Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A4204C34
	for <chrome-platform@lists.linux.dev>; Mon,  3 Feb 2025 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587635; cv=none; b=SQzY+jLkiPytoZ969yiMleMQu2jQI5reC5TlWRdETDKnVSji50xrThRQD3IoDZsIukiDPFjRJqfRuAGY5BpTEmaNM7stS89bngrtSH9kzcjhyBXzsEKjaljAK68UsqIPsHdg/cP2foD1sT+d9mDqWEmGEzKoGG2lWmgEdGd8SJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587635; c=relaxed/simple;
	bh=LL6gfAu8GwnRNpsGn6atA+r1enD/inePC+cNmAhJO/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGFxgEBUujfFVIRUMpxooBEYGM+Mffa69X9sqV/Ti4oiQszGIRkGRbgx41onXg9abHi76eaWri02UgJ7TXlVtrTmP/2yTtKVIchSUtuwwJsvSA63DkM8J0Zj2Yn5mtYSHlEh1c/hw3Qvm+ZjbArfxGBrAGrk6BvVnMIth0J85Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UAET94nm; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UAET94nm"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso7082993a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 03 Feb 2025 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738587631; x=1739192431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZhQYJbonnYHiLNkHwoRDr/jemZOEPe4uCcAwPoPSx0=;
        b=UAET94nm5XTcyTMJZRh/alLFoonq+6z618l2sVWUJqpv8eKfkoqJv2yoz6t4l3OeLF
         7bRz44BxdrGzrbXSY07pOtL820D2ed6g9+YQBixv+Wy6LWXYK+nhnrd2xgouBdwAPZWk
         Q8ZcTZTBiaa7Xn1mG1f7hxDRx3V5XxoFq+HuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587631; x=1739192431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZhQYJbonnYHiLNkHwoRDr/jemZOEPe4uCcAwPoPSx0=;
        b=CHQmhsBQ4LRIOK4H3XKhujHgaH0+NFKgHONT5/No46hMElTjowOXCgQCZKGUF2Yp34
         9M8c3lSf7sr8gKeD85C9/5/djPaQbKmDLwyvrDVLui/27faZAnJ9YEEuOYinkO9pMxBz
         zbqmT7L8yRFprudrUc6WVXQVowqhEHZ4L0u4Sms5QaxnxG21DLL9yKa+oMwmFzqJ9Zvx
         mTwZ3saZ2ONh9OnEwM7pb+/XqsLU8lU6dLrzZE9ZFWNhPOdRKGHU3t+4oNTPXNSeyCNE
         45brhHsgNirVgZ+Ac7GTLU+oS0fa9WlxGRQebIbkon+j9GggJnMBTlx/VnHzNZaYO9ak
         BgDg==
X-Forwarded-Encrypted: i=1; AJvYcCXArUfmoQQ7IUp7tgOXx9LVEvDMk8LABm2GVNhHERDKuYIzLqICEQ4OiGXeYfX6GgzBMOhkRu0Ikyv9seoCEn4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWOkum8l5wB3IIl1AtRZOiykCbEKrhCgiyUTZgsesSuGrOwZL/
	UwgSt+fRtdBHIAGg7gCO7i2o7782LM/1GaeulULYTSBmuLkELzTd2zzxahoLhiHyjqRaQQXGmzk
	SMxxb
X-Gm-Gg: ASbGncsS9FyNVQKNsNGCQ0NwUAwgyl2s+Tq6fpruZfmdctmIK/D/G2Hf3L58foebJXz
	N/LSKpK3yxuFKITSWaI9AIbRFwtxRiFvQFs2Ij9i1X17cuZFQF4pjLOj8r5CSdH3vRcFR5VYDna
	+lxDJHCkxXSyjyHPJvBfMO/E/9nn6z0OhIGpvEF+5j8TdSuCawsh9vPtwYbylKQu+k6+Exmkj2p
	DG2K/br+gVWNu/cswZGBfF+1XfUgTzi7CVBM7Pp+5YY8Rax10CFbQtrSNwBsYUJezZhVW9cfup3
	tNa25K75/sfwL87Kjilby0JxwsNbq9nbAO7bTb/mGUaxNoBZ+o1PF/IkLeQQaRpIWKqZ8Cb2wgd
	xUag+vQ==
