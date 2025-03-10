Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C68226D1A
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610432; cv=none; b=E35VmdR07PRNbEd7cVWtZfMuA1RW5QNc8+Jkucasyb95xdKM3qGkDDNapnzNr7wkb9AHyY2+9tZVG949xxAEYtdwKxmPBzG7lU9yyDLvcFzSEFRdyeYQF5W07WsvWDKwOsw9luJY1MRGM6T+i0aFSnhEGBONWmooctgXNUaqA0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610432; c=relaxed/simple;
	bh=br0qgCwXR6IILS/HJMnJoxXyosKeHcCMyBKnZ2REJ5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1DCo5NrgcOFfj+BX/YF0SMWB+19aVMZt8OpJWMeoGHityJvC8v46goyE5MxNqU4vIkkEs4WLttBRE/kQSl8qBkjjjyzMQ9dOoWkdiWWjteF43tbvgKxSl9YQJvWkbSFFoBu1UjNSigVzEbzeMncDRYbqgVRaDVVO5xZkyhV3uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NjMWGnbl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NjMWGnbl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso11347285e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610429; x=1742215229; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExDJc9PeCSc2zmT6lc+tq6m+jvUQwjNZ5eNvB72f2YY=;
        b=NjMWGnblVAf8MYqPT7bxB3I18w05DVgpSeJnxgIJ5wErBTDh1D4tgI8+jirSE5TC/s
         lqPMALyI3ObhrQB9jQxhy1/siODJ26njNNtUxbShqoBXP0Wzo9ySAAmgJCHOyIlJI58W
         eK4plpbgsZsl6I5msA88Ao8AZVGWMWDEAOM6zg6z3LrHdpSFiQk8+tv7kVhDNW6MyBgp
         AnhbS2rJcckNP5IYb9WBQU/Xi+MywEYtC9encGW3LNZuVfcbX92agFswLHsOGBuc/Q32
         ISExdZFAtd6QHmWlULyA2wvMJnmzwgmDqekqBpI+JOMcRQ+B0cSDhFuIvPjhqIStDIvU
         yJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610429; x=1742215229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExDJc9PeCSc2zmT6lc+tq6m+jvUQwjNZ5eNvB72f2YY=;
        b=PvB+02BNzK6zQDgzutHhGPakcxk7kDlRgTAG0g8MmY+q02aIquT/TS4Nr7zpSR41N0
         6TiRA6VA758V7AWXm/0lw0wysFFWbc6CEPE7PfEU1xdlee13vNHPvAFIF+jIHKhDlAMZ
         5mkdYfvAW4LxUQEt4nAsbDS9YRYsiJKaMmAeri6Qt3nVr44IoSpoanyB8JgWZUxqVaDZ
         FQ49b/2r5rEFr10sFR8gUrSmtroI8V4DRT1BmIYqDm4f2To9GYVGFN8qqObP8fZD+kcz
         WJ7z0HwBRytAE68WBeiz4q0+SP2cJBd/7CjK511zt3Lu9IZKy8+Fxpo+1VN2vF3NDV0i
         m/TA==
X-Forwarded-Encrypted: i=1; AJvYcCVItcFeX0Ixh3xjolIyF0I9thGFncMHqwmpXTU+z89wizi6C9IU3+D0EVg20cuHIgPITVWb4tPPYT9id32Hf4U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw44IadRYmBwN1xsdBTYowyQc0i2nJweWcUWr7kkEpkejEyBBtE
	x5Mq0BEUJYvtb+qXOOePmcpXijVZAmNdj8Lua7dqCUXNdO+klBZ9cJJd6Ba4EVY=
