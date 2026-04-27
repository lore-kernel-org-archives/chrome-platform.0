Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04F83CE4B9;
	Mon, 27 Apr 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297657; cv=none; b=SAb6L/eh6aTF6CtIgf4epHzKKxOucnW07K2UPzfGKUqNJb/52Y4m8vlrl8tCPmWZj6wq4tczeWb32o17nWDqTn1TmB84hFWRX13PBwZYX3lwbRrs+Axrg+hmnZmtUCstNC+YifKXyzi68EsUivQLCnto5s81Bk1poNT6uZmKkeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297657; c=relaxed/simple;
	bh=RliJdwdCbhUsiPjzrU97YhxB0AGBgxUToL81YoxKXGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qggwnDSPoHjYk5al6Wy7gwixJhEwGqW/iOKljmo0tZn82/1r1d8KlOIXsZdPaiXteozkhLqOMnxstvt/h2yA/mZGAvJaxx8dt4Yj3PYg09VKZQg0xN1odG2P2zvzfbZGSuq9lYCgKYIX592Ngk3nzA1jQxGm4PX+fadQZn9clyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKW1w4Nn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKW1w4Nn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A427AC2BCB4;
	Mon, 27 Apr 2026 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297657;
	bh=RliJdwdCbhUsiPjzrU97YhxB0AGBgxUToL81YoxKXGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XKW1w4NnYX/bTLqj9tJeuhtQSrICuT3yEd2qvgZNUiUEKF8SggGwFBaLlMsQ3uSCW
	 XKKcl6F0R2d5OF3Y/HyOdEIOjCo284yUcpJ11K789WMy7jk1n6nvPcGVQJ4uC6jTN+
	 ixjVFgXMZSJNsCZWnba4bxe/ClOf8s9fiVQ7Y6xfEz60e0rItb4JQUzPkEj5xgkSqc
	 hxbjP+FYZuD9FHYxxubdNnKg5kKk9ONgbYGOZBb0Ibzz4uwd+CkSImjhBp6or0mXtX
	 uBQVosX8WRSD7A4h3fbci5ulPR7NtUVyz502ckXlpeN5x2AZssKPNnHZHcO5j3xWJE
	 lKknsqb7avrfw==
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
Subject: [PATCH 1/8] char: misc: Simplify locking with guard()
Date: Mon, 27 Apr 2026 21:46:52 +0800
Message-ID: <20260427134659.95181-2-tzungbi@kernel.org>
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

Use guard() to simplify locking in misc_{de,}register().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/char/misc.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 726516fb0a3b..e2bea4f01851 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -36,6 +36,7 @@
 
 #include <linux/module.h>
 
+#include <linux/cleanup.h>
 #include <linux/fs.h>
 #include <linux/errno.h>
 #include <linux/miscdevice.h>
@@ -209,7 +210,6 @@ static const struct file_operations misc_fops = {
 int misc_register(struct miscdevice *misc)
 {
 	dev_t dev;
-	int err = 0;
 	bool is_dynamic = (misc->minor == MISC_DYNAMIC_MINOR);
 
 	if (misc->minor > MISC_DYNAMIC_MINOR) {
@@ -220,32 +220,26 @@ int misc_register(struct miscdevice *misc)
 
 	INIT_LIST_HEAD(&misc->list);
 
-	mutex_lock(&misc_mtx);
+	guard(mutex)(&misc_mtx);
 
 	if (is_dynamic) {
 		int i = misc_minor_alloc(misc->minor);
 
-		if (i < 0) {
-			err = -EBUSY;
-			goto out;
-		}
+		if (i < 0)
+			return -EBUSY;
 		misc->minor = i;
 	} else {
 		struct miscdevice *c;
 		int i;
 
 		list_for_each_entry(c, &misc_list, list) {
-			if (c->minor == misc->minor) {
-				err = -EBUSY;
-				goto out;
-			}
+			if (c->minor == misc->minor)
+				return -EBUSY;
 		}
 
 		i = misc_minor_alloc(misc->minor);
-		if (i < 0) {
-			err = -EBUSY;
-			goto out;
-		}
+		if (i < 0)
+			return -EBUSY;
 	}
 
 	dev = MKDEV(MISC_MAJOR, misc->minor);
@@ -258,8 +252,7 @@ int misc_register(struct miscdevice *misc)
 		if (is_dynamic) {
 			misc->minor = MISC_DYNAMIC_MINOR;
 		}
-		err = PTR_ERR(misc->this_device);
-		goto out;
+		return PTR_ERR(misc->this_device);
 	}
 
 	/*
@@ -267,9 +260,7 @@ int misc_register(struct miscdevice *misc)
 	 * earlier defaults
 	 */
 	list_add(&misc->list, &misc_list);
- out:
-	mutex_unlock(&misc_mtx);
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL(misc_register);
 
@@ -283,13 +274,12 @@ EXPORT_SYMBOL(misc_register);
 
 void misc_deregister(struct miscdevice *misc)
 {
-	mutex_lock(&misc_mtx);
+	guard(mutex)(&misc_mtx);
 	list_del_init(&misc->list);
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
 	misc_minor_free(misc->minor);
 	if (misc->minor > MISC_DYNAMIC_MINOR)
 		misc->minor = MISC_DYNAMIC_MINOR;
-	mutex_unlock(&misc_mtx);
 }
 EXPORT_SYMBOL(misc_deregister);
 
-- 
2.51.0

