Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8A93FFD
	for <chrome-platform@lists.linux.dev>; Mon,  8 Jun 2026 21:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953332; cv=none; b=rmOPuxB7FfSs/DVNdi9NvsiMhgZc4wnyx6NaX87SQyptGZeYjgta9YcLmlSyF6KgzFl2Rjb5pa9jf7/NvIWkiP0012ZJZZdEdoe7LSP1jl2v/UlVDlsqr4EL0joiGcmZTmuUkZlHymvrB7RfXCHYA72F9GDO2OF8UveLQebmISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953332; c=relaxed/simple;
	bh=iFAgN8DbE7OVcSutM8notY1MwxJ8XpYFnGmY52k4hK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fx4iMzL7f5+ZIIxPe9S39aLM7pcUoAwYLO8+GhNL/3IFVx2CQ9M488jQCaC7n42QkVuoUHCScOVKDu0i67koYnfhmUjYS4GZLm0EdA4QPxzuMPsCnoGaKAXEJs6fgRyQ2ucatPMesjoWXpNu/mE0ubZMemwxnOqGhGe2evA0+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iwfaruCe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iwfaruCe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bed19623d6eso621861666b.1
        for <chrome-platform@lists.linux.dev>; Mon, 08 Jun 2026 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780953329; x=1781558129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrpvRF346UBWhP9CBug8gjoooYVDpjPlcz44UjO5FtQ=;
        b=iwfaruCe6VZQnSPVSYjFGyObDZhuhg7gAgqlqzrPrefPIAFmWDIPJPzxBEWr2vEyB4
         BSIOo9JZn2kc0RWDa+W8Q+rYJWE5oUBXisjdE65Iw3ZOQ8NBXHmRY7izR3b2g+kV9VKq
         Q3c2C7wPHZkGHS1g3pRmXw4AAH87knHMBGI3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953329; x=1781558129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YrpvRF346UBWhP9CBug8gjoooYVDpjPlcz44UjO5FtQ=;
        b=T8S6qX7wzyTapAjyeGl1nxhxkNhytR3XEuBRz+mvjzs48CLtvSlgYu0GizlFFU/K1k
         PL8F1y4YMbzQiRYDQPU5/8IhJi1vaBunmEzPLai2gF1NrkCIh84mpa6YMW4oikMhu3R3
         jwmfZDq7Fm59eJLMSMHVDQsm9CQrRqsEJsTrn9TztOKDn01+tcsfeRN9k0c31iFCSNbj
         6gi6fkmJHnJ7K47Hodm+cU44eKurjsLyYBkcPk34S4RGXSCQvWFgfGLqSYRD5bG4KTe9
         Tv+8NUgTzftWC3ejDGZc00sD/V4SVmoonU2cGiMSBiN54kCC7nwkgHiiubMZmOeBkGIG
         ig7g==
X-Forwarded-Encrypted: i=1; AFNElJ/unswbZhGTpg8urw0R2zKwVcK6mfM1dl2nVriB7HnVgyxl3KMOCLU4aHcyGFVSp06F/RkULkXzcb3v5qx336g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOB8GxLYdPNLwI8QAqaHSORGz2OVUEa5WOa9DZriP+RWLwL75O
	On9KZvQiyDveKEW/qhKYDBPTYiOMXbxsalY7RN9fD4K5ox5dZNsCuPKYSyVycCk3xQ==
X-Gm-Gg: Acq92OEFQ48kP2ajaoB45DhZM2AY4LwQBmiN3YkUch1Yg960X8dLPDh6rPG8SS5ElUN
	rGHoYielKriSp4DOOnIO4ocidsfl3Q0Bn+/ns2oI8S9bIPIeNZy5mV2V5gAce4N+Vkd35yxPrTe
	FtNcAKjUKHw314d5mNxJqcQ8Tx3T1pJO6C0iadrav9F7GpUD13IrmuF/fyyhM5B3CDwHgqksu8B
	oB0MjtLLy76p0X1sP1u/mqx27bzCOHzTW/oEqifD74dPNj/WHL0m1XKSLNVnGGfTNbrvX8/+9lH
	Yt5Y7E8ryJmmf3P5B6Rqvi3dNqs5D5ncrbjg8445vI9loG65sFkpCEuPyOR71KZw3O+rO7l5PSZ
	+kpVMKz+HxDcUCHlzhg44DDK0o243LkkiCSuSJzvbz0L1SUkaa7EMfJb3N43eGupt3J6anvLucN
	Fv/Gj6+FX9x55GzB+tuylC+kgMO84zxO3uF0fcG17Ar6DKlyj1dy+0VnP2CPPK85xDpZ48G1Iwb
	4KozsBwfe8wm6UmfAyPkSSGzsHJUb8=
X-Received: by 2002:a17:907:ca84:b0:bee:f72a:28d6 with SMTP id a640c23a62f3a-bf37096c195mr850339066b.14.1780953329293;
        Mon, 08 Jun 2026 14:15:29 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm931041566b.4.2026.06.08.14.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:15:28 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 2/2] mfd: cros_ec: Read EC features during probe to catch transfer error
Date: Mon,  8 Jun 2026 21:15:18 +0000
Message-ID: <20260608211518.2214740-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
In-Reply-To: <20260608211518.2214740-1-akuchynski@chromium.org>
References: <20260608211518.2214740-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_check_features() does not return an error if the underlying
EC_CMD_GET_FEATURES command fails. Consequently, when the Fingerprint
device fails to respond, the probe function ignores the failure and falls
back to installing it as 'cros_ec' device instead of 'cros_fp'.
This leads to a sysfs duplicate filename collision later when the real
'cros_ec' device attempts to register:

  cros-ec-spi spi5.0: EC failed to respond in time
  cros-ec-dev.19.auto: cannot get EC features: -110
  sysfs : cannot create duplicate filename '/class/chromeos/cros_ec'
        : sysfs_do_create_link_sd+0x94/0xdc
        : ec_device_probe+0x150/0x4f0

Fix this by explicitly calling the newly introduced cros_ec_read_features()
function. If the transfer fails, abort the broken device initialization.
Move the initialization of class_dev before this call to prevent a missing
release() callback warning on the error path.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 39430dd44e30c..a8c6300248d59 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -203,6 +203,17 @@ static int ec_device_probe(struct platform_device *pdev)
 	ec->features.flags[1] = -1U; /* Not cached yet */
 	device_initialize(&ec->class_dev);
 
+	/*
+	 * Add the class device
+	 */
+	ec->class_dev.class = &cros_class;
+	ec->class_dev.parent = dev;
+	ec->class_dev.release = cros_ec_class_release;
+
+	retval = cros_ec_read_features(ec);
+	if (retval < 0)
+		goto failed;
+
 	for (i = 0; i < ARRAY_SIZE(cros_mcu_devices); i++) {
 		/*
 		 * Check whether this is actually a dedicated MCU rather
@@ -220,13 +231,6 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
-	/*
-	 * Add the class device
-	 */
-	ec->class_dev.class = &cros_class;
-	ec->class_dev.parent = dev;
-	ec->class_dev.release = cros_ec_class_release;
-
 	retval = dev_set_name(&ec->class_dev, "%s", ec_platform->ec_name);
 	if (retval) {
 		dev_err(dev, "dev_set_name failed => %d\n", retval);
-- 
2.54.0.1032.g2f8565e1d1-goog

