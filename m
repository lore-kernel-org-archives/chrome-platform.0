Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557E94279F9
	for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893867; cv=none; b=CSb4gDnCuj+/FFmbI/iCjTzR3lE4nt/PqAvK/2ccYSKsKLYT8/a+/4C+TC8i9TuJ1EO0i00I5iT9VyPrf7tLCqSEah2gLM+c6xDtKS4rVLu94XpvuSkW7iyjsxNkJn09KGyecuxaKr/AN5KeKCIwJPrP4JHdUUXYmUM7WUGN3tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893867; c=relaxed/simple;
	bh=oDODHMUoLpDU7iZfBhWstcjShA2kx7eASZvf6nRJz28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VzRSTlSTs88PxfryCIOj1vdxY0I8UGRgeUEoJpC2p52Fnebi3b2zen76VIIkM5FQHQRka8Kagbdu5TIQpLDb/Y0p9VL5lYn9/bWTSHTvxe90R9T441qKx3b62Ecewcq+d+wDnv/HQRQv28jMSc2Dg/U66HrqPpBlUjs89QnVhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QAHtbNpb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QAHtbNpb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso102154785e9.2
        for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779893863; x=1780498663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vS1V6wFacA53GGyfnOVFyw9GSa+e1cL9vb2RCcSv0ng=;
        b=QAHtbNpbzEhymQqvCHf9kEF7BQf8lZyDWOCV11MNFwSOQVAfGOC+4GcguP7x2KHIRK
         ZiBpydhd0jjtbNqrdEW/zt9TV9FKXtgb4Z8cKBAAMARasFqdMJBWSVQ9oqPXZwM7gR1N
         49LqhjMMjXOD2T3iljdKL+flaWpSJjZj1EIojx5D6XHslArdq2YrO8TfT3cB3MvFbTlO
         0JNZL+USjw4Gmoqdv7t+wH4nIfc7TNQ/bN+P3ZwI2BetOtMoZLHdpN7z3pMRxoaDiJRH
         39TC/qanOmOrzRBVq0R8nPslqX6FVSiNx3pFljyoqeFz4efi2To7iJ8zPeZTfLyRun4V
         ZPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893863; x=1780498663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS1V6wFacA53GGyfnOVFyw9GSa+e1cL9vb2RCcSv0ng=;
        b=Qb/y21ckTComRf/w/3PLM/Q2UW9q0jn33i+tYS0cN4TO2GFlXhj/nwMX4fsQJWli3z
         T1K8dplMJHK65Kh+cRTGtpo5PbRanrGFwttjuh7wAX0B89ErE4FnwYgcGGrliXf9y2K/
         L1cyrv5fc41zRY/wAotq5x84v+TwVQWYUxtOK1D+aXMIlVHT7nByh2USpTiUMuIA618s
         n2dNm8QsO+bwfxqwa7xRKl+M+tRSK21WF0LUFDTwl+9cso0et7H3Jz2pMK9NOxCBFh9e
         ZXvhYqJKYRIOoP/47sFgrYDP0Dm4+Y3nhPR+lcvgb9cJY9pYgEtChd+tdJxzqSJvTt0Z
         NL7g==
X-Forwarded-Encrypted: i=1; AFNElJ9WTOufokNRDBkTW0O+qitYfhyn5Tr0v+s58LRFiGkohyBnSk77aFcSWCyPVLxkLnYlCTLJQCec9ZA/HsB7SuI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Gy3b5N/IOVu7q4SJBkAUz/m0scYrU7pNS/LWDObJ9EJXlPw7
	AWJLkm0BBRXPPzwDPNgXt3VfMQcJHvDtEy0edrloe97w+EZ9/96CWgZCG0gqbLGXvRs=
X-Gm-Gg: Acq92OEqWXC/eBL/jb04ZUWQ3hr2B+rnswS3qoswoi+6TKCB8yUScG2gioRH/tmd2pm
	4nSOHAl0HpWVdqaAIAU1N0eTggUXoyiqp7fpxrBkMnzAWIvgB6DrESpe5BC6M4YwAonKuUq3miL
	IAuxzCjYzT31IrMFWWmkNIUxIeWj1k44v7w7tY+u/11UdojwoawoedWKAKrB7VaaPHzev0WfLKI
	oTZUDsX8HWYf3z43hOlgsBLb73R+SNuj58861YtCJCT31btDnfqb/gya4ZhnPt2bhe3El9CMzeu
	Z1/qOq2EP3FZ+tBmHCNGRgFkO814ruwDPeG7IRRb97/jM0O3ccFigJ0ciijFOR+KtvgnNpbTZwR
	+ifS0LNH8OEUMXrSAxCE7ZvyeRsR5tnuRhXel7Ik7iAUyd8XGXlicrtTfZMRqcfejd2ymCyUUjY
	gE+LSO8nbfEhyEPSDpRPGD9mdWKZeDnj5VEFRcqe4Dl3cH0zWi0e9hbR1ZedjB6ZbWVU0LyyKif
	0Z9eMqaeiuVkLM=
