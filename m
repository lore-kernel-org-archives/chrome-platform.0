Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7633E35F;
	Mon, 25 May 2026 05:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686851; cv=none; b=ckuBlDSVwQ0uYfVoI+GV0AIr8DkGfzyuU8Io2I1SiqmH9G2XyvA9UeCrrRinSmmEzzjmDK+zbilnmbpDPZfMKKOWaFruOz0/Sup5/Gplw7nQB12u3gmAEn84nFIIYuWf6+32UP2NoNQQ/Imf01oKsT2vKThJtO6aOhZqnzTyCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686851; c=relaxed/simple;
	bh=eWojlr18EsSXtgTQq7ND0v1qeT/PqbVJVPxwj6aFROc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6GqzEVfrwDHd5qzVIorY3rivNcgpYwqPE+9MkOdfaThZcVApQovFgJJxGXDho4Blxh1RLf1OGuiMozlkvIQ7FAOP73aPQABO7T7MfdpCRUqpeggMaI3+KbOCK69Sou5zvG9NnFGG0k+fQm6QRPhm9qSHfnxO6HvRQbx4pJImHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMOMLgZ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMOMLgZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D98D1F000E9;
	Mon, 25 May 2026 05:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779686848;
	bh=HF2veDU+bAnkwF0dhjKQXkgzF6RRml8EMeePiXSodqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mMOMLgZ4HDPxs35j5IEK3OhE/yz1XBdp3i1LoQJObwXywAAqpGqjbfJBRAMgS6cci
	 QvPglB1CtSJOzNYkDcRkyEfZZzPVntQAIkcKrC6ADD8Nr8Q2rY1WSdXock4EJloNKP
	 vliP6NDVKIsBg+4Sr2rNzu0j7+mPFiGWtp/ncv1kkvelwDgVYPN6FTFZJ20vgGevaE
	 V4MFWxUbfMO5ec1RG239EUAIgqJ7Z2TsyN2Dmf2LifAUS+1G3A+YnC/qAMrkicLU2E
	 lI2bnKq+tYiwaqWzR/dw4/6SQ9MGxsZRyJRWXOgRZK1ysCUPoq40ddXx6DyogdW4uQ
	 CvrGA3O1kY3UQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] platform/chrome: cros_ec_chardev: Introduce rwsem for protecting ec_dev
Date: Mon, 25 May 2026 05:26:54 +0000
Message-ID: <20260525052654.4076429-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
In-Reply-To: <20260525052654.4076429-1-tzungbi@kernel.org>
References: <20260525052654.4076429-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a rwsem for protecting `ec_dev` to prevent Use-After-Free on
the `ec_dev`.

- Writers: In driver's probe() and remove().
- Readers: In file operations.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Check availability of `ec_dev` at the top of fops.
- Fix removal order in .remove().
- Add R-b tag.

v2:
- New to the series.

v1: Doesn't exist.

 drivers/platform/chrome/cros_ec_chardev.c | 39 ++++++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 7e046fc56998..25ad409523b8 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -23,6 +23,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
+#include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -38,6 +39,7 @@
 struct chardev_pdata {
 	struct miscdevice misc;
 	struct kref kref;
+	struct rw_semaphore ec_dev_sem;
 	struct cros_ec_device *ec_dev;
 	u16 cmd_offset;
 	struct blocking_notifier_head subscribers;
@@ -122,10 +124,18 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 {
 	struct chardev_priv *priv = container_of(nb, struct chardev_priv,
 						 notifier);
-	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct ec_event *event;
-	unsigned long event_bit = 1 << ec_dev->event_data.event_type;
-	int total_size = sizeof(*event) + ec_dev->event_size;
+	unsigned long event_bit;
+	int total_size;
+
+	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
+	if (!priv->pdata->ec_dev)
+		return NOTIFY_DONE;
+	ec_dev = priv->pdata->ec_dev;
+
+	event_bit = 1 << ec_dev->event_data.event_type;
+	total_size = sizeof(*event) + ec_dev->event_size;
 
 	if (!(event_bit & priv->event_mask) ||
 	    (priv->event_len + total_size) > CROS_MAX_EVENT_LEN)
@@ -219,6 +229,10 @@ static __poll_t cros_ec_chardev_poll(struct file *filp, poll_table *wait)
 {
 	struct chardev_priv *priv = filp->private_data;
 
+	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
+	if (!priv->pdata->ec_dev)
+		return -ENODEV;
+
 	poll_wait(filp, &priv->wait_event, wait);
 
 	if (list_empty(&priv->events))
@@ -236,6 +250,10 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 	size_t count;
 	int ret;
 
+	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
+	if (!priv->pdata->ec_dev)
+		return -ENODEV;
+
 	if (priv->event_mask) { /* queued MKBP event */
 		struct ec_event *event;
 
@@ -374,6 +392,10 @@ static long cros_ec_chardev_ioctl(struct file *filp, unsigned int cmd,
 {
 	struct chardev_priv *priv = filp->private_data;
 
+	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
+	if (!priv->pdata->ec_dev)
+		return -ENODEV;
+
 	if (_IOC_TYPE(cmd) != CROS_EC_DEV_IOC)
 		return -ENOTTY;
 
@@ -414,6 +436,7 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pdata);
 	kref_init(&pdata->kref);
+	init_rwsem(&pdata->ec_dev_sem);
 	pdata->ec_dev = ec->ec_dev;
 	pdata->cmd_offset = ec->cmd_offset;
 	BLOCKING_INIT_NOTIFIER_HEAD(&pdata->subscribers);
@@ -448,10 +471,16 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 static void cros_ec_chardev_remove(struct platform_device *pdev)
 {
 	struct chardev_pdata *pdata = platform_get_drvdata(pdev);
+	struct cros_ec_device *ec_dev = pdata->ec_dev;
 
-	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
-					   &pdata->relay);
+	/* stop new fops from being created */
 	misc_deregister(&pdata->misc);
+	/* stop existing fops from running */
+	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
+		pdata->ec_dev = NULL;
+
+	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+					   &pdata->relay);
 	kref_put(&pdata->kref, chardev_pdata_release);
 }
 
-- 
2.54.0.794.g4f17f83d09-goog

