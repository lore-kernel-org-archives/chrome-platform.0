Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8593C6A2B
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041927; cv=none; b=lEtuY8WiL5E3p3NgbcuTdEPWH+KrV98CSThHZe+pr1gKIGWCufcSa0SnKXaYeRv6Y1d7luQoXt9oyzikshHgufyofhu8ks/qrxo8vVH1Fu2BGwazdVYCs/VNfsE9xtL+4wYN4U0Iq+91XSjwJx/MvR+guzDhEsXe0CJFKCd/b8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041927; c=relaxed/simple;
	bh=wEIJJfBuuiW6SgTlxZD7EP4tAEv7nIycNrSYwH0kNGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzqQWOX4Buq9HoYaYVb3uo1N4sfrYqf1+6iixmuuxtoMdwDC6r9DEMpsARLKS+h7atnP+lbjM1Zs5F99Bdo3B+P0nigkMESfKlkRcwMRaTosHEMIK7qQpCTVtvfzQmqYqKudsIPjmEBrtGnMC5AhRg3BqtsnOJDYuGV84nV666E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=dkWE2p6o; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="dkWE2p6o"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6948d7ccfbbso415464eaf.1
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041921; x=1779646721; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=;
        b=dkWE2p6oS5w8JbcX4cvbWepPEPPkYTDXGA/+RMqSp4z0miSRPa/DNsvOHtyOOde2Fq
         ahIzKnPNdzlTEoYd5KBLiN6BKgyKZXHg/VaViFU4KV7qCefI5f0dTnj9PTD6N6yVxzaj
         8ze24HrMsTezPdpFEjy5ApUg7i3o9hyj3VLeBwfzA6Mj2G4Kc0yMKM5ITH9fn5PT8j6c
         JT+QpkqRP0xWG9mNRj0ucrL3aX5/no3TA1AzDwswpoA7jMtAzV92zLCMhN5lSTE/a+vi
         l9A+wXqT0Kim2l/wEF13w2x7Qs7mnzVWjmGQMHW85UiqvK/sL96OrzWhnsn3jQlyNX2K
         2g1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041921; x=1779646721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=;
        b=md/Hx9Z019588rXoaq2vJLT+a1h8C+kqncA4kMfb035vl1FknHhDpeuvZeCPy86QOE
         GD9LnaPYQMpNddCdCSULKXh70myTVafegKT08NkoSokSjPX1NtCrqP5ql0y1kG9qREHP
         8CoQP8dje84TWB5WidZi6FGhUsIZ5459hL4G0Wad8xush5DQvvqTwC2Gdq/tzIMAwe1X
         fOWIEHfROqlsk3E8VRCz4ycChaHVCUvEmfkxw9Qh0S6V6lrxNkusSSOJZHr6tl0CHbqX
         qSNALslh0DINlfINxybK5nq2e5LRnRUTYPMywsJyPG6Mmne2hr4e8Fx7Ht5nFO427WsP
         TIxw==
X-Forwarded-Encrypted: i=1; AFNElJ/m7X2detuwbsV72Vx/hUQxcRlqXM1OKQ2U1TUsJt6ZrGCTRIl5pQyDvvrRRS/WQ9//ogmaiMzcCR6QeUrVT0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyieN9O7fc+L9tvVkxO38YV1SvZc6J+QvNofOlbMlam5cujryqf
	PoIfUYAo5AYSabm30eIdcXqytu2CvYJPoUBswuwJMq9hrA7xh3pESpVCXVP5Vlt7p7o=
X-Gm-Gg: Acq92OH/XiE0eqEArjD3BfOfn2QF2u77ppryTQa4i43O80+jDPsSn4PLML+CsV1qXSO
	+XFtlLxk1d2PqAg3YD17oBzUZwmnwIRI5QDi6g7tFXmJVailOqC+QXHtH6dxKaeloT5Vsogea+/
	CTxosM49bVxdmvMpwOf/fE++AZH1KvF3le0x1drSYR0VxvuqSBIPUivOUemdRzml6ckoNeH5zth
	IAVWHs+vq+4sygRP/mf3CExq2KL+OIXSM4UgGQlz8XzC9rHJMlz//0kOBcpZy/KwGZfzEr0gH5h
	+3iY4x9hBZ7opKiVLMT9jyy9tXeP88ez52BtqNJEya+TPNV/FVt8jpDoCSN9SslgYasgQNHMbtt
	bmpai5dLf4uq7mq2bQ8RjP87NqHgM+0IqbGQdyr5WuGtQQK1I8N8tD6ldTtlFd87yStKA/AwHqe
	8fiK3XMiShIUc9P/VN3UCoC+0U4LQ=
X-Received: by 2002:a4a:ee08:0:b0:695:818c:e552 with SMTP id 006d021491bc7-69c9c05b9c9mr7284877eaf.55.1779041921012;
        Sun, 17 May 2026 11:18:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:25 -0500
Subject: [PATCH 8/8] iio: pressure: cros_ec_baro: simplify timestamp
 channel definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-8-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=wEIJJfBuuiW6SgTlxZD7EP4tAEv7nIycNrSYwH0kNGo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZl3bTfr9cKcWM0WeSP7fcRq1+d7XYc1F4Xo
 RfDj35AQXSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGZQAKCRDCzCAB/wGP
 wCfGB/4t+2/7CSmhBVt8beV0zuarKfbCi7dFgQWBJMcDXDyATSw1geVjvr3oVWj41/EraJRsc0P
 yP14hy3N7EI9S4MtFZO1OXirmeuqdzAruQ9YsX8BXEsAkb8yxjRm9aLhx1ODw/swqjMF0rO1+qL
 VG14aCHgmOlFOlZNgT1MirGmj7wCjcn0FMGLgKR6eCLrMrceSAwZNlPjf2YLbtjvaKCBZT29m9h
 /oqz7p7LzT5A5Ipa5T9JKMUP4Vv9pMZRknOKxy2FqV3G7JTWU9YJn+ZkV/sfs/QhIzaKfYuh3F2
 kIvTmBUeRS3JujorXrnp7PVwsJ9fsL/CjuCUrNco4EmKWYp6
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/cros_ec_baro.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..87eb9359928c 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -170,14 +170,8 @@ static int cros_ec_baro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Timestamp */
 	channel++;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_BARO_MAX_CHANNELS;

-- 
2.43.0

