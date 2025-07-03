Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F862E426A
	for <chrome-platform@lists.linux.dev>; Thu,  3 Jul 2025 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542522; cv=none; b=V/f9d/Lb/baKtIh7qyf0OsgJdtqXlBZwwyvUqHa+upXs67YI6JixKGJhklzjZ1+27PJgYJNumCc9fxEizwzxByaWC1bn2ZB8al21q1xKETOVTns7nYqjFEt87fK2SQLDkUKNRbCVfzcg8f9tCoF8WqskND06iyxhLQZpZKBshNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542522; c=relaxed/simple;
	bh=QytvG0XjE7lIedcgfL17O73rx8CaNhd7df2OS8+FwoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hs1pxheEGQh2NlLmUjkC6NqtcXDAbMycrHYMhaOoJ/aoYIg0Ux1mL3ofj84aaS9jt62u7SHJSiyMmY9RlJo52myqmQxppAV3d97HskDa8Ba1UaZ/C6QuFd4Uv9Zj6eurJonwiE/Czias2CVvPISrOpGnynl816TrD8d1mnlYoVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWG8T36w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWG8T36w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A3CC4CEEB;
	Thu,  3 Jul 2025 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542522;
	bh=QytvG0XjE7lIedcgfL17O73rx8CaNhd7df2OS8+FwoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWG8T36wbIq4Qus6sMLTQp9bk4ij/2P4cA5TnFEVyLATSOWHAtMxvEwuF8LapZDje
	 ii783/0RJCDV4MEHPNsagewgOtoq4c46Sx4QGpWn3h07bcxEyR574ZQ+UdXkKIKGRy
	 tV16CUXyaKmgCWbum0vq+jKGE4FKyewdKiugQau32xX5JazB8G76L0YEmslANsQEX2
	 IPdqpj8qeNdx5x75EiVYwagpLyRUbGoTr0iB1UYvC65pM+wuUuCZGX/XMyBEsq+2er
	 AstLZqKPBbN83nLxIMBW3TsiEbWDRMOX1c/DD0Tr+pnKhwyLnv6aI89EsiiMp4aoI4
	 AozVpSXCFJ22w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com
Subject: [PATCH 1/2] platform/chrome: cros_ec_chardev: Remove redundant struct field
Date: Thu,  3 Jul 2025 11:35:08 +0000
Message-ID: <20250703113509.2511758-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250703113509.2511758-1-tzungbi@kernel.org>
References: <20250703113509.2511758-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`ec_dev` in the `struct chardev_data` is unused. Remove the field
and the whole struct as well.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_chardev.c | 28 +++++++++--------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 21a484385fc5..5c858d30dd52 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -31,11 +31,6 @@
 /* Arbitrary bounded size for the event queue */
 #define CROS_MAX_EVENT_LEN	PAGE_SIZE
 
-struct chardev_data {
-	struct cros_ec_dev *ec_dev;
-	struct miscdevice misc;
-};
-
 struct chardev_priv {
 	struct cros_ec_dev *ec_dev;
 	struct notifier_block notifier;
@@ -379,29 +374,28 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec_dev->dev);
-	struct chardev_data *data;
+	struct miscdevice *misc;
 
 	/* Create a char device: we want to create it anew */
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	misc = devm_kzalloc(&pdev->dev, sizeof(*misc), GFP_KERNEL);
+	if (!misc)
 		return -ENOMEM;
 
-	data->ec_dev = ec_dev;
-	data->misc.minor = MISC_DYNAMIC_MINOR;
-	data->misc.fops = &chardev_fops;
-	data->misc.name = ec_platform->ec_name;
-	data->misc.parent = pdev->dev.parent;
+	misc->minor = MISC_DYNAMIC_MINOR;
+	misc->fops = &chardev_fops;
+	misc->name = ec_platform->ec_name;
+	misc->parent = pdev->dev.parent;
 
-	dev_set_drvdata(&pdev->dev, data);
+	dev_set_drvdata(&pdev->dev, misc);
 
-	return misc_register(&data->misc);
+	return misc_register(misc);
 }
 
 static void cros_ec_chardev_remove(struct platform_device *pdev)
 {
-	struct chardev_data *data = dev_get_drvdata(&pdev->dev);
+	struct miscdevice *misc = dev_get_drvdata(&pdev->dev);
 
-	misc_deregister(&data->misc);
+	misc_deregister(misc);
 }
 
 static const struct platform_device_id cros_ec_chardev_id[] = {
-- 
2.50.0.727.gbf7dc18ff4-goog

