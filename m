Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7C224AF7
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673188; cv=none; b=F2k5zNVjdBHDZ1MVJGZjeE+2BNdgU10INC1jsC9UhD5q13ZRxlxFpoT+Ptk/EMORgfPAMlsPp+Crhlx8gQAhLTIuicTa3PB6XhIrG4hfP1cpT47o/84ltCFgZ07/rX5nQ017lrNnei/MC6tcHtQ21Iedaz6oCf8L9orX2o5z5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673188; c=relaxed/simple;
	bh=TEHUifL7/4dnIMKll3xLMjX4V+n+021/c18PVpzo3Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7gyXCK/uc0zpR8OUl5qdCdf6F1yyo1X4HiI0K3qKCGwjszyXbQZ1XmrZCtgHLYR1F2VH1BKLwacFRF7fWSkb4Zj3QJLRZngcFmIVh3Mi0YNmkxp33jci6tMCirkslPU3oUy4BR/whJ5J9ENYZwXVfTBIy52elQEEF0ofDu8Dn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RC5TUm6P; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RC5TUm6P"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e582b3bcaaso7828224a34.3
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673186; x=1780277986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=;
        b=RC5TUm6PzTfcfE6n8F8ueqVRHkhDB2WxkUJbhBTGNvNkwKBo8omCoJQtMc3xUNw0xw
         UI6bMi8aquqq1zDKwJjq/KVBtSWkdzqtVr7bGDD6yDv2XHgye5bhdrA438LN3ImtQe4j
         9IjYphu/VKnmz4NDNBbWwEEaHA3fbJx0/NFIfI8JoCI9VEpN+VvqIzo2+oQ4BLvBCPam
         X1qi6dvqStS51darGGrMPKD8y6v+NlxngTKPIo1fRbhjkLUA3ENs0Ph0JHUyE2e3N4N0
         jd91oZ9GBznACpL332rZldi+nNAHnph4v3HoAxRyDlk8x/xkubrOuyNqIRLk1I8lNAzk
         a+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673186; x=1780277986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=;
        b=Hv7Z/z27BGoHZVHrr8RIc2333/vJUS+fz8zV83rzi/q921KIzpwRQ7ZTS7cV0ZnBEp
         ZxiYf4yVkNmJJBeF8XHsQIKnUpgRm7pCgOiajs0UqtvHWuDC7IV2VHWty5xWKPeWDT3a
         vXg/G8czo+QvUPIQsnj48GOkcASBdRZJzhnJrt8zuzG727iZswjEPSgGoaGKq5zthiF2
         cfRxj5RSG6WCPoRD97jucz3sprYMKx+f8JoYfTjg8326u3MGdwmboiHpBT2TmehCIoVN
         FcZm+i+HusHa6UTtW4iawojU48JlokWnHRbs8WOlDtSdgek/EZQtqnbbT1T28dn6I9J/
         s+Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/uC211qA85vTBJjP51oqW1wscfJCHCPQUmd0MRUBUi8vQ75/7kLcd9npUxMBZdYRh40srIQwMtlc60uHpA2aM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg/QVbjlZD0u0QXY9u1EqgjDAm9e8h0GuG+U8liLA9laAiRffK
	G/3lOnzAXJtJ0VjIicuwWh0wlwlZieVz5AqXx6GPwvUbu4h9Y3gIhNo+2BlY9yz1s3w=
X-Gm-Gg: Acq92OFoI3QzjEge9tTV7xEWEj7rLi0lf+RMY/os1xEuVLwHGH3cL22SvKbA8URG8QV
	m1uC9sZUdIAT8zteuATekPCN7AMJI/du/5Ix5Somfdho1nfmQ7OCzDpaKvAYPejjwLZQ46eJLVs
	HulozpMZqFz3wUfd9nbCOC4RI63Hn6n2PSq48hMhGbIyZJG79MSxOy4YuADAVv71a1k0X/SwLjl
	f3WD1UbI9WG+12uwnTRi1XahKPtqK4PZzbMZcUUSi3la7gF73Fvd6EmC6z2JPqSyTNJ6asIv6k1
	RYRm5/g0ejIXazRrtro5rfAd04+v0KRgzcBaf+VvKdAYkN9r9siaHzYOVNanIKldy5GGwEsyMJX
	p6aekH9jlkmkzvOgRe4dGhYQ1CgvGXU13SeeXPxdq8TCCGkTL6EQEkR9trLPWAsj8FR5cjzaFUm
	VB2r3y6oaRrL4Lc0TOEtqil8e5g5WYwzMB6z0kOX8=
