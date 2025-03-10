Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5622687C
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610430; cv=none; b=A79IU362ZIqK5LDx2m7IVZPk1zHV4sv/kAdSmJNJVsKK2849OpAz+DDOGvXCopTgZcf4bdKm/hz0xBulz/ytE+aF79Jz8ichNBWm/2+ZLyUKee/GRYWTHSJL3TZV8XcoUZWHtpktTN8P4Fm/dSubnW4MFZsyiGG8RP7ecaEJQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610430; c=relaxed/simple;
	bh=/8NjX3rOzGTLQ756Q1j66Bv/y8E0Nf+JlzA4oIcsVvo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZbQR913J2PedaUHvhbqIr+HCdm/VkPOZbxOz8K/vEEyS8i1BlpLJrTWLMDjiGZCqnJ1+mp9hseoqdEte+74uMcB3/Y8gXSOEUSWkSeMe7jF054zSjC1bSKK+YktVzEoaZ8AJnvGL/2G5smlP1Nxv5GGppvYj5O2+r0hcRZ2vOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sYoKc/Ol; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sYoKc/Ol"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43948021a45so35466035e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610426; x=1742215226; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0SW/193dSmdJ4hIuDLKeGIYpk3++UwLKAQ2QPtDVJE=;
        b=sYoKc/OlgY4Rjlyad7mH1Njc4BFf4RpSoY5ZFCCooKmrVPIasSCiVJpDayfyclvZ6D
         YZLMwJ2J+Fe+ypEZ5jJiDwT2kcLWlQx4M1HnIYT5wmm+yNslsXAgLRv01H9m8+ek9imo
         6KYffALhCUW6zG+0/Rhv7iH0mF4HfgRrXDWU/OReN00odOvhKhLaMwsvUBfX/JX4qAEX
         JXdy/FKRUss52fGJ5XbAu1upfZRlOyv0WMi2MxEBCrClq7SPJXG2lTzCSoUpFw0RUo00
         IeIr4BTCfYjs3mD9erdQ8d44zHVL7/+2q137HC9pc860MaW15T7O5nva33aD5xu7n358
         bx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610426; x=1742215226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0SW/193dSmdJ4hIuDLKeGIYpk3++UwLKAQ2QPtDVJE=;
        b=Re4rmRtAWKuLbDQaik3I/brSbtTdHhD167bGuqGnHM6ZQP/i5vlOiUG1NtVt1Kg+JS
         Df80AhcLh4S1lDq280goMGUXmVcDvcIQKJ1OmycSfztlR5sXpayHqHgFbsWMF8aFU6YY
         a/FuADCPlOK1gGtSt/pDVDDc0XnMfyujlzr/y+BEDJeJMesVmHLaObt75iKjQZn49GE0
         8KEHIrzchcIgz/ewnPuKkkJ4SNR/+eowZfrMYd6CvtDWpiQ3NiKjAX03QfAxSZ5BNRpn
         jp+iogWl78ryd1H8a14Ps2pISXRexbX6o3lLk1cCUstZYc/kiR42jhb+x2xjZMTP3GKO
         z4tA==
X-Forwarded-Encrypted: i=1; AJvYcCWA1whlPwAmsFgeEmfh2I4b/msfctJeOz7aQQ8INuuZ16ptjPF1dGUyJajmRgSa1w/BvBILqbR2uDe+3yo0mZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC9fDVyEcZyiqkn23FedgFoXoLiWeA4M/TeuEigFNhXxJLzIAt
	S11UpmgYAi1l26C9cMFJ8K9KuYul1Ofexk1GmwiTEsvUIFiUWTt7+gFf5l//x+4=
X-Gm-Gg: ASbGncv7Etrec2ZQVA5oqDcy6prMVYLGFXUrau+4EqqCSGdcx67T2h9S+r3/o2T2L1a
	DQ3ZYw0nXn5LWRc9q7QI4KhCHyllOWcxb6JQtfHyhw5cf4a3kF+03BIBjls7IaInhl93MFzU027
	3WgVemoovP51TlPQ1KhaxR9+ngDZwf3yC9tAV86DlpfgVNUYu3OJjIALuIzXOtnMoqz4ECcwU4C
	EzgWhtT+MEn602FHivBH9Lg8HkFm9lA1OUYP8qrWjdtxIwuPN8CXw/BHSOjdbltOJPI061XkP/R
	xkqr7DSZ4meSuAWMVQBfMi6DLUDRN8d0p5TiOw==
X-Google-Smtp-Source: AGHT+IGvPu/1nOs92AdzRzoEoUE+KHkXYbFS1CNbXKzN17IWobEMq+YxPKwtrL34br0uOwNd+vwAKg==
X-Received: by 2002:a05:6000:18a3:b0:391:29f:4f70 with SMTP id ffacd0b85a97d-39132d308dcmr8761092f8f.3.1741610425580;
        Mon, 10 Mar 2025 05:40:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: more gpio_chip setter conversions
