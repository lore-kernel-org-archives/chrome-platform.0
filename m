Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5BC3CCFAF
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041911; cv=none; b=aaQzMSNttadCc/fgosugClieGySDyh4WsLS8wIBF6dLy1XBUUk8vMX8QWpqTvx7Ozt8jodQPrHlc3RtTkaoOIbIyFoiTBXpPZwtyaLgsbB+L51YW+PKaAoCcU1Prm3oABSXsiIoP7zJBX0CVwjG034Z5eRin0wJCsRibQvbR9fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041911; c=relaxed/simple;
	bh=C48Abd8eNikDaFfFId0eSCBHL6bq+0x5TvEL5GoFu8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbLXswkRiX2c1DI5KFRhDX0m+Goy/w/8iQAUe9vnqVFmfDwNLia4WsWZPw4iYBvV5JXlxVckC77dhr0c6c0FsTDGxvoY3gUvTwaaD68hA3BXRGJCv4pZETwEYraKOhpsveUCJrdeuxmUN8lPG2Zlu8fmwd0czf6Wcach0zT/C2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xBcrOkPx; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xBcrOkPx"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-69b8c270821so757679eaf.1
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041908; x=1779646708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=;
        b=xBcrOkPxZMA3QZfo/osSiyYJi5lVtrGmio4lYPYtEuo/0cGHJV6RbOEvgAk4pJ4sps
         kulnxRgDpMoReElvZLoH0mtl2TgfJIo80SmrFssP3zBXIyR7ZyDawqz9u4UMth5aXtud
         W0sZ12EFpxuHD/+uJLL3vB63WQfXMQMvXJbT9zLESF1vQPUE8UOzNeJ8CmeGCfqmnV5N
         XEjwg+yJNWFkLQQzm2aOO+2kq/s23YkC06/NV6HhQOvJBEa6x066LALoTi61oxWKytuM
         XmwVOpxyhluG+r+Vr9MPOk2msYyscR3RVoeqJtnXY8Tk81jghpPY5waT1ZpAlFJus1h2
         23gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041908; x=1779646708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=;
        b=sF1RyVdZ+nXgwdNsUbO+/r3454ZCu4+Ru1P2ESqRGlfbF6QipRXcMGS2bZWEn7Nft+
         5Yohi+tO03ag7OsEn7l/JJ6hhj4P0+MLWWMyu8ipCf5nommTYrmzjX+M3kMYpBuWIY3P
         GdhHDXJNgCpOpf0KmiPdaYTIkEjRvaRQqlRIisg+2rvS3Z5zggcIX3SBNdvuL+u4Jxno
         JwL4DB8OMVr/EqoYjwArdGK76WBlBexx+r0nsYWtbgWL6EtFMySvbpeTpjwgTlhwRydL
         Ijl8cIC4hnGXDW5MRcG7JRRxegjuTKLV8p+uoa2w2I7vy9YP52ioYKo7um8dJS6qBHaY
         WpOg==
X-Forwarded-Encrypted: i=1; AFNElJ9SNmIQo8dW+CAqkqVv/ro+0hYsTKnM6l/KQXU3VfQVfqn9+JizpASxvcPbGM0GowIXRvSpfybafGPoiyZuqvs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOhPN49jia6HX/vDwh61LpvCpKoBBlU3awGspN+apEcWcX/Ydf
	AxrREpA+C+KteS98uJPYQZXAmXGUINOYHV/7HkMOtIY0VLvUc+mRxh/9mv9SVdljpu0=
X-Gm-Gg: Acq92OHLOGQwKBaMRZ5v8NTDo/JNx0q3O2tobUhhC59EoLi8Oy4z/LepSzWi9VH9hXj
	oieqfuM2ELtJ433MIXh/9h5/TNnW+xBkHRogT8YiwNKNjJGccVzKjucbQ3zc+3d6aSOj+lLU0s5
	a+8IOmz/utWATLI8uo3CmkZ2ztttmqM+dbDYdob0wJ6TX/QRpBHiEjuNaXe65lu3C2IBkU2DObe
	0/P5CprlrqvAPh4S7o01JzEQ58aD3cJmTkxNIKkPVMnNG2h/QWpgj7ww1eSkmWrLhSN2j9S8/0c
	4FX31+rW6IE7i/djL+NWoxzt2k3WHDvI6toJqhvQ+Kh8vYGtMhpOpP1BQT7/pSlCPAlgq++CYjB
	OhRabTMdiznSxGsLXjMFj8tvMB4HQ9hIcFhVDoKTQ3rTsAIkHa8Pqma/+oScx1Bqnn0dUeBVEN2
	uNqps0V3/SGUhmhA85wwP+F7If3X4=
X-Received: by 2002:a05:6820:20e:b0:696:7697:647a with SMTP id 006d021491bc7-69c942ef628mr8599698eaf.16.1779041908361;
        Sun, 17 May 2026 11:18:28 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:28 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:20 -0500
Subject: [PATCH 3/8] iio: adc: at91_adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-3-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=C48Abd8eNikDaFfFId0eSCBHL6bq+0x5TvEL5GoFu8w=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZDEZ17zmDQ4U89aCy+DcS8oW4YodZ7dhEf8
 0qbBK+H7XGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGQwAKCRDCzCAB/wGP
 wJFGB/9B3fVze53U8lx+G9ghHy0Zh5HQ9zTEiq/MOyWnB+E6PZoNL92fCoc4WMGniCoaEyd6UCT
 S8/2ofgAd0JD6A+5gZ4A3Z6ioBLYgUhJB1cHu1KUM29AIBLuDxp4xU/9MsG4PhsURfN/lRehJMA
 TIBIIL84aV7F9kAT9F1FpaGDR/nQSJxXDhoEa8ITP6iA442nNGUPY34z1zkTKtuuSPA77R7r8+V
 RIzxuL++W+LZLHPnaWA91BW32quPK4BG2mAgCxFA5La2kmd/mk/1EYpzGp93fuc89AhgdccUHvZ
 2XE8TzX6pT/qCvLiY0eYEtpxXW7n17P6PId2jHScku1P7KKe
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91_adc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 6e1930f7c65d..260e3e0c09fc 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -481,7 +481,7 @@ static irqreturn_t at91_adc_9x5_interrupt(int irq, void *private)
 static int at91_adc_channel_init(struct iio_dev *idev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	int bit, idx = 0;
 	unsigned long rsvd_mask = 0;
 
@@ -519,14 +519,8 @@ static int at91_adc_channel_init(struct iio_dev *idev)
 		chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
 		idx++;
 	}
-	timestamp = chan_array + idx;
-
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+
+	chan_array[idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	idev->channels = chan_array;
 	return idev->num_channels;

-- 
2.43.0