X-Received: by 2002:a05:6830:3c8c:b0:7dc:e0d4:70c5 with SMTP id 46e09a7af769-7e5fef83672mr7641141a34.25.1779673185757;
        Sun, 24 May 2026 18:39:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:33 -0500
Subject: [PATCH v2 1/9] iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be
 compound literal
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-1-c37c9408b7f7@baylibre.com>
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
 David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=fKuBtJfAfzCPrk3RdMloY3OvsD35TA24knEc3HPqxbI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gkbp2XpLy55TfXwCfXUXCOiKIRuOMxo3k8B
 SKcIFfNBt6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoJAAKCRDCzCAB/wGP
 wGJ0B/sF6GcNKoszGrdS3K3qVjnpXeZGkJO10bpDXR4Y3SRxc7dVTNe9sllJCpyKPQhdmnCCdbJ
 8MYmZ77vnGZLM3YPs09/4cO6Oz6yDoJdjxh7zlvnMcmgzm6Dj5l0P/a5r3Uh0V2wvH2dex7ggHd
 SaF2Oi0IeM0dI26Bx0hksIsaLx2dTD8BLZqrx+y6qY4bVH9v0EmzoSsAmfE7WKnvYGyxdGtFB+2
 UvMVrh/rhy3kOiOk0JJNOyIo2OsCanJ/fKxsfW12+iDCn6TSQXXQZG9iH8086GSo3wlX5XRc77q
 SCocumfHN0Fis55ywvYaqhtzzSiGdfFfcIICVJQWNs/3mTWy
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Currently IIO_CHAN_SOFT_TIMESTAMP() can only be used to fill the static
data.  In some cases it would be convenient to use it as right value in
the assignment operation. But it can't be done as is, because compiler
has no clue about the data layout. Converting it to be a compound literal
allows the above mentioned usage.

While at it, tidy up the indentation.

We also have to change existing uses of compound literal at the same
time to avoid compiler errors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: David Lechner <dlechner@baylibre.com> (fixed compile errors)
---
 drivers/iio/adc/ad7606.c   | 2 +-
 drivers/iio/adc/max11410.c | 2 +-
 include/linux/iio/iio.h    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d9271894f091..cebb8ed8dcb1 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1475,7 +1475,7 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
 	}
 
 	if (slow_bus)
-		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
+		channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->channels = channels;
 
diff --git a/drivers/iio/adc/max11410.c b/drivers/iio/adc/max11410.c
index 69351f4f10bb..dc1b96356592 100644
--- a/drivers/iio/adc/max11410.c
+++ b/drivers/iio/adc/max11410.c
@@ -804,7 +804,7 @@ static int max11410_parse_channels(struct max11410_state *st,
 		chan_idx++;
 	}
 
-	channels[chan_idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
+	channels[chan_idx] = IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
 
 	indio_dev->num_channels = chan_idx + 1;
 	indio_dev->channels = channels;
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 96b05c86c325..711c00f67371 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -353,15 +353,15 @@ static inline bool iio_channel_has_available(const struct iio_chan_spec *chan,
 		(chan->info_mask_shared_by_all_available & BIT(type));
 }
 
-#define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
+#define IIO_CHAN_SOFT_TIMESTAMP(_si) (struct iio_chan_spec) {		\
 	.type = IIO_TIMESTAMP,						\
 	.channel = -1,							\
 	.scan_index = _si,						\
 	.scan_type = {							\
 		.sign = 's',						\
-		.realbits = 64,					\
+		.realbits = 64,						\
 		.storagebits = 64,					\
-		},							\
+	},								\
 }
 
 s64 iio_get_time_ns(const struct iio_dev *indio_dev);

-- 
2.43.0

