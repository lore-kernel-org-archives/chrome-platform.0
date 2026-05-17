Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838449659
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041911; cv=none; b=Q93TwNPnju+heng4l1mqgdFF2PrqOUO5oWUHaDcM3Lcbm8S5eWcbc08Q+926k5YmpYfhg1yvWrRG1N4NslhwpIkJh8FyKITxKyUuQU3Zs8WoDniU5uDKe6D9yU0jsYSUY8x/5NpaAb48fo3Rdrrp0SBFyfTZ0zhJRWj1ai9jPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041911; c=relaxed/simple;
	bh=BwNLo5FYKl87iXnoZu+CcTxTzv1iNen3r6e4SjxMA7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UF0qYR38Gn5URxBZ+4gn1X9KS5nI/Agj9zC+qlRX7nuEzevyefCOiB+zfPgVJnGjvScIQloPm7C36HcvBbnico7p9xaYFVZP3zx2fPzDLCJJnmh6ygi1H51pPDxVthcwXHpgb/3lCERYtX4VB5ENN+7fGu0AerG3qKXuJ6RkvpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=K/An50Ki; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="K/An50Ki"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-40974bf7781so2378143fac.0
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041907; x=1779646707; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=;
        b=K/An50KiANzVCLdDG9RMyPJ+9nOlBHQprv9hjvMQNBH9B6gQBgVDS8y8hmTc+Kf82N
         CweLPNY4NJuEiZo5iwNE9u1mTzUdj9imeCt7je0OF9lcxLvYMQ7FKV+ro+nH9nhdGzOK
         wk2J9Pk77cW/ttJxrjMiF3H1VP6u0lELVLLVLgcq6yrYbO6tGzgWh+pSW89/7H0UmHP+
         9jITsPwzPtT1e6xbdH26E9NvVg8U0kANldeKRtjeXrH6+3ed5whdZRfyqzhITqesdoQk
         oh22Afi0KCL+lcD+06bZP73M335L19IQ8ktDWjRrZJRPA2rBsUwNYd2xpDgXKBBUvjDb
         SqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041907; x=1779646707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=;
        b=O3aoZxiekmBLo4IVr4rDXhwqpASl0m2Pk8NLYM6bwuPutPz12UV3YOpzw8zhjmdHuX
         MHqvS0WmNI9t/jF4TXacBkYTylLE5ykpXj+QkS444WFraJeMvAz8gF4El2w9H3v7dNVL
         58em8JenqWlYz7WyNuETC3LHcCB9LORMm1EUjoFUPh/YI6+Aevt0ptjDI6DIe7felWTr
         3v5ksdm+UfMcmaCz4MHCrejQN8bRCA19BCT0IVK5LtNokvPiLFNBrZS/z4VKl6gpYuYW
         DMYWdIgqFITVg9l7mhZj8XFucQRP04hMx1ytZwqWA6yzJKmFVeftJHTlX1+1z5tISLHW
         H7GQ==
X-Forwarded-Encrypted: i=1; AFNElJ85xYAVZ/ijD0OIpFo/yWdN3i3uoVSmSYrTuIP6gvmUui11OqLVvpr0k0vMSErB+j3qIUEjaOq5tsSZX7QFu84=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFOwu5ynQAegCoKkAbHsODdFGFRyN3hYYSv4oM4qwmw+euUIMn
	bKXuWiU/1XgqGrCTv+jq1wRXMMUxoSI9izqubcwtgTVYtbW3+lmhPiJ/pdtIznhve9I=
X-Gm-Gg: Acq92OGTarRgwewsYNk6Ju7JSAjpTZ07Y1T6wAfkv3zoJ4ylwE1kfYqxL2zSQ9h9cWw
	wYE9VtzURXY3Nz6dCBCSLuQeJvRXR585+IVUECLTVklMUGOq7g4Mu1hPCZyeQyk27Ud9K7icnsb
	e9W5StKZeX9YFUhAo0ZudhBwXgN4Pi4e/+8hXWFa/HKko3261bZzuoanukLZMQxA84zK+SW5c3L
	xty65Hx9nxbNrgV4VKnWssLW5zlfdloVpbvrLtjBv2F4fkCpfg4Y1aRoJs/cba6K5pY9OgbRqq4
	PTfjtZB9Cdl2FaKOfl9cY6Qp6Z2UsxN56jbZja61NxTqolWlyWbdb37rtIUt/DtDYcuBS2SjGOm
	8Nwoo8BzdA+x8fX6Xk4xGq2hEJp59Ki6h4Bbu47AlHZjUOUtnBjU6yBpJDCbCcAL2hR0pSAfYgX
	k2l6sPlbD879VXzhrucvB6Bilxqflj+91pa3iE2g==
X-Received: by 2002:a05:6870:1797:b0:435:486c:f2fc with SMTP id 586e51a60fabf-439f94bfe19mr8687343fac.18.1779041907408;
        Sun, 17 May 2026 11:18:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:26 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:19 -0500
Subject: [PATCH 2/8] iio: adc: dln2-adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-2-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=BwNLo5FYKl87iXnoZu+CcTxTzv1iNen3r6e4SjxMA7s=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgY8TJDJ6Ft/FcVQ5VpLbl7I3sreJsrciaZuR
 YcR8uAF1CeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGPAAKCRDCzCAB/wGP
 wOqBCACLIOEEYmguYfD2EXtVfXwCV+RMMhWS2cj5j6FCUGhFAIT3c6jLdr4I9QvxORRNbgHFE+u
 8irHHh2DH8okhGX6jVbG4CmXaHnJQcresATqKmSXGuI/Y5g3mOXB69I/wgkefbvup1uazdswGAW
 GrFSQL0eYVZyNMZMWJn26wexmzWpk4waVuT6s87rOiIC1MGPCIRk7NO3le4sj8d9E2CWCjbycgf
 xq+7BVUqhUVWXYT2gbdFFdHRY2mFqcvldot7KGVW+0OrVUJd9I2oXmxfZ03O1XH5KNKNWA5CGgo
 BnO79x5kMgSBG1qUGXnvKcYFIOAi3JCqJz0ljFkZHqE2o7tV
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..b7250fbe4fae 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -444,16 +444,6 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.scan_type.endianness = IIO_LE;				\
 }
 
-/* Assignment version of IIO_CHAN_SOFT_TIMESTAMP */
-#define IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(lval, _si) {	\
-	lval.type = IIO_TIMESTAMP;			\
-	lval.channel = -1;				\
-	lval.scan_index = _si;				\
-	lval.scan_type.sign = 's';			\
-	lval.scan_type.realbits = 64;			\
-	lval.scan_type.storagebits = 64;		\
-}
-
 static const struct iio_info dln2_adc_info = {
 	.read_raw = dln2_adc_read_raw,
 	.write_raw = dln2_adc_write_raw,
@@ -614,7 +604,7 @@ static int dln2_adc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chans; ++i)
 		DLN2_ADC_CHAN(dln2->iio_channels[i], i)
-	IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(dln2->iio_channels[i], i);
+	dln2->iio_channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->name = DLN2_ADC_MOD_NAME;
 	indio_dev->info = &dln2_adc_info;

-- 
2.43.0

