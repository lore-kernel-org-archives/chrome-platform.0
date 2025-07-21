Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9F1A315C
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073128; cv=none; b=VCkSAXQ6jw35/uG8FiRqXe1ngCoOMR/Fd40N/q44/aqnXxIszL8xUqOgB9MYisZGjUVawa15VpBcHXRYpx030a2qT0EWIJg0ur+fKfVniXGoOIo2YR5ojmHTlZYFfoYdxLW/d12o0hoCVvFsSHoGTryCSQSzKXIWfcxDpxpe/M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073128; c=relaxed/simple;
	bh=3YCWv9v8ZxFIrElXS1/EueuGqOSLLb3/dMBSznF0xl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MR3Jk3vvILIV3UzYPyHD/qY+ULYG0dea+EooCDGofSKyJS2bOe5v9jEdSQCSSgjjlO4bIZiJndpruODo7JB4HXf8PInfEfSAMYVsTLS1IR++TQ2Gpk7UKnnG9H8u55P484BhIKjWAHyb7/3A8RVeRl+VIItvyvrC0mDKrSBScRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdt2CYQN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdt2CYQN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B445C4CEF6;
	Mon, 21 Jul 2025 04:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073128;
	bh=3YCWv9v8ZxFIrElXS1/EueuGqOSLLb3/dMBSznF0xl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdt2CYQNWa+jgxpetizpFWb4sg9aFzS5x8IbVoMY029oZLO8Hcms+b8mWeZ3oYvh5
	 LJdqd1j0p1dhUfMYT084ZmDfucDzm5wGFWjSBV1osBp8SJ20Nz7tAmZb6zS3UENSzF
	 SIrWz7qLmkgsbiNEZA4sz+Rexj6m6TulOe4aWh/AL5i5PGApsWtpc708tbYuTs8tTH
	 qx4Z+71HAkOQF6KQcIVtzUtNgsYCwNCAcIrOQX3MCHTcaDReERw/NOzmkTuUdWMFFs
	 1c95iEiS2EEO40QJk19+Lgu+12LpdRuIooqFH0WCBQvIxN6iGLO4UI7CmEGhFlM1sR
	 LEBITRaqBbKiA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 7/8] platform/chrome: cros_ec_chardev: Hold refcount of struct cros_ec_device
Date: Mon, 21 Jul 2025 04:44:55 +0000
Message-ID: <20250721044456.2736300-8-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721044456.2736300-1-tzungbi@kernel.org>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hold refcount of struct cros_ec_device to prevent the memory from
releasing when the fops still depend on it.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes since v2 (https://patchwork.kernel.org/project/chrome-platform/patch/20250708080034.3425427-6-tzungbi@kernel.org/).

 drivers/platform/chrome/cros_ec_chardev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index c9d80ad5b57e..1cb09ca3b850 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -181,6 +181,7 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 		kfree(priv);
 	}
 
+	cros_ec_device_get(ec_dev);
 	return ret;
 }
 
@@ -256,6 +257,7 @@ static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 
 	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
 					   &priv->notifier);
+	cros_ec_device_put(ec_dev);
 
 	list_for_each_entry_safe(event, e, &priv->events, node) {
 		list_del(&event->node);
-- 
2.50.0.727.gbf7dc18ff4-goog

