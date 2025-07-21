Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B07DA95
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073428; cv=none; b=HBwJtTwXAtWcNsUb+y8NCFe5WEe3ympWM/HP0JWHDi8igQ0SEAsL7dqAoluQeHanpdftcZL5RvjAUWntV1eZYvrIO9tK1hLZEI0b8cyJVRFIvPC7Ue4UaYay3eQk2rIhuV49xIWzjeQtJh56FM1Ve9NFcXFK5DQ0xWzuTyr0KEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073428; c=relaxed/simple;
	bh=FYEe+ZkysHUlpuUt6/6Vi7i90v6/BqFuoeEcfGniUfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jc966lI+t0pvbN9eJIVm5xW96dDb1/xE7Ff3R9egClAAUksEBhGeq1Jq34fVOo+8nTlPn1Eu3y3P1KBGGK5LEUdx+mJeYTe0fCSylsLMdXlVrBq9sfz9/035EVKNdJ8irumqVtlZYSW1tKF06+CXSN6iIApjbfivQrD24CnzN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+6cWQM6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+6cWQM6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD02C4CEF5;
	Mon, 21 Jul 2025 04:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073427;
	bh=FYEe+ZkysHUlpuUt6/6Vi7i90v6/BqFuoeEcfGniUfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b+6cWQM6C7CwXAyhQ5B3tPd9VF7lO8AzIuA4Vwq9yerNrH9RV15bqUwS5+LuCuIuk
	 ZYPCcVq+nNZD0v65djxxXJksVW8Jjs0YWOqmJH4Tr9N+v6Mztg/gSK+d2RzpS3vP4N
	 STQegyqcL67jW6rOxacCJb1NbQXotkuyC6gWPnnFnv5u/GRQP9izuchiEpCx9jFMTL
	 xpeIYWvThcwvaYsKgVLRYFYOiPfRGpdHfkeLsnEaiX7H9NpepBOZEdHv8UyS53g5+C
	 F4EjSio9TFRQoF3H+f6cvlJlROyOQFkbae+NhxOBkS13rzoH1zSVJJWXJ+n3Z1nSWS
	 VN++UuXe0KCZQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH 1/2] platform/chrome: cros_ec_chardev: Don't use wait queue's lock
Date: Mon, 21 Jul 2025 04:50:08 +0000
Message-ID: <20250721045009.2737376-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721045009.2737376-1-tzungbi@kernel.org>
References: <20250721045009.2737376-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lock inside wait_queue_head_t is not designed for protecting custom
data structures.  Don't use it.

Use a dedicated lock for the structure instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_chardev.c | 40 +++++++++++------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 1cb09ca3b850..5e9ff70c6cf5 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/fs.h>
 #include <linux/miscdevice.h>
@@ -23,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
@@ -37,6 +39,8 @@ struct chardev_priv {
 	wait_queue_head_t wait_event;
 	unsigned long event_mask;
 	struct list_head events;
+	/* This protects `events`. */
+	spinlock_t lock;
 	size_t event_len;
 	u16 cmd_offset;
 };
@@ -109,11 +113,10 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 	event->event_type = ec_dev->event_data.event_type;
 	memcpy(event->data, &ec_dev->event_data.data, ec_dev->event_size);
 
-	spin_lock(&priv->wait_event.lock);
+	guard(spinlock_irq)(&priv->lock);
 	list_add_tail(&event->node, &priv->events);
 	priv->event_len += total_size;
-	wake_up_locked(&priv->wait_event);
-	spin_unlock(&priv->wait_event.lock);
+	wake_up(&priv->wait_event);
 
 	return NOTIFY_OK;
 }
@@ -124,30 +127,23 @@ static struct ec_event *cros_ec_chardev_fetch_event(struct chardev_priv *priv,
 	struct ec_event *event;
 	int err;
 
-	spin_lock(&priv->wait_event.lock);
-	if (!block && list_empty(&priv->events)) {
-		event = ERR_PTR(-EWOULDBLOCK);
-		goto out;
-	}
+	guard(spinlock_irq)(&priv->lock);
 
-	if (!fetch) {
-		event = NULL;
-		goto out;
-	}
+	if (!block && list_empty(&priv->events))
+		return ERR_PTR(-EWOULDBLOCK);
 
-	err = wait_event_interruptible_locked(priv->wait_event,
-					      !list_empty(&priv->events));
-	if (err) {
-		event = ERR_PTR(err);
-		goto out;
-	}
+	if (!fetch)
+		return NULL;
+
+	err = wait_event_interruptible_lock_irq(priv->wait_event,
+						!list_empty(&priv->events),
+						priv->lock);
+	if (err)
+		return ERR_PTR(err);
 
 	event = list_first_entry(&priv->events, struct ec_event, node);
 	list_del(&event->node);
 	priv->event_len -= sizeof(*event) + event->size;
-
-out:
-	spin_unlock(&priv->wait_event.lock);
 	return event;
 }
 
@@ -170,6 +166,7 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	priv->cmd_offset = ec->cmd_offset;
 	filp->private_data = priv;
 	INIT_LIST_HEAD(&priv->events);
+	spin_lock_init(&priv->lock);
 	init_waitqueue_head(&priv->wait_event);
 	nonseekable_open(inode, filp);
 
@@ -191,6 +188,7 @@ static __poll_t cros_ec_chardev_poll(struct file *filp, poll_table *wait)
 
 	poll_wait(filp, &priv->wait_event, wait);
 
+	guard(spinlock_irq)(&priv->lock);
 	if (list_empty(&priv->events))
 		return 0;
 
-- 
2.50.0.727.gbf7dc18ff4-goog

