Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081822A80A
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610439; cv=none; b=XdW9QD6kspyuWPKLkIOMR7Iq57EJLx34AyucQp9oBPH5+MY8JTRHwkfKC32pGVc5xm2amXM1mU67ojjts54QyqSEgdv/dhMYlV0LLys6I3zY/mFNoR1mDyC6rSK/+MAwdC+ZePSOHR1BKeMv7lRIUUjzz2GvUEUKWjFpI4T6cpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610439; c=relaxed/simple;
	bh=eF0hDq+dmWyAGOjr1phNsifrrwjw6vv6u7L6MkqdfqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnryWOVZRlgoEbHKbsmnNbqFidus25ps4pB1cbHnfoXSB/D+k06D80qRgANMYUt3v0XatqQ/ZUKg0yIMrabBpUGj8tT95ESdLETgzmZNqiBFjJbl70CyV1W2zx5DZYOLjE093J5KK0qHl8thFKdhwyD3ik70cbA3G7gxciSMqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JSQoEnH4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JSQoEnH4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2075800f8f.0
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610436; x=1742215236; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ul5VnJBefCrA6KPx6o9qS+QweFeRf07qToseQLHiWw=;
        b=JSQoEnH4OTq1byA6/rKyqpzpu12XEsb/DHhUbLODJVptA4w1DQILoiyQXqn8MQLA9Q
         HJx5eTtxZIt1we5RE2mA9xNEppuKTQZloe8fBcI4r/Fi5HnWJiApdmFccRcyQBBzQOVl
         jCHtVmDS72WlWMbg98BU9iMDbOjh+bdjmahQ88CuuJr02I4MyG/co+b21tzJd8Rmcdbk
         S1Z7gmdKhsvrx8nFL4b57u0uT5svaY7hZaM10v9+OfARnVMf0CfJHVxTBL6akWwoiq+Q
         n6z7OE22QBRbPjSG1AJeG6b80w8WWUzv7YcgRviRd86oRTVNKPfxkSity14wNd7evnFh
         kyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610436; x=1742215236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ul5VnJBefCrA6KPx6o9qS+QweFeRf07qToseQLHiWw=;
        b=iRDuKcUqEMTK6dvZdBWvk6HNlj0n4OCvPnLMJkI7HpZINhGWgDDhHuTzmrWyqToq92
         xBjk8mBQyouZOAmxBXYBWCJJgSuRoGwO1NNxF7fWyWIZXot13D1Gcw8t607LbNAWzejT
         UMauYSVaN0rDJIZBqa1Cjd8gGKvex9Zq/IZY6V4KH4HPeXo0EKLDjYfqP3pHNv+LTzUi
         b4vHOpNTgsrthIA9YIVnJTF1IISXMV3QCNg0J7XwLU2RHhBBx1pcGBzQdwqndXWxreBM
         ZBmb0m/9BKbKp88deyOXuz+HmTUvZEaaDRqdOi8lXusbQbSYrktJmEwMEf6P5HrYqp+c
         ilRA==
X-Forwarded-Encrypted: i=1; AJvYcCUZS9k9ss7PRiTapC+FhITymZAYPQolZ1aaz0FwZjVrZaqZkE2NcuSiz1jpHdRbR1+3DlG/k+u1BK6YkcRGct8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxomWPtF6K1SdAFopYO4ssEq9Brrxt3c5HHqKJxp6H2sPyfOX4y
	2CX0p8NKOJe+tMriCHAVDO/dDupSOfYnEjQ51R/u+RZJ0W2cC0Fi+glPjuZFvDk=
X-Gm-Gg: ASbGncv/+u4+ySn2gu+F/BqNdpEPgEu/LZ2X0gi9N6OHAfgoYj/rtnMy/xd/GmEaS5U
	c8YaDwXL7TbGwsuoD9XexU9ci0AydElYTcPweDnXK/05rXkghbTh1MoBob2NMHawbs2c//bB7m6
	ysMBWCrWHEFLlNypuIFUzt37RcY1AmuVI7qPBUsLbbUNd5suJ6Dw2hbHxbkvoBOb0jWi0XJnrP+
	9UpKjEPrEhFdqzzrANba213Z5nz0/K0EzJywnDXjRYs+8rRQ2cmjFIxosF6GcwatyCHCmX59pjC
	LvXX82+B6TYIznGSp4LZlFqKTsnkfLLBNlmcxQ==
