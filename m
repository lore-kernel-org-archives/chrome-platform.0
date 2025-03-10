Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5A227EBB
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610445; cv=none; b=Js/4HJsAL9QSgB57w4z0p2YI4zuvKqbZxk1LTSLPZjNKKeFVadgqk0R2N2iVNZckKlUjASQtkO7pcOEzlO2JlKCuKpijrsNrtQNg3EX3/QWb5gbkQ0yt7wz7Y8By7GFhNKgAd/4ALHJwb8Db41LOetKPZd2mG4YNvMhl5U0QhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610445; c=relaxed/simple;
	bh=JCZwjmhHkI7UGuyylm3hmg1ybe6vyUyFrcZEROggpDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMfernI3iCZAr8WoJZ2VNP/boaSNVK1mzQSWA3LUSaxKoDHa3YzKzfGmTN2pSzVtLDGfMMT1vb4SZzTnoJ1fg1fc1XuxRrxbL3TQbTDQQ1WZjEx7E16gDAMuZEAVO69n2zGtAn5Y+ifB1LB5QJp902TV7V3uxt8zrLggXbBvEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E+cSTiZC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E+cSTiZC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cef0f03cfso8103925e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610442; x=1742215242; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNtczHCYOvGzkg4rCw2cTpCLRIRLWrJdIViZwBgDUNE=;
        b=E+cSTiZC0pjlHQVd22Ypcj6Cgxb+wMWaziX2tq4lRxwT8fbQ2l2Eku6r7AJmyCiSz2
         JImaDgTQvNoAUkS6LDY1mMi3FNvQkwHwqmh43X3sqQDRKavF/FNFEcOy9CZbQ+xYHQ54
         T1fVmuR7pcxYMwWoacYeKstkOWPQqeQKltPR8e4U4mlE7iWfxPWKnEN3DzGPfGAmYYNM
         9R06ty+3K3LXu7w5Y7Tk4Vq9iDwr/NegzAMxCSZPiRaLJa4XaAndN4dZ50nVUa0ez8I3
         CQAHbPFszaGyVaxqifcDqh/KUDTFYyyII2Jpz0Mx9l3HROTDm1rT0VuAb7ulVNko07Oy
         L3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610442; x=1742215242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNtczHCYOvGzkg4rCw2cTpCLRIRLWrJdIViZwBgDUNE=;
        b=FKR9vDxIdJk/uEFRzO9sqqHJGfYA8H/0gqUPqL5q3JwZjPzpBk8aR36krdwy8hW04+
         Za7CJl6AUVJaMt1e5SanAsR/mG76ECCkTp+mEa9/r8y/a1A/8tNPqk6P6p4HvqDn2v7j
         KJFijN5+oeg/LDF/jrC0lpv7bjY7LGRySN2461vzwLYnLzPajkQ6yxEBgAZ4q4NTAkSx
         K4X8B6X3jO5CJ+8pvV9T6dkE8MS5KRwVrMZAT7Vmwa4alEhPtMl3vhggl1q0qeuz45lT
         LsSRM7lOcJ8uc9wag33+TUCoUF8ziokJMMgyV9pswaQ188go39xDdWW4tT57wk18+Zkp
         TAJg==
X-Forwarded-Encrypted: i=1; AJvYcCUX4QmXU5v4EL58CSoopubRYYSsEHUzrAZdAVQ89raqIdRfqqfazAEqBSTHdOe2NJd4GJdjsgu8LIcMOyJrYcU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6WV7eBXQ3WJg+uxfBNeLbRu6XaJoraPA4gjTBWK9mNPTW8mYb
	2H4RNqAzrrHQ1lVngcasB03rs9kGUFFvH6TQcgTy0jgBeoQRryqEg0X5Omxn72I=
X-Gm-Gg: ASbGncveEwqnpXy3kTywO/Wd8qq0AO+VCd8TfjqiVLv7QORgQZCPifHv+IC95AuXxoj
	LxHQ82eGhqXZ4WLGANRWRtS03EISEL/P9W12gM6xKqrSjn/Ts7UgxP2rzun7/nhXRGmYvb98j3W
	/hE5itPZr60TaTvh/Vgbbx7gAPNRlQPFDE3j/D9BLA9UTAGiFHTPXaB2k/zbja81oPvFF94DSxo
	4AIzmNU053m3YMg2i0+9c+zlQIttfP+GHLWAC+H/by6rGNXmrbSuKJAAspCdOJImbZMgv7p0KSF
	bZKmG+co4er1epSfnYoxhXsdWs+YLvbdrj5Qrw==
