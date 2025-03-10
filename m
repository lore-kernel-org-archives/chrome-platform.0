Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00922B8B8
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610443; cv=none; b=OTeM8Rs76LJinkm1pRTC8AvJ2DUR+NFCCDdEc754A/B6DBATGJgdnb2LduMJyInDOMhXIOd3tIhDuuowfl6nTE1q2oHIH+H+oGXzLTwTbFvp6HCgvkyxUm3/Vvsf4G0ubgYo/uyXJXHvXWUCsRbJU4rBIk2UPJrQUWu9TUBAnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610443; c=relaxed/simple;
	bh=W6bsbnseBY25ByUGe8kY8ymh0ENffkUvrW6x3HhNht8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8RXvuyeJYmx4oW8ilLq4SazSS/mCs0TkKKlB01Gyi/tcDUQ0zOsX74On4+uUSQOmUc3qyXVy/MIVmXtvSt2zR+jp1eHBTU4kxdWKKupT/OmYPA5FTpKibQzwrDK60ypVE9LU9TziSp2iS3fD6jYL3tG/PhcLDKww7XIj/2juYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U9KK8Nv3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U9KK8Nv3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394036c0efso23441485e9.2
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610439; x=1742215239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZMXz92h+Kc6DuqlUd9j32ZQvM67O+7ril4p2VpiO5s=;
        b=U9KK8Nv3ZRE8oV6DNhlmkvOM7GvZiF9hx7352RYRPwMZ3Btbx5jZ37LsYBVRQvGmS1
         KrM7PGGiPeB/ASI9cuBcV5UptMfOia/fDP7RRtQrONU/IFjOQQA9ScdhRrAFNYcpH4DC
         DxWZdZoxqmQDgavdapy7dDE3B5eXhRP8lcmI1XBTVc1iDLyAk2CgJSm3aQCoXnqHHiL4
         eF2WEKY4tiBDPUmLG6UZglyAOCykQAqhvmPnaMacp0qVVbJkIIokq0vkBcvhcUUe6utW
         CqrbpZ9UKXVP70KwNr/ap7E+UuIbJSduyfasGRLMH55gv0j+7OOsLxxKwAyRpcjh/iU0
         kUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610439; x=1742215239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZMXz92h+Kc6DuqlUd9j32ZQvM67O+7ril4p2VpiO5s=;
        b=e8kjeXg+t1d+xVnvWzwWJDc8r/QPj8Oqpad/ymfLwqxKtL18BOBWq8MrBGkWXQq3W5
         8BPRf9sokP8yxl45m5LMSSR/oKR2BnWlcKh+7CDgKUtaCyKqoYTMwhBId8W/opbZkcOv
         ldApLldTo4PthJjKjQzcPC75thGPGrNArTLAe3fAi9EmMJsZQrucYqlWBEGK0OlBZo+c
         wTKavfrZ1cGiFE7I3crEiM6wa5LTd8kAKExbJIJeNtKICphpFK6a4VYIagR/EREfp9zz
         B0K5gsJHe+ediHJfhFmaOl0FdG89INll5iSOS9dcV5zEwOLioqHMGVS0znycEy4GG5Jv
         c/uA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8kXJfpJueq9NzEH4hD9mWBEr40lJeeqPPev1W/s3fTTee2CcA2Xm3i/GGTFAZ7QknmtpM0NCtlkNF1+3Ryk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrDfbG0/YgIgLiTct1RIh51RcKyr2tOzdNTTkXcglZisn4ARd5
	vAimi2vuebK7ZsM+63ZYwJwmE3Cxg82G29gkVJ79bWBveeFMoQSH92b0jpnry8o=
X-Gm-Gg: ASbGncuusuAE3kXk9Q1lfMwW6KQgIhYeQkFJZzJA2D47sGseeoMZ5XxHZF7SL1FHnpS
	J0zRFB2/0aRbDOO+Il1KxstgPr6qKfOEuulan4qVA8Y+kS2F3IReHdPKz/qibB4pBREyxAL3D2I
	wyW82ODjkoa/44smcg+PuFoBfeqO4tIyrsufQIlUmu6DWix6pPahCudFBNuh0kxyckt4cTk/3KP
	/Dsh55FXbEZsBR/USuX2QWFdFAa88XM7ZzhuE1ZFvSKGtl5WgJhQBl6rYIzEjmhhXWfSheKt+dS
	cmAiTdkfWWy2mtNpa7nom7FmGCwMs3mM5Gjzrg==
