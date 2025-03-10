Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0B227E99
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610433; cv=none; b=J+99B8EdYYTIfPWZcDoF2z2hU2rnK8hWmkG5Iq4IDEpn+1Gj3R4tO7zvs0xb0apE9rGVV/G6xGZc7UybIC7vG8FHN16k1Ouevs90vavzBdTixLG8ujlOHg7Fpnju03jUJhRtXlP7vziqotJJwEhlMDQU6YxEdhW4SNdjNHzaHqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610433; c=relaxed/simple;
	bh=DmESC0YR5KbZrlAd/dDpIL2pAODS6Rzc9c8ux7DosCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsN1jQ2PDPb/9HrKTNN/289DYYQuK+0qrNyvkNN2XbPdKQhkXIn+7FU/sdRmeS3Xvuk74b94+9ZLbsHDAnCdz1ubH5vzIzRNxLY03ZRGN/ENa5ISArn0+TcdvMDaQ9LAQ+Ckc94D15NwWIscJ/q1K34ZthWFnkskKXObwGjULDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v7gyVqsB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v7gyVqsB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so10605365e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610430; x=1742215230; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xar7ZrAdmD0Zgg1MVmgfA5Lcsmb+K+928MQN+MEqYCk=;
        b=v7gyVqsBCXuxIGZ3mpWu8Y5I7rbfHAB1yy9O4kyl2qd5HBU+ylN77VNw3RysrWvAlY
         MFSlWtvts//gWW3k1E7SH4WD8Gb+AN4Ven8JoCcLH41pb3BAgZSE/aGzvhNcBRobIb7V
         mPfmQuiY918ovXbiST9ncRRLeBYiJYuWZbpYwSaF9NSeAZcgPLuPeAq7st0RGz9eYIyy
         TsfjFZCpBnKbEfjKuNRFA/5W8T8/4kKFQ19ASTW7snqwE2/zTIMt0Ee95O53suEmuADv
         YMhoW0yY8nj7mrngRatPsPdyLsqrx17Hf2IJ+izgkxTuL67X2j/cwNDQhSomtF2wK2xM
         xkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610430; x=1742215230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xar7ZrAdmD0Zgg1MVmgfA5Lcsmb+K+928MQN+MEqYCk=;
        b=ZSEapNwPN0+gjG9WfM3FAcjWluO9jL1usn2BokeQayhxfjSxhvCZYdgM+yMoKFUNqS
         9/My2jbyqMZ2gdhn10gWQW2t4+qkfmksgX/uxLhfLe/lb7DBX+YH+y9yKgPNBahCRHO8
         54cHh7jNQM626uU/LSQfnomwdtcoht4MMiaPWho1RWBBIzZTEtIceLl4iB8MLbZeasyG
         Ayttk1+ZI7wU2RBpVzhRD6AdiiStbu/1SMCtgDUZDhqRs6Jv+rwpZKBwOknhu1/L00NH
         1H+rw3dB+e+yZnCskD4r1T+hDQe0LHmKfGPMduBfsff43S9RoCBgyFKar9d2uxxybq5c
         5UqA==
X-Forwarded-Encrypted: i=1; AJvYcCUdrl1aXWNyZ23gwrK10wdSJstorU9aV1NzL2DNQKioMhkbzEc2NsA5imLbnAlZkFMxgks8TYXoLKqXRsw4T/8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDmIpEJo3F04FIMv3XbUSYiAWB+TTBDsJZJyMesleafQj26wZg
	26heapCzyeVJB93rv9hCu5g2hUOdb4JaW+BOUSukYQiZLSJ5xJJEX2oqdf7OjeQ=
X-Gm-Gg: ASbGncvfZatQh/AJBBbwGCw98QK1wIJdUHspDQhQn6cm2FJSYbdxb8KtlD3YqpYniBx
	gX+rc4kTYnUX8ysSdIDdtww8DscO3e2oWSaSOifewkOFbmRejICCFTf3PI8qjepvEXsDt4liOZR
	80gN3yKlWZ8z201ZGJm12unXhpIZgk5n19lpHzrDcV0lz0w/2BaAGOAoetCtLO7BoOLFOe9JRKS
	C1k4RmwAFK/QIehKV0ie8aYeBuyiAxRkDVqG/jHpnRY+L351H/Ts3H6m35sn+H8kyiOJDJMRelw
	7iJCwvRMGF1iSTVHFir9xiKenJYdKsEzfvIPVb8vPmZi/CWm
