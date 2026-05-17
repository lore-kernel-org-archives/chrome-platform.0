Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0883C6A2B
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041922; cv=none; b=EzTid2zhSLS+gU5n4q42+txog7jUXA5a8Z8Sw9ff5L24U7BSrFONdt0/FwJIi9GdXLLWejzODMeE//nJxBA05gkirzpdYjmFRI/mzBHBZDPvfRM+VZbWuqeuwdfYgEuSnyuGJH2xNpI2bOoFQGFtzJKeY7SzP75mAGSjllfyYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041922; c=relaxed/simple;
	bh=zB7k3lhSdqbVTwNkTinjxGrJXZtNT6Oek8UbqFGJVDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiKmWDIpJuTmklaiBrlD6S5ixzl4+CeLc5g1Suwf9iXwU/FyLUF2bl+p5hNhuFNQNX4JHHmLfoRBupG1pTiiMNKEQp7iH1r/tm8s3oN/8rc4CJixg7eYRSU8Qa/BEx2zsZyc9t5GP2/oGHApZtbA/iIDezmRNeNKvwMfdL+WdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=PwKmy0qv; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="PwKmy0qv"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-404254ffe8aso1347279fac.0
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041918; x=1779646718; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=;
        b=PwKmy0qvLoFRGgWrLonAyczdUjxqA0Dy26acb2q44rGSyrU5uVxKp+BcxaWNMCwA/V
         OfS0PtcFTCcNpmlMfr62jxyq2UNyjtSmgC6HOqDCrGAFl/9pbrzYCFyf6LeoFkhNVgd1
         8jRbJyfABeHWbT9WjUKpQZjDO7GKy6x0g202EO3nH/YJhNlMAcdtE53KWwIzlvRRmhdm
         XmBIbPRWeyEY5UnFHHxkHJkrlsvoRtaxOfk0E0Dp+H9y03+72gqTZWD7C5efop1utB3N
         eTPgdahggty0x6qImZj2noTrh86/kyRYUjTszNxZJb0M1LsO++1Nd/eXWWRivn+z/28C
         XHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041918; x=1779646718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=;
        b=jMSIu42hwZMMzRpwehTfd5N73elTNRPsc5lUXk/yzGRbuYSUBwY6w+kpNss46cCjdy
         rt+ptqpIUzNBOZ0HbjRu0s8LESTCwuKmqWPPOrroW+85Hl40DCrtgnN8rxsCdbN8TdYZ
         WOCgyyzNeZtLwYKofRajcVFeDWCnQw99NIZoQEHO83r72Gh5qjo7Wziy3vFoDb8ddOaj
         LidHiTGn7EAEJ1b6cUBO53O738yP+jnrJzhv8Mf8/4NloteGJ/qqBuvpNkCCeDnrgkdU
         vUYrpWlnYY3pW+PyKei7OWC8ZNNMyGLbc1DSJ/hRpiUjVYm2JvkgbDrnPV+XNGZgJQMp
         AfOg==
X-Forwarded-Encrypted: i=1; AFNElJ87d94vStqcdfOkDAanZ+hqWCfFDp/SU7ERu6lZ63Xk63dRlU4sHRpiiW4Nl7fJOyPSmInnsqguFq3DAHHoptc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvMsd+Oo0aZdQnmSyOFw2Ia/PX9CxUFdlRBty6OIo3Z9Vt6TIP
	Gva+0bazqDc1IK1n2CG/jP113bVZVhLF+YGJx+JCAv1pSudNTZU7v1qB1xurBAm7O2g=
X-Gm-Gg: Acq92OGwp6NbIQXfu2cmln/mbQOgjFYHlUlSTTBeKq/qXcQkQC/y1CTbdyjoaAJCg4k
	i5MDJVFS1KLQONYcdHSsBkY8Embdnq+yYcuqZ2j9tsOmJZigImkgg2uqmL9QswUzRqv0JQ22DiM
	cWIPK3zKHVn/BOsmEOK7G5W2Vx2OT9eD9Ss9QisWz3cXjSFWVFWooKj6Mvxx1HsusRjkzO8L3TR
	UdUXziQnI7EplTKw/2Crz1TWhl+0NhyaBeC7a/SNqkW/iU84CIiiyvbrYSVRveKMIv1kWdA7Bzv
	mURTxm4LmHsAMQh8vm/NjGZ+za2t3TDP7miOYDET5sk3Sli4XbgNXM84ZnUbD9h8JlP7lBYBvfa
	0MSf2C5fFUHdQxY9MTeonQYUlX2MPLtrn3/DawBstf7NNRU0VVycWBuMFl3VGTyDMUPRHaihAGx
	HYaDOlkB+VYXvXUzlLESZ23OD55ouyHrPCic4iZw==
X-Received: by 2002:a05:6870:1750:b0:404:1843:e5bf with SMTP id 586e51a60fabf-43a2dddeb0fmr7311064fac.18.1779041918076;
        Sun, 17 May 2026 11:18:38 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:24 -0500
Subject: [PATCH 7/8] iio: light: cros_ec_light_prox: simplify timestamp
 channel definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-7-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=zB7k3lhSdqbVTwNkTinjxGrJXZtNT6Oek8UbqFGJVDE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZfqM0vragiRqGTD7eEpg/krmTzQCfTGXB1h
 0z3rSgndWeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGXwAKCRDCzCAB/wGP
 wN/7B/9mbxgZ1arMG7zmnev/BZ3+8rddj+Wn7ufPv6TcTQVYZzFDkOaHVzTOdhOhQywA7LeEEEV
 IYxyzLebUsY7Cvp2hJfywA+NbN6mvVmcxj3d7MNcdTYL9x4UdjBbqkIPV6CTxo2VyRM4/QG2Rk8
 nXeiJ7FNalUuj/gJKBAdAsEbnZbV2jUTYylcaR7OcLTK3VbQ/uPpePkxwsx10WIjNYsUvt/g0eG
 DwEXz3vbLZSJCMhlKhEIdi/N4wcK8Q4Rdaa1PF4w36R70uw/HT3E6MFRjz5JnYuCyliNZUqykHp
 FNKiie0h+NYOJQVharYkgWkfNDV7xWjPxN6K248678aKDb6Q
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
index 815806ceb5c8..6c8746236030 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 

-- 
2.43.0