X-Received: by 2002:a05:600c:8b84:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-490546689a7mr366033115e9.1.1779893862724;
        Wed, 27 May 2026 07:57:42 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490838f7f35sm30535645e9.1.2026.05.27.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:57:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-pwm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 0/3] gpio: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 16:57:26 +0200
Message-ID: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4144; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=oDODHMUoLpDU7iZfBhWstcjShA2kx7eASZvf6nRJz28=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwZXDKwsOjAsKUzLboec5og9VLoE+o2c00gUz UH6kdhEIFSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcGVwAKCRCPgPtYfRL+ TurWCACGVYbAn82eGpMPsanfyUS8JzwWXl0rIeWEgrdLqqdUkJHpswWdfqJjO8lhMS4iGBnyezq khvw4AJ/eD9YytnLbc+K71CagOVNrJcLWnQZFwmW4MRU1g8nyD7jskSqLUvinwNI7rm42JYZCXL XvQks/gI/EsLB4GXIIiJRW71/FmFZOq+3Q3Apa2Q0amRj9TXVDKMPmX6gpZaKIQA4i0Q4eMupu+ ao8oowaqpXDmq5aUoDZH3WBd5LclJ7rNtHPV+QNDeuU1aqnr1p3tRkqbimiN7ZCVnf6J3MQBiaJ +d0T79KmDEPQiN0SEJ1b9k+z17HNHxh71Ah1pva+IxvJq1LN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
	index 5d61053e0596..03bc8e859d73 100644
	--- a/drivers/gpio/gpio-pxa.c
	+++ b/drivers/gpio/gpio-pxa.c
	@@ -534,7 +534,7 @@ static struct irq_chip pxa_muxed_gpio_chip = {
	 static int pxa_gpio_nums(struct platform_device *pdev)
	 {
		const struct platform_device_id *id = platform_get_device_id(pdev);
	-	struct pxa_gpio_id *pxa_id = (struct pxa_gpio_id *)id->driver_data;
	+	struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
		int count = 0;
	 
		switch (pxa_id->type) {
	@@ -708,14 +708,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
	 }
	 
	 static const struct platform_device_id gpio_id_table[] = {
	-	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
	-	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
	-	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
	-	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
	-	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
	-	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
	-	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
	-	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
	+	{ .name = "pxa25x-gpio",	.driver_data_ptr = &pxa25x_id },
	+	{ .name = "pxa26x-gpio",	.driver_data_ptr = &pxa26x_id },
	+	{ .name = "pxa27x-gpio",	.driver_data_ptr = &pxa27x_id },
	+	{ .name = "pxa3xx-gpio",	.driver_data_ptr = &pxa3xx_id },
	+	{ .name = "pxa93x-gpio",	.driver_data_ptr = &pxa93x_id },
	+	{ .name = "mmp-gpio",		.driver_data_ptr = &mmp_id },
	+	{ .name = "mmp2-gpio",		.driver_data_ptr = &mmp2_id },
	+	{ .name = "pxa1928-gpio",	.driver_data_ptr = &pxa1928_id },
		{ }
	 };
 
increasing readability due to less casting. Also this results in the
compiler warning:

	drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_nums’:
	drivers/gpio/gpio-pxa.c:537:38: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
	  537 |         struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
	      |                                      ^~

which is a good thing as adding the needed const to fix this warning
improves type safety.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  gpio: cros-ec: Drop unused assignment of platform_device_id driver
    data
  gpio: Use named initializers for platform_device_id arrays
  gpio: max77620: Unify usage of space and comma in platform_device_id
    array

 drivers/gpio/gpio-adp5585.c   |  4 ++--
 drivers/gpio/gpio-bd72720.c   |  4 ++--
 drivers/gpio/gpio-bd9571mwv.c |  4 ++--
 drivers/gpio/gpio-cros-ec.c   |  4 ++--
 drivers/gpio/gpio-lp873x.c    |  2 +-
 drivers/gpio/gpio-lp87565.c   |  2 +-
 drivers/gpio/gpio-max77620.c  |  2 +-
 drivers/gpio/gpio-max77759.c  |  2 +-
 drivers/gpio/gpio-pxa.c       | 18 +++++++++---------
 drivers/gpio/gpio-tps65086.c  |  2 +-
 drivers/gpio/gpio-tps65218.c  |  2 +-
 drivers/gpio/gpio-tps65219.c  |  4 ++--
 drivers/gpio/gpio-tps65912.c  |  2 +-
 drivers/gpio/gpio-ts5500.c    |  8 ++++----
 14 files changed, 30 insertions(+), 30 deletions(-)

base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

