Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C531A7FB
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686841; cv=none; b=B5wOeIlPNrPkrt9nNQyrVS17y0UKMS27ODi4DsmSNhPGFVCJhFehUw/oWGVVGEqyPIaCbqtLafwXw6cWvbVRJuJl7+DlB5AbKmuYcpQEAN2YkU+m9EnFagFqxnu2nqJ7gegRYeYf6OKZS/kqkNr7VGTK5xJSpMT+bkukeai2XPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686841; c=relaxed/simple;
	bh=Pzl04Z/f7G9BuXHblYf8c17cgor4qrSf/5Wv2Bzp4O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl0BtoMB7Q0nva3ieuQWzQbMRUizeWhSakNVp1xa7hivLDnnzE/BYP6BFruSHhdBctxNjaQ6j1YRen7WviEhEgSRF5Ktn/N9TIefhwYk3Dld/WSaTDFGecAHwGyZcsHHPtI5GnprDTDXSd48HUorgVXf1D0gSJRizop3+Yxmr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KckOLajf; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KckOLajf"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5eae7bb8018so262235137.2
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 00:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686839; x=1768291639; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QROS04KwedxjJOENCLLDXjHHa0xV8qTJ7XV/vfD/RD4=;
        b=KckOLajft3awy8R+S/s9ZGRR6NbLAhi3HdSuKfc8m4tlSN6UDqkXO10RpvTAQ5kxyY
         aRx8vpxqqLe+nJz7GI0rVxZ6oLHmsJbue/eeY/dJluz9vW6yFnpTy1wZf4eK/vA8PZNM
         vw5TzWbb91z7FC5Zbllt9uQci2+3oVUKQZnxuRD1mXlFA1QrKJrmtvkREP7x04QDKhTG
         KZcZn5K6SdDKkMyBKoKLiqhJL3rbYEzbuLAX24QTwT8tceGBBUosK+vEU2PcZRj+N0DB
         s3E6d/U/HxoeISyqJtV+27lND8z/5imQ241gfyeZNgqbCB4saKM/UP5hUen8hMLjkSod
         pWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686839; x=1768291639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QROS04KwedxjJOENCLLDXjHHa0xV8qTJ7XV/vfD/RD4=;
        b=Vx0IUqWH+zj8wQ2z1YOPGF2CzngEN9O4emT4pmwuvXCds/sbU7yszEMA4ReNIMOMwG
         raMF2X4zoQu5kTgakNYr1S10gyCcWjN3X8gxrxv18claVN5IdNE/FlgZhg5zEAH1XqwH
         QQXNwSl+H/jytuGrdl2d1gvoCJqovhYidkQM82zjIi7k1reiQC9JGuL2cGr7r0WaplJW
         hib502h30pdzsEUi0q4RIlhWNWsamYp9syeLOwaKJ6oI7CiysgSbofq/DiJnQQGawmIu
         CKif+bVGO6GNTMof+YjZHs3k7+5T1OrLYTH/+f5dfbCFOoZpvRRzm63Ss0v2tFGmTA9c
         jpXg==
X-Forwarded-Encrypted: i=1; AJvYcCUng2dG5gcYgn3z6Hk60X8PYTz/xpOZoQ4tSmRa8EEeECe8LqLXObFORgoGj0COhJYPN8EmsF4EpDV0aO03d+E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvTEXjTlayI7OqJ2H8cJmxlmI95lUaZyZfLrKJh0+hKNl7hVCD
	5nU0dZPFdnIk/UhD/sxyCVFD4XK8UeNINXygKKKS04hSWcIvi73AmsE7
