Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611BE21FF26
	for <chrome-platform@lists.linux.dev>; Tue, 16 Sep 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758014676; cv=none; b=six7JeL4ixMznz/gPwZGL7RlMgZmrOJGaSLMJsIyCfn2KVr+KDX5lG1jaZCcjnezGdkXhk5Ysye1GJihck/ankR+Qw0GUngl89kcW9XC8wqpBFp8vzoQ/Ug3AxREa2iBwNQDUr2TVsEaVW8ABx2ueVwtMjYQONONC8b30t/lIx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758014676; c=relaxed/simple;
	bh=Ngrjx2eG2hVF2WZBcGGEhh9NX15Q4San1SUfshxaRlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RoB+DMfBCaYj1TxzIyDmimVn8RNEzBMCWErQqZprpyyxGFg3qyazcu8rzps6x5Go3r1XWRxZT2ZfT4rva7wLmwhA8+C68EVoRroIdatoEBalFaREUQSZly+Hq8Uoyy0/9SX3U1Je/HqVFHWkP0Vo2wdzSTNfGnonJpAGVWa5h3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGa2ZIRp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGa2ZIRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEC4C4CEF7;
	Tue, 16 Sep 2025 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758014675;
	bh=Ngrjx2eG2hVF2WZBcGGEhh9NX15Q4San1SUfshxaRlA=;
	h=From:To:Cc:Subject:Date:From;
	b=UGa2ZIRpsk1qnM2vM2khu7XGteW3KoD6vV3cEkdC+lHito5C/WIEV+Yvn9csVzJP8
	 FC0FyEhKHdyBCeO/XhmUi3urEWjyxcK4ASgtD5PWs71QUh47WqIOdSPObY1rSNWwQH
	 1UTzz5oRsnnT0tFrtA+PY9qqRldyJXED84JTWEe5PVDpH8JQcVEZKHeSPq71OdMNDm
	 IuAIt7GqxvxwAdrEBq3iFosJLLAoxflHlceE/cjaaRj5zBOChaDGDsZDfwrP9fCgMX
	 mxGi1RKWiGdppduHWCLPFLdDUeXVVprFCkdqTQh3tjKaCt9pRYSOS2/1de0tj73E9/
	 5D2GCsCOgvNZQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Cc: tmichalec@google.com,
	tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: cros_ec_typec: Defer probe until EC device is registered
Date: Tue, 16 Sep 2025 09:24:14 +0000
Message-ID: <20250916092415.1707444-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to 48633acccf38 ("Input: cros_ec_keyb - Defer probe until parent
EC device is registered"), use `cros_ec_device_registered()` to check
parent's status.  If the device is not yet ready, return -EPROBE_DEFER
to ensure the probe is retried later.

This technically reverts:
- 731a4702b668 ("platform/chrome: cros_ec_typec: Check ec platform
  device pointer").
- 7464ff8bf2d7 ("platform/chrome: cros_ec_typec: Check for EC driver").

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..17379e8b13b3 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1341,7 +1341,7 @@ MODULE_DEVICE_TABLE(of, cros_typec_of_match);
 
 static int cros_typec_probe(struct platform_device *pdev)
 {
-	struct cros_ec_dev *ec_dev = NULL;
+	struct cros_ec_dev *ec_dev;
 	struct device *dev = &pdev->dev;
 	struct cros_typec_data *typec;
 	struct ec_response_usb_pd_ports resp;
@@ -1354,10 +1354,14 @@ static int cros_typec_probe(struct platform_device *pdev)
 	typec->dev = dev;
 
 	typec->ec = dev_get_drvdata(pdev->dev.parent);
-	if (!typec->ec || !typec->ec->ec) {
-		dev_warn(dev, "couldn't find parent EC device\n");
+	if (!typec->ec)
+		return -EPROBE_DEFER;
+	/*
+	 * Even if the cros_ec_device pointer is available, still need to check
+	 * if the device is fully registered before using it.
+	 */
+	if (!cros_ec_device_registered(typec->ec))
 		return -EPROBE_DEFER;
-	}
 
 	platform_set_drvdata(pdev, typec);
 
@@ -1368,9 +1372,6 @@ static int cros_typec_probe(struct platform_device *pdev)
 	}
 
 	ec_dev = dev_get_drvdata(&typec->ec->ec->dev);
-	if (!ec_dev)
-		return -EPROBE_DEFER;
-
 	typec->typec_cmd_supported = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_CMD);
 	typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
 	typec->ap_driven_altmode = cros_ec_check_features(
-- 
2.51.0.384.g4c02a37b29-goog

