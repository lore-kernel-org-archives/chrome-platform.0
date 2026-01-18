Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D923E330
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751105; cv=none; b=Ky9PauAdsmE3Xw2hEiIxPfcIX+ieqY+uatDj5q6OYCodkTD0DScSPMBOfT77Ery/ekwmv1UGggPAwYj4doIncS31AznBJ97L0SKragQs4kHSEu6DEvFIWL5gFz9G4DvwLENhPClLyqcybUcIUb3DIux05Unw7Dj+Ix+NuBIwBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751105; c=relaxed/simple;
	bh=Bt3F/lHb6LI1N+BCX9VGngIeBqcSWQC3l35PbzVvVCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxSfavi9r1gqwcLUQ8Aym4dzofN9oXqKrdLDOmTv6i61LhXBRpwknvhhO36cWZdbEp7L+g0AkiJ4a5rPDl1ZNItKRpyxIA2YXwMKA/tC/fDQiWlvBCRWCPd5tZi26juvOx6+wRHwBjpOtb6qibxOSEaIdxRF5EJitrY9iRVxwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/X17lJw; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/X17lJw"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9412512e9f3so980708241.0
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751101; x=1769355901; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGdTfbPm6m/cN0XbYhh/ArH4Gt5W4bmHVBdR2RxVxHc=;
        b=X/X17lJwko6NU8thw5wtANONEWIPwpTsmbZQUkuubrnW3NIJKsdHtHRkfIwSuYGB5j
         ke5154mOBHvYrlvtjBdYV4Ce52/DvdhSDFQiVVwcKqmyC3u4P46LuMfPnbOt3XCVYmyd
         Vsg3bW3e8Dfs18iaTYXOv7Nrj4ujy9UpeJ5r4BLdVCKbKscvjko3YMuT+AcCvVkNBWOv
         UbU+AtuXAon5MVvYefSU0EyS0P3B3/huUYZ9jZMqHbSKV00g+onxUr/1BrzIeVFMMLwA
         7wKuBHp+FcJ3mTXBaspt1EJ9hGEGtf5zoA/jyJvnGi0ZQFY1q6jnmLYHl6jKEpXqubQp
         jnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751101; x=1769355901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XGdTfbPm6m/cN0XbYhh/ArH4Gt5W4bmHVBdR2RxVxHc=;
        b=WqwIxfBrRVRUc1DegunIOnX388SxATPhChUNH2MZ4YqDBzS834Qcogac6+45Unyn/r
         DxVrEJVUcK7wEGnsDc3S/5TpgXJj3wDgS0rD8EWKvLmzD5rErUR3k4+8go6q5NRms66N
         R3b3H3DPcbEb1uxn3zieqbeOsSFwNJyM9XLP9XYxn1koWe+v3KbV5GegeVq7laRuLTg4
         UGt1zY4tFBWN84rj+3Vw+p3hBVJJAnnARGMIVbkbnfzENc42L5ZMfmH8MF6ueK6SwJw5
         tKrzo+yIArr8cnYQFRfVXTRjVlfkB586j4Gru/0HQSP4bjLCSGpNxu50ZwF2RXEsqFiW
         xhdg==
X-Forwarded-Encrypted: i=1; AJvYcCX40m+DGFCYO/9xqvwl3pIq659hfPH+WuBTHKly54tKiCtJJ7LR506z7Jb3TzdeTRWy+/3UKBcl4Ey/2/jHNuk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSQq+h5GN4CMky0gUqfA3tNDXaGrP/A/0+v4VE4PyG9ZWI8ypM
	Uk8MSlmcJqIh0xVeNlHyoZ5g7z0DEoibaWniaSQPj+VjZ9T/ayFKBgAsSaBx2OhV
X-Gm-Gg: AY/fxX41RO45NBBfDc5qpPPyKS+PiZ+o6AiSlrBwZRjemKy9fC8QpL8chT3BgeX3FMu
	abmOadHRdZ5UY+0LdVmuGdmKI+nswEHGjw7QrwwuOe4ywcxlU/lsK/Mzxufa+2meLBcW8uvABKh
	/cm9vh/4fsQWduQZ1uPFUC8E/PYY8S1aOj586RXH3WEXEZbkQntyTBojWFpLWQVxoHBwt3pOIhX
	8nyB0aSv5Sror2aUd4X2BaV2rq02GUTF6tkZVJ5dEc+OWc0g+5BIV0SD95tF0PWSZKP17ofPhJJ
	tYhsMxM2NOVtfzdIF6nh1OfZxMewfn2Q6jK3jVbJqx9DBqvV5RkYOSky18l/xjR9Bff7uBf2fcu
	86jmGavTyVvKrRTX2pfdQz3qmsPubbjEt/D8UhQZQGnkElT4fxAjj4YGiXq9h+Hgj3Iz13W60rL
	KIbteMl6ItCVDB
