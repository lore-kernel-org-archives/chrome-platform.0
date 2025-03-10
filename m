Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F496226D02
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610430; cv=none; b=uJ9U85HYkcwCRSli4bGpvWRDfvXApDyQ8kXlmEO6t5lB0IleJhMG0pAtRQokaJFJJavr4SQImVX5z4Az8+vRItDUYxFBngx1AhATRbizdkqrb3k5ox1rjvoQbYpGTy6vgbAuSk20cFyLFJEkZxVpF2Rcp/YqElpWLrWViVoyNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610430; c=relaxed/simple;
	bh=oW/aiEUvZZXqJSh9yhfXEXd+nz94th1LNEkngduFixs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akK/H1N5RnGguxhUufCY9bQw9GWiIzP0rHctVRbxLjvYovUMWQkiovuFHyKhoqgolXq4sjmJ78/nkHqE9mFn5ECBKv3LejScQBxjI7Gz+JNHgZxsqI2bjYtPHUwjePhCxPYdb1O7umLvAeiSPHuIHxYSPnbPH3OAPUBHaWjQhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m4fw+JeM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m4fw+JeM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so7384385e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610427; x=1742215227; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYGAI05OK7Mp/05h37Cjc2avvREPLKZMIgnLXPpZpUk=;
        b=m4fw+JeMAFiM/M3JSbQJgh+VZFAZhP4HQPynnxD9DvaPMSKcltnVgdzaIgX0iLTbXr
         qHphlW0RKiVaFDXHWUK89wMw3lrxZJXHtF5oCdashsE7M2BePEF84Jk+MLlntBHbWGNl
         bA0ALdIBioIJWeBDzGkQWQzCrzqkS7y1YSHYTB3mOgmdal/lRaY4Xwp0IdHPSgd0IqXo
         uguISIjT23ni1CUf4pp+yGUdUFlMU3xBTSGaNIR/1El0cmiWayHBDV+f3I2mRN1zRP5q
         nw7eoiOaqPgWubLscX9nbwYAKhV6q/KLb7T9PeYSouMaPGGJ9wAjfreabCZjXaq0bYpg
         WlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610427; x=1742215227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYGAI05OK7Mp/05h37Cjc2avvREPLKZMIgnLXPpZpUk=;
        b=VIAVxwFyAXMCLO02GMIP2dkJ7j+b0c4O4xZ3NZtIPd56UYqwLJaTe2BGa+px+CcSpH
         3piHku5/+Ck+E/czVGc6yQPYkg4RA0ZSN7J+niYBjNS174lWkNdLl1rjh1peEl0PxPk9
         ylAqGjshZ2y2XKVytuhEyJBBLpMfcWRijz41Sn4Os20fsEDLktbUZWbm+XTL2kNgrbQK
         cqmjbAkXhMR6RiliDFuC2E3Ryqt5+YJuIXPP+n4y5Hxip5Bq0dzR1R8gZOT7VAB0RxwV
         rhlh6D3BkE4x0DT6LTlOEFcwIDcaPR1LpJxZZz48/Cj4xWF+anfLtClse5CZqfPfXslQ
         tZRA==
X-Forwarded-Encrypted: i=1; AJvYcCXgiH205Ol/TY5JZmsKxecp/x8//oobEP7C6mc5fDKas0qB+erQeKzElQufxDJ/520gC4QLwGNQoyfw++6WpEI=@lists.linux.dev
X-Gm-Message-State: AOJu0YySv3CKcAOXvftFi8bbpsM6NHbTjMM0RysBbBWM9pEhjdQO5/4z
	YyE/lLq2ahxNcKEAF7AYHin4lbGyvpkyGs/wdFgtg8KhokumX0qL98qX+vIWIo9XDt2AkU43/9v
	t
X-Gm-Gg: ASbGncuAV1A2GyP4i8RPgcpFZX5s5jRbR1TKszDrRpJWjMDZdAIK1uNcq0wJbfI8w/n
	VLjRb5fi2rDLsO1xoJBLteI7xZ8lq/OmBofB1i7nDoGt2NfiwekykUjCki/UFINq/2LUhfFwu5p
	CKbYiKSV86uRRMGtt6uk5C5I5tsZg3GWsLi6/RZyJ0l37jDQpKwsGvslM1e8a7OscDV0tLr00U6
	P2JDYGFPtjwKOVmiDBLrecSD9a994/KZWZDEpbJjvqOjDikzNmQZ0AxzMOlbZ4uhETw1o+PpBpe
	tO8HzUVhrZnaY/4WPoM+tvzT0LvUXHSaMoqDb8Wbb6rU49Fn
