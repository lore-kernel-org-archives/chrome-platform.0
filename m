Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB041991D4
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673199; cv=none; b=KnHri32EyDauU+KOe0/2Mfs6RnskhpZnyEvNiDmg3MGi9Od63p9pLgjETAJ4PbS/z1QtrqU2EKEiynGJ1ppmM5ifwzsFESeUWl6z4w1nFUvFiuQgzQbFbuqZXnxEl76wyidnl4bDiYRVocq9NwR1JFREuapoDQ2GbVLTJz/MZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673199; c=relaxed/simple;
	bh=a5s5z+cub3SAmh1xynpckVoWZ22C7+19bL3gHnAgtKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvwY9fqaPMzwJZ04nCVYesF111UbM7A4UWY1V07eFAHVTD/6PkigpVkQENc6cdGnmUuevkoJwN5Ulv+YDaXk9muq1Y233rnH3PCaGRkuziGfy8rFHtgvVNKG3F3yseQGK32eRSRyUf9FasgoDotzs4SwCExkjII2UPcJ+KYHrDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GCh/Vpv1; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GCh/Vpv1"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e61da76fd9so1073298a34.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673192; x=1780277992; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=;
        b=GCh/Vpv1bHzFzAVcDIn3zgPhMS5513+q6f24XrH5O0Gf3mjyjpqdCLJAudrNsDEdBS
         RLCtSjfgpHjgWfpnvRCIn4onbNtw3Pun9WCGJo/AbIza1pJbcSqebh9NloN0xSv48VOf
         IZrxUrW/xcVE+KEhNkP6rcwD5vVFJqGyAWPSDgaHSE6GyuFsiYFsPYMBtsaPu6zVUHw1
         WGzg0R7jWLdK1MIJwXAw0OflgWUW/C7Eelzmc91atmQDoB8+Er+s4NtyKG+y7iGr0egk
         MtFve5lOPwrYE0COfAoefmxcti4aSRchXyxeHzQSx6jdHrai+yqdc8MGKXQJljDT9P9i
         KK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673192; x=1780277992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=;
        b=JhJCvnT64WkI5A/gaOv7WbrTnIIFRIq1xN6HEtFPMm1TrGFCFc+WpBjjDLAQSTySo4
         D4HyZgMtb5dw2FVEs9ImhO6RCt8YQHswfl79QvjjVWGZmazUg7XzNO+5uKp08GWoVN05
         k5zfmUIDCs9xuZFVKdz0d1JWOvXPHGoVlTx4eh3EYOUIjQ+pmouO9qw3hxf8APUwD6B1
         CUVLuPBbfUr1Fn3YLoBvmu7iPwSim6b2V04qqPUFXQS7HM4U0RtWIiJK0llYJtDDtKKc
         MRm6ocXfE7Crs8x9mwfMZunulmTKHBg0YpbpCRMCq9FmRcY8JKPYfpeGwF6lQDXPKA8T
         WYaw==
X-Forwarded-Encrypted: i=1; AFNElJ9CnDzChKcWoNG/bKb0+C9eBOT+QHLogPOID2HRP8gNPFgjD/GwJVVgQjN/gaNhNoEcqstJh86oMXI5vXYXsWY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp9FCWjO6BivxOXHiUpdWZugXKKG+Rkx9CFTP5Qu23HPnTX88a
	PZEnUx/HONxc5OXe6+Vpk+wdZ8NTrqy6ylDKrJS8QxY4QZaseG5nojCs3b7Bqkm1skE=
X-Gm-Gg: Acq92OHnpa4t7sGw5P6brXY3aagu+lnNHZruiLoDE1zDz82bUTa6AGr7lCSCJPvE88W
	LN12Set7L0YaAOE+ZgieUrYWNmU/wyCF+sLfvL972S1FVDq0QKotF6A0TKdKvIVD9viMIHhAyV5
	LziepyYpuc1LhdXCQbg1T1hEarPM1Ri4n2fy8PS9w9Y5QZ7jIvHuafd9NjO8GMi7UkC0kEpuYI4
	Vn4wBG28FZxYsoEVxNKdelHHqOVYb3uAOCDJtQ3BZLb2MfKarOZHay152fxFNZwMElCy12LAjFh
	KJt4Z2nb29xFAKtcPaSTJuqvegzcJQdpGb3rVGG+h5n0ClrSItoEatmzEim2JTegLktGLlaiMu2
	rW9bSeVBf/bPij4HLNkW3WhcgizauCMiPFdlJPs8Oz8LT6UfjF2JL9UnpZwD1LxqGTxcOEbBdRS
	FVHwUQPIbuf2vmaSTjFiIU7z2EME8D
X-Received: by 2002:a05:6830:67eb:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7e5fedf1913mr8821807a34.11.1779673192588;
        Sun, 24 May 2026 18:39:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:37 -0500
Subject: [PATCH v2 5/9] iio: adc: cc10001_adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-5-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=a5s5z+cub3SAmh1xynpckVoWZ22C7+19bL3gHnAgtKo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6g/yjb213zQLbMwk6iuHebY91dnjXtb+FUCD
 vvtjZPSn4+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoPwAKCRDCzCAB/wGP
 wPwgB/kBmXUguncTbHCacyEQoFcxVZzlf/TOYZUKfnV2TLLum71flgDtMY1b0gdyXRmp3fM/OyK
 GuIvva8ImnHI+QUy7DVup2FJijaxuRZL4liv8BzuDmz+jrk+tGdFxjou/iziU5yzpsxn3h0UReg
 crutlwGxtN4TM7gBRUBqtvDGeGuTAtMiyHz3lJidkFemL9Vnwdy11RXMoLo6xpspnIby3loNKcM
 rwkb03JkzYTPV90rUuc1zVI4NWRdGhcSJ6QcGg25nQV8e+pjnmj4ZPxBeI518VkgGwI2bg+ySOG
 7EkIojBOcPvtAZMyAu4+KQxGhDwPFUmM2l1bB+pLFJTdoSgq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/cc10001_adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2c51b90b7101..d42b747325aa 100644
--- a/drivers/iio/adc/cc10001_adc.c
+++ b/drivers/iio/adc/cc10001_adc.c
@@ -262,7 +262,7 @@ static const struct iio_info cc10001_adc_info = {
 static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 				    unsigned long channel_map)
 {
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	unsigned int bit, idx = 0;
 
 	indio_dev->num_channels = bitmap_weight(&channel_map,
@@ -289,13 +289,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 		idx++;
 	}
 
-	timestamp = &chan_array[idx];
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	indio_dev->channels = chan_array;
 

-- 
2.43.0