X-Google-Smtp-Source: AGHT+IF8RfpOiMZdB1vExW4K5rzQNK0TgHRaqy0wyeiXC3V7IuSnH5Ub5H5GptqU8/5m0SRjRsT7KA==
X-Received: by 2002:a5d:59ae:0:b0:390:f5e3:e833 with SMTP id ffacd0b85a97d-39132d379e9mr7758009f8f.23.1741610438927;
        Mon, 10 Mar 2025 05:40:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:26 +0100
Subject: [PATCH 12/15] gpio: crystalcove: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-12-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BhBIMadvw0Ns81letqcS3Gn7LQUbTtR4jE3YMqJLxY0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt23jeX23+pF1Eafov7hkFKa1djj2w9+iJp8/
 rRbFcWDIzyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtwAKCRARpy6gFHHX
 ctiQEACLoEP5YjVmtd6+kD5O63MERvwFhHg696nwDJsEw4K7bxv1j7WVoDQSM8jNdik9mTvfovn
 5SfFW1mHDptBe0mIsph5P7HoaEv1X+SmebpPUd1wIz6iK7hcM2jNWa6MnFuwNiV9aOGTRhk4dkb
 xdNwrJHRhlP3AM5UFsi/QdDYgrwgQI93D4LnO9px8QNuTUzR6yenOLLg8jDZuwEG4usybEHVF+I
 jbs3x/CuzeEjHS03A6RTUBEA1IxG+UKWaed1+7mbIoBKU+KUJG/iFLIB31w3iR1+UyBV/pZ1dJs
 Eg0GQ2KH0w5xXSVUm76LpvGws0ITabwYJxPefpT4AH1ZRM2bDSVftyR/g677SOqKISCc+eFNRsX
 rBIfE/X+8cndGryG2b/CVy6mhGoxi0E22Xem6ZmrEUArHwU34X+0f/UHHxh7dlA75HbvgF/f3/N
 6U5tCKLDrBDhco1pjls0ddyJivXlolubpgM025TdDKMTSmDEXWga1QxEb5qSJuy+pzmG4CX43kx
 sMJtg1HfP/YUBJpOEcmknfcDb3wtmGCctcGL6NQlvMcHvtih0bWO1hBEoJDRfdzqMCHOU3Ow+l4
 D/XO5TIkjJPHfUfMMnn5hvKIfZS1Op+ZymdB18sbNP/3ssmJG1Xv9No2figbVnxN9kktk4suJa6
 BhVdTqgjCfqWgxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-crystalcove.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 56effd0f50c7..8db7cca3a060 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -168,18 +168,18 @@ static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return val & 0x1;
 }
 
-static void crystalcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int crystalcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return;
+		return 0;
 
 	if (value)
-		regmap_update_bits(cg->regmap, reg, 1, 1);
-	else
-		regmap_update_bits(cg->regmap, reg, 1, 0);
+		return regmap_update_bits(cg->regmap, reg, 1, 1);
+
+	return regmap_update_bits(cg->regmap, reg, 1, 0);
 }
 
 static int crystalcove_irq_type(struct irq_data *data, unsigned int type)
@@ -349,7 +349,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	cg->chip.direction_input = crystalcove_gpio_dir_in;
 	cg->chip.direction_output = crystalcove_gpio_dir_out;
 	cg->chip.get = crystalcove_gpio_get;
-	cg->chip.set = crystalcove_gpio_set;
+	cg->chip.set_rv = crystalcove_gpio_set;
 	cg->chip.base = -1;
 	cg->chip.ngpio = CRYSTALCOVE_VGPIO_NUM;
 	cg->chip.can_sleep = true;

-- 
2.45.2