X-Google-Smtp-Source: AGHT+IEFFTCQlnKxKa5Uqz8Qsewx5EPKGuImlX0WipUtNgEC5ZPbK9A6g9jliGLQxqqZ0CjYumZWrQ==
X-Received: by 2002:a05:6000:25e3:b0:38d:d603:ff46 with SMTP id ffacd0b85a97d-39132d8a273mr8267077f8f.14.1741610435829;
        Mon, 10 Mar 2025 05:40:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:23 +0100
Subject: [PATCH 09/15] gpio: cgbc: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-9-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2670;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1v/SXsvrtA+Yw36LlEJRsvD6C7VXgTznVWuX8EmPL5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt23h45ep6JsGUc+cwRb71/qO+/+nDM1jaN6r
 kIDV5FoeemJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtwAKCRARpy6gFHHX
 cj09D/9LqUW7e1QJC8y1pvtBoGpumfGGVdjjKlOP0Nf8cj7GV+OHGLG13szW3NVOjrmRxHBvOv/
 by4FD0UfZuyeWy6j6m0SghMAQQ1Ik4WxSWsJTJo71i1qPqwZQtZuV9F+/JdcMHPa0D7dq114Kpl
 V5R4K2jF9/g4/UDmsS42VemnAuzETo+p+M9u2nBHMH8t9yKYUEQfN6WHZHJzVkktQYC1qh5Vp0l
 mxrhFmQAyZb+Rd+lcC2sDZeVulOT/ZmL+ZRKcVHI0hMLy0RCVQbxjFszzhPpoVxSAsJoGUZiRLp
 xmh9sWBU1fOklwBlmRa4lyEYl/ri40xa0mAELP1UqqX/QqsLQXJeAZz1ctOZ8iE/1qOucHi9biT
 jnENyJ0kCenHSbdqL1fkhQyXiys9bNTeA7B90jWKrBli31Kqgx+LASUDt5CRkyKNnVjeOID3MLd
 /6hpjFWFjLjaa49pc8XS2qixCa6t4Xf7Jv03HWCTd3yUQKJcELUSFHWPn+DW2d/O0HVROv+6sBh
 cBYhjLRA1fopAgt6jYLFa+sl8j2hzKW3ks4bO8oEnhf3j2Pu49sYM1HgEF1TbW93LvhLedxvgKD
 GeLzVLO+U2cSXJrYx3hqHYtDyY17+3vmhU4o4P6ZMpdyrL775ibIn4bHx0yyy2sw7qonW/453+J
 rQKMsBy22LFL3pA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cgbc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
index 9213faa11522..1495bec62456 100644
--- a/drivers/gpio/gpio-cgbc.c
+++ b/drivers/gpio/gpio-cgbc.c
@@ -51,8 +51,8 @@ static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return (int)(val & (u8)BIT(offset));
 }
 
-static void __cgbc_gpio_set(struct gpio_chip *chip,
-			    unsigned int offset, int value)
+static int __cgbc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
 	struct cgbc_device_data *cgbc = gpio->cgbc;
@@ -61,23 +61,23 @@ static void __cgbc_gpio_set(struct gpio_chip *chip,
 
 	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 : 0, 0, &val);
 	if (ret)
-		return;
+		return ret;
 
 	if (value)
 		val |= BIT(offset % 8);
 	else
 		val &= ~(BIT(offset % 8));
 
-	cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_SET, (offset > 7) ? 1 : 0, val, &val);
+	return cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_SET, (offset > 7) ? 1 : 0, val, &val);
 }
 
-static void cgbc_gpio_set(struct gpio_chip *chip,
-			  unsigned int offset, int value)
+static int cgbc_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
 
-	scoped_guard(mutex, &gpio->lock)
-		__cgbc_gpio_set(chip, offset, value);
+	guard(mutex)(&gpio->lock);
+
+	return __cgbc_gpio_set(chip, offset, value);
 }
 
 static int cgbc_gpio_direction_set(struct gpio_chip *chip,
@@ -116,10 +116,14 @@ static int cgbc_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned int offset, int value)
 {
 	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	int ret;
 
 	guard(mutex)(&gpio->lock);
 
-	__cgbc_gpio_set(chip, offset, value);
+	ret = __cgbc_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION_OUT);
 }
 
@@ -167,7 +171,7 @@ static int cgbc_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = cgbc_gpio_direction_output;
 	chip->get_direction = cgbc_gpio_get_direction;
 	chip->get = cgbc_gpio_get;
-	chip->set = cgbc_gpio_set;
+	chip->set_rv = cgbc_gpio_set;
 	chip->ngpio = CGBC_GPIO_NGPIO;
 
 	ret = devm_mutex_init(dev, &gpio->lock);

-- 
2.45.2

