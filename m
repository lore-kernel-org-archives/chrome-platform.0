Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D9F29BDAE
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507546; cv=none; b=UpM5u3pfCJJz5EnhtqQd+gUQMQbGrztajB7WzuhfLWTMDP4EqDBF3rhEV66SCN1T3pJmO5ZqqKHoyFEXKYRlD3azVDatSuRZHxeInLeNRgsNYz49qrYenPszaABkoCIDgbqVROLiXY1W9ausLLmec7J2hzUPQhEC6rL/6l1xnaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507546; c=relaxed/simple;
	bh=6RuhgjKQZQBu1gVOM1UJ1b8RuzOWlkNhUsVE6an3+VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIx6N9/uhgdRlmTSzBpuSj2lvzy+JWoDE8mh8hiu3pcTsXL6yTsiPV5Cr/HelE0VbyBjeDWvtw2GGm3RnKkCRJRWr+BFdvVkX5TwLvWTWV4c4KsU1bo2l1vgWJf2osYxaQid1rzTcYS8KyLOD4zyJAO81Tn6dR+gKc9QLd3qwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2hvg+Nv; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2hvg+Nv"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93f5905e698so235570241.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507542; x=1766112342; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7teUlQNakpyBekbyBa3L6SiOmkc3TRpBucnHceeLxnk=;
        b=L2hvg+NvYPc5pjSFKONFPpOx68ktuplv73ZlsuSPm/PfD5fnApfbutO7RgsoUD5INc
         oo/iTQBWu1MDAsRHVQZQ3MdWnHYc6exXMQKhv8Za+OwZKf7AzvlKM45DTrrtuVRVvBQr
         Mr6cWkE7MiK5oTv1N5Yb5D937N99YXaye/9aKGvmlePlAaAvPCXu3JT3MwT0bX/c2zKZ
         N8a2sFWhEJ/J2ZSgGCk4HErQKroKQjZwYV2yxYfDo5HlT4roe9ZAAbbuC9PTCiQUe4IX
         jgW+oVAf7Aj7R99p5c0GbnTuuh1tTYIu9iBpt85273X6vx7rJcfoIV9UHJX9Tv9G2Vl8
         sr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507542; x=1766112342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7teUlQNakpyBekbyBa3L6SiOmkc3TRpBucnHceeLxnk=;
        b=YsV4LTBe3Jbe1G/cOduiWVuyFsyqBGQPK7SvGX5PQfcglcB2OwmEsMUSwGLt+gZvIU
         4DZPZ36DGtOb/VmyK1OinshIPvtcMhh1WdMxfkPecD6TAA6Uc6msx7L8rz2SJFYYt4KM
         5Vr6On5UYU2cNp+dWcVeVJBVR67UNdyvuFWoga+iO+QFfc8r9JEdYsaAXfdalubITeXx
         0XLPFx+o/mXVR3ewK1cLe/008aNFNbduHXsrI+3+SVOhYCZogyqWj2iCzTNhZ4AfAMzr
         Nyz/Smvrjm/WaWsTjJiEHU6ntDaVEnXKOUHpaAyJFUzMYg/kvEUDo4bba9CrVB9m4JDl
         ppkA==
X-Forwarded-Encrypted: i=1; AJvYcCUuZoiXhQKKPEeVdqqqDG0E7NWSwUq5no/B0gKSXKmf/+ONgkURTg0fls8BJiYMlg5besuYAzIyfs+ZwkfEXss=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8o8z4yhXl9GdM3x9DkrWN8xKAfXrKLWuM9bKIJh88FDb0OBfQ
	GeFWORUolO+8jrOzL8bZ/F9zJjicpiaXF0/aS1ihYKdA+7g4FVTpzRBg
X-Gm-Gg: AY/fxX5rBcgYdw4Cba0s/EyHhKWHbPQTKrmc4vfX5OmcVFmsXyfRumcospLteDva+KL
	JMOTibRKatCN71u4sdg1P0KMuLwO1lXDqOYTqj/Ktkd9GlcyjjRxCTHayTwrl4odUWUmExBb/a6
	GONUtwrQouzaH9+WOJXcW4Fv5AFK8eJ8Zwi8tA8lUwvYSt4yFxz3eb4B2k8dXa7JRyinHdpBGrK
	tE4uWYhrpk/WfjY2nmReU9iWfqhXgpB/Spr1RsIZr0fTV+tbxiFnvQLwd21ig4AN7ySpAxIt71b
	JrPUO4+szUqCESLZZSz9lZRdpxk3DBCococV8XRdXg090ftNo0sXw0rEQRU3k+wYmQxfBCkcOuD
	PuaUIum6OcH3r8zE7lG37Sltu3Ch44/DkHtvHQr7q4cKcLrEB1Acqs6RMmmzZ3ocQZ1n0DSZZSw
	oEm1KVP1ywA89A
