Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CFE1CF5F9
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440447; cv=none; b=UZtUV9M3hZlWc2qG8lTTJ2tTJ7W9mlf6Ws8PGckfjrFQ3OjuolDwy19RczPkdh8m1Bl0QfGAzpsTt2biusoJSHdRECEbuIklYVh+Ku3r5QiyQMSzqhwH4CHWa66mIqEm26Vui1UkHWq3a8PTfPpQpNNdsv6/SsKOFUlbYT9NQFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440447; c=relaxed/simple;
	bh=rtIMsOt6wo4AfcXvwPWe+CMfwtVUeU2YX21kuRORNiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbI2pZ40Wu8drFGYbz4PMwu7nu0BHULCoqe1sXIJrfBZk5GQwLOOt4XZD3ZBQa0GYcszMfBsPjjZZBWrNVITczCDDdXG0MtYEbmS1e/iQx9EfJMSSteuwzO6xnF/xBai1U+xLJe3edwLFn8pDy+dHA7Bq5Q5XmOYRVQ6q/K2F6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SF1jiV5P; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SF1jiV5P"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7177a85d092so421192b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440445; x=1726045245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXe0bTAdK4fzeVHk0iwWr+4YgaeXrtwwmT3G1fAlM0c=;
        b=SF1jiV5Pdz5FEL0/S1ffqt37suzQHz6p5XQ2WPKX4sBNlh5n18SjBhhz8lg9lZVU3j
         v/tvxyZH6R1N2mjVSbcpve+jDMylhN3T1q1ody7gSPMAsIhEEmRUiZdVJkmLpTBbtHft
         vSS/kIkGHQwl1ckSGv4dk3LaM1jK1EifKxfBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440445; x=1726045245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXe0bTAdK4fzeVHk0iwWr+4YgaeXrtwwmT3G1fAlM0c=;
        b=ackVXDMakEi8PC3q3T8LdHx6yW1Lhk6VqDQ6wk92YG+rYympePda3vXCUZl8m2O6uV
         XpS53HCB2OhfHZfYJzXabWHvE3sCeN4Dn0V71v5vm18z11tm8pHz4G9WYAvaTxDvz9/u
         vk1VaOCuOtIRzmGgi1xo1JZimmVk5ZLnnCAnEJn9T/239gI3gYraiYlKolBVxuuax99T
         dkL/21SK4k29aZbKI82hoOYrTLLK9vL8WrAwGBqu/8aAa0+rIfk10n0ShjzhjkppYhST
         5RKHMPM1JOGDs0ebR9pLj2RBTk7zz8RQAII0CqhBKz3OQu4gdwdlPxp9YRupMkmpD+qG
         F1Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVJYSQLtUQdphfOiJkjlMMLdObCcwnRLa0frcxD1Yfqh8UvaClWx8i6s9F5rI2HZEh/fJP8Fz1Zo43o5ra7gIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqRubYTGW+/ssrKNk/9yIJpYf6inuyDP0OSD/jmy5aQODywxPX
	HFavc/wVt5zsfjQPmahjWWlv074LNhGO0D1F5h4KvU5TVIPMVD1AIEnZ2Zer4g==
X-Google-Smtp-Source: AGHT+IGxijmAvO+pYlgJ7hjMKsPERsrObcLBwxYEKhBRWkHQTmof+srMssUjYemzBoLP7fiuqVV5Ew==
X-Received: by 2002:a05:6a20:d48c:b0:1be:c929:e269 with SMTP id adf61e73a8af0-1cce10ab242mr24768495637.34.1725440444657;
        Wed, 04 Sep 2024 02:00:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
Date: Wed,  4 Sep 2024 17:00:08 +0800
Message-ID: <20240904090016.2841572-7-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C device tree component prober needs to get and toggle GPIO lines
for the components it intends to probe. These components may not use the
same name for their GPIO lines, so the prober must go through the device
tree, check each property to see it is a GPIO property, and get the GPIO
line.

Instead of duplicating the GPIO suffixes, or exporting them to the
prober to do pattern matching, simply add and export a new function that
does the pattern matching and returns the length of the GPIO name. The
caller can then use that to copy out the name if it needs to.

Andy suggested a much shorter implementation.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v5:
- Changed function name to "gpio_get_property_name_length()"
- Changed argument name to "propname"
- Clarified return value for "*-<GPIO suffix>" case
- Reworked according to Andy's suggestion
- Added stub function

Changes since v4:
- new patch
---
 drivers/gpio/gpiolib.c        | 25 +++++++++++++++++++++++++
 include/linux/gpio/consumer.h |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3903d0a75304..86527cc7991b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4295,6 +4295,31 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
 
+/**
+ * gpio_get_property_name_length - Returns the GPIO name length from a property name
+ * @propname:	name of the property to check
+ *
+ * This function checks if the given property name matches the GPIO property
+ * patterns, and returns the length of the name of the GPIO. The pattern is
+ * "*-<GPIO suffix>" or just "<GPIO suffix>".
+ *
+ * Returns:
+ * The length of the string before '-<GPIO suffix>' if it matches
+ * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
+ * -EINVAL if the string doesn't match the pattern.
+ */
+int gpio_get_property_name_length(const char *propname)
+{
+	const char *dash = strrchr(propname, '-');
+
+	for (const char *const *p = gpio_suffixes; *p; p++)
+		if (!strcmp(dash ? dash + 1 : propname, *p))
+			return dash ? dash - propname : 0;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(gpio_get_property_name_length);
+
 /**
  * gpiod_count - return the number of GPIOs associated with a device / function
  *		or -ENOENT if no GPIO has been assigned to the requested function
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..494dde33ca44 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -56,6 +56,8 @@ enum gpiod_flags {
 
 #ifdef CONFIG_GPIOLIB
 
+int gpio_get_property_name_length(const char *propname);
+
 /* Return the number of GPIOs associated with a device / function */
 int gpiod_count(struct device *dev, const char *con_id);
 
@@ -188,6 +190,11 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #include <asm/bug.h>
 
+static inline int gpio_get_property_name_length(const char *propname)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
-- 
2.46.0.469.g59c65b2a67-goog

