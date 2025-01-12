Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE1E185935
	for <chrome-platform@lists.linux.dev>; Sun, 12 Jan 2025 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736676500; cv=none; b=LAteEB3zTTg1j6klegjrcq3dQdwyTBSpVL8q5KCipmSYp6mMQWM/xlhFZl2+2IL1n4uCw4M6u4kMIIQ7amErPCgX2iRkeWMiKp9ZYhaYatyHt6yyrH3gqUMU/BMS+qtItjJgrjkeHBDjFkNMXbTOvA+1SDfgHikF4Z4pczuKCdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736676500; c=relaxed/simple;
	bh=Z6kdjKJXu/yio5pbfvtYSxercn0FfZL0jWkMmT5jSXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhBJtBDia3Sjt2rbsmD4CImB9yxAc21MIJvgFI8T0x/awx5reiiEVRZmjCtS1pfo5uUgYaEcIUah5PD7VmvPuacKQgCkmbilM2ZYfh0WOn2IpIolqiteCtJgxF7iMiqCu4VELvotOFVR98K2m2tYnyOQBeLD9LyH6B/S5dpRQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oBu6g2Rg; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oBu6g2Rg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736676480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m7P5peWtc6Tg1K6NBkmXpbqo/8mYVOU35MBO7g1B0u8=;
	b=oBu6g2Rg779poVYKcmZX8+uUt6u5PlEOZGl6BCzDa7aZkiN8z6JJbueul0caK9+VhSqAEV
	7ZnfA4P9/Mh6UMyBQcXTuJ53tYaicucXksyhWZ4DxruiRPJREO+YUHlH3nRT8xbZNyQHHa
	G4h+Japg1aoQ7Cb5Y3nIEaF0xrlaVyw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_usbpd_logger: Use str_enabled_disabled() helper
Date: Sun, 12 Jan 2025 11:06:55 +0100
Message-ID: <20250112100655.55741-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/chrome/cros_usbpd_logger.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index cd71f1caea81..7ce75e2e039e 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -13,6 +13,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
+#include <linux/string_choices.h>
 
 #define DRV_NAME "cros-usbpd-logger"
 
@@ -135,8 +136,8 @@ static void cros_usbpd_print_log_entry(struct ec_response_pd_log *r,
 		len += append_str(buf, len, "Power supply fault: %s", fault);
 		break;
 	case PD_EVENT_VIDEO_DP_MODE:
-		len += append_str(buf, len, "DP mode %sabled", r->data == 1 ?
-				  "en" : "dis");
+		len += append_str(buf, len, "DP mode %s",
+				  str_enabled_disabled(r->data == 1));
 		break;
 	case PD_EVENT_VIDEO_CODEC:
 		minfo = (struct mcdp_info *)r->payload;
-- 
2.47.1

