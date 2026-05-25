Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3882776026
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673630; cv=none; b=j7nG/M/atbWYuK/c+LEuNC3zznb/orEJWlIHgQSqXc5sAvXYBTsxb2xPZ1tR2RKf4NrqwMxAdN3rdsMsBJIVrx89d1cbsrTSXwnIwYnxBvXrZMyIO+EXvBOKGwnMnwLeNiVAVmF5PjrNrKpLPBf5Z+EaDiXkkjlseCTQQtVdwoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673630; c=relaxed/simple;
	bh=1GvdRYTbe4ysj0bbOqJt39+jueckOj4wJjySGOcUdLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIv8c24wKeACEZR9INdmOEdpKAHC94V5lwLv3T3BeannN02MQH4PybGu/Pc1rW8AYt2YcSoT/tzfKJMSQ2XTe3ztAI1pVS6unkvA8WpTwaTQiUgWfXPy7/Q8I3TQm4bPbo+45p7yc5KDGb4EtciotvjcbLyvKakMkexv75fXu+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f8J9Vd0q; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f8J9Vd0q"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-484cf882ce5so6646009b6e.1
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673628; x=1780278428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=;
        b=f8J9Vd0qdhyVrU3lyWmunFJ/K5fwwNnBfyD0IbNEXNxjo+Cd4YN/zakW9CD/q+qBWS
         sR53xBBVeqAhJUJ/THoS9ABysosySIgcGdwXd5CotNznNwSPl8Av/lE4iHOPn9rFiW/I
         21Ko/PgEUif8XBiXHOPKAi6TxJPADLbXYkt8dQDKe7kQR+9bpBC6rULUn5oRqI7We/cS
         7B/PRNrxId5KPN91d+1gvrgblHx5nfGNkIyDUIm+9Xw1z6/g04QY1AE86eCZqhX7rmZQ
         Mm1NCbinbJILQ1ziDaz0hC7YMlrZ5cMKpUpvh5faWWHPedfELL3NbNKj8WqptDXgDI9e
         yKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673628; x=1780278428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=;
        b=etEqljJ9MYk4NmwHjSLT5uMnGfCTBUVZbjzfUcCrszvMLoy8gPnpRxd7scoQFFQLh/
         jave2twxQSAoN1H5DWQTFr9HXf5VT5PltC96V1J70ENY3G/IJTKfj2aa5wVPFF7uPSpa
         xcgCXutIW+ooE6olng/slBaQRwyJWSm/66ljNRnpCb+XEJ6O9tNm3iUvv2z4LdhbAcHZ
         c9YydnN0QwHZ4+8+bxr/KOTFn1R8OLUS4LHq+cX1L+e2nNQbY3gTflBb/Yoc+VpqW8de
         Xdv+BDLMW/lO8jDDBDDZf66aF+bFx4fSXJwUbdjK/Vt0leGhOq5NU7xwfkXYM9bLQFJt
         SlRw==
X-Forwarded-Encrypted: i=1; AFNElJ9sIT6qIWE+HqlT8GBqNYDabUCBX8ewfXIba+w1DR3c6wxawZD2U7ULp3DOhOKRsuR4JpFRx2QYoeySWaKHvC4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl3P3DP9LPeZTfB7102ZxscTLpC0MX6ujQoV+MxmyH8nQ7a3lt
	1GEt7TmKWdLW6xpxCrr1JMCwMw+hhRhDB0uaEZJpYeIZS+LNzOn1XOkbGMtBucnxO40=
X-Gm-Gg: Acq92OFJgqHIrSaXWVo6KecoJrx6hNoRg0FzZbDEaLD9Oety/SgvKtyfia3y2XVmHkT
	lqCGz1EuqaE9e9fvp1V2oiQRQrilqDRQY/fjrV0kLGRynzT/6i/cS1HDiADx9cjqtCWBxz7EnsV
	AkcaAvgLdyG1ngzCtLll6M/OSM+u0QsvhcWlMv8Oi7aY5UcMjzJ9tNWL8Wnioc75auh4tyL32tC
	gw/Qtn9TKLF1WiZRfkswokuOKN7SThj0v6aiUJNfeeccsGjPDBdsY/QRN8LbwA6nML8jS7F7G1X
	0pzzaa9g18kHo8lexNOSWyUbyWCuZQ7/GhCbaCpVxDt0szVMBuEAF30tFd7CJX64PZTtrvi9Jmx
	qdpS3/uLSkx9PlK0+MHdCvOzKMpkwiyM4u79oIUA03pT8pyKiuS8fNaT06V8oo9gEJQ8FaGUIlR
	EctVm51sqH9PpMj8dtZAXOOOhH5UkOHBfsnCrx
X-Received: by 2002:a05:6808:4fe7:b0:455:f0e4:4f89 with SMTP id 5614622812f47-48549cfca75mr7320262b6e.3.1779673628014;
        Sun, 24 May 2026 18:47:08 -0700 (PDT)
Received: from freyr.lan ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b6350ad38sm9263431fac.1.2026.05.24.18.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:47:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel definition
Date: Sun, 24 May 2026 20:46:52 -0500
Message-ID: <20260525014654.2399354-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
References: 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/cros_ec_baro.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..6cbde48d5be3 100644
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
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_BARO_MAX_CHANNELS;
-- 
2.43.0

