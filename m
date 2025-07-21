Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C37DA95
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073428; cv=none; b=B0gXv4k5UXxN/yABbsF7Z1xSUtbMP1MoRp2NPFNevRol+r2fka8XER8zT2QgM+wTBv7HQkS+Vhu9XrltO04zfpDXBdRX7QUKdQ4uUYOV6s+YpPZv9vyDdHYS3FA7Z1Qen4Zldy9cW846VHbAHCiCF7RCbLsI5UXUaB0Hs4Myf+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073428; c=relaxed/simple;
	bh=ogKgJ+B5+aRvwXd0sDzyJ8dggN/T0T1Zdkl/wULXlDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IB+8Ohwgme9NuSeRzKiynDHw3aCdKUa+NEl4MhiN2N1AWjcrmloexMFflcGJVnxBpvgxih8ZdhL/9wSSC6X1jg55PqYSbyy4BQTkwOHrUdLF64piyMKH4amBkZzsKokUIWssIT77+1mj3JUJh3/jkpvXMpWClr5Cqeidqvtz8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5d9ozro; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5d9ozro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FE9C4CEF1;
	Mon, 21 Jul 2025 04:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073428;
	bh=ogKgJ+B5+aRvwXd0sDzyJ8dggN/T0T1Zdkl/wULXlDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5d9ozrotbY+vpt/WaUxQEduD3iQca53Bz6PkkMjhS/P0S0wzb9ESPEszTevghwHD
	 gccsoGcQO7Pp4Byq+uafGNKGKBDbY/Ah5Z3CxeuJXNW9ABZqvjs1GSu/Pd4zUSxAtQ
	 dSKAmvT/wlBLeqPZA4Uo9z6Z3eX34kTAdl3lgTZZ0OUvtt5lZyB2rNlNuQRjRZ33vk
	 mCF9nqHXEcxX+lnEquS/mp/88wVJZsq/Twy8JCUqsF4AxgmWLGsCV55ZHCvuVVtVIp
	 rpCOZ069VlerUe3KzL8ZTfUTW47ntaWd+FQwfSbgL3N+UIkax7/oP48W673Cij9BrB
	 0wAIME2ZDS9Vw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/2] platform/chrome: cros_ec_chardev: Check ec_dev's availability in fops
Date: Mon, 21 Jul 2025 04:50:09 +0000
Message-ID: <20250721045009.2737376-3-tzungbi@kernel.org>
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

It is possible that a userland program is waiting for further MKBP
events while the underlying ec_dev is already unregistered.

Check ec_dev's availability in the fops to avoid the userland program
from waiting for some events that should never happen.

Note: if the userland program uses poll() without a timeout, e.g.:
: fd = os.open('/dev/cros_ec', os.O_RDONLY)
: fcntl.ioctl(fd, 0xec02, 0xfff)
: p = select.poll()
: p.register(fd, select.POLLIN)
:
: while True:
:     es = p.poll()            # <--- without a timeout
:     if not es:
:         print("no events")
:         continue
:
:     for f, e in es:
:         if e & select.POLLIN:
:             data = os.read(f, 100)
:             print(data)

It'd still block.  The patch doesn't help with the case.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_chardev.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 5e9ff70c6cf5..675bcca16cb5 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -135,11 +135,17 @@ static struct ec_event *cros_ec_chardev_fetch_event(struct chardev_priv *priv,
 	if (!fetch)
 		return NULL;
 
-	err = wait_event_interruptible_lock_irq(priv->wait_event,
-						!list_empty(&priv->events),
-						priv->lock);
-	if (err)
-		return ERR_PTR(err);
+	do {
+		err = wait_event_interruptible_lock_irq_timeout(priv->wait_event,
+								!list_empty(&priv->events),
+								priv->lock,
+								HZ);
+		if (err < 0)
+			return ERR_PTR(err);
+
+		if (!cros_ec_device_registered(priv->ec_dev))
+			return ERR_PTR(-ENODEV);
+	} while (!err);
 
 	event = list_first_entry(&priv->events, struct ec_event, node);
 	list_del(&event->node);
@@ -186,6 +192,9 @@ static __poll_t cros_ec_chardev_poll(struct file *filp, poll_table *wait)
 {
 	struct chardev_priv *priv = filp->private_data;
 
+	if (!cros_ec_device_registered(priv->ec_dev))
+		return EPOLLERR;
+
 	poll_wait(filp, &priv->wait_event, wait);
 
 	guard(spinlock_irq)(&priv->lock);
-- 
2.50.0.727.gbf7dc18ff4-goog

