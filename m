Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B93CF042;
	Mon, 27 Apr 2026 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297667; cv=none; b=QrRlKFjuGOxhOhOPrHR2V+Zf8dkFLE1Jnx5Q69325Vd4Y54UCbovLDEUiiYoTJUhEhrjitAI08WKzJdJB4q8Hazo11LX7S0PddEM8UHfoKkN0qLoF7qEMMrWrPQqh12ybcD+0bDOigLxFC5Yl5yn10l0+ZuKxdyvJ/QlB8KjedA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297667; c=relaxed/simple;
	bh=jcyT2Wi1Z7EnOwpapIsvDS8XtnS9XgxhDDg5TzFovnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K997zIZWRJa8DJOGSwJUgm4WVBuejE9t0ctJphx1SXqzwDa+bFiIeZpUND9c4KGQoI3fNccpy/da+2zptDQy0gOQgBr9Dlr12aWRf/QznRFtK6AqM7ZiL6sOzV3eXaZcDFtkQ5GySOX/VXXx8PrGHfnc9vBC5I8bYf92zSSiRe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yfzp3AJK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yfzp3AJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C292C2BCB9;
	Mon, 27 Apr 2026 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297667;
	bh=jcyT2Wi1Z7EnOwpapIsvDS8XtnS9XgxhDDg5TzFovnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yfzp3AJKlVjurjd0+O9uyKX9DMmEd1oMnqOPut/k5VXBpAh2GAG3ZPfAsSLB99k8C
	 U18kpzvkBQbheyfARMtbS73VyfE5MqxpL9U7Y20Yh6pRPoiyGZz2tU7YJJelzvqBxF
	 7wrjoGR4i/R3JtIg7R6iwVV++G2SOrjjqXFVjhUDWVuAzg2WBvK0lh4HoY2ZSbIouo
	 y8pLPjtvrL8MhNoDwMTzcn8lbavbwoha0uQKc8984Jn/xeCKdFk5BA5cPcr+hgM8qM
	 Xqyu7xcfO/kasJ5dxYJw/0W7U10e0VyQp+OXkD+Z/7/tNZtReouc0Xk4OctWueO1NN
	 hluozUjNM91LQ==
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
Subject: [PATCH 4/8] char: misc: Use SRCU to protect list traversal
Date: Mon, 27 Apr 2026 21:46:55 +0800
Message-ID: <20260427134659.95181-5-tzungbi@kernel.org>
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

Replace the global mutex with SRCU to protect list traversal in the
file operations.  This allows concurrent file operations on misc devices
without contending for a global lock.

Writers (registration and deregistration) continue to be serialized
by a mutex when modifying the lists.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/char/misc.c | 84 ++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 87f47bdc7afb..8514287b8ff9 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -45,6 +45,7 @@
 #include <linux/mutex.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/srcu.h>
 #include <linux/stat.h>
 #include <linux/init.h>
 #include <linux/device.h>
@@ -58,6 +59,7 @@
 static LIST_HEAD(misc_list);
 static LIST_HEAD(misc_sync_ctx_list);
 static DEFINE_MUTEX(misc_mtx);
