Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65328246778
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673203; cv=none; b=g3WI2lUiYPfi0XH0S39afldgfHbYj2rudZtL3YrIuZhIeeYWBKpXtA31Q+2V54KfmG84PnFQYLYa0yUo5FAyXiFnWekCRiT2pQXHCjpFWwLznjpkjj0OS5gW6CscWzFeTByPrBhXEYOrx2DMvSRUygFZaLC/O7UdmpJ+sWgCK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673203; c=relaxed/simple;
	bh=ZT+q1uIcB6+NTxZJlpCOAl/a9R7GwZgj1SBW0pmx/qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIZ7csou6gMgdwOIU06YWzJc3VIY8o9wU5jTJjS5+lPgjLGUs4JeUBxYEY5L66BCdDeL4ZH5/d2108OOBAJA2ivZ+1uzSk67sMGP6Gx0LwmEpJRBuWNGsUnBf3scedSAxMtpA6sh0+tCtQeudKxt93uhZ52PdvXTRsjh7YlZhNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IHgiqZu9; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IHgiqZu9"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e615efd7d7so1670121a34.2
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673200; x=1780278000; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=;
        b=IHgiqZu9Tq4TrV9Y84zEV7UVTf5GdplbEsUMoH6645+ceSi+t/P3JFLiP9UWhVN2Fe
         ll8Hy0vaR9cSaXDni3JuURsD3szFo0gbQwA7FEuFXgVo23x08opGzIhwoGY9u9Hy28yf
         Cxfrgq0kACPfBrx297B8/PjuSpsnsOkBO9LwMEAEkHBmTn6eWBAbULmVlIUZaoL3mT9G
         tVZn2fU4sBeu2+blyHY13vjG7g98NkZckiqN8vHBGegqddMX2o4RFFk/EvbPjKxxvFyk
         4gSAC+vW1p1k0wbljbgoLiODbjBYr5y+9lO9mkQU7ROBTzHgI7MHbxqvUN9Q9NrTNQRP
         VFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673200; x=1780278000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=;
        b=r5WBYZ34iVcCKtgJUOo4okZpLptcMaT6iQEeHpIEUat+mM3cEFv2ee/MCU3bELfhJo
         tkyBOzn1udJ4BAybRCT8fZ98PY+lXEDkYu7SWHE7zXh2b0EkIyZSjtL8q9s1iChfqyxz
         lRWccER5NlmZlF3rl1YwhWVjSuMy/vgZkPhoYkETKl8+Kl2sP3W0sR9V6GwwUSU7CJYV
         DG5MQmYG8oomri+IvS7zrusu+P1jJnhfA5txqYj7uIn/ZXnTzA1FDrtiFlVBnIzIlCEI
         h1SePxrDAxpbA155wXL3slNUOE2vg8LaNIFi/YPvYmoLiExmSA6mgX4nN267vRK3CBVC
         FaKg==
X-Forwarded-Encrypted: i=1; AFNElJ8l7NAS7aNcI7jJDVw9oEF3A2IF/kwV3kn6gkalnlkzslaIyPvBebxg14+dFC5dYbYqkmeRj5BsL5canyKl63o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwy/gejb6FUfGn208q0WKiWEJqsQI+LpAnGvxL4fWmZBHSMS7E
	dT3dEsp6gFCfoUwyPYrrVJR0WlX6Cdlo4URFzqiHbrcOOXfo4Mru8lvXErfdwIFfLIY=
X-Gm-Gg: Acq92OE5Ny5YcaPpX8i6zkYYUZpKcXFIFQzTcusLh+GCf2S8Krgzrfzc83dxgpoDjj+
	uVb5GGYi0EGZujRu4hixexoLtzgZIbN65N6vRRsH3iq9XUNu2WjKtAaAZkX1hKBnBRcMs1vW0Sz
	/dod7oCwUQOu+n9UFI6vEcOhevI8YrvfeqSGJ3YxwzY2ciG88l78iukoncJzk23n+lj6wnLXG7V
	tmgvyogPyeIlXHRKiRBtp1J3P0CbjlCOUcAUZ0aD82IA+QHMFXrPwvFoLWSWLVDlpd+SdoAbEmI
	yN3CNsypaAmNOdAWUqpyQOVnhJLaWMc9KGujbkPJ9qetEIdrD1vxnQjHSMOkCTymnyr7j+azhTZ
	1oss2RFLkU97V9fivbmXl/YbsfcKq7pKV9zNTeOlcwnsVL4Yzo4nctdX8IV0HNrpvJiB7WGxKM6
	Wtc3/lnwD8BGA9JnZBq2MiQkD0u5rZ00Ku+fVdid4=
X-Received: by 2002:a05:6830:6182:b0:7dc:cd0b:58ac with SMTP id 46e09a7af769-7e5feda98ccmr8635037a34.9.1779673200405;
        Sun, 24 May 2026 18:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:40:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:39 -0500
Subject: [PATCH v2 7/9] iio: common: cros_ec_sensors: simplify timestamp
 channel definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-7-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ZT+q1uIcB6+NTxZJlpCOAl/a9R7GwZgj1SBW0pmx/qQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hM39CnRhd7ZB2gP19BJ4GLnYKluJq5+aC4X
 i8XRKRITNSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoTAAKCRDCzCAB/wGP
 wAskCACfNSL5Vz4Cx1MbQaKk90iMp4pl1QLQYrJOWI95BPLFaXenWsYkLPkTMIjVPhfG9LBUqi7
 BIIzwLhw03+63ZtMhBxMIK8+lf/QcMewhBjifvxlt35sb49gsX+MVkKjUhZf3NYHeBjw49PiCEo
 2ek/mmaAv2Q4Y768kMkOKz0BjszAZSWygmYZBUKEO1pYKXECEBGTz+eeGwEuHrqcyw/kb1nCQ/Y
 a+oX3tZKu7pSI2yIoR8FPd9ue+uDqxisYZFGiifQgGkD+WoXw07zgBvRLEvYmJ9WocRMkN+iq1w
 GG6J7I+0XDN9HYbw17EULER6YA+vgzT6NaSrOGJYjEogLbRM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c | 8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
index 6e38d115b6fe..6762685e6876 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
@@ -279,13 +279,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		channel++;
 	}
 
-	/* Timestamp */
-	channel->scan_index = index;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(index);
 
 	indio_dev->channels = st->channels;
 	indio_dev->num_channels = index + 1;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index f34e2bbba2d1..651632ccfe0d 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -279,13 +279,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Timestamp */
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = CROS_EC_SENSOR_MAX_AXIS;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(CROS_EC_SENSOR_MAX_AXIS);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_SENSORS_MAX_CHANNELS;

-- 
2.43.0

