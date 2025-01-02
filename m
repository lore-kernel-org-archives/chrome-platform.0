Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BEDD528
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jan 2025 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735851903; cv=none; b=DqadxY2tNhE0ARzxHEMcv+Xw6LNPSBHGVYLDQFcs1nx8eNiDCvIzyHMfPvh3MsZJy3hbnKh4EZDiW/YMax/sISyiAcXdZrYMt6nc7w8n249AsIqCChlXOz30wi9oe24wLvg8PEzlIiSiSCC9WVwN0Jw7xEegVio7vfb5wGQ+o6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735851903; c=relaxed/simple;
	bh=5zQdK13xtrCKDK9xGESW4BfJFPD/Ar1U64fYytvJ8OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=czmeOCvMGJovmZjcca1B82F56MbZaX3gy29NSoEzaO8oqVGFM40oQDIfuk8H/jh2/y6UYb5pC5b/fYt2p8qr3XEmCPTEdZVf3mqnBp+U0Fyxl5+Fc+sO1yDHLfmiYLY6Pvpn+0N1nn1ODTJIY3XdTFb7plnHzl52w1HcuEyEgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RyfEW49Q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RyfEW49Q"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb95317so165401915ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jan 2025 13:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735851901; x=1736456701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C+QJbavX7HdDfHFe53DpWiA/pVYzEokj+ijuptplxbY=;
        b=RyfEW49QWHE0BQaDEVX95GDI6Paao34TI+7hVpHVrRufG/dSb34QnNzqWQNMXrDh4B
         sGekpZfbb/hSv7efDJN1aJaOItWBkKILP25UBwiyZUGrc5PmP0bdPzD2phBGxWAW/f6M
         mYORteOS5Of6AJp0VoaDkcM6wFzkcgflKPMoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735851901; x=1736456701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+QJbavX7HdDfHFe53DpWiA/pVYzEokj+ijuptplxbY=;
        b=KbSj+afPGsDfmUb8y4CaKhhC+p/7yIhCh2AwvKb0HZfqY4sB1lF2ZJy6z/4fZIWPvC
         pjqIMj2lDeOthtZX63bl2xxTuoC9ldBdDgQ0x2QSwIUVVr1AOIc+EE+AwO80wwlAgFvS
         P4zAR45hmTq3NJtV0/6abvQ8AyMH7etxbqaP10ga3sSV0YMfdrDBqXDBOEIezrnjx//u
         hszSDkmfn17rbRAnh6fRxFvpb8jYM+d+Ow/Phtfzw8TrN9dulfforOItNIFOsskdKFgM
         OFToXKOTeX98Obn7MMkGNuAmRF9/dkl/9YUu0nhhhoyI7Dcdv+1g+q/iWXhFUKR8wGpp
         mupg==
X-Gm-Message-State: AOJu0Ywknn+VreYcRW9t0pMOFJiK7plqv/Xl5+0cqZQjuHsZ1KoeEs4Q
	bkuBJPPkkIYtOmKUUEHPmyYh81dCxESoUH6ZE8KdUMXxhClfqtiVK6mqfzm/Tg==
X-Gm-Gg: ASbGncv5lSPpvT6EoWtErQMr2fHYuGlwzpMvNqpOnA10CUXab2vsM9Tuc4rjSkNTMEq
	MfyXe0hOLal+YQaJpQfwIu2uu5hGykv5BX91co186NZGHhBYNzYCRjSPkoty+mzcRQ7NUtlN3Di
	k1GfYIsItqcK4yoXcvvPJWHSNu/lxta7a7/ubW8yYP62ND2+Zz1RKjHtPPFoiyDyez+gozpKBBT
	4Dbq2ri1eFP3By/nQd+lfqBlErVGYycnwihp20LDTu4sWEGNBRFpAYz
X-Google-Smtp-Source: AGHT+IFeVIuWpD+bU/N/5lsp5Npf6SscW4FsNkIABUkoJa1UsIzVQZxQEh//J3q9swwxxfUw3FN7EQ==
X-Received: by 2002:a05:6a00:600c:b0:71e:16b3:e5dc with SMTP id d2e1a72fcca58-72abde84e5cmr67424044b3a.19.1735851901295;
        Thu, 02 Jan 2025 13:05:01 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad8fbac8sm24877169b3a.159.2025.01.02.13.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 13:05:00 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	dnojiri@chromium.org,
	utkarsh.h.patel@intel.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH] platform/chrome: Update chromeos EC command tracing
