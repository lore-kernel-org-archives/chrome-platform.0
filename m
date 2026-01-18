Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDAC21FF26
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751105; cv=none; b=oX0S47/UGwKF8rLS8rC5gSPy2NbLvKyW8GzfMOnZB22hlucph1dirVf4b+Ib7UUn7knR3NzJFBstaSZxodK9egtJ/M0onzp27LnymKrFAQ+7VA3vj/T84wrbEK8lvTOUF7Yfx/ZgicA0MZ4YipvtmPMDpJbRySuHd+QPq7Ic42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751105; c=relaxed/simple;
	bh=8Qsn8l9ngnc+knSDLyebRMQVPK7UtYm5UK7xm5nz2xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbHeYDcC+jOdIVX9TAayGNClD26DKXtbptiq3VeadqcKp6879QRS5SMFCnonWWwaBBTUWOEqz6sF2lMF9J4jGmrcu1TwLNORBqEgq9h/ZJ5OB8MMGonh0jVEwPr6ynqHtGksxl8HYMc+nPzqm9IsY34eC4V7nuRmMRlt0OxEdlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHzM52yR; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHzM52yR"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5637b96211aso3223417e0c.2
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751099; x=1769355899; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5xzC39ymMALozKjLqKfAnaQGtCnTtEhf1tuivfMM+M=;
        b=IHzM52yR2dovjw7p0+NPxkcTUsCHY40VDnZhl1VvJCxjFwhAmgli/U0Stlxsn1JDBH
         75njvZ3zmOLgIcnLeI+6Wv9/5rtEYGn4HzNhB4oAM8o0MloF7gklb6aHxBMHDVp6DBgL
         Q3zHHpy1ts5pXNKsYhLHU4wIDvIM42joOWk1QyJ8CrG305i/gosVLaUvOhZIlbb1lAIf
         NSmfB0SvFHM/8uut905MaUH1iWyaOxqFrOagF3pNkUKCYQj5iI08ahR+UmXOwYClYmSv
         TzPzNQj1qbjrmajD37P6qeKRL9cB8LrEW99Rro7fKWrKetk8gdzyIZen02tFbMFGU/+i
         Lg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751099; x=1769355899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5xzC39ymMALozKjLqKfAnaQGtCnTtEhf1tuivfMM+M=;
        b=csh/JcfKk2fjSoFYSqYRuANhSPYs79acIm45zNtmfzbNiouac4Qrt4rDoGdgLMiYeF
         v3SsQ8Vhe7rQM1q7bwcavfhsq0ervwC5PNviu/bkAXTZ+fg6hA89NeLf1ocLEgVq9rGp
         xVezK+7YUv0nsStPWZcqHDvPonWy2dDrjazbbcAAmQ5Hj/tdqFKGUTCalDtcmTEZDm+7
         lOxxMhquU9y8teQbgnINjuxiIX1CN73JLnepfbDl175daX4RKgFN0iryYPZ0mO7IpNqy
         3G5scLQZZWoRvJbWhtBCJ/uAPmcee1drmJhPJkG/v7ECurj48aW2NKovBO6uJQwNN3ee
         5YCw==
X-Forwarded-Encrypted: i=1; AJvYcCUpQ0B5UOM+ZjLECjTZq1BRHddRZq8xhe9DwJRybIdomrTZIispv9l34QbEkqIQt26zr1NemQlCY/l8RkqLqQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCW9cLbmnisnfGG2SF5h70G5PFrkEwg82cvfsbtEtjFqA/IM6V
	5cVmT3rrDxcdOWfmmberwv7LwXHVE11l7Q+yLizeLDJ+CIXXhCN7XvxFQuq3bUfp
X-Gm-Gg: AY/fxX55fyNLgPj3ISJU6g9/TTrXTh8r8KtPJNM8G3dHSUnqx4LJ2GMcJ0uVGi2SBH3
	g/bFodR2I+MGpNwC9Ko7HnhoaLVCy9zv88XFM+1N90zOUQ6DXqh4cDBCZilL3sB8yJcsJfm9Ogs
	hFfKp2foQNB8NR3IPIWMfkgIWE2ua+VMluAuWjUUfzPnCspiaJ2tfjRrNt+fKKzSgNKhXbVVQPb
	1is36U2F3Xizsi+XHMshn423xF++VKXO2q7Cs3/GKuWfn6DzqyiEuj1mmi2xjjItfYQQuHkuOnx
	J2qREYRuYah7WX+0PmVsZf49rFevaBIFAkZ+mHS3Pcrhd+ZGq/SnqeQHEJeFPWS0cYg4jfiVLwm
	EPeYo5fwc2xLgqtBK36K/dUNTCaV6MH/6c7oWZ3lnPf7Rp8S028LqYpelN9Bf7skeaVQrAECt+M
	ZcPBdz58PPXkVx
