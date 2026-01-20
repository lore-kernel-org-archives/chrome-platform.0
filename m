Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758F155389
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 06:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890076; cv=none; b=UAGtV4FkFXCaIvTzX4P2AGsGVeOA7pWOKZuxD/sIwQMXzpOnWlMtf6zzL5ojZI9lhNbLJ4StDVlWLz5krasAQhh3oirkT/WdHF2APisfiaeHuhDDqBFWuikROMvn6T5zAYQyJ8CjX1v+bdF4V/F5SAfvVly0RyMJmrQk3rPF+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890076; c=relaxed/simple;
	bh=Tc5/3NT6AVqhl2DjZzJv2Sn4xFJDlerjPios4AAER84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtRFoLknlsawxCb5eh4w/5simF/L7YHmrHhGxc5ijZBKANQfO3aXR9GphRAv2j+2bVDkM4MBvgUHgBcc/w26e/OUQEgYajO/S6IrYj4jhS+qQhZt4M99Hh8lv1z3Z1BsFdEXubaHMT9DhbEY0KZ21a+ERZKjUydCNAxWnUC+TP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEY/4RqH; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEY/4RqH"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5636f0cf5c3so3633051e0c.1
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 22:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890073; x=1769494873; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awxt+DDD9i1Z2I3KP5u44VA06ZhetlDbI4UFSh79c8k=;
        b=cEY/4RqHJtedrpsJTuVZS7qCkjcAjzfSZnMbvRA/ua0+1SUUpejtNRuJjOe3wUHkGD
         nMf4+qPgjkeuaGWQ2MUhZQR8A/8LFvgdWtxxaH5ljqNXnKGFJqMdp4EZ1wvbcQfOIIaU
         JXuMbO+X3/Wn42ovO5vkxSIGlzuySMnUmcx1SldiUo84eFPkonarM4lvas2fOMyWF4iw
         46pyC1Rplw9XQA9Kt1e1nugHR/ESmKR7uWN6fysw20mGoyEm3ehDJ630qtaZaGbMNEFi
         fm3B2FbY8l0trg3Y0a5m7qdcg4yB3p0J9WPNlwuzJSO6u9m3AVu8AizFeYXhNXzoAQbO
         o6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890073; x=1769494873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awxt+DDD9i1Z2I3KP5u44VA06ZhetlDbI4UFSh79c8k=;
        b=E29sCTdq/BdmdwXgF0CPMfxXnqmgoa73zo0jYubfHNuaum7C1sUvxQuk/4D8qvdae8
         tuNTLwxJMFLUFdVS/sT+vAlXswchVQYPZmLAzHZjBBxgHNeREbomhoyIop1uA7REJk7Z
         csQU/D+uBL2uAYYRv+a5FBUiI5ZNEa7eHb02bkDu+i4atWlUVscksroqt2sX3gZG1KDp
         WiUtDxOg7Y4uGkVK46Nx4cYcxf3x3C2UwJtZwWZdWMCyi+og5TSz6OTXIo9O/+BXYnRM
         FfcOUR2GAmNUY1e2ycTO8ewPLzMX3OOcXOU1qcs82Lmqx2zzzJQt3mInLzekUPQLZxi0
         susA==
X-Forwarded-Encrypted: i=1; AJvYcCXW3HOT56tCT//ZFlSN6Lia9TSI3XAIz0Q7zBtazItHH2dewwPalaqo5u4yAvkVQbRmkOLeFiDDASH0RFAF5PM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw88SQPp97rISMeOh+dSb9p274nN5v0NEVHc4oW6yiarMWQzwro
	1RVSbCJjiICfSeDT4w4MIfqof+2E03Ly5TmI+mNI2VBAb3audcM/DX2s
X-Gm-Gg: AZuq6aKymFnmg+xdN5kWpAVDgq0Zh7quOqlBpuUJ1b81rQ+1+h8capJ8jwyp88xi5eH
	o0seEEch1dGx4aTvAFWLiedJoTLuXrynx/badYm3C72ehGbWOSaiJ2xEl8we+zwmB/dtpJNKceP
	Ylhjlq8LdWy2E+nG8N2tUB+BJkn7K1WsnxsyhWt5QzkEnjmpUBY5/i2kcgeSPmTtXQkILLM1S0F
	h9IngxHzGp80ouYl8ZlpGqZO8PdYXDbjPEN/yUJtIv8TRJVx5T2rcOQGzOIyJJJs5B9pFHPAqku
	5h8cahjyICOnoHD03DPFQdp55XEgOXwLdJi9cVL+jB6gVcxD4oDrKIfG1ZNLuBhWa1CbBWsyg+x
	NppD4/OP8pcY6yV+4uP/XHPCQULiXJ3La3+ySNqivlQcWCms5FM3IZM3Yy/HDHlIUO3NfDZgJCv
	axj8USOOCpZNmomlfqN+UkNQY=
X-Received: by 2002:a05:6102:3907:b0:5df:bb10:6334 with SMTP id ada2fe7eead31-5f50aa7f38emr239664137.39.1768890072897;
        Mon, 19 Jan 2026 22:21:12 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm4057944137.3.2026.01.19.22.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:21:12 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 20 Jan 2026 01:20:41 -0500
Subject: [PATCH v5 1/7] iio: core: Add and export __iio_dev_mode_lock()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-lock-impr-v5-1-d4d22347041f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Tc5/3NT6AVqhl2DjZzJv2Sn4xFJDlerjPios4AAER84=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJn5cpd37ymcE5MvdiLlS5ro7VTG8AX9gdpToh6cz+6Z/
 KxHf+mmjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZhI0gNGhq3ckxtdHLa7+G8I
 cTm6hz1GQVN1rXR06HtRDoMf3zz7shj+57ZOjdJUbFh+n7ni3ORULgb2G5XJWkZ/Fj0/5r33mbc
 eOwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add unconditional wrappers around the internal IIO mode lock.

As mentioned in the documentation, this is not meant to be used by
drivers, instead this will aid in the eventual addition of cleanup
classes around conditional locks.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 30 ++++++++++++++++++++++++++++++
 include/linux/iio/iio.h         |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index f69deefcfb6f..db803267df6e 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2171,6 +2171,36 @@ int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
 }
 EXPORT_SYMBOL_GPL(__devm_iio_device_register);
 
+/**
+ * __iio_dev_mode_lock() - Locks the current IIO device mode
+ * @indio_dev: the iio_dev associated with the device
+ *
+ * If the device is either in direct or buffer mode, it's guaranteed to stay
+ * that way until __iio_dev_mode_unlock() is called.
+ *
+ * This function is not meant to be used directly by drivers to protect internal
+ * state; a driver should have it's own mechanisms for that matter.
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
+ * __iio_dev_mode_unlock() - Unlocks the current IIO device mode
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