Date: Mon, 10 Mar 2025 13:40:14 +0100
Message-Id: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7dzmcC/x3MSwqAIBRG4a3EHXfBHha0lWgQ9lt3oqIRgbT3r
 OEZfCdTQhQkmqpMEZck8a5EU1dkjtXtYNlKU6tarbpG8R7Em0MCJ5xsvLsQP8O9wQg9bFZrS0W
 HCCv3f56X53kB7YYVe2kAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/8NjX3rOzGTLQ756Q1j66Bv/y8E0Nf+JlzA4oIcsVvo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt2xSm4P2dQUEH6/WXgLwh0Og3Dk1vWZ8fyc9
 3DxKuhoy8uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dsQAKCRARpy6gFHHX
 cu4DEACMU/mbub1Wl/BAjiWgnjjXiGBySayfhIbiMgAGkBuRBylXg8baXdUi0i2sV6iwqrGE9OI
 s6HWytFr0Toai6HD8p6ilSac1y+EANFTsA6dyxH0lmGfeZr3JEtUtPhcp7tPrqkXV9EQEZa13qa
 LOiKYFy+5ZAonelieCiU1V6gPkjvE3EefjjB/xtCgJtrXlC55s3e5eCNj/OZ/MsAeGNbsDF5GDR
 SoKvCr86OQkk5NcO3hJ0FUAeodmCwwAv7jOyPRCtgNLFYelkMXXD4elNoIkAvGkQFVd0GLSZ8gz
 DZPIHGl00Z3yc4ciDQ6a5eq1daOl2SjjXiIqOwKn+OTTuhuNHNv5u3BxGUF/58kgHQDfjvs8KU9
 EAHspWUutD4i2GQnQMP6aklZMkvLmR3kukhKE4NKUmw2YLm9T5C1Y4h/S92YhtYNJV6EDJk2Yqf
 VNnmDw2qQi+gsxBKpBgV8AQl2hOSJQd0Q+tPHpFqNccUWqmAlMplHA41zSVrRdGf3Ho+8OCO0RC
 VogMfrduLhGTtcvOEdVtWCkNHCJo9pHHKmY9nN4TcC5N1fqAyZJdpWv7TDCSnfBD647CtXn9WuL
 sgprAl0gX46CqLn65AdKb5Pbb18qBNjd6rzy//bZgue1kaepXWwTgDIx/tCvXy2xm95Vly5eTq1
 nq3itWNk4h69CVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This is another round of GPIO driver conversions to using the
int-returning value setter callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: bcm-kona: use lock guards
      gpio: bcm-kona: use new line value setter callbacks
      gpio: bd71815: use new line value setter callbacks
      gpio: bd71828: use new line value setter callbacks
      gpio: bd9571mwv: use new line value setter callbacks
      gpio: bt8xx: allow to build the module with COMPILE_TEST=y
      gpio: bt8xx: use lock guards
      gpio: bt8xx: use new line value setter callbacks
      gpio: cgbc: use new line value setter callbacks
      gpio: creg-snps: use new line value setter callbacks
      gpio: cros-ec: use new line value setter callbacks
      gpio: crystalcove: use new line value setter callbacks
      gpio: cs5535: use new line value setter callbacks
      gpio: da9052: use new line value setter callbacks
      gpio: da9055: use new line value setter callbacks

 drivers/gpio/Kconfig            |  2 +-
 drivers/gpio/gpio-bcm-kona.c    | 69 +++++++++++++----------------------------
 drivers/gpio/gpio-bd71815.c     | 15 ++++-----
 drivers/gpio/gpio-bd71828.c     | 15 ++++-----
 drivers/gpio/gpio-bd9571mwv.c   |  8 ++---
 drivers/gpio/gpio-bt8xx.c       | 48 ++++++++++------------------
 drivers/gpio/gpio-cgbc.c        | 24 ++++++++------
 drivers/gpio/gpio-creg-snps.c   | 10 +++---
 drivers/gpio/gpio-cros-ec.c     | 13 +++-----
 drivers/gpio/gpio-crystalcove.c | 12 +++----
 drivers/gpio/gpio-cs5535.c      |  6 ++--
 drivers/gpio/gpio-da9052.c      | 34 +++++++-------------
 drivers/gpio/gpio-da9055.c      | 14 +++------
 13 files changed, 107 insertions(+), 163 deletions(-)
---
base-commit: 21c853ad93097619c7966542e838c54c37f57c90
change-id: 20250310-gpiochip-set-conversion-4ce7e56df55f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