X-Gm-Gg: ASbGncstC42t+Z2Da7r+187i7D8cAljY+rgl6F3mml6xrjhpXyHavNDyf0IEhrTo9cz
	uZ0MMLLsoYtPVgdiEWO+xeT54FVUhZnDe9RnjoHUkQQs76HULlLddRYZryyTTmQhLxucQyRfK6R
	ukdYHa1p/rbe/ffxzkYq6loR1huIKTe/qFRzKg3fujs0HM34tixS6JShZeV2hC/NUVVSHinhjif
	x8U2mgII+GV/BM/14T+CcbGbkMkI/q2vdiWfzRNCfEfdpMNABy+izYaeQFlGxMfyIKSrdidiARk
	MBwn8RLU6DBktkqcf9jHs81vVjd6DZHzl5vEvyovb1+NKOTY
X-Google-Smtp-Source: AGHT+IFR4eU8W3pLo7eGZme/v2IPUi8jYvj7XNPiJwIbpKFova8nZ7EiLJqrg7eufMPKCGOAKDZk6Q==
X-Received: by 2002:a05:600c:3411:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43ce8a50bcfmr55669035e9.16.1741610428892;
        Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:17 +0100
Subject: [PATCH 03/15] gpio: bd71815: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-3-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6eI9oSEZvQ/zRQ9ewG5oMx4x49O1IBi4OsEUA4Kgf+A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt21t5hg45JOHH4FIQC8J2+lEXuZA+Eo1vWQx
 d7HdKIRoXiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtQAKCRARpy6gFHHX
 cjyGD/0SGk000FmhJu2Sr6c1Cl9SGsiT2TcHqvF8b8i+n0CVrJ5B3pRnyj2DXREnxyRGCrbyhdm
 DcBI/oty8LNJzRcjkVoZBhikYQACHOVwlQYKr+GeX8vGSyAQ+4tCMtu3Bpoqo3lLqq6NY0Cwvyv
 w3X0l0mIFjjCcqEHUhqAImv1/mQEa/kJlU4FT2E6vm1q2/YkhlMJQsQMbVXHY55eu/pVt3wAY7R
 /j/tEAbkjIPVTg5WqmjQUCD+M+4m6qG1E+Ike1bmFBz+LnLhHMzo4tLKPSc6CAxKQASkLBeWXeq
 AZGJuKNwBjV7BN3goJZXXpSVTugCcxaIA2aAghnJFbW73kYWSOGtRRaUIoP4JamtEj6PnNvwEqu
 eNTyMvYRx5AJoqcZIuK8H0X72khuVADHxwB90dObjOBFrQNXmjxc9lVDhcrGjdEoaMDLefa0m2E
 fnM2TdI5IhfI9mjcwIV7XVtlj0UpDBbqRt4ICb+kZclM9ezI0sl9d9MRvRQ4yvarBAyzNpuh5iP
 WJgkdZFlzHQzvlH5/zyVbtVj6fhF8iGV/BYVD+m2En4UHERaTpmYiKXKCKk240LGxUV2spZY3qR
 Oy3L+kB6vnM7MTvQYIWn3HStDtNQlc0gxQchDSn4+4sHsFN5BpMguhDL/i4oclpLN/HaAFDMn/S
 XDIX5SDT+taWgng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bd71815.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
index 08ff2857256f..36701500925e 100644
--- a/drivers/gpio/gpio-bd71815.c
+++ b/drivers/gpio/gpio-bd71815.c
@@ -37,21 +37,18 @@ static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
 	return (val >> offset) & 1;
 }
 
-static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
-	int ret, bit;
+	int bit;
 
 	bit = BIT(offset);
 
 	if (value)
-		ret = regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
-	else
-		ret = regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
+		return regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
 
-	if (ret)
-		dev_warn(bd71815->dev, "failed to toggle GPO\n");
+	return regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
 }
 
 static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -88,7 +85,7 @@ static const struct gpio_chip bd71815gpo_chip = {
 	.owner			= THIS_MODULE,
 	.get			= bd71815gpo_get,
 	.get_direction		= bd71815gpo_direction_get,
-	.set			= bd71815gpo_set,
+	.set_rv			= bd71815gpo_set,
 	.set_config		= bd71815_gpio_set_config,
 	.can_sleep		= true,
 };

-- 
2.45.2