X-Google-Smtp-Source: AGHT+IFJF/DQR6k7nfEEy53STh5XvsowIkt/i+SapQ5k4Q193ae8NMu0h8hg2QV8k19bzUGlnfEhJw==
X-Received: by 2002:a05:6402:4313:b0:5dc:7fbe:7313 with SMTP id 4fb4d7f45d1cf-5dc7fcdb660mr16771564a12.6.1738587631436;
        Mon, 03 Feb 2025 05:00:31 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc87f2e5easm5319055a12.57.2025.02.03.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:00:31 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 2/2] platform/chrome: cros_ec_typec: Expose AP_MODE_ENTRY feature state via sysfs
Date: Mon,  3 Feb 2025 12:59:47 +0000
Message-ID: <20250203125947.2701106-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250203125947.2701106-1-akuchynski@chromium.org>
References: <20250203125947.2701106-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds sysfs attribute /sys/class/chromeos/cros_ec/ap_mode_entry
to expose the status of the AP_MODE_ENTRY feature. This attribute
indicate whether the EC requires direction from the Application
Processor (AP) before entering Type-C alternate modes or USB4 mode.
This allows user-space applications to easily determine if the AP needs
to be involved in mode entry.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-chromeos |  7 +++++++
 drivers/platform/chrome/cros_ec_sysfs.c        | 15 ++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-chromeos b/Documentation/ABI/testing/sysfs-class-chromeos
index e067dbdab170..7fa5be6cc774 100644
--- a/Documentation/ABI/testing/sysfs-class-chromeos
+++ b/Documentation/ABI/testing/sysfs-class-chromeos
@@ -44,3 +44,10 @@ Description:
 		- "SAFE": DP is in safe mode
 		- "TBT": TBT enabled
 		- "USB4": USB4 enabled
+
+What:		/sys/class/chromeos/cros_ec/ap_mode_entry
+Date:		February 2025
+Description:
+		Show if the AP mode entry EC feature is supported.
+		It indicates whether the EC waits for direction from the AP
+		to enter Type-C altmodes or USB4 mode.
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index 93e9ed87249c..f22e9523da3e 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -345,6 +345,16 @@ static ssize_t usbpdmuxinfo_show(struct device *dev,
 	return count ? : -EIO;
 }
 
+static ssize_t ap_mode_entry_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	const bool ap_driven_altmode = cros_ec_check_features(
+		ec, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
+
+	return sysfs_emit(buf, "%s\n", ap_driven_altmode ? "yes" : "no");
+}
+
 /* Module initialization */
 
 static DEVICE_ATTR_RW(reboot);
@@ -352,6 +362,7 @@ static DEVICE_ATTR_RO(version);
 static DEVICE_ATTR_RO(flashinfo);
 static DEVICE_ATTR_RW(kb_wake_angle);
 static DEVICE_ATTR_RO(usbpdmuxinfo);
+static DEVICE_ATTR_RO(ap_mode_entry);
 
 static struct attribute *__ec_attrs[] = {
 	&dev_attr_kb_wake_angle.attr,
@@ -359,6 +370,7 @@ static struct attribute *__ec_attrs[] = {
 	&dev_attr_version.attr,
 	&dev_attr_flashinfo.attr,
 	&dev_attr_usbpdmuxinfo.attr,
+	&dev_attr_ap_mode_entry.attr,
 	NULL,
 };
 
@@ -371,7 +383,8 @@ static umode_t cros_ec_ctrl_visible(struct kobject *kobj,
 	if (a == &dev_attr_kb_wake_angle.attr && !ec->has_kb_wake_angle)
 		return 0;
 
-	if (a == &dev_attr_usbpdmuxinfo.attr) {
+	if (a == &dev_attr_usbpdmuxinfo.attr ||
+		a == &dev_attr_ap_mode_entry.attr) {
 		struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
 
 		if (strcmp(ec_platform->ec_name, CROS_EC_DEV_NAME))
-- 
2.48.1.362.g079036d154-goog