X-Received: by 2002:a05:6102:dcc:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5f1a717ed4emr2752450137.30.1768751100866;
        Sun, 18 Jan 2026 07:45:00 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:45:00 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:31 -0500
Subject: [PATCH v4 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-4-6c8d0aee8ed2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3563; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Bt3F/lHb6LI1N+BCX9VGngIeBqcSWQC3l35PbzVvVCs=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z/eZhPNcLLkddP59UGR49r002tzUzdNjdqo2JfJW
 3O1JGlhRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEzEtomR4cuUHvZdLO4rD//d
 OF+kpG/y8dPXpjw71f91z99lwi8/bVjKyDCfY9uReJ37ehPnBBxm7NIxvvZq4s0F+97uz85dN8l
 J9wkzAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add guard classes for iio_device_claim_*() conditional locks. This will
aid drivers write safer and cleaner code when dealing with some common
patterns.

These classes are not meant to be used directly by drivers (hence the
__priv__ prefix). Instead, documented wrapper macros are provided to
enforce the use of ACQUIRE() or guard() semantics and avoid the
problematic scoped guard.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 include/linux/iio/iio.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index fa671e120e95..4a0a77fcfa8d 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -10,6 +10,7 @@
 #include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
+#include <linux/cleanup.h>
 #include <linux/compiler_types.h>
 #include <linux/minmax.h>
 #include <linux/slab.h>
@@ -740,6 +741,70 @@ static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
  */
 #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock(indio_dev)
 
+/*
+ * These classes are not meant to be used directly by drivers (hence the
+ * __priv__ prefix). Instead, documented wrapper macros are provided below to
+ * enforce the use of ACQUIRE() or guard() semantics and avoid the problematic
+ * scoped guard variants.
+ */
+DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
+	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
+DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
+		  iio_device_claim_direct(_T));
+
+/**
+ * IIO_DEV_ACQUIRE_DIRECT_MODE(dev, var) - Tries to acquire the direct mode
+ *					   lock with automatic release
+ * @dev: IIO device instance
+ * @claim: Variable identifier to store acquire result
+ *
+ * Tries to acquire the direct mode lock with cleanup ACQUIRE() semantics and
+ * automatically releases it at the end of the scope. It most be always paired
+ * with IIO_DEV_ACQUIRE_ERR(), for example (notice the scope braces)::
+ *
+ *	switch() {
+ *	case IIO_CHAN_INFO_RAW: {
+ *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+ *		if (IIO_DEV_ACQUIRE_FAILED(claim))
+ *			return -EBUSY;
+ *
+ *		...
+ *	}
+ *	case IIO_CHAN_INFO_SCALE:
+ *		...
+ *	...
+ *	}
+ *
+ * Context: Can sleep
+ */
+#define IIO_DEV_ACQUIRE_DIRECT_MODE(dev, claim) \
+	ACQUIRE(__priv__iio_dev_mode_lock_try_direct, claim)(dev)
+
+/**
+ * IIO_DEV_ACQUIRE_FAILED() - ACQUIRE_ERR() wrapper
+ * @claim: The claim variable passed to IIO_DEV_ACQUIRE_*_MODE()
+ *
+ * Return: true if failed to acquire the mode, otherwise false.
+ */
+#define IIO_DEV_ACQUIRE_FAILED(claim) \
+	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_direct, &(claim))
+
+/**
+ * IIO_DEV_GUARD_CURRENT_MODE - Acquires the mode lock with automatic release
+ * @dev: IIO device instance
+ *
+ * Acquires the mode lock with cleanup guard() semantics. It is usually paired
+ * with iio_buffer_enabled().
+ *
+ * This should *not* be used to protect internal driver state and it's use in
+ * general is *strongly* discouraged. Use any of the IIO_DEV_ACQUIRE_*_MODE()
+ * variants.
+ *
+ * Context: Can sleep
+ */
+#define IIO_DEV_GUARD_CURRENT_MODE(dev) \
+	guard(__priv__iio_dev_mode_lock)(dev)
+
 extern const struct bus_type iio_bus_type;
 
 /**

-- 
2.52.0

