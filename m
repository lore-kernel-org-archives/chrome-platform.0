Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AD1F4184
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841292; cv=none; b=uNMf7BTEeY6GpkdzRAEvOjGY51MlPsC3q/bcCxWlU7gXTtT9LZZR+cE330+Pq2w96djywdoiT0EZaU1bJV+pcSlVefGfzUzmAQsmy1hsziDiAC8K+461sQugpj+oeWqiSrsiZH31aslZyN0wr+h9adCifaSpiQcGxCi62tjm5/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841292; c=relaxed/simple;
	bh=6YZPbCIstrkFIBq12YFEFEcPE+av42I+9yZpNMwYV10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEzSB3baPsHE1wbGA1A7vQEusxi4Qq1HFKhK0oTyU0JIqmoFDXJGak8i3ulHdB2sOtPkfYrNx8J076ZbYX12HwUXMRTyChvjUfl1BcHhkX+5bPpbgIhP3eosNc4LDYLcAa9lsLsamoIAycfsX4PGlMiSirIK5Pwt1sqiunLYO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S5HSWGoX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S5HSWGoX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224191d92e4so10079165ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 21:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841290; x=1742446090; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+gtVH5q1IVL2N3KNRKRTyNZRjmajO4WtYbaLiekdyM=;
        b=S5HSWGoXkgwreZwgt1dYLPkv2jSvKsIu0P7J6ve4CnEXiuIhbA8OmEeM+lQBtL3dSU
         P24tb+ixTt4ViHMkqKDNurl8z7akjceKX/OdnKMGQsPwmw+8bO/WwvPJ/0/tyvBgzqL7
         o0CRcOiydxxQNtfB0n1EDXQCpS22dTMpSvVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841290; x=1742446090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+gtVH5q1IVL2N3KNRKRTyNZRjmajO4WtYbaLiekdyM=;
        b=L1bb3qTq5GNhwwL3z12Atk7kX0uYVtOtLZVNKacUx07ujYljyLZQsLltLeg6QeJlEi
         kmFJ/Zt8RuAYW3qT5tcjRqjfnT1PLtG/Uzt/HqSTHQVQa/804LxqEyelGhx9/z9j8pXn
         h2Grdm0dfhjft0ir/32epkl4BMZAmB+CBMVTdmpRWFtNRBDcFBb8FVwQVPxYx66PmpAD
         BT5Os+eFHA70/smhba23M8Ml3yOi7BUNc1ghQIcs90Nx4euloVbtOSSiluCYbH1wYdOt
         /b5tKlNF41UiMRcTusEXY0s3pycFHpMsH11dstn/11ZutiqxY9+C0vBVwMkbzbvGqGqx
         XjOg==
X-Forwarded-Encrypted: i=1; AJvYcCVM4oK2RTt6B34TDJhpkaCzdkXWHaXCTEiiMOy6dfJ79tafwIPHrUSczfMuM51Ad6m6ESbGDNCpwtPz0fbMEHs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgO7KHuAlUzxFGpD5A3E73rrZhYk/OmjqFfklYPzTA+MjGqp1G
	KYlxrIy1PMYrrRt8fFlYCVzXM41vbEus98Aj4F2RSUWuKtDtvCDxi5x9jqEhIQ==
X-Gm-Gg: ASbGncuTo1V1YKkQ1sg/lDr44pax/pAQV2KnqnQwSQS/BMiuL9cUmNRM679zkgyWDwZ
	zmWzaL+gkaa3C+Ac28QEGWVytpEg7OqN6fTHFSxszAhacaZNQbU5ZvDMdvTpTl4FmFZVj9EiHfi
	i6TFTOUuyCKLMc96yB/l0iN/R7f2jMm8fwJGCFbYoVvrzNUlW5rX8Jfuus0QlmgTLiV8X6Y9Eey
	vUXiGBXjrVNXFW9rVJi2BoT0oLi6GT+JDYRpJlJTZB7y+J5hRWqXUR7OBlNpOfHkWYQ85uoA9A/
	PtUwAkr2BSfGyhJD1uDfqG1Ns/w6XOCGu80UaMmPr6sXvQoH/XX1hlx4W8n/bYhNoF4=
X-Google-Smtp-Source: AGHT+IEaZ5AffNlbpnnWajl9IqcugOB73K+75CMHqeDiaMOSmLOQz2lLmmj4CJcymfMhLCNoiy1i9w==
X-Received: by 2002:a17:903:2281:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-22428c1908amr341875375ad.50.1741841290572;
        Wed, 12 Mar 2025 21:48:10 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:10 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Thu, 13 Mar 2025 12:47:44 +0800
Subject: [PATCH 3/3] hwmon: (cros_ec) Register fan target attribute
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-extend_ec_hwmon_fan-v1-3-5c566776f2c4@chromium.org>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
In-Reply-To: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=1917;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=6YZPbCIstrkFIBq12YFEFEcPE+av42I+9yZpNMwYV10=;
 b=JhUhhxTRkvnPU2ov79FmQS4td92jVH4sj9+r0KoSiXE2Sg7nvJ8UWqERzYXiXc47oPttOjo78
 tc+qyXZb9F1AjCgrfx1CFLpQ/fMpFl1pTwbrfgNiaVXvLnhUkahlThK
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The ChromeOS embedded controller (EC) supports closed loop fan speed
control, so add this attribute under hwmon framework such that kernel
can specify the desired fan RPM for fans connected to the EC.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 73bfcbbaf9531be6b753cfef8045fd5dab5b2ab3..56a8ee13ec2a9f8e7127815a530d2a254a45bf55 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -168,8 +168,15 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	const struct cros_ec_hwmon_priv *priv = data;
 
 	if (type == hwmon_fan) {
-		if (priv->usable_fans & BIT(channel))
+		if (!(priv->usable_fans & BIT(channel)))
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_target:
+			return 0644;
+		default:
 			return 0444;
+		}
 	} else if (type == hwmon_temp) {
 		if (priv->temp_sensor_names[channel])
 			return 0444;
@@ -194,10 +201,10 @@ static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT),
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

