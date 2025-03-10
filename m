Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32222B8D7
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610445; cv=none; b=bKO4MkVvct0BYjFofLsWKoZ1ZxjM5ymUB59vlqytv3+mhhbt3IxKHycD3/xsyEQdWYGfaKCKMFfgqf42dhOr0YnMY9VUYdTnZQEEq/k9IVnOf62j8BotDruR2Az2jJfTYQCTqkvX7PdOrFdQowRNgaRw9V/nTlIwmt2rH/lNiU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610445; c=relaxed/simple;
	bh=E9aB1Vd+AUoxjkLy3Itt4VDoDSlD+bPdOL2/ADVn31U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=th7h43myLh0W/QcDuqj9P66iZfNY3K61+e1TowroBym4d+CCGGyc2DN9OA/KO7IVQuQMLcQ2NtXzy0hVzBkP9oTmsqDV4HRiKzdD+EOA2rvWhe+pK55Y2+/K0EzHZGDHRO8Xgwsg4AZ/tMCEeO5OMIu57yGlyY5Ez2zqaibCry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fQzSLMY1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fQzSLMY1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912c09be7dso2224920f8f.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610441; x=1742215241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tf7eeljLA2y+9Oqd6IiV/JOm7eXfUA7DB4oQ/Zqnubc=;
        b=fQzSLMY1UixJpHZclFSTBCgi5t0N2kM0ml6/eGugfrqoFF6ynptJWd9W7EK2HYbQx/
         J8tpxd07KS1a7DLMYkqsB02EOZQ9hajKxzHKuIFx8Y5ko4PLw9GD826tlNdILCwsbeft
         LMEITOl1421g1b9nvIgK/c1y6TIfUA/JNLp/2V/soMH4zo2yNaQqgrgZZmfDoXD2TPHf
         vt/OiFQ6gtUXfAKbBMy0kVgCr+QiFp0bNI+pBonIZJy01yyKh1M/T2dG6fl5+sBHRaKb
         1sULiX9zVtIDoFrb4OuNUaQfKFyE494mOskKbUcqaoMonzz8Q2gJBoeTRBo2XW7uok8Y
         oU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610441; x=1742215241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf7eeljLA2y+9Oqd6IiV/JOm7eXfUA7DB4oQ/Zqnubc=;
        b=brLvMCTBr6nbMFvl1DV24l0lHRxsn9OQ1Y7N6CbqsxT5saQW8ia/tehk4IJtuuQLRp
         vGDPTMAFpwgl3ZZfn5Q/SSafmCe4FvZZcd//koxUV9th30rsqN709GVoBRin2NyEk1pi
         lQX94B3E3DPG+AawBCV77wDq8V5Fa1pvSVFMD//7pq+lYcwo7Fyxxhk4WzL/ZnMhHOQ3
         rvYjZFHj4wWBN7yiTB1xJqoJf8fKkTHIo7wngDMCHl59h4lUNu0Db78GfmDEhSJjoQcf
         mXfq/TmCVVoHzNknFDyRcNuxIlAeTM3ONP9Ul2ZcHiuOcohHikCZxDL5QmeZaT+3EOPu
         WPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHbGEz5VBeuY9U5KZCpfuYa3zzNlyLfUesoIDF950DOAot6Kk8J5oTJOzeDwYyAKIuERcKoebd22hOxILzJ/c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyud+o8bAwkK5tlAn7fhySD9tbS9eHuUfDpG/x1ncZZfzBsMAHq
	Cd+LzEI7EKHyhNU1cOesNHgzcCi5X8GHfjQFyrvOr75T/qAuOzKO/C6I/fn9ZIs=
X-Gm-Gg: ASbGnctWerIvVby/na6JaV2ehKaWAe4V3FGnQyp7lNHUayelfB+dB6fZZUJAskB5DOX
	y6UruseYtcmZ1iJuQXeqi++p7Mb7D8Uz0q3TxmfD3k/p9PQsMN9G/QQMnpc7s0V9zoDIGqlwtdh
	EludFQ6k3FRyfTbg787CZqmZ6qTYc+nx1GpKPSPVVHFiiXUvusFf63/h7BdTcRIoDtY0LzoRc2u
	HX5IBbnWhsfuGfVPzYkoFAV1vGUaNV0N2G22SKxmWYb1ON1NCGCPm5OldBE4p6SJpnhOyf87e3z
	2PlMjawoN/TzhIyJ9zzs6cXxOXULnctsbpPmIw==
