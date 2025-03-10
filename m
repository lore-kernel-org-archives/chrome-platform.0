Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78F22A4FA
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610438; cv=none; b=rwytDbDl+pIi1ApdLWu/R48rgT3MVz0zY5wY/B+q5T325JuH1KXi7/31nd2awQEK6NBRmSIM5VB4I2rPcME2Pk7wyw+zO25UB3JndmYK13oyck9G96hzmieLLbFjcr/aGCW7qG5dkcsGGB8RykrQohq+snMbTLndsnRzVxK2bxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610438; c=relaxed/simple;
	bh=QWtxoXhKF2oycxErr3xHOOEyp3cijfG+PmUvCY0z4cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XV1UBghkwAchDjVmbU9vCwkUICJvRGiEhIS3XXovcspap87Lr6FMjs5JExHUXv7cFBpw+T0RcwWrZVOH4JKNwW5Ftf284vgZ59ckkKv2mzlsOATh7LrFCpVM0XHOArrf0VYvZpiibNE4ADFJk7phQC116P9FCo4uWwa4pCsR+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WKm7MxF3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WKm7MxF3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1972354f8f.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610434; x=1742215234; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9ypBApPZis9ZEd14nlPhR/yx9DAIJjYqHgRrYtwPs8=;
        b=WKm7MxF3NNoFG148t/Ok783Tu/W0jIPpKT613hAxxk6uwai99h5J7BO/tzSdROsAJd
         5AYKHZebXzPYehbv4pVRbg5f229vzxcUu6Fme3kfo5NgrxGrQFSxOULnvSDH+HLgZscv
         9XKzakIGhZC8qpYH4Gpvwl5m/o16/hWGqvPnop4P6niN9KR431UVUov8lhbw8TU34WKF
         KyGIJTcDiFytnbUgbh4CMvxxtUIKohm1W5fsX0w6gRL9mqk+M04MWZaFI3IHuV/hBfZt
         pZmdDjS+qnKhS/STK8X51pFCwpzEmt1jY3RqQ6yWqYqDAKy+iP0cIsARBO4peTs3rrli
         c35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610434; x=1742215234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9ypBApPZis9ZEd14nlPhR/yx9DAIJjYqHgRrYtwPs8=;
        b=pGBoa0YUqzcrpGuflq+WgsRdNXotYaiDtytyYsCIGkMdzC+ioT+mk3IyiEUDfKmJLN
         vf6XpNfw49B5xHDiCfefdRMA5tcuxswIqM2F4z84Ic2kWBtjHA0HZmXgFdAlwW2mf6kw
         0+Qzu6bp7DTyO0jV1/voev9w1PkdGrU5QlTk1Jz9feO37VLc0dox3J5WzapVoUbrt6sk
         wk51Pp/qGpxykFc7Q1U6p1c5TwcZjrNGsAeG9CToQS5WawHpDBC79f5FjQZSelxWx4kZ
         FzF5NmIqlt7yJd9KJlhm/vd5LtoZEYuHC8uSYYjuHTnRvvMPnguxWBbNerrYtF1/vgin
         UfFA==
X-Forwarded-Encrypted: i=1; AJvYcCUTZN6XL2IG8Rexw2xHRX1I9pTYEaBH3oQGEZnRHlYQf94BknWxaw85FezgHONsZGa+kc4KeLDbWoPh3dDAQ4k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRI59Or79qo7FsetCbBM1gFdRcm3vIuO66mztz5yMX0bj83VRS
	1a/7cXWf18RcLd22oC0r56SF9/mN1Li3bXn1XUujIK6gf/SoHMXRs0gX/GAdsSo=
