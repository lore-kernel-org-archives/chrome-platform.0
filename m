Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C07372EE9;
	Mon, 27 Apr 2026 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297665; cv=none; b=CwTCT3n//5/qHYCaPtZAuZMpOWDnfQzM94PNm1A9xNJZhoolmOWcDHkMD6aDc7QmWpHT4AbnqJPK/XvIu8OjJ6GmjfaZ50WRfvD5OW5UpJmBSQiQ+MtHQ1o4dbI0PIsqNjgDkCB4/kadprrZ4PhV5tmOPVBJdse2Ey7aoOmoqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297665; c=relaxed/simple;
	bh=ZCOwybLTgxJu3NQ6X10o3dZFALJKCXKCNQmLaxc70Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNcxTmlmAzC444yBE/lmsyWOj+hh51lHX3l6dSJ/vZeEkPNbe46TiSyt5Km9ElCwCWBDcTHSWhzmOfcWxWkgm10PjZYGPcWdAY3cRbJd0bvqBFHN9zNldfbSnf6chDeId5/xB0PFPlfmjckAxdnVspWxTh0JtWmnNwa2MFkMo5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiYi2Pb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiYi2Pb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E030C2BCB4;
	Mon, 27 Apr 2026 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297663;
	bh=ZCOwybLTgxJu3NQ6X10o3dZFALJKCXKCNQmLaxc70Yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiYi2Pb9Z1iUbu0uR8k+iFIvoUoBtyxhpT2eLWFJJqkgG10+nZHTECeFtwnTR6Jhx
	 qZq571x3MNYfRiWgg5Iv5QWVYxMhf0XQKZ6OZ8y7wI+oMZa0RetNFYHVtaEcBCLMs3
	 X5evOPf+66Qql7YdbzkKu+xaDkbm1ovE8uJkgBTCe33Z3jm9jMx7LNClKT1vYnqSpL
	 F89/Z7PsEnTcYyBnwVQMW1l9ObLOxKWheqK812hWaSx4MHgAUUvKoY9aiR9W4pSBnG
	 +Pwtq0m2xAIZR4hwlS4ClDM4m+S/bn6BsbCREuBKsQQcMT8tcswk7F5Ud/7A7gHSWm
	 30m2rufjW+Sdw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 3/8] char: misc: Introduce misc_sync_register()
Date: Mon, 27 Apr 2026 21:46:54 +0800
Message-ID: <20260427134659.95181-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427134659.95181-1-tzungbi@kernel.org>
References: <20260427134659.95181-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce misc_sync_register() to support synchronous file operations
for misc devices.  This aims to prevent Use-After-Free errors when a
device is deregistered while file operations are still in progress or
files are open.

It creates a synchronization context that wraps supported file
operations and ensures the device is still registered before invoking
the file operations.

The minor number is deferred from being freed immediately on
deregistration and is used as a primary key to search for the
synchronization context in `misc_sync_ctx_list` after the device is
unregistered.

Performance impact:
- All file operations are serialized by a global lock.
- All file operations perform a linear search to find the corresponding
  miscdevice.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/char/misc.c        | 123 ++++++++++++++++++++++++++++++++++++-
 include/linux/miscdevice.h |  10 +++
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index c26315577d65..87f47bdc7afb 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -56,6 +56,7 @@
  * Head entry for the doubly linked miscdevice list
  */
 static LIST_HEAD(misc_list);
