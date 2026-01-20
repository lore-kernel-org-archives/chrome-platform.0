Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAEB378D68
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890081; cv=none; b=Bo2vHtT22uDqXEnhUKwjC+q5xFOtFW075ULBv6yw4VuFjFGITZyRHm57kqESKsMy5eOyPkIrwDoTATabsy8xZOoxfd6ZxjD4XEnYnDAvsMad751xrRjraFfEi6krJ4xthg89jizUPk2btmNOlqeajrKR4U3869uEU/1eedccNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890081; c=relaxed/simple;
	bh=JrWulgb5grSFMVK1z6odZB7wWOSYuUBdIJG44+bjR30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCOUZHOU6GsWwKhckw9TbbkRXQyFMxyIHo0Ifh3UCje1E/1Ze51BAr0A87p3oHwDzWdNvk8ow7ywVcMeHphuWrmEbHy4lOemP4PNODWNidj4sT5Xnmm854+JDtch9EDq2Nzs6dAspWG/QjuUgRU8obEx/2nDaloGbLTIuKw3HLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hldI8Qks; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hldI8Qks"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94801cf4bb8so146719241.3
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 22:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890078; x=1769494878; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLMTng3flPO+eq1heKg9qmQSNnEZhgCKKq6nL/z8Gzc=;
        b=hldI8Qks6Zqlcq+RQgoHZA3ZupFYIuEKTG8f9yaOmDrf7fVS0dv5AU8HzUxPJbN0yV
         8GjfF2qWly/0gGECa13foW8siwXndVzsyrakhV84+g+irT6zunJ90CyzFmEyT8+GNmbz
         TabQBuNk2ahXhC+yTQEzl0WsD4DhODrxm4o5GwDjqmri0w2EiZ2BJl1EBYkjwbKU49UY
         E+oxHKW0z2YFE1eBCB5vqSLhcLN4C1a5CzDoD4wFVYoNNGcO0wBcxLVBXiA+aHE7pmXP
         RurX2tbvy9K7nsUXi6b4x4zNlWfgGd57iJl2TGYaxojSRibUKPS+SX8DRioi9xX9WCjk
         hupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890078; x=1769494878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NLMTng3flPO+eq1heKg9qmQSNnEZhgCKKq6nL/z8Gzc=;
        b=FUmx3Q8aXSndQt3gund+uYYqsIQVsftglrOHyZFyYqgP0GNgPe10WfdF9zJfy5lJEW
         IGhLDygh/rVQV0b3KT2bIF+8ojMn2qjZWmw/A1W7Ta/8nsjveuB7jWJ49YpPyDD80Rav
         akhg5Y4XHxBRNd/kGUmMusZugqEDYUwA+DB2FH0ymVGpeq8cC6ZTtvnI03fF+6E61P7p
         yLb1W23dlWrp9gKvoDlgc8fyRnhBJxNxSUj+xkd3eygG3uxMJ9PJEFfBQZEPubWwW0kY
         WBQQsP5NLIbJw1h5Xi5GqjeWpL0D8xVtPP+Y13yRfLhy1VFvEJ9DSKL7qJTEi+OmmaMX
         s2VA==
X-Forwarded-Encrypted: i=1; AJvYcCVZgE2VrgAfpO/zioXl2PnfSBMx8Huoj/EdMyyuRl2+GzKpdh0dkp1qDBFOPfk8hNDxCP8uJPBTh17miEK/xCw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn/ryM9jGsACAFdAtemQ9x9zELv27LahIDwZvIbAqFDmXNjrKq
	h6LFO+oCNkoed8YACGCsz7lO0PiVg8SLkvazIfzsDquu1gH16MEbjyWf
X-Gm-Gg: AZuq6aIYDZidE3r8m6NTxCCK/kooeUFjhcBvGxR59PRzesGRitjPu8+tfk2dSbY5iIV
	9fdDLlG+hqMkqIlMgiY5yN9nSuFX5IZPHWRhoYtlH0GKm04FIs2SbZbzQnJgjPUpLdzVLH0/BYE
	y6vlgelqcdKsGSkwowllhG0A2Md1FvTv8ZL2spnWfhd0Yr7kz0P2/gEUr/sIiDTivJ8jQgQBvvp
	q5r/p8XIOXZvj+Ia1cKxeOwN141hnxLe04l+HSv4VIqSeSKGuWJ3EjdCNknI0OHo/vBHgrGBws4
	5PTz79m1g9wGmsQIqLPJoI6peotpBHUui56GM3fji/ZyVXiS8kV7gDIXkrtpp36eP/tCfxVSlvz
	eOh18bQhcVB9mb8seNAst3vs4CflegzlczHzM4MjeYJtF7z+iPDVPXOt+ck11w6M16qvV3d9HDt
	6Vkw/gteBXDr+B
X-Received: by 2002:a05:6102:d92:b0:5ef:6709:4738 with SMTP id ada2fe7eead31-5f50ae44e0bmr212536137.30.1768890077616;
        Mon, 19 Jan 2026 22:21:17 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm4057944137.3.2026.01.19.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:21:17 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 20 Jan 2026 01:20:43 -0500
Subject: [PATCH v5 3/7] iio: core: Match iio_device_claim_*() semantics and
 implementation
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-lock-impr-v5-3-d4d22347041f@gmail.com>
References: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
In-Reply-To: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7973; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=JrWulgb5grSFMVK1z6odZB7wWOSYuUBdIJG44+bjR30=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJn5cpfPF6fGflh4ZLVF60+WZ0d2JFe53Lj1jWlKoURQz
 LpXv123dZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBE/KMY/kqxM92esy1mUmah
 uxXHfyaLprqCRbEpS/13PkzU6VY+UcbI0Ho1fGXLnYMb30+9qVVv+G2iBUtwYGTh5v4uFwbHK/8
 MWAA=
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
index 0f8e3aa98b72..3115d59c1372 100644
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
index e263ab5eeccf..36bd14e93a75 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -706,8 +706,39 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  */
 #define iio_device_release_direct(indio_dev) __iio_dev_mode_unlock(indio_dev)
 
-int iio_device_claim_buffer_mode(struct iio_dev *indio_dev);
-void iio_device_release_buffer_mode(struct iio_dev *indio_dev);
+/**
+ * iio_device_try_claim_buffer_mode() - Keep device in buffer mode
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
+ * iio_device_release_buffer_mode() - releases claim on buffer mode
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

