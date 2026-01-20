Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565A33793D3
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890083; cv=none; b=EFAfjN4RdS08i5zOTkYL2nNya6eL9cquAgJyF/bdVUp+N/UdglpZVghC4AwZbF+fD2XPzSIdh8wokRZ2IrphcDdWShSOaK3Bdqkgd0LL7GES93SBhhV0Dxl39prSrch7HXcN+aSC6sumfzv8k9S37AcHqQJB2unweLGP53LdvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890083; c=relaxed/simple;
	bh=gk4uEOkebbeY+cZwYTy+/3fKoRkuSLvWkzrfvmHqOLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+7IRz9rQKy4e8B54bKtdla59x+aB0CwD6QjtBGZAaBiQvZpJQAlJCh6YR/w9jDnei6yH4Cx80XThSYMB1HN+XS915VAGIhvKt9ifr7UgsfcMaXsbbrgmkPgo9QcFb8ah9B9iGmRU72zf2jPMyJ6/7u5HePkcWaC5YBFH/cpQ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Av0H/Yln; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av0H/Yln"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5eeaae02888so1391980137.1
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890080; x=1769494880; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILl543DXo8pvw93JPMvlHELZN9bV6WaivIpMWAbJAoM=;
        b=Av0H/YlnHmVr5DfbxNDu+9t2kZ9tQpwOQGTMnCmVsAO3ZIxMjL5loxiby2hGMtHjJL
         5oQaWMdIshsP+h7cUFv+THFN5maf0kq3zY+NI61CBiwMxMbTfC1fKbVP63Nmcq43LL05
         RTCD6NG/OtOeNaFx0BnnFRlwtCDYBTYOzh5xi6faibv3oSI2kGBZdQSqvU7V0gsxpBBO
         4XxqPvKcxkyboBws+bffQ56tXx9UP/7f7UU0FD8eGrxuMkMg3Vg0D44vJ6Jt+FRBBzHQ
         FywpmunPRAChvZLeZVQK5aFnlc43MFelKQo26YIdx1+WG/06UBwSJ91fN/kUSZ7/o18V
         Mytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890080; x=1769494880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILl543DXo8pvw93JPMvlHELZN9bV6WaivIpMWAbJAoM=;
        b=RgaqDgKOgDLDuFyUmumGKXENiamrwwMCsqdLHcvPdXGYHw8JIuYxM/oWHmqZXic01W
         LVXZmerHfBrY110BF5XcjczLgES4EXU/zqaXXj411T3hPJZ8Gt5Ihpkou3Vp0YD1v4ea
         BPlak4WUIe8pUcKFa7dd2WMnZVVpx7/iKMbB2ezYwYmu/3Rz+XgDDiGTXqwRJDIlU/Sj
         2MbQwcZ6+gog/S4lnlJDY+b4uD9u4KyLXdHwTsHocs5KfqyxB+qR5NkMMOTQjd7+wu2M
         bBjRTPFsxQ/+lsa4hGfjGHCoJ5nmPaPXt1oAkrcKDXUwlAEiXzc2dLwCQERg2QP9R6eQ
         FikQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUudYBf0TfvRmE0zIiIdDJAcraae2NnG3h7FEPUU1a0mDxTCi9ksblnqyqd86I+niv8Njk/eib8ADhTC90ZNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBb6Nf9mBkzsY1x4kgPkaD6nztIMtOPFLFFH949z6FmboSHltl
	Jywi+mbU6H3dzAOpBP69T5FGNaWDnf18I8PXiZZmIMb8irL9NU6xJ5LA
X-Gm-Gg: AZuq6aK8rNxdwVqYzJ+9e8u/+jJL7dzKfVLbP/t/o7kdh7UuNBY/RlHn3qLubpB5b+G
	YcBuy+XxpNjyAE0TlIEvHrP1RxojBfjZevQuN06Au+TBJeHf3BZ/J5JIPpq09sgfpyupklyj1Ey
	fhSSSTGmekz9LUQbxe7x/o3UvquLLpWdlUNuydI238hUkLJLqNzlSQbu8Tvc38TkdlNbPcxuMM5
	3F1clYlELU9cm0JYwz0p9k7HD7BoEMmLNHiljuvjQW8zWe56OlMc/OGkxzArW8+mJdRO9vNG28t
	u4cf+S/BadMU6+47cWjd3N/n3pii55MmiqKljJ6nSl3YDGis/lGnCcZSX85KeoKEhc2Gf7TYwbn
	wqNiUeMPahU1RTlwJILDz9dM6sc1twWEcTxc7ukw/95KmEY2CMVAJlAiti2q2taoPbUYEsFHX3L
	nP5uo5fR+YhsT7
X-Received: by 2002:a05:6102:c94:b0:5db:3cda:cc3b with SMTP id ada2fe7eead31-5f1a55a2fddmr4131087137.34.1768890079962;
        Mon, 19 Jan 2026 22:21:19 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm4057944137.3.2026.01.19.22.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:21:19 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 20 Jan 2026 01:20:44 -0500
Subject: [PATCH v5 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-lock-impr-v5-4-d4d22347041f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=gk4uEOkebbeY+cZwYTy+/3fKoRkuSLvWkzrfvmHqOLM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJn5cpd9jkpauCy8c6Mr7FDbP7X+bXcND+wMvSkQ6RpVG
 ihSwDyvo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACZS8J7hn+oz17uT5/z/GWBk
 0ccgsO+oyKal69KrXsRZn+p/MMMsYikjw+8dyw7LRUv+mJujZuS5yCbm46LESNWlYXrNHxM21u1
 l4QcA
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
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 include/linux/iio/iio.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 36bd14e93a75..a9ecff191bd9 100644
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
+ * IIO_DEV_ACQUIRE_DIRECT_MODE() - Tries to acquire the direct mode lock with
+ *				   automatic release
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
+ * IIO_DEV_GUARD_CURRENT_MODE() - Acquires the mode lock with automatic release
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