+static LIST_HEAD(misc_sync_ctx_list);
 static DEFINE_MUTEX(misc_mtx);
 
 /*
@@ -130,6 +131,75 @@ static struct miscdevice *misc_find(int minor)
 	return NULL;
 }
 
+#define DEFINE_SYNC_FOPS(member, ret_type, PROTO, ARGS)			\
+	static ret_type misc_sync_##member PROTO			\
+	{								\
+		struct miscdevice *c;					\
+									\
+		guard(mutex)(&misc_mtx);				\
+									\
+		c = misc_find(iminor(filp->f_inode));			\
+		if (!c)							\
+			return -ENODEV;					\
+									\
+		return c->fops->member ARGS;				\
+	}
+
+DEFINE_SYNC_FOPS(read, ssize_t,
+	(struct file *filp, char __user *buf, size_t len, loff_t *off),
+	(filp, buf, len, off))
+DEFINE_SYNC_FOPS(unlocked_ioctl, long,
+		 (struct file *filp, unsigned int cmd, unsigned long arg),
+		 (filp, cmd, arg))
+DEFINE_SYNC_FOPS(compat_ioctl, long,
+		 (struct file *filp, unsigned int cmd, unsigned long arg),
+		 (filp, cmd, arg))
+
+static void misc_sync_ctx_release(struct kref *kref)
+{
+	struct miscdevice_sync_ctx *ctx = container_of(kref, typeof(*ctx), kref);
+
+	misc_minor_free(ctx->minor);
+	list_del(&ctx->list);
+	kfree(ctx);
+}
+
+static int misc_sync_release(struct inode *inode, struct file *filp)
+{
+	int minor = iminor(filp->f_inode);
+	struct miscdevice *c;
+	struct miscdevice_sync_ctx *iter, *ctx = NULL;
+
+	guard(mutex)(&misc_mtx);
+
+	c = misc_find(minor);
+	if (c) {
+		/* The miscdevice is still registered. */
+		ctx = c->sync_ctx;
+	} else {
+		/* The miscdeivce is unregistered.  Search in the list. */
+		list_for_each_entry(iter, &misc_sync_ctx_list, list) {
+			if (iter->minor == minor) {
+				ctx = iter;
+				break;
+			}
+		}
+		if (!ctx) {
+			pr_err("Cannot find miscdevice_sync_ctx\n");
+			return -ENOENT;
+		}
+	}
+
+	/* Restore it so that the corresponding fops_put() works. */
+	filp->f_op = ctx->orig_fops;
+	kref_put(&ctx->kref, misc_sync_ctx_release);
+
+	/* Call to the original .release() if any. */
+	if (filp->f_op->release)
+		return filp->f_op->release(inode, filp);
+	return 0;
+}
+
 static int misc_open(struct inode *inode, struct file *file)
 {
 	int minor = iminor(inode);
@@ -166,6 +236,10 @@ static int misc_open(struct inode *inode, struct file *file)
 
 	err = 0;
 	replace_fops(file, new_fops);
+	if (c->sync_ctx) {
+		file->f_op = &c->sync_ctx->fops;
+		kref_get(&c->sync_ctx->kref);
+	}
 	if (file->f_op->open)
 		err = file->f_op->open(inode, file);
 fail:
@@ -280,12 +354,59 @@ void misc_deregister(struct miscdevice *misc)
 	guard(mutex)(&misc_mtx);
 	list_del_init(&misc->list);
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
-	misc_minor_free(misc->minor);
+
+	/* Defer to free the minor number for sync fops */
+	if (!misc->sync_ctx) {
+		misc_minor_free(misc->minor);
+	} else {
+		list_add(&misc->sync_ctx->list, &misc_sync_ctx_list);
+		kref_put(&misc->sync_ctx->kref, misc_sync_ctx_release);
+	}
+
 	if (misc->minor > MISC_DYNAMIC_MINOR)
 		misc->minor = MISC_DYNAMIC_MINOR;
 }
 EXPORT_SYMBOL(misc_deregister);
 
+int misc_sync_register(struct miscdevice *misc)
+{
+	struct miscdevice_sync_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = misc_register(misc);
+	if (ret) {
+		kfree(ctx);
+		return ret;
+	}
+
+	ctx->minor = misc->minor;
+	kref_init(&ctx->kref);
+	ctx->orig_fops = misc->fops;
+	INIT_LIST_HEAD(&ctx->list);
+
+	/* Use any fops as default in case the misc sync doesn't support them. */
+	memcpy(&ctx->fops, misc->fops, sizeof(struct file_operations));
+
+	/* Override fops that support sync. */
+	if (misc->fops->read)
+		ctx->fops.read = misc_sync_read;
+	if (misc->fops->unlocked_ioctl)
+		ctx->fops.unlocked_ioctl = misc_sync_unlocked_ioctl;
+	if (misc->fops->compat_ioctl)
+		ctx->fops.compat_ioctl = misc_sync_compat_ioctl;
+
+	/* .release() is used to drop the reference to the sync context. */
+	ctx->fops.release = misc_sync_release;
+
+	misc->sync_ctx = ctx;
+	return 0;
+}
+EXPORT_SYMBOL(misc_sync_register);
+
 static int __init misc_init(void)
 {
 	int err;
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index fa9000f68523..a60d8281e1dd 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -81,6 +81,14 @@
  */
 #define MISC_DYNAMIC_MINOR	255
 
+struct miscdevice_sync_ctx {
+	int minor;
+	struct kref kref;
+	const struct file_operations *orig_fops;
+	struct list_head list;
+	struct file_operations fops;
+};
+
 struct miscdevice {
 	int minor;
 	const char *name;
@@ -91,10 +99,12 @@ struct miscdevice {
 	const struct attribute_group **groups;
 	const char *nodename;
 	umode_t mode;
+	struct miscdevice_sync_ctx *sync_ctx;
 };
 
 extern int misc_register(struct miscdevice *misc);
 extern void misc_deregister(struct miscdevice *misc);
+extern int misc_sync_register(struct miscdevice *misc);
 
 /*
  * Helper macro for drivers that don't do anything special in the initcall.
-- 
2.51.0

