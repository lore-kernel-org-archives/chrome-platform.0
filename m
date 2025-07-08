Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C4929B233
	for <chrome-platform@lists.linux.dev>; Tue,  8 Jul 2025 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961764; cv=none; b=WSCEMFGZMrXUShfyvPo2UUU0Kx0Tj8yzB/8CqnHmiazjLki221IcBpnIEWATk3A3BRcRCrH1HFAqmtcUKj/FOBwv3uYZM3j8Pzfvam8ir8vz4jMWSssnK8+A48JueUVT272aW4Hh/QugYl2S8jMJdnvEvsmJRnxyns56x0nYj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961764; c=relaxed/simple;
	bh=9vDcTRUJc4ermo/2Ss7CgWu3jNogkTUF/bCKpkZwUKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIQyAKkVyxiwfJIeAAIV+EzuyTLPcpGK/iGGLtFndSUnqPyEcmBHGPW8d3cYUoipF2FZHyn/OGE6v9bA/mAb22On3ZGLTmdWcdTLQNE5spFDRnCp22+9NHRKF0MaZCd8FLituzgUWO03dVoUTEQzJLvqWEKciUhGz1zblAp87H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLrxHRad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLrxHRad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8266BC4CEF5;
	Tue,  8 Jul 2025 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961764;
	bh=9vDcTRUJc4ermo/2Ss7CgWu3jNogkTUF/bCKpkZwUKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLrxHRads3dZmEA6zBKGVd44VUbAq+6GEbRUtRvpK6PWN7cEGVERKyPZXprC+va53
	 zD6w4cPxMg+j8+felAQuG7Jv150hr6NlvpRKmXBhFsa2nT2qJGFgCBAF2lEdKPxqVG
	 pQm6o1jU8KaE97Z77odOBafdeHIfWIg0ypzT7XJNBBkE9lDiGWw6R8C90GhR4VQ0xX
	 pH4vONoILCpHw/XsvKOb0jq7E2fZQcPxqF+O9JMQyoESv9NnrTS/lLey/+sbaE4Yxk
	 tQH0CvhEVF5YNaEfShPDKmvAr1TRdmHGwxSyfpmT7fJoUh7KxCjXsISZjc0NLlPp20
	 +J8+Whyx8Ck5g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 1/6] platform/chrome: cros_ec_chardev: Remove redundant struct field
Date: Tue,  8 Jul 2025 08:00:29 +0000
Message-ID: <20250708080034.3425427-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250708080034.3425427-1-tzungbi@kernel.org>
References: <20250708080034.3425427-1-tzungbi@kernel.org>
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
No changes since v1 (https://patchwork.kernel.org/project/chrome-platform/patch/20250703113509.2511758-2-tzungbi@kernel.org/).

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