X-Google-Smtp-Source: AGHT+IFVuyRiKFOOAXDZU5l6h/TGQ2xggZC6+4dIULrDNG5L2YF0yi09dTRtPuRjwegzC6F/xDPbXg==
X-Received: by 2002:a5d:648f:0:b0:391:3150:96ff with SMTP id ffacd0b85a97d-39132d57d7emr8406280f8f.32.1741610442247;
        Mon, 10 Mar 2025 05:40:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:29 +0100
Subject: [PATCH 15/15] gpio: da9055: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-15-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aX+Sc7fT/BffIdWWzJi16XZBvVpXWWKC15xKXdoh/ts=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt24DB5SoA3hXBMRBC6RePpPoJYAb2N8IdI5i
 pcr3SXpATaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87duAAKCRARpy6gFHHX
 cimWD/98dfw0xWyjhT1TCRNPGdqbkj2nQnmfYJC8g42IGydzwqwzSN7m6xgIlZL5yQJ74CjTNIq
 9zx2WmSkS9S7588Gi0ihnRPW/sA04phIaDLWiLDK2YpSI21KDCGEsVOa1Sua7LP+ocVdXL0y5Dl
 fojCC2iWXNQEaHr/gWiPoktUcwODCRnKzP4Hkaj3fZ5yAleEYanJve+yvCEXSDQfjyetqR5Dj8j
 NUgBSu0fUzZqtcezJoxnsV1hUfXGLeE3nCABFzZEOjAHvYCQTXUugJ0NpRrzO5omloRmYltItnw
 mL6cpyrRR0CCohWjQwbvTFtMVbB06mzFVZO/2/XK4+0/4rQN9uDRJVnme3b+qulhOSopMdKpybk
 n6hGsKM/zWn0vDAaM22cVeBrBsWJBOPrpe1mbUAQxfM+3ZlT/Qvet2Oi/diAKsqASoXEumH374N
 tOQioORX2FMyUTAJ2hSLK60xJHWRcGunqLTzM0zdbbruDBC/xhYA7qlT9HLkpAB0qnAQBkxSjMi
 jI70EtKxQfPccNt3EAjVZtBWPizGrbS+qDe55Cs/jK9KhfT9oP9d1JiUUWXKWr4PWnaCiq9KD+w
 oKxxGJa5QZmrir/4qi1+OCJ4vMc1kRpkir+a1wFlfEzZRCy4Uzq676K6WWHtidzMnjq9yMiZuSq
 1ZPwoMDDsmuemPQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-da9055.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 49446a030f10..3d9d0c700100 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -59,14 +59,12 @@ static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 }
 
-static void da9055_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int da9055_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 
-	da9055_reg_update(gpio->da9055,
-			DA9055_REG_GPIO_MODE0_2,
-			1 << offset,
-			value << offset);
+	return da9055_reg_update(gpio->da9055, DA9055_REG_GPIO_MODE0_2,
+				 1 << offset, value << offset);
 }
 
 static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -102,9 +100,7 @@ static int da9055_gpio_direction_output(struct gpio_chip *gc,
 	if (ret < 0)
 		return ret;
 
-	da9055_gpio_set(gc, offset, value);
-
-	return 0;
+	return da9055_gpio_set(gc, offset, value);
 }
 
 static int da9055_gpio_to_irq(struct gpio_chip *gc, u32 offset)
@@ -120,7 +116,7 @@ static const struct gpio_chip reference_gp = {
 	.label = "da9055-gpio",
 	.owner = THIS_MODULE,
 	.get = da9055_gpio_get,
-	.set = da9055_gpio_set,
+	.set_rv = da9055_gpio_set,
 	.direction_input = da9055_gpio_direction_input,
 	.direction_output = da9055_gpio_direction_output,
 	.to_irq = da9055_gpio_to_irq,

-- 
2.45.2