X-Google-Smtp-Source: AGHT+IGWHzX6jPHaCn8QBRkPBn68gP61T4dWPxRIFGpojE4uHM3kIsOycd5FGBFqdAjNnQc/pVON2g==
X-Received: by 2002:a05:600c:4e45:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43cfa3f9022mr19496005e9.2.1741610429995;
        Mon, 10 Mar 2025 05:40:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:18 +0100
Subject: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4YlNQyfBza+2wJJnMpt93TznA7sgUuEsjl5zYShA88M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt22r6eiRU7IXW2y3xyuBn4NGc384r3V0dbeh
 xyh5F6vKtOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 chnUD/49tg/Xo/NHEP/ubBHcRIZLaJ7jxMUWU8m38mO98ktbD6vqwNrt8Nm9BOkNLUQVU3/Z/JL
 uskLsI5o5jrVWBEZYvPSxAg30wN52s2ETf0NjDh0XaP3CsvomX5mCf8nkrB7QI+xCbmZNATeaHs
 42SAv+7lykZR1wRciibdbrgtfiFMbVa1xSDWY4HP7Cwe5qU6WKT4eWab2Ao0ahmFAAwd1H2MfRU
 6HjdlK8BLIWrVm+EELOqVE5o4JSQS59nv1w/Xs6pwPzlIG/ecCmElDNCoK4QLIncHT133dRIXKY
 h2/9dWU9Xl9RqFJOe9exyt6Arxh+YwWK/klf7Uqett9vF8N1+JFdTmBLgx9SWTypR7DxXWXxsn3
 2A2ES139kLDHcXgHnOLPRI+1AiUpgDoTSyyF49I/b8Yx2rHJIqaI0OkIG2vG1gOq4EjFZ2PS5FD
 tbNMTede7T7/P1zGaOvElDEoR1it16b9OL6J1nSHQT5l2pe5ngzpYmEcV6JFfqk1lfKLEeB/aU9
 OkAUt4wEkDHcx0RLmQLLOoDEqM4WLOj5S3eIlCR9kozsfnnc6aUjaEqalykpjIsb7Wu+7kw4UVD
 f8jzOYiHloPEgdjEVRDI/lJI3i0gov5YxgDFV2fTm3j7ZncTxLbCCTMzr7PBFenf5LsFbzK7OtS
 NrMmCoZQ/M0a7Rg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bd71828.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
index b2ccc320c7b5..4ba151e5cf25 100644
--- a/drivers/gpio/gpio-bd71828.c
+++ b/drivers/gpio/gpio-bd71828.c
@@ -16,10 +16,9 @@ struct bd71828_gpio {
 	struct gpio_chip gpio;
 };
 
-static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
-	int ret;
 	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
 	u8 val = (value) ? BD71828_GPIO_OUT_HI : BD71828_GPIO_OUT_LO;
 
@@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	 * we are dealing with - then we are done
 	 */
 	if (offset == HALL_GPIO_OFFSET)
-		return;
+		return 0;
 
-	ret = regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
-				 BD71828_GPIO_OUT_MASK, val);
-	if (ret)
-		dev_err(bdgpio->dev, "Could not set gpio to %d\n", value);
+	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
+				  BD71828_GPIO_OUT_MASK, val);
 }
 
 static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -112,7 +109,7 @@ static int bd71828_probe(struct platform_device *pdev)
 	bdgpio->gpio.set_config = bd71828_gpio_set_config;
 	bdgpio->gpio.can_sleep = true;
 	bdgpio->gpio.get = bd71828_gpio_get;
-	bdgpio->gpio.set = bd71828_gpio_set;
+	bdgpio->gpio.set_rv = bd71828_gpio_set;
 	bdgpio->gpio.base = -1;
 
 	/*

-- 
2.45.2