X-Google-Smtp-Source: AGHT+IEpiZSigsD7mq/7aroNSLpkKgw14vyLzwCpAs6P3IU39kiwkAcoJYwXJqsG7JdjAFA2p1EHlQ==
X-Received: by 2002:a05:6000:1fa4:b0:38f:577f:2f6d with SMTP id ffacd0b85a97d-39132d093demr9788508f8f.2.1741610426632;
        Mon, 10 Mar 2025 05:40:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:15 +0100
Subject: [PATCH 01/15] gpio: bcm-kona: use lock guards
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-1-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8700;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64LvLyjulLlcRTZ6GwgHPm6zOm13plfMb/iq3ckJj3M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt21eodUQWkbpDril/aofsEv3YS5awh3YzS5v
 pLHOsHTSUKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtQAKCRARpy6gFHHX
 co4WEACFOzNSsrtqyn29Tv1p2FDoEi4QHiQUDjLxZx2Bv3sENlv3Tx75JcS/y1LNsyW06lE+Lht
 hni/2nm5Ku+vMumPzvWiQpBGr7jvBFFisiXHVGoKHZD60rPJV3x1VGH5fpXSYrkqF0G9SzZi2/l
 sr1zPSrIQ98kdRuklC9yiUQCidpG7gpymoTNQ61suzfAmfv23IiTfxlE8xnzb3YRnGZgMAoTydg
 yiWDrRIiOgcxDTGUf9Qb0NqtPeOKf7xy7K7WDs3vSkHs9HWmU3IAmawoi0CYedV6LVxTwWxjmpc
 csZNcgsMcVziHsGfPLUVy0/8HlwM5Ukux4cLc7Bn6q9k+Jn1ceTy5UyyRzSpdoCI+DC6lp6pzMm
 i654kvtGMluy6k3KW3YAErcIMxRWcM3aXp8RMGs5CxfkUnOMKS4XycWERkdPLun4RgR6HFvrHlI
 KhhJpNS9RGUBP7stOEyCgd+PkGd6y1oU2qGGNshbuXlg9c+xU+R/JZEHApv09Ncywafj9Bdjtpy
 vxHR4j2+I/jnJi56GrWy53xOBgGky1gNT6SAXOIOS1xn01LuIZeRPNMXL0eGmxG0EOxnhXd5psN
 HS/oYXp5UOwxqWQBiSK8N4yy7mxJrW7R5ptA//ih+YDloJvs0xBPMUxedvFEn2yqJ5ElJ7N0WFJ
 qzp7ejpfa8xA3eg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reduce the code complexity by using automatic lock guards with the raw
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 64 +++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 64908f1a5e7f..a7390b1f1173 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -100,7 +101,6 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 					unsigned gpio)
 {
 	u32 val;
-	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
@@ -112,13 +112,11 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 	}
 
 	if (--bank->gpio_unlock_count[bit] == 0) {
-		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+		guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
 		val |= BIT(bit);
 		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
-
-		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 	}
 }
 
@@ -126,19 +124,16 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 					unsigned gpio)
 {
 	u32 val;
-	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
 
 	if (bank->gpio_unlock_count[bit] == 0) {
-		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+		guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
 		val &= ~BIT(bit);
 		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
-
-		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 	}
 
 	++bank->gpio_unlock_count[bit];
@@ -161,24 +156,21 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	/* this function only applies to output pin */
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
-		goto out;
+		return;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
 
 	val = readl(reg_base + reg_offset);
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
-
-out:
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -188,11 +180,11 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		reg_offset = GPIO_IN_STATUS(bank_id);
@@ -202,8 +194,6 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	/* read the GPIO bank status */
 	val = readl(reg_base + reg_offset);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	/* return the specified bit status */
 	return !!(val & BIT(bit));
 }
@@ -228,19 +218,17 @@ static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_IOTR_MASK;
 	val |= GPIO_GPCTR0_IOTR_CMD_INPUT;
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -252,11 +240,11 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_IOTR_MASK;
@@ -268,8 +256,6 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -289,7 +275,6 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
 	u32 val, res;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
@@ -312,7 +297,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	}
 
 	/* spin lock for read-modify-write of the GPIO register */
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_DBR_MASK;
@@ -327,8 +312,6 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -367,17 +350,15 @@ static void bcm_kona_gpio_irq_ack(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_STATUS(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_STATUS(bank_id));
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static void bcm_kona_gpio_irq_mask(struct irq_data *d)
@@ -388,19 +369,16 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_MASK(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_MASK(bank_id));
 	gpiochip_disable_irq(&kona_gpio->gpio_chip, gpio);
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
@@ -411,19 +389,16 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_MSKCLR(bank_id));
 	gpiochip_enable_irq(&kona_gpio->gpio_chip, gpio);
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -433,7 +408,6 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned gpio = d->hwirq;
 	u32 lvl_type;
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
@@ -459,15 +433,13 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_ITR_MASK;
 	val |= lvl_type << GPIO_GPCTR0_ITR_SHIFT;
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 

-- 
2.45.2