+DEFINE_STATIC_SRCU(misc_srcu);
 
 /*
  * Assigned numbers.
@@ -86,23 +88,23 @@ static void misc_minor_free(int minor)
 #ifdef CONFIG_PROC_FS
 static void *misc_seq_start(struct seq_file *seq, loff_t *pos)
 {
-	mutex_lock(&misc_mtx);
-	return seq_list_start(&misc_list, *pos);
+	seq->private = (void *)(long)srcu_read_lock(&misc_srcu);
+	return seq_list_start_rcu(&misc_list, *pos);
 }
 
 static void *misc_seq_next(struct seq_file *seq, void *v, loff_t *pos)
 {
-	return seq_list_next(v, &misc_list, pos);
+	return seq_list_next_rcu(v, &misc_list, pos);
 }
 
 static void misc_seq_stop(struct seq_file *seq, void *v)
 {
-	mutex_unlock(&misc_mtx);
+	srcu_read_unlock(&misc_srcu, (int)(long)seq->private);
 }
 
 static int misc_seq_show(struct seq_file *seq, void *v)
 {
-	const struct miscdevice *p = list_entry(v, struct miscdevice, list);
+	const struct miscdevice *p = list_entry_rcu(v, struct miscdevice, list);
 
 	seq_printf(seq, "%3i %s\n", p->minor, p->name ? p->name : "");
 	return 0;
@@ -121,9 +123,8 @@ static struct miscdevice *misc_find(int minor)
 {
 	struct miscdevice *iter;
 
-	lockdep_assert_held(&misc_mtx);
-
-	list_for_each_entry(iter, &misc_list, list) {
+	list_for_each_entry_srcu(iter, &misc_list, list,
+				 srcu_read_lock_held(&misc_srcu)) {
 		if (iter->minor == minor)
 			return iter;
 	}
@@ -136,7 +137,7 @@ static struct miscdevice *misc_find(int minor)
 	{								\
 		struct miscdevice *c;					\
 									\
-		guard(mutex)(&misc_mtx);				\
+		guard(srcu)(&misc_srcu);				\
 									\
 		c = misc_find(iminor(filp->f_inode));			\
 		if (!c)							\
@@ -160,7 +161,9 @@ static void misc_sync_ctx_release(struct kref *kref)
 	struct miscdevice_sync_ctx *ctx = container_of(kref, typeof(*ctx), kref);
 
 	misc_minor_free(ctx->minor);
-	list_del(&ctx->list);
+	scoped_guard(mutex, &misc_mtx)
+		list_del_rcu(&ctx->list);
+	synchronize_srcu(&misc_srcu);
 	kfree(ctx);
 }
 
@@ -170,23 +173,24 @@ static int misc_sync_release(struct inode *inode, struct file *filp)
 	struct miscdevice *c;
 	struct miscdevice_sync_ctx *iter, *ctx = NULL;
 
-	guard(mutex)(&misc_mtx);
-
-	c = misc_find(minor);
-	if (c) {
-		/* The miscdevice is still registered. */
-		ctx = c->sync_ctx;
-	} else {
-		/* The miscdeivce is unregistered.  Search in the list. */
-		list_for_each_entry(iter, &misc_sync_ctx_list, list) {
-			if (iter->minor == minor) {
-				ctx = iter;
-				break;
+	scoped_guard(srcu, &misc_srcu) {
+		c = misc_find(minor);
+		if (c) {
+			/* The miscdevice is still registered. */
+			ctx = c->sync_ctx;
+		} else {
+			/* The miscdeivce is unregistered.  Search in the list. */
+			list_for_each_entry_srcu(iter, &misc_sync_ctx_list,
+					list, srcu_read_lock_held(&misc_srcu)) {
+				if (iter->minor == minor) {
+					ctx = iter;
+					break;
+				}
+			}
+			if (!ctx) {
+				pr_err("Cannot find miscdevice_sync_ctx\n");
+				return -ENOENT;
 			}
-		}
-		if (!ctx) {
-			pr_err("Cannot find miscdevice_sync_ctx\n");
-			return -ENOENT;
 		}
 	}
 
@@ -206,8 +210,9 @@ static int misc_open(struct inode *inode, struct file *file)
 	struct miscdevice *c = NULL;
 	int err = -ENODEV;
 	const struct file_operations *new_fops = NULL;
+	int idx;
 
-	mutex_lock(&misc_mtx);
+	idx = srcu_read_lock(&misc_srcu);
 
 	c = misc_find(minor);
 	if (c)
@@ -215,9 +220,9 @@ static int misc_open(struct inode *inode, struct file *file)
 
 	/* Only request module for fixed minor code */
 	if (!new_fops && minor < MISC_DYNAMIC_MINOR) {
-		mutex_unlock(&misc_mtx);
+		srcu_read_unlock(&misc_srcu, idx);
 		request_module("char-major-%d-%d", MISC_MAJOR, minor);
-		mutex_lock(&misc_mtx);
+		idx = srcu_read_lock(&misc_srcu);
 
 		c = misc_find(minor);
 		if (c)
@@ -243,7 +248,7 @@ static int misc_open(struct inode *inode, struct file *file)
 	if (file->f_op->open)
 		err = file->f_op->open(inode, file);
 fail:
-	mutex_unlock(&misc_mtx);
+	srcu_read_unlock(&misc_srcu, idx);
 	return err;
 }
 
@@ -311,8 +316,10 @@ int misc_register(struct miscdevice *misc)
 	} else {
 		int i;
 
-		if (misc_find(misc->minor))
-			return -EBUSY;
+		scoped_guard(srcu, &misc_srcu) {
+			if (misc_find(misc->minor))
+				return -EBUSY;
+		}
 
 		i = misc_minor_alloc(misc->minor);
 		if (i < 0)
@@ -336,7 +343,7 @@ int misc_register(struct miscdevice *misc)
 	 * Add it to the front, so that later devices can "override"
 	 * earlier defaults
 	 */
-	list_add(&misc->list, &misc_list);
+	list_add_rcu(&misc->list, &misc_list);
 	return 0;
 }
 EXPORT_SYMBOL(misc_register);
@@ -351,15 +358,20 @@ EXPORT_SYMBOL(misc_register);
 
 void misc_deregister(struct miscdevice *misc)
 {
-	guard(mutex)(&misc_mtx);
-	list_del_init(&misc->list);
+	scoped_guard(mutex, &misc_mtx)
+		list_del_rcu(&misc->list);
+	synchronize_srcu(&misc_srcu);
+	INIT_LIST_HEAD(&misc->list);
+
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
 
 	/* Defer to free the minor number for sync fops */
 	if (!misc->sync_ctx) {
 		misc_minor_free(misc->minor);
 	} else {
-		list_add(&misc->sync_ctx->list, &misc_sync_ctx_list);
+		scoped_guard(mutex, &misc_mtx)
+			list_add_rcu(&misc->sync_ctx->list,
+				     &misc_sync_ctx_list);
 		kref_put(&misc->sync_ctx->kref, misc_sync_ctx_release);
 	}
 
-- 
2.51.0

