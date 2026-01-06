Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF95317702
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686836; cv=none; b=jpiZorqF88QL/V+xfkLKTXh2+4yVC0nzkXLrJZecx7ixs7dZPNhdxAeMxohuTui7cytP0Y2aV18iCC7UWoN523vmXEv0vnwZ2zTfINjahRBc6KZQSExoUmpuXxedr21eCUI4lCYuZY+xPGhudj4UvLftulsrHLbB6wi8rQ4woas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686836; c=relaxed/simple;
	bh=e8dx5+Y9ZmFmdYVxk3+rCPDes2YyZRYOQmPuTiqxJtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VReHtLx4mveAFFLegihlLQg/dUdNQZkSlwP8QQRX6UcF1rVoY1DvPjqXaA76MP8GgkkzKiq/qoJaPMcUk5T7KNVzI2PKIwpo+/NawLFscxENbdtDseE1+o67D5HN5xtowbiz6iVsKWr+L+WkrPneUWE5smw4cfFdDrWgJbLont4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNA47wpq; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNA47wpq"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso520037137.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 00:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686832; x=1768291632; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eBw/siTkOPKNQywL34hEvRzPDZoJwcT16i1sK8KTFc=;
        b=DNA47wpq5eWOl4azDhDm2DtnocIzG+r4zkbL++TNgGapSYCGF/X89wkJ1mFVWNN/j5
         voVJjG0CIpab5gVRtLzTk2YGm/qOegErgUI7O+97A+z1G32ZZD62l1BYY5NMrBlslvpA
         zTOKZbcoO4G6pnIE77Rg2qQDUMMOiaqPeCqHzJvMytwnQo0s7j2IY8baV9BqjyYXt27L
         VmA3Q0XqzqWf4H9454X0Y3b+wEe8IuncvTGysLmYQz+MEA7zf1TmYgpRq/MxkgKU3Cz5
         llK9650A2d+Upz9fwgDWGMm8NRtP6d6HA4Vm5nN4mwBTwdtjPrPQx2HILTwdj7TVm+8D
         byIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686832; x=1768291632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0eBw/siTkOPKNQywL34hEvRzPDZoJwcT16i1sK8KTFc=;
        b=oG1nXMTdLb6hKQ5RKb93zWXLz6cM15ivhyhQm+hlvc6f8YgB17KXNdSsfW5A8hmpJg
         Nr8mdfsXNa5JHum4WEE1+uz2hQukTVWR+v2L2Vmvehy5Tw2ghtuGHlCMduULdBN4ivZV
         8uiPmY3UFVvksruk49xQDyDs+hS03Fab36J89fJDjihd3WKez5soUSNLN8xapBLzyxoo
         l3Xl0McEei9AnWvYGDj0M+vt05pOXLmERD8APR5FTpJ74Fvf1oQWw3+/C32UXqTOzRIF
         srbE9bMd+7pbDAwAp9e9swKo5fxmuE55XssgWKZLNEh+5KsV+3R2qfg5DW1ZDQHtSw3X
         0Rog==
X-Forwarded-Encrypted: i=1; AJvYcCWrpG2d0Pg5gTivrDBKdGMEX8bmmlQCoe27jMvooM1mpnhD6Pw6pv+9ZycmwDee5aTmXSaTOq+uQAoWYeraP0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGP1OJIN+Mwsc8OO7+ONwLROaCMQ69pe/kXyROyMfh2nzf+2ek
	ipgCl94ZGXs5cfHW+/UpUOYdzS49g26inx9PBDTP0kCKCMKfutYz4euA