X-Google-Smtp-Source: AGHT+IGsjw+gRltOoV68hWd664IKVodEPK3RYjj6f24rZc1hRr2npsppVMspn/oueccOmjBO3+VPfw==
X-Received: by 2002:a5d:5f45:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39132da8fecmr7962936f8f.48.1741610441102;
        Mon, 10 Mar 2025 05:40:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:28 +0100
Subject: [PATCH 14/15] gpio: da9052: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-14-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oV3wI9w1INONqHANJFjJ/R8DVh9K4lYun6zlcNoJFsU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt24Sveiw4Qcrns1kVInUoiSTeiXKL/2WohT9
 7Y+3Y2saOiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87duAAKCRARpy6gFHHX
 ci+uD/4zONnng97wW7G9sQ5b3jWrqerJ2Hzi9b5RBYqxyTK9/zDjLIGuKjWGIbQ0IdajUKXxFG2
 3fPzRWUeIAowZM1v+yjc2wZT5cBjSU3/9M9pm6aQHKhnfqlr92OMbN9LlodjfyQ0nk85bqd2YHm
 W6m9atQ/6tV5EZaxqJ72wU2HBFX/3qvjlA+ign3ydiSEkbz7xM62F4lr2TXe8NnSjf8gEOylHhq
 8eTfY9ilHP+oCynqcFSMMgwTPyfuQa2v3sD/FS+17HSqDPXVarxP0G+bDVCDXNHV1VpLytDjmxB
 Tmt9z4fHghh+tr4fyChzIOIki/+DzlVF1IRv7TuQBnD6y5s+ECAPbfG9YOYp6kGeZXpveaVgK/H
 9hUV9bowzZEHquW7zKW5Mljo6HDIPezj7b+rM0G/ZOjirLtK7+AdOk9nlyJ5SVTc8uEcsLHnjGc
 qVtIDgfZd7TQhHV5ffGtE/dYVuDREHmCHfRr0l0qyrBlHAqoLqL7kli2a+baJYRm8lvXxDgiOJ7
 TDPsgQyHdHX//Xxw7a7EJUOQFd5VFml21vaNy1l2IM2Q+i3+zX63MCjzqLIwePCW03bSFKqxjNI
 MgxKPnwAGGuTM71+4dAi6hMWb8/Uw86tBy8C7GF4IJh/8bioSY352wpdCJ5TNwLHepI4m2frh57
 Ubq5f9r0zBTvXlQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-da9052.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index 6f3905f1b8f5..6482c5b267db 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -89,30 +89,20 @@ static int da9052_gpio_get(struct gpio_chip *gc, unsigned offset)
 	}
 }
 
-static void da9052_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int da9052_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct da9052_gpio *gpio = gpiochip_get_data(gc);
-	int ret;
 
-	if (da9052_gpio_port_odd(offset)) {
-			ret = da9052_reg_update(gpio->da9052, (offset >> 1) +
-						DA9052_GPIO_0_1_REG,
-						DA9052_GPIO_ODD_PORT_MODE,
-						value << DA9052_GPIO_ODD_SHIFT);
-			if (ret != 0)
-				dev_err(gpio->da9052->dev,
-					"Failed to updated gpio odd reg,%d",
-					ret);
-	} else {
-			ret = da9052_reg_update(gpio->da9052, (offset >> 1) +
-						DA9052_GPIO_0_1_REG,
-						DA9052_GPIO_EVEN_PORT_MODE,
-						value << DA9052_GPIO_EVEN_SHIFT);
-			if (ret != 0)
-				dev_err(gpio->da9052->dev,
-					"Failed to updated gpio even reg,%d",
-					ret);
-	}
+	if (da9052_gpio_port_odd(offset))
+		return da9052_reg_update(gpio->da9052, (offset >> 1) +
+					 DA9052_GPIO_0_1_REG,
+					 DA9052_GPIO_ODD_PORT_MODE,
+					 value << DA9052_GPIO_ODD_SHIFT);
+
+	return da9052_reg_update(gpio->da9052,
+				 (offset >> 1) + DA9052_GPIO_0_1_REG,
+				 DA9052_GPIO_EVEN_PORT_MODE,
+				 value << DA9052_GPIO_EVEN_SHIFT);
 }
 
 static int da9052_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -182,7 +172,7 @@ static const struct gpio_chip reference_gp = {
 	.label = "da9052-gpio",
 	.owner = THIS_MODULE,
 	.get = da9052_gpio_get,
-	.set = da9052_gpio_set,
+	.set_rv = da9052_gpio_set,
 	.direction_input = da9052_gpio_direction_input,
 	.direction_output = da9052_gpio_direction_output,
 	.to_irq = da9052_gpio_to_irq,

-- 
2.45.2

