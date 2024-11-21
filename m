Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937761BF58
	for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166312; cv=none; b=diGW0AsrzN0m7Nm8wd073L/JPu5Syja50bOxfV7rUe28YJkONdZiOPW7CtveXQc/7Dyg3V8JXUVkf0QP63Xid3zBJquJHvCz4uz3mxmUlQb0JWPC8hamWPh0IyVJGIEH+wObpbBX79uaPcL/rtVspQLcEb/9tRhoxVGrjFJjXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166312; c=relaxed/simple;
	bh=3iNiMAaXuyRoPF8/xoY8wdLm6PfEbp5C9kJFn1jG7HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sVzBvRqZCtj39Oq6q+j/5+lB+mjz8ewTm6O1AavK8egw7f59LuyK+vVbgBV6BOFO+74jOD4fuVTXjHHTYsRBB4E/TCtQXBVovVsLURj8STOPGlSFiNpjDYIP7yiLFPugQushjsQgBNJTQpVHRZ1wdh+DAwQyRhOfcE2gb5IO1Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X3bslUix; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X3bslUix"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21262a191a5so4325675ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 20 Nov 2024 21:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732166310; x=1732771110; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRRi5SKhoizpTYQ3Ei2ujEmx27mAv2VTQ/FPrSwu6V4=;
        b=X3bslUixi/ZJqmOi4r7eJVIpRlU30A6Mn/928dyftAFg1xdnDlKGdKqSctPGAsBDAv
         FzG0zz2iGRXvAjlrGKcC4aW956LSg7DopE1SQZqlYgeoaMsAC0KKtG/PUGIOXHeOR/sk
         NcOAw4CSUIWPuIM/vm92xquG4P0Rlnb6xmswk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732166310; x=1732771110;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRRi5SKhoizpTYQ3Ei2ujEmx27mAv2VTQ/FPrSwu6V4=;
        b=fhUexKZOXi/70Kz6THs2SK/lJUco5A2R5tB1gEGzIach4lxSmhaghB5KjBzxanG6On
         yVdSde0qENGQ8hwFY3QGiRKmGIlb4LlSCu+UQiF86tfUrcbqI8d5FaBwtLAEP18+t+SE
         GdCckAZLJTKuiMWgUmWf1MgfUhDEhBIL4mz5Y3zhH6CnbHKA4nCvvIM55xN2mn3PLK1c
         T86AY0BdO62qzc913hv07ooVenWdL0wUbRNn7PY2ibS2njCaJbIH69AkgHGxKP+u85rs
         ctDqN8Z2lMSUILHnOXMrR5FPi75TLeDG/YPzCj+HP+gAKgriLrJb8dWnZvUYoduC0y/4
         AQTQ==
X-Gm-Message-State: AOJu0YyDrGEjbQfT3Jm2a0qxYM4TysY0hvySp1ERovy4r3pSAPj8dP/G
	Ll1ssZDWfg9iZKquRSQubFPEJPtN4EMW9+R3VsIcRV3PIhHJXmYuOGK+59aIZA==
X-Google-Smtp-Source: AGHT+IEcYjVTkLz1aNR2Rs+b1/26fkT8XZws7jDLf+IzBe8rUwmQgktERWQyKYkQGUrBjuGfJRAwMA==
X-Received: by 2002:a17:902:ce8c:b0:20c:9d9e:9049 with SMTP id d9443c01a7336-2126c130e74mr62613895ad.22.1732166309868;
        Wed, 20 Nov 2024 21:18:29 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:2c14:fcb:b86c:e723])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883e45c4sm4648955ad.218.2024.11.20.21.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 21:18:29 -0800 (PST)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Thu, 21 Nov 2024 13:18:26 +0800
Subject: [PATCH] power:supply: cros_usbpd-charger: update command version
 to set limit
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-fix_power_limit_ec_cmd_version-v1-1-2f15dcf32084@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKHCPmcC/x2NSQqAMAwAvyI5W7DFDb8iErSNGnAjFRXEv1s9z
 mFmbvAkTB6q6Aahgz2vSwAdR2DHdhlIsQsMJjGp1karni/c1pMEJ555R7JoZ4cHyaeqvDeuyFp
 Xpl0GIbIJBeMf1M3zvLEKxLpwAAAA
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732166308; l=1543;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=3iNiMAaXuyRoPF8/xoY8wdLm6PfEbp5C9kJFn1jG7HY=;
 b=wiyA9RmRAL+z2Xb4sx2KiPSsmD8rPIGptfjrdwpzGCLziP+0NGFIMFXJuWuABi8UlZoTVd2bM
 HY64Bc6uCQ4Cs8s4b6esQTyCOQz8ayDYRVb6lM96SqS9fAkk0Q2qOjQ
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The request that sets the power limit on the ChromeOS Embedded
Controller (EC) requires the command version to be 1, so update the
command version used in the driver.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
The ChromeOS Embedded Controller (EC) exposes a set of commands (host
commands) for communicating with it, and the kernel driver
cros_usbpd-charger uses host commands to get and set power settings on
EC.

The host command needs to specify the version in the sent request. The
set external power command (EC_CMD_EXTERNAL_POWER_LIMIT) requires the
command version to be 1, so update that setting in the driver.
---
 drivers/power/supply/cros_usbpd-charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index 47d3f58aa15c..c496c7c4dd2c 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -325,7 +325,7 @@ static int cros_usbpd_charger_set_ext_power_limit(struct charger_data *charger,
 	req.current_lim = current_lim;
 	req.voltage_lim = voltage_lim;
 
-	ret = cros_usbpd_charger_ec_command(charger, 0,
+	ret = cros_usbpd_charger_ec_command(charger, 1,
 					    EC_CMD_EXTERNAL_POWER_LIMIT,
 					    &req, sizeof(req), NULL, 0);
 	if (ret < 0)

---
base-commit: ac24e26aa08fe026804f678599f805eb13374a5d
change-id: 20241121-fix_power_limit_ec_cmd_version-6f2d75ad84b5

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>