X-Gm-Gg: AY/fxX4I/jK4TD9JEwl+GwgF4cjOWDI8CKIp0JVoXJg15tkpmjTJV58JsOqe+LBrA+t
	dqkAQzTFZFkRUQxS3dDwG/YZE3EB1MF1dpfa3rDg0mn/Po/357uB0r2bAYLISo2B9FJUaA1qvwx
	HNvemrWC+7PHVfIWZ4lkpbLMyecU7MYxMveM9K5ALabq868qKUF7+CZvG9qKdbb+XQYu9O5l6Ds
	kbl3slx7XUvVyUk4EaGbI8B9DZquEjqEhpK4NmBDiH6VIPurd3J017y4nYMV04sWZzncX/k9CmL
	QBjs86Aa0auu7eInXL5Qgpe2vY+XquRPuISkXteW9Kdx4cdVCp/xfjlMIRxESu3hF6PDTpVpzvy
	9tHP4TmUldtu0eFnnVEUIaF1LHA5iauTElz3obIVuNjNEwpFDtdp3+C48bQVO0OXMg4SaNg7ovk
	zm8PvNsa8lSFecNB7GIDhWoek=
X-Google-Smtp-Source: AGHT+IHcK8ji32sCIat7H2xKucoKdh58wxd0RlCa758Zauf5a9oF4zVD5I+zYwQ45lypy7m4v6Nizw==
X-Received: by 2002:a05:6102:2908:b0:5d5:f6ae:38c4 with SMTP id ada2fe7eead31-5ec74598e62mr521625137.45.1767686839040;
        Tue, 06 Jan 2026 00:07:19 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm457615241.11.2026.01.06.00.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:07:18 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 06 Jan 2026 03:06:59 -0500
Subject: [PATCH v3 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-lock-impr-v3-4-1db909b192c0@gmail.com>
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
In-Reply-To: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3685; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Pzl04Z/f7G9BuXHblYf8c17cgor4qrSf/5Wv2Bzp4O4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkxh1ZJfdTQqWUKNpvNntYjcOZ4IUuhqvinZ9Ou1nP+e
 Kort7K5o5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACYSW8Dwv2zOqk/z+d/OvOiq
 bXHn7oXz5lt1+ZaeTBXcxfj9QLje94+MDI3NDoEKG/Mdwzqn/nzc0HVkx+JQg9jgiGc9d5ySCt7
 fZgYA
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
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 include/linux/iio/iio.h | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index d8af0456f966..c795f731f2d8 100644
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
@@ -740,6 +741,76 @@ static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
  */
 #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock(indio_dev)
 
+/*
+ * These classes are not meant to be used directly by drivers (hence the
+ * __priv__ prefix). Instead, documented wrapper macros are provided bellow to
+ * enforce the use of ACQUIRE() or guard() semantics and avoid the problematic
+ * scoped guard variants.
+ */
+DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
+	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
+DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
+		  iio_device_claim_direct(_T));
+
+/**
+ * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direct mode
+ *                                           lock with automatic release
+ * @dev: IIO device instance
+ * @claim: Variable identifier to store acquire result
+ *
+ * Tries to acquire the direct mode lock with cleanup ACQUIRE() semantics and
+ * automatically releases it at the end of the scope. It most be always paired
+ * with IIO_DEV_ACQUIRE_ERR(), for example::
+ *
+ *	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+ *	if (IIO_DEV_ACQUIRE_FAILED(&claim))
+ *		return -EBUSY;
+ *
+ * ...or a more common scenario (notice scope the braces)::
+ *
+ *	switch() {
+ *	case IIO_CHAN_INFO_RAW: {
+ *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+ *		if (IIO_DEV_ACQUIRE_FAILED(&claim))
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
+ * @claim_ptr: Pointer to the claim variable passed to IIO_DEV_ACQUIRE_*_MODE()
+ *
+ * Return: true if acquired the mode failed, otherwise false.
+ */
+#define IIO_DEV_ACQUIRE_FAILED(claim_ptr) \
+	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_direct, claim_ptr)
+
+/**
+ * IIO_DEV_GUARD_CURRENT_MODE - Acquires the mode lock with automatic release
+ * @_dev: IIO device instance
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