X-Gm-Gg: AY/fxX6K1qc8+74A5EgcHTHNsLy6kyrkeFG2sxP250v/PcU5L4f+XoZ2l9NKdiBtb5O
	vdMb+oe0dgFG2FDN0SFAo4+pFg8TTc75HmwmXJvjhJzs7wWfLbArTaDVj4Mj68Yf38NeC3pRy6f
	BjdG9n3PV1Z9R/4+bTppGPSNOOvJHrwbduu00seMIvbs013L9AmJQjZxhq8sPDTwsMyfaa+L2Vw
	ez4jKBDnUvZms7eSyz3DEM/BxFXP8ZSxQTwkmJMxy6pCOSl0beehu9k8lQwJnBPDNtQfVc1AT4Q
	DlaaC3s79/t0+3gDDgRadsYbgz2uzUj/6y/j5bGXNylMaV1F4GfL0XjDEf+UpWNjdlkzyBH7q+0
	y/wXWdHKyxbq/ziX1+VnNAvjBMH0Kz5Ina5urjmV//l0VREfzGdGyo+KIUyi1918mZ4gvvVQI57
	2Gsi05YuIiM91m
X-Google-Smtp-Source: AGHT+IHHKonWi1vsrR/n1XZBjsbDP55NV5Xe9+c0ckwEjkAwo2rnLjn1/pCor3jNViJDrOIb50kazQ==
X-Received: by 2002:a05:6102:2b92:b0:5dd:a0bf:8c89 with SMTP id ada2fe7eead31-5ec755c2d49mr614154137.7.1767686831757;
        Tue, 06 Jan 2026 00:07:11 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm457615241.11.2026.01.06.00.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:07:11 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 06 Jan 2026 03:06:56 -0500
Subject: [PATCH v3 1/7] iio: core: Add and export __iio_dev_mode_lock()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-lock-impr-v3-1-1db909b192c0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=e8dx5+Y9ZmFmdYVxk3+rCPDes2YyZRYOQmPuTiqxJtU=;
 b=kA0DAAoWFmBDOPSf1GYByyZiAGlcwqqjZwbxqPT+UWyr0W5p1s4jwhOEeBscxXhqeG+P1mNAp
 Ih1BAAWCgAdFiEEh2Ci9uJabu1OwFXfFmBDOPSf1GYFAmlcwqoACgkQFmBDOPSf1GahEgEAlT9h
 g6slgdmAiTQIy6zdPTsuhWstAvX3SBgp6nErrG4A/3neXrHJ00Sk5c0p56ySv4ZOG1G6UmX6SPl
 lz5t/JBUG
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add unconditional wrappers around the internal IIO mode lock.

As mentioned in the documentation, this is not meant to be used by
drivers, instead this will aid in the eventual addition of cleanup
classes around conditional locks.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 30 ++++++++++++++++++++++++++++++
 include/linux/iio/iio.h         |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index f69deefcfb6f..34867a860a84 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2171,6 +2171,36 @@ int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
 }
 EXPORT_SYMBOL_GPL(__devm_iio_device_register);
 
+/**
+ * __iio_dev_mode_lock - Locks the current IIO device mode
+ * @indio_dev: the iio_dev associated with the device
+ *
+ * If the device is either in direct or buffer mode, it's guaranteed to stay
+ * that way until __iio_dev_mode_unlock() is called.
+ *
+ * This function is not meant to be used directly by drivers to protect internal
+ * state, a driver should have it's own mechanisms for that matter.
+ *
+ * There are very few cases where a driver actually needs to lock the current
+ * mode unconditionally. It's recommended to use iio_device_claim_direct() or
+ * iio_device_claim_buffer_mode() pairs or related helpers instead.
+ */
+void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+{
+	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
+}
+EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
+
+/**
+ * __iio_dev_mode_unlock - Unlocks the current IIO device mode
+ * @indio_dev: the iio_dev associated with the device
+ */
+void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+{
+	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
+}
+EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
+
 /**
  * __iio_device_claim_direct - Keep device in direct mode
  * @indio_dev:	the iio_dev associated with the device
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 872ebdf0dd77..aecda887d833 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -661,6 +661,9 @@ void iio_device_unregister(struct iio_dev *indio_dev);
 int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
 			       struct module *this_mod);
 int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
+
+void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
+void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
 bool __iio_device_claim_direct(struct iio_dev *indio_dev);
 void __iio_device_release_direct(struct iio_dev *indio_dev);
 

-- 
2.52.0