X-Received: by 2002:a05:6102:4415:b0:5db:28ef:3dfb with SMTP id ada2fe7eead31-5f1a55958b4mr3140154137.34.1768751098599;
        Sun, 18 Jan 2026 07:44:58 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:44:58 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:30 -0500
Subject: [PATCH v4 3/7] iio: core: Match iio_device_claim_*() semantics and
 implementation
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-3-6c8d0aee8ed2@gmail.com>
References: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
In-Reply-To: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, 
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7969; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=8Qsn8l9ngnc+knSDLyebRMQVPK7UtYm5UK7xm5nz2xY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z8Gvd9Vy8Y4fXrfdoNKtqN/qywsor5kWioZNHPp1
 q26Z9PbUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABN5rsHwk3EbT2nxQblyXc1G
 O5nzAeHxb1gtcqomJp75XmRifvSjPcP/ktCF/2+sXvTmasWPmvCdEibFvN5hipar1SM7dVNNWaI
 4AQ==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Implement iio_device_claim_buffer_mode() fully inline with the use of
__iio_dev_mode_lock(), which takes care of sparse annotations.

To completely match iio_device_claim_direct() semantics, we need to
also change iio_device_claim_buffer_mode() return semantics to usual
true/false conditional lock semantics.

Additionally, to avoid silently breaking out-of-tree drivers, rename
iio_device_claim_buffer_mode() to iio_device_claim_try_buffer_mode().

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ade9000.c                          |  2 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |  5 +--
 drivers/iio/health/max30100.c                      |  8 +----
 drivers/iio/health/max30102.c                      |  2 +-
 drivers/iio/industrialio-core.c                    | 42 +---------------------
 drivers/iio/light/opt4060.c                        |  2 +-
 include/linux/iio/iio.h                            | 35 ++++++++++++++++--
 7 files changed, 39 insertions(+), 57 deletions(-)

diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
index 2de8a718d62a..db085dc5e526 100644
--- a/drivers/iio/adc/ade9000.c
+++ b/drivers/iio/adc/ade9000.c
@@ -964,7 +964,7 @@ static irqreturn_t ade9000_dready_thread(int irq, void *data)
 	struct iio_dev *indio_dev = data;
 
 	/* Handle data ready interrupt from C4/EVENT/DREADY pin */