X-Gm-Gg: ASbGncvzJazadsrJIEfprdw+7kHwZwpRinzW3RTeHCbFw4fSUS4c6iBKcC3buA/mNpS
	b31IChrcVSi1bS6aRmN4cuBjL6jwlvfVFgA3IHAoGVdIyyIgAc2gXYBZqP18byjzpM1x9h8KlcA
	jXar9AI9R0/9Ku1hFcnEO5GiIsOfXnG5JbaG2cxCo70NGzD7u2Y5v6j9QzBpd8rEHVvHHVwU5yy
	7DAtCRQN7XKcmpizaGOdXq4JgYsbNaLJBxbGgnXYxJe401yk4QCRMCeoMi29Sb76V7XKbJcDEPg
	vF6lINJIkwpWtCrkpcpXU4vlbo4DDE2S9hbxmw==
X-Google-Smtp-Source: AGHT+IGK0qUS6C3S2XE8X9yVB4lBi7PGkNGx1BRbWu1kP+2lHLgfZ+futRVICmhbqbk83Y2sD+IhWA==
X-Received: by 2002:a5d:5e10:0:b0:391:122c:8ab with SMTP id ffacd0b85a97d-39132d5f36emr6128432f8f.22.1741610434533;
        Mon, 10 Mar 2025 05:40:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:22 +0100
Subject: [PATCH 08/15] gpio: bt8xx: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-8-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qwBsS2oKTY2IIbpNdpv6Gx5gpfJN7LtePKR45ZXxPg4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt22EtYKirSRGcB31ylFtPB3vvoA0QXPEG5nv
 rj0EcgL1JiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 cnT6EAC5zz0cx8z5RrK3ooghI1WDunxYkmwW9P2rIO7r+GyDrLstokK7xaABeZP0ZBfcaAONhGz
 AcO0t6+UBC/Bq6IHmCdyZ/5wgHF2KRdOuJdOu7ygxtSsM60Evg3tbBejarC8ljYSC4gjY0m+xbX
 LdVsqI/6R48060rtcT1/DX08HWXAkCRYDeBsxakx5v//qgriYyJgwbFhEyRgoHET/7TZcNjOP6k
 ykLLjX1rVHACxhDu4nRw7fnZHaJKl9K3PTwkO8XSDVcMfRDurWfWpgGWlx9g0MvYNyacRdGqR+P
 nPPPlnVJ/eTJix2tMXqcy8ahYxrAq4cOuMOuO3vWSk4bxTqXJenEQAy7Vn7gXzRx8neLk+D2wV6
 o07QqY9nfNGgVhH8YFWJz5LpMc0ENrpQcKDa8nYSKwE/boIsxU4qS0uewl0T4G8MPKo+5SjJ0dp
 qpOX77cgq21vtLV2qZjJfDQQw9oVOoWOz8CWtACKfY/2drz9dcugdlnZqfkVh8yna1Dt509EKP5
 rJ4C+5xTwustIw/5wf5RIStc09w1Ji+nacMH1Gk4MBLFwYdiksb59Y4euyDPFGNkplslgA9WIus
 jb8TilDBngFBgftOF+UuGnOKTAeMZYvSvBGBpY6rG6uFuooDIcQwbLBh3lZqKUwMa2sFF5kKCoJ
 Qkv/UnEdhmAFe9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bt8xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 173da7bbfc98..7c9e81fea37a 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -119,8 +119,7 @@ static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 	return 0;
 }
 
-static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
-			    unsigned nr, int val)
+static int bt8xxgpio_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	u32 data;
@@ -133,6 +132,8 @@ static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
 	else
 		data &= ~(1 << nr);
 	bgwrite(data, BT848_GPIO_DATA);
+
+	return 0;
 }
 
 static void bt8xxgpio_gpio_setup(struct bt8xxgpio *bg)
@@ -144,7 +145,7 @@ static void bt8xxgpio_gpio_setup(struct bt8xxgpio *bg)
 	c->direction_input = bt8xxgpio_gpio_direction_input;
 	c->get = bt8xxgpio_gpio_get;
 	c->direction_output = bt8xxgpio_gpio_direction_output;
-	c->set = bt8xxgpio_gpio_set;
+	c->set_rv = bt8xxgpio_gpio_set;
 	c->dbg_show = NULL;
 	c->base = modparam_gpiobase;
 	c->ngpio = BT8XXGPIO_NR_GPIOS;

-- 
2.45.2

