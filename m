Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31E4267AF2
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673205; cv=none; b=ViqKfGqSGUH90ZpdiDYpPaqkPvrK0MT1x7qIzzb6HY87o26vxeKmPum0Fbpo0Z+NakG95oAP+pfjdwe0O0mOPodbMSY0+ksBlGHJQg/fi0nGiF+tBwLX2GwWbBzOBOAVUejjyTeh5yG4u53Yfl39CwmwpiA6lR9kcdaNvpL9i8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673205; c=relaxed/simple;
	bh=7C8/5+5gnNT6M2AlhPrzghavej9n+bAnqS/RcFC9G6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIER84oNWCyDK8QUk+oIXyGSTEPiPEdqxyUV4x7WUO0glMEYgbv17qz2gDBKVbAftGKqlALIRPM3CzVhCaILI3hh37KJu0lfNP8paCdmNwxDQnoGyGdIsCL4a1yzh6vOyqdFMq7cIXUeVq8hVVLnyTPmb8FuI5jlt969gy8kXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YyWg6b7F; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YyWg6b7F"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e615b4c2a7so445244a34.2
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673203; x=1780278003; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=;
        b=YyWg6b7FGZdcrTdUTYfaMCssDwIzDgLLr9PW3pZt1gtd99/v20SPL4p8R9GsKm+xvq
         8NTDC1YvrHcChXO9G8bapsiwqkUd2oswA2hI6EAw91cprAxrNZZ2YtJ+Vh1Xpo2rgp8a
         Mevfif4Yh0Q0DvYgFWtQ26x7ou4r2A8ZJ/z1S8zxi8b7/4w+RdDWHI3Di4Si2cC862Sc
         JZGePKbJO0mdh52pzdDz5cwXasJ2GG5cn2QxL2MdTsuA31Dkd5JWUAFpsG57/5vjRk08
         LlSYq7LT1T+vpcrnlsnReY6iRERdvlgzWU6zaJnTSdS3MznM4uDV/BLNxAeRCoZer+Er
         ecgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673203; x=1780278003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=;
        b=XXd4/rLB9OkywPO8z4jWkYuhsqWCkC5wO8QAjQSAISdDlJxVylERC8mF98NYw58HiI
         ixtwM1zMBP5HZ/smWZfyr4y20TugUjtHm1iz8UG1KqmrlNLQWl28crgmv5q4ht7DUKgz
         uNpfo2euZvgMo1WISbRB3iHW/FMEfGxZHXZ+YSwZC3G+NuuMV9tsQRSaddGKU/Sfbdc6
         SAPs2ZOtIvxLJLkU9421ZMNc5nLD1DFrLBN7pZueNukcG0WJ/vPUAOrMpvGiLF6cN4Pz
         A8I3o8JJ00/UIf8pczLkmobzAkt8j+YCr+dL5ApjQVzDYj0oPePLjpainc2LkMx0jX46
         +zdw==
X-Forwarded-Encrypted: i=1; AFNElJ8xfunn0DzjoiC0/16gVw//gqvDe1W5MOs5hrwa/ElvcxW9Gc/Rk49Hs9Dv4KhdtiA4zwcULcuH8v7JU4LuthY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/awTEzslxSjcjJhrIV9V6NGLGQcSNXl5LlCeYYgXnQ9ErZmhq
	//KlxzfMOjuXk5iewKz0i5qbh0fljc8XZd68306bIcbnWEr4z7B7eSY5pPVGYGP1ABs=
X-Gm-Gg: Acq92OFNYR+cmpbav0l1TuywvPBG04Nu7AkJqyvcVj/Eu3Lc+7YZH/f5CBQzlrNc9WP
	Wh6vTWV5S/RADk9hf9VPxqOS9I/eWuRLN2Rd8osARZSUOTdbSLthT8YjEMW6EaKFCEt55WwIQYA
	dVOpDOMWkIpA3W+Q88JeypkkGRTLcwV2xr1OI2Km72xtoGCxfQNS7C0Swgd1IqDGSuKc3uVy9Dw
	J8PBZRO2THEpdsjZUS0N4B0KnvLxVaPj9q2f/DT2FOBFbjpgoWsPg4v6JQQIjpg24p1EoVqC2zX
	+5P/RFoQ7l71h4cUqpIwkfbLl7Gq8OYjGyL+JU2/eWtSymFLJQYPChPXtnrDI6EycHTg5rCrWal
	uQmE8f44dOepB4sCtTxRmyJeAcg68W5lzJEg+hAXcqP3uifut/zZdD+IkNsTyNlh0k2lz5bfLpu
	rL3PPG+bzhsai4BofasHCbX1oiwUxT
X-Received: by 2002:a05:6830:6b0d:b0:7d7:da05:f2d2 with SMTP id 46e09a7af769-7e5fee1654emr7987729a34.16.1779673202703;
        Sun, 24 May 2026 18:40:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:40:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:40 -0500
Subject: [PATCH v2 8/9] iio: light: cros_ec_light_prox: simplify timestamp
 channel definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-8-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=7C8/5+5gnNT6M2AlhPrzghavej9n+bAnqS/RcFC9G6U=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hSvUsVar0/xUDDV+QUJ/9QMjDeZul6qiVC8
 FnvZCNDU8CJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoUgAKCRDCzCAB/wGP
 wGyxB/0Qj/N6aCMaKcrDRbJ5BmZ+vj037ba3Q6iW+PZkKjvGsd9n4PoFI7wD6diSeSxvG2GERAV
 0x7y5cPwTJeGgFrLU4Qo8z9NcqmY/opoPqkC68DGf1g4gTHMT2AFHuEgfGeY7XqOwhRn02ByyZ7
 +BgbYfMmx9PIrdrvLqgkhF11SndRrlvItLg165vQBWRtZa5DSb8jybr8+fyduA8COR7s0xmuXU5
 PQaOeq17CpIVkbeYd+2zJNY5zR//JrrRaAgbcQ1iXR86OAIlopDA2T+cAjRX1sezQfNGetxEBw8
 nhehymX7MVyKCKWxDzyMp+MovU+rt5IIKdRMjaV9OqcsI0Pj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/cros_ec_light_prox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 815806ceb5c8..d09dea9c0782 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -223,14 +223,8 @@ static int cros_ec_light_prox_probe(struct platform_device *pdev)
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
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 

-- 
2.43.0