-	if (!iio_device_claim_buffer_mode(indio_dev)) {
+	if (iio_device_try_claim_buffer_mode(indio_dev)) {
 		ade9000_iio_push_buffer(indio_dev);
 		iio_device_release_buffer_mode(indio_dev);
 	}
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 9ac80e4b7d75..ef53066b1735 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -188,11 +188,8 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_dev,
 	/*
 	 * Ignore samples if the buffer is not set: it is needed if the ODR is
 	 * set but the buffer is not enabled yet.
-	 *
-	 * Note: iio_device_claim_buffer_mode() returns -EBUSY if the buffer
-	 * is not enabled.
 	 */
-	if (iio_device_claim_buffer_mode(indio_dev) < 0)
+	if (!iio_device_try_claim_buffer_mode(indio_dev))
 		return 0;
 
 	out = (s16 *)st->samples;
diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 3d441013893c..7dfdb5eb305e 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -417,13 +417,7 @@ static int max30100_read_raw(struct iio_dev *indio_dev,
 		 * Temperature reading can only be acquired while engine
 		 * is running
 		 */
-		if (iio_device_claim_buffer_mode(indio_dev)) {
-			/*
-			 * Replacing -EBUSY or other error code
-			 * returned by iio_device_claim_buffer_mode()
-			 * because user space may rely on the current
-			 * one.
-			 */
+		if (!iio_device_try_claim_buffer_mode(indio_dev)) {
 			ret = -EAGAIN;
 		} else {
 			ret = max30100_get_temp(data, val);
diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index a48c0881a4c7..6918fcb5de2b 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -476,7 +476,7 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
 		 * shutdown; leave shutdown briefly when buffer not running
 		 */
 any_mode_retry:
-		if (iio_device_claim_buffer_mode(indio_dev)) {
+		if (!iio_device_try_claim_buffer_mode(indio_dev)) {
 			/*
 			 * This one is a *bit* hacky. If we cannot claim buffer
 			 * mode, then try direct mode so that we make sure
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 83078285cd97..20cf316664b4 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2183,7 +2183,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  *
  * There are very few cases where a driver actually needs to lock the current
  * mode unconditionally. It's recommended to use iio_device_claim_direct() or
- * iio_device_claim_buffer_mode() pairs or related helpers instead.
+ * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
 {
@@ -2201,46 +2201,6 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
 }
 EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
 
-/**
- * iio_device_claim_buffer_mode - Keep device in buffer mode
- * @indio_dev:	the iio_dev associated with the device
- *
- * If the device is in buffer mode it is guaranteed to stay
- * that way until iio_device_release_buffer_mode() is called.
- *
- * Use with iio_device_release_buffer_mode().
- *
- * Returns: 0 on success, -EBUSY on failure.
- */
-int iio_device_claim_buffer_mode(struct iio_dev *indio_dev)
-{
-	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
-
-	mutex_lock(&iio_dev_opaque->mlock);
-
-	if (iio_buffer_enabled(indio_dev))
-		return 0;
-
-	mutex_unlock(&iio_dev_opaque->mlock);
-	return -EBUSY;
-}
-EXPORT_SYMBOL_GPL(iio_device_claim_buffer_mode);
-
-/**
- * iio_device_release_buffer_mode - releases claim on buffer mode
- * @indio_dev:	the iio_dev associated with the device
- *
- * Release the claim. Device is no longer guaranteed to stay
- * in buffer mode.
- *
- * Use with iio_device_claim_buffer_mode().
- */
-void iio_device_release_buffer_mode(struct iio_dev *indio_dev)
-{
-	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
-}
-EXPORT_SYMBOL_GPL(iio_device_release_buffer_mode);
-
 /**
  * iio_device_get_current_mode() - helper function providing read-only access to
  *				   the opaque @currentmode variable
diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index 981c704e7df5..8c4a1f562a83 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -304,7 +304,7 @@ static int opt4060_set_driver_state(struct iio_dev *indio_dev,
 	struct opt4060_chip *chip = iio_priv(indio_dev);
 	int ret = 0;
 any_mode_retry:
-	if (iio_device_claim_buffer_mode(indio_dev)) {
+	if (!iio_device_try_claim_buffer_mode(indio_dev)) {
 		/*
 		 * This one is a *bit* hacky. If we cannot claim buffer mode,
 		 * then try direct mode so that we make sure things cannot
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index f6d494065efe..fa671e120e95 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -706,8 +706,39 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  */
 #define iio_device_release_direct(indio_dev) __iio_dev_mode_unlock(indio_dev)
 
-int iio_device_claim_buffer_mode(struct iio_dev *indio_dev);
-void iio_device_release_buffer_mode(struct iio_dev *indio_dev);
+/**
+ * iio_device_try_claim_buffer_mode - Keep device in buffer mode
+ * @indio_dev:	the iio_dev associated with the device
+ *
+ * If the device is in buffer mode it is guaranteed to stay
+ * that way until iio_device_release_buffer_mode() is called.
+ *
+ * Use with iio_device_release_buffer_mode().
+ *
+ * Returns: true on success, false on failure.
+ */
+static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+{
+	__iio_dev_mode_lock(indio_dev);
+
+	if (!iio_buffer_enabled(indio_dev)) {
+		__iio_dev_mode_unlock(indio_dev);
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * iio_device_release_buffer_mode - releases claim on buffer mode
+ * @indio_dev:	the iio_dev associated with the device
+ *
+ * Release the claim. Device is no longer guaranteed to stay
+ * in buffer mode.
+ *
+ * Use with iio_device_try_claim_buffer_mode().
+ */
+#define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock(indio_dev)
 
 extern const struct bus_type iio_bus_type;
 

-- 
2.52.0

