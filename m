Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BCE256C8B
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673196; cv=none; b=affEo3NWZbf5RdMqjuaxeNn1VCn2JKoNmpVcCQ37TT/aTcrgHSsPvZhrS3TXayPpVo1YzpymPzokzGr2wt3V8i1dtm3HyJmo9/SSShrWK4Lxb1L9XTNvMDV8u/EzSd8O0i5B7DnEJ0ruir8xZXr4wIOzpLKtpKDqzjRAeM8liVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673196; c=relaxed/simple;
	bh=kT7iBeb9XCkWmH0M5c7AuCVAJn+S9r0mo1T4JiYsl94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV0BrM0jb848fY4gGSQ/CwDmCQThjLjiUFJvwO4+SMsaocusyDZpr1QZj5v0Xtvo9Y+HICfY7MDdV/AOt7bgctTGGC92PFnnHAqx84SZlSrBjBCaBFB5f0DZiN0ZLr5wAkF5ahY7ubELu+sAau/CBKG6HSin1zToae4F7yJVeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=myJ+V8r+; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="myJ+V8r+"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dd73b7c757so4151948a34.0
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673191; x=1780277991; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=;
        b=myJ+V8r+9WuSbl0x8BNpBVkjx1iFyqIoze5lVRWJix9EnrGAow9+r2opjoWB4jMFdI
         pqLWZri4hwtbPkknD7S9mGtv2shy/uZV8hhxVO3MvMeHZZ3QKQoBQ1tqBMBCqvouRGFL
         DkszkX++kDbB4RZlec4UR68UFiS8GcJHw5smtn07whvcKrRp+fRSduuIIR01vpPEcOsS
         JSx5IqAeOUuhN62kJ61X96r7OC6oJzAMWZyBV+QsS8ML5KDFrQEfbUaw0MoD86etoEMg
         rb+sOXgg1ANM6N6Ot+Fry3azsh8+bLObkFJT0IYCCnmwKRG7jDpX3oslrJf+YQbJtdQX
         qZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673191; x=1780277991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=;
        b=AB6vQIRrwLxPfOMrjvdhApC0a0+B2Gk3m3tt+Q3/C2FJ6bHTI9zIdUF4UXfgVEepuq
         CMWDYzb/dsl1YhB/yns7EF2ObXjc8NNR1W7F8FxiqPvbNU5om5U6kqe9PhkynUoTCJjE
         CEltOi5sO5fTsxLrbRS6ZamV66PzAFHFlc9YuV2jC9Ccyimgdzvvr1a/cGnhwd+L9hJb
         kZFr6eL3xOID8G3VXUl97lSBSbz6/J3qn3MKgLCx3NH0Q66I2jbp/9K6u7WS9eCfn3H/
         k3ES1e4rTZuDEiqEpxQ3PHdFKdFW0X2YBsOhm8Ih+m4yMSAUYEVG7gLcrvmRixMtzbF4
         KF1g==
X-Forwarded-Encrypted: i=1; AFNElJ//hdJXXt2ioG/Sri5O8XQ/rwDLrGVPh4WkDWslSQkxCB7+qIfxffS/ouO+V1XJpIs41UP+X2blQ870cgDUedM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM57n+fWfbnow4fl8hq3LqZF58VeP0wiUaSofX8DfK+uwcxvRB
	Ji4+XgXmb8kfPaFLZv0cO3iUjomtJc4tgo39hgzH+yHmAZAZ3hXFNS83kiPke66ePcI=
X-Gm-Gg: Acq92OG+E4sIlukjU6wrEWxBIXSIZDtIn4hA1XXg8uJRUK6tqO9Xm6ohYsK6/Czy+sp
	+hsqYjhWlIClvjjWoA2FkPHbEUC3o+QrDrfbVyrXf4oC0QUcFzGKcf8NLv2fkjoYUqV7G5MSzHc
	33TnlvXvnqWvoPAf3rgfJ20RXWYK2XaXqMituzW1qTx7YFIXKaj0Wdl5acc03u6vY69Pt9nvFse
	Xhoc3fuAO1sA404chEhl2BoynbYanPMqUezoj+TN6Idw0kS3G4pWy6gv4RAERIxXYw0d1P60CSn
	9RQUu9G85cL4KcM0Jlf4H+xvBi4ZD1HDGr5RqYaNBMPXs2PIvZMFewChLMt3CQno4+EusgrX3iw
	r3lSGZRl5TqB4t/GpWtOLxvaIftPP8CknE5WyYicCXNgZ8TkyAtjpDq98Y8XdzPskTmD0KfDH8N
	v4Za3Ud7thBFbeNtwJqSrnU07CSgm2
X-Received: by 2002:a05:6830:6d0c:b0:7dc:d99c:c441 with SMTP id 46e09a7af769-7e5fedc8241mr7219838a34.8.1779673190623;
        Sun, 24 May 2026 18:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:36 -0500
Subject: [PATCH v2 4/9] iio: adc: at91_adc: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-4-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=kT7iBeb9XCkWmH0M5c7AuCVAJn+S9r0mo1T4JiYsl94=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6g4ZzvN+pLtbr0EtlFMYHDp7WfJxXmMKDzwC
 v9MYmHcbzCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoOAAKCRDCzCAB/wGP
 wM4kB/4oMi3qMB93dUQsrGEQKP3Ylxt+25M4VOOtJqdg7N8vJaJ1C6Lmi5F/KK6qCauA/lzIV4X
 si8btQlgwRRXDQ6XKwu3cWj/ai0R3djV9ReHCVfEGuiQQ0tUgB2QROHEnXiC0F4tBS6FWCVUlYJ
 I6DBZOM1nFp9tt6ap6GXFJ3BcwoZ7V/n5Z3GOC+N2BdEyABMsqK6hVrc8Db1ksyYyjbzIhaETVj
 tIJsfrSn2JjVJ5299p8Gm7hdyOXXZh/t2uRbe9QEeahWGaTwcNWvv9HlO4izEY1uM+pkipAIoh7
 Sdf1+Nlh+iWCpQuVbssgfyPaZxlw0P8K6guLhv28vVycI7U5
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
index 6e1930f7c65d..f610ad729bf3 100644
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
+	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	idev->channels = chan_array;
 	return idev->num_channels;

-- 
2.43.0