X-Google-Smtp-Source: AGHT+IFCbSwjQx+j26I4gFkKKi2c2VWed7wiEapgwj8ZJoFsVfh4kg25ChAQAYsyJ44hwmfrSbsVtw==
X-Received: by 2002:a05:6102:94d:b0:5db:3cda:cc3b with SMTP id ada2fe7eead31-5e827835ad9mr109640137.34.1765507541686;
        Thu, 11 Dec 2025 18:45:41 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:41 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 11 Dec 2025 21:45:22 -0500
Subject: [PATCH v2 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-lock-impr-v2-4-6fb47bdaaf24@gmail.com>
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
In-Reply-To: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4071; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=6RuhgjKQZQBu1gVOM1UJ1b8RuzOWlkNhUsVE6an3+VI=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjSc/Hl3I+GE9k2n2i5kNa865/P+6+/tGXw6FlycLw
 jQLr7bydZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEJnxjZNixR9ri+uLDqi0N
 LAdafz789yXIbGnsF9nHl3sDpNiYjQIYGY6cbI257HOhf+2N1YdvT3Zi1Gz7z3LD/Q33evbQ7F6
 B6ywA
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
 include/linux/iio/iio.h | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index f8a7ef709210..c84853c7a37f 100644
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
@@ -739,6 +740,88 @@ static inline void iio_device_release_buffer_mode(struct iio_dev *indio_dev)
 	__iio_dev_mode_unlock(indio_dev);
 }
 
+DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
+	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
+DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_buffer,
+		  iio_device_claim_buffer_mode(_T));
+DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
+		  iio_device_claim_direct(_T));
+
+/**
+ * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direct mode
+ *                                           lock with automatic release
+ * @_dev: IIO device instance
+ * @_var: Dummy variable identifier to store acquire result
+ *
+ * Tries to acquire the direct mode lock with cleanup ACQUIRE() semantics and
+ * automatically releases it at the end of the scope. It most be always paired
+ * with IIO_DEV_ACQUIRE_ERR(), for example::
+ *
+ *	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+ *	if (IIO_DEV_ACQUIRE_ERR(&claim))
+ *		return -EBUSY;
+ *
+ * ...or a more common scenario (notice scope the braces)::
+ *
+ *	switch() {
+ *	case IIO_CHAN_INFO_RAW: {
+ *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+ *		if (IIO_DEV_ACQUIRE_ERR(&claim))
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
+#define IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) \
+	ACQUIRE(__priv__iio_dev_mode_lock_try_direct, _var)(_dev)
+
+/**
+ * IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) - Tries to acquire the buffer mode
+ *                                           lock with automatic release
+ * @_dev: IIO device instance
+ * @_var: Dummy variable identifier to store acquire result
+ *
+ * Tries to acquire the direct mode lock and automatically releases it at the
+ * end of the scope. It most be paired with IIO_DEV_ACQUIRE_ERR(), for example::
+ *
+ *	IIO_DEV_ACQUIRE_BUFFER_MODE(indio_dev, claim);
+ *	if (IIO_DEV_ACQUIRE_ERR(&claim))
+ *		return IRQ_HANDLED;
+ *
+ * Context: Can sleep
+ */
+#define IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) \
+	ACQUIRE(__priv__iio_dev_mode_lock_try_buffer, _var)(_dev)
+
+/**
+ * IIO_DEV_ACQUIRE_ERR() - ACQUIRE_ERR() wrapper
+ * @_var: Dummy variable passed to IIO_DEV_ACQUIRE_*_MODE()
+ *
+ * Return: true on success, false on error
+ */
+#define IIO_DEV_ACQUIRE_ERR(_var_ptr) \
+	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_buffer, _var_ptr)
+
+/**
+ * IIO_DEV_GUARD_ANY_MODE - Acquires the mode lock with automatic release
+ * @_dev: IIO device instance
+ *
+ * Acquires the mode lock with cleanup guard() semantics. It is usually paired
+ * with iio_buffer_enabled().
+ *
+ * This should *not* be used to protect internal driver state and it's use in
+ * general is *strongly* discouraged. Use any of the IIO_DEV_ACQUIRE_*_MODE()
+ * variants.
+ */
+#define IIO_DEV_GUARD_ANY_MODE(_dev) \
+	guard(__priv__iio_dev_mode_lock)(_dev)
+
 extern const struct bus_type iio_bus_type;
 
 /**

-- 
2.52.0