Date: Thu,  2 Jan 2025 13:04:56 -0800
Message-ID: <20250102210456.2399245-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mechanically update tracing with new command:
sed -n 's/^#define \(EC_CMD_[[:alnum:]_]*\)\s.*/\tTRACE_SYMBOL(\1),
\\/p'
include/linux/platform_data/cros_ec_commands.h

Fixes: 425d20518c54 ("media: cros-ec-cec: Support receiving messages from multiple ports")
Fixes: 5d227f02ceb9 ("media: cros-ec-cec: Get number of CEC ports from EC")
Fixes: 56d629af09b9 ("power: supply: PCHG: Peripheral device charger")
Fixes: 845301001308 ("power: supply: PCHG: Use MKBP for device event handling")
Fixes: cd2c40ff90b0 ("platform/chrome: cros_ec: Import Type C host commands")
Fixes: b64afd949ee3 ("platform/chrome: cros_ec: Import Type C control command")
Fixes: 0e0dba884c43 ("platform_chrome: cros_ec: Add Type-C VDM defines")
Fixes: 8553a979fcd0 ("platform/chrome: cros_ec_typec: Send mux configuration acknowledgment to EC")

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_trace.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index 425e9441b7ca5..9827b3117597c 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -122,8 +122,10 @@
 	TRACE_SYMBOL(EC_CMD_ENTERING_MODE), \
 	TRACE_SYMBOL(EC_CMD_I2C_PASSTHRU_PROTECT), \
 	TRACE_SYMBOL(EC_CMD_CEC_WRITE_MSG), \
+	TRACE_SYMBOL(EC_CMD_CEC_READ_MSG), \
 	TRACE_SYMBOL(EC_CMD_CEC_SET), \
 	TRACE_SYMBOL(EC_CMD_CEC_GET), \
+	TRACE_SYMBOL(EC_CMD_CEC_PORT_COUNT), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
@@ -161,11 +163,18 @@
 	TRACE_SYMBOL(EC_CMD_ADC_READ), \
 	TRACE_SYMBOL(EC_CMD_ROLLBACK_INFO), \
 	TRACE_SYMBOL(EC_CMD_AP_RESET), \
+	TRACE_SYMBOL(EC_CMD_PCHG_COUNT), \
+	TRACE_SYMBOL(EC_CMD_PCHG), \
+	TRACE_SYMBOL(EC_CMD_PCHG_UPDATE), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_GET_INFO), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_ENABLE), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_IS_ENABLED), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_SET_VOLTAGE), \
 	TRACE_SYMBOL(EC_CMD_REGULATOR_GET_VOLTAGE), \
+	TRACE_SYMBOL(EC_CMD_TYPEC_DISCOVERY), \
+	TRACE_SYMBOL(EC_CMD_TYPEC_CONTROL), \
+	TRACE_SYMBOL(EC_CMD_TYPEC_STATUS), \
+	TRACE_SYMBOL(EC_CMD_TYPEC_VDM_RESPONSE), \
 	TRACE_SYMBOL(EC_CMD_CR51_BASE), \
 	TRACE_SYMBOL(EC_CMD_CR51_LAST), \
 	TRACE_SYMBOL(EC_CMD_FP_PASSTHRU), \
@@ -184,6 +193,7 @@
 	TRACE_SYMBOL(EC_CMD_BATTERY_GET_STATIC), \
 	TRACE_SYMBOL(EC_CMD_BATTERY_GET_DYNAMIC), \
 	TRACE_SYMBOL(EC_CMD_CHARGER_CONTROL), \
+	TRACE_SYMBOL(EC_CMD_USB_PD_MUX_ACK), \
 	TRACE_SYMBOL(EC_CMD_BOARD_SPECIFIC_BASE), \
 	TRACE_SYMBOL(EC_CMD_BOARD_SPECIFIC_LAST)
 
-- 
2.47.1.613.gc27f4b7a9f-goog

