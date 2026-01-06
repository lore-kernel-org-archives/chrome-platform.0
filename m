Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906BF31ED61
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686849; cv=none; b=DMsU0Bo8wSMKBAEKX2ho9IJOSIvEJRf2JGS6bOG9eGo9hKZHBjwY11Ro+bD/2E7omofIPFtkiRWhNd+iT5sOk6kS6GxbwoZMFGRgLKTDGsVm/vUeJzWhP/mmEUTWbUUzHzqQj9Sqz+gNYHWurOJG9n8YTa4C7J5R5lU6Kzu+svQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686849; c=relaxed/simple;
	bh=wLQkfH84L3nWLNYNBgcXpFCEELbehsGmWWxLa2vh72M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE5U68Y9zv+IiNxDL3R56APVZWxMQkczjFZfbNvOlBHNzuFeI0+mrmZtygdYWvX3+qCNGmm/OQkk6wxIrHQlNb582NstRxqHJjOiplU6dcZpi0/kaIjBlIxoMGOvtMXWFzlTHyt1rbQvSBj8hnbqzW/lTc48E/JLAP6aOfdh4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIRBRYOO; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIRBRYOO"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f4f04d9f6so1359509241.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 00:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686846; x=1768291646; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IydZnnaEgCiF4tRpM0JqQAl0iXFoV2F5d6i1TSIygpQ=;
        b=TIRBRYOONphvlgFL/BN3lyX57Fr+Cfkh5Vz8VcxMBw4+by5YsmlPPDCHBC4GQMyh8e
         ehFGvffB6mGqeml8rMALqaNP/U/Ch59VrX8SSrQo2gZBnCgWKN2FQdCT2nBcHpKcGGjN
         wr4n1SNIPoshjShNjH00IZNaI7gMH95Gy9FBrnhACzfZihRNDDjKfFS7LApFzAzvHCyO
         Uk/PPA7ZKs9DABRXhhL6ZBknXNGe0pGUE218nERq/59l/zF0LZEUIsHoquu6AM2PqWUK
         zGHl8a7w3aHzCUMSlZBJjm5tmwd5hulauljxfXAIFFMS3RiWyBO0nZiu02qrS/DA2o7G
         eTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686846; x=1768291646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IydZnnaEgCiF4tRpM0JqQAl0iXFoV2F5d6i1TSIygpQ=;
        b=g4i0GYLmL9r+6X0vFIQVFBgDGOQ8x1g2kc2ZtVlBuhQUTFQnYZCv5EoFr2QhBhx1yC
         P0V03s6h2gZZAV28glYOLzO5OvR9mZUQmz1BrqcUKKVYkq5c6hsmOcIN2WtkeoXGjwk5
         u+E0y0kMSjsiSQ1KqThWq0Eq8rtG7Ch0ZKroSjbGHF06mPlqB47TIL9H0PqcRUaFMsvm
         QwFSrZ9XlqAKpRVTjVfUeHr4MWjOwqj6TFiumvBxKK/ap/UovNHw1jMDCDYBTEyIdNXp
         5yzN/L9mE4IZDhUXJ8rb41vLOsfbeiojvtRSO1mcdJVx/CGDLWzTERLDcKd9X7sci2b5
         WqUw==
X-Forwarded-Encrypted: i=1; AJvYcCWdQ/bwvisrRd1qawX6QR3xipbwHMJHuc4n5c1xvItwn3xwBHvpJOufx+9qSQa3eI0wa/xjWGGVhSq06buotKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWYiFpNLM1Dz7ldbcKtU6fqTOqZ6bIt4GIotI0ZippQmRS8FmN
	Y2Infr+m4+3pD0FY/q/bQfx94UHsz/Mo7PA2WHO3cELUbw5F1v2pyj7f
X-Gm-Gg: AY/fxX7FRV9RTIeGL87eG2O49JuanBPb2+JD7or1s0wuTcKHdOFsrRXRBfdIlMV/IEk
	/4n7qCZTau5V84Jnj5mjVDqRaGe6pSTJBxahth/jy752YUlS6Yx7/WWsRV0sh+9WNYa2Krs6VPX
	LaSfk+mirLG1PEwVxCDxq1X4WB9aomqmySRtYDAVqLqAoQeNfL0kgDp+2YP3l+NnaKCym7yyTNQ
	chrcvqMM4s8W2zrKh3GxfZE2yu5bMLOYqVZFAu47iPqLN9SCuy7tXGknGUFcC6GrL7jnJ6Rmk0H
	cKpzl8Q7tDcxwqvSl07MP2uCtQ5/PeQz8Lq5YFmBJk/EzU9+hpk3CMP29zT3DwcxlnODBIZcOqB
	tcybarY6ILhzXjiyzShjJkGla7zGqmgOMH78nhOjnYb25O266bLtZXCcxTyJGwvXGDmR8Xnghq9
	JULlmFQLm898FS
X-Google-Smtp-Source: AGHT+IGMzI/cOqZ43QXZ7a5RlfUrH5CNRBYOY+ps8BI9qD34V+0PqH3koe/uQqhNWbT7bakQngPE0Q==
X-Received: by 2002:a05:6102:41a5:b0:5d5:f6ae:3903 with SMTP id ada2fe7eead31-5ec75772675mr663970137.20.1767686846422;
        Tue, 06 Jan 2026 00:07:26 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm457615241.11.2026.01.06.00.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:07:25 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 06 Jan 2026 03:07:02 -0500
Subject: [PATCH v3 7/7] iio: light: opt4060: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-lock-impr-v3-7-1db909b192c0@gmail.com>
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
In-Reply-To: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, 
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2592; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=wLQkfH84L3nWLNYNBgcXpFCEELbehsGmWWxLa2vh72M=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkxh1ZZLly6fU/3oVnceUXdgQrl5s9XfjBatl7l8LvJE
 8SeHfH52lHKwiDGxSArpsjSnrDo26OovLd+B0Lvw8xhZQIZwsDFKQATcZNm+F/+RFrepeK68zpN
 lvAJXpZuJr9u9bomyiUc76pf6te5goWR4f+5Ssv1Z9lFLX76L/g4K0Fs7Vcfv7/lFtturOAN3Ht
 2Ew8A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_GUARD_CURRENT_MODE() cleanup helper to simplify and drop
busy-waiting code in opt4060_set_driver_state().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/light/opt4060.c | 52 +++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index 8c4a1f562a83..d6e915ab355d 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -302,41 +302,23 @@ static int opt4060_set_driver_state(struct iio_dev *indio_dev,
 				    bool continuous_irq)
 {
 	struct opt4060_chip *chip = iio_priv(indio_dev);
-	int ret = 0;
-any_mode_retry:
-	if (!iio_device_try_claim_buffer_mode(indio_dev)) {
-		/*
-		 * This one is a *bit* hacky. If we cannot claim buffer mode,
-		 * then try direct mode so that we make sure things cannot
-		 * concurrently change. And we just keep trying until we get one
-		 * of the modes...
-		 */
-		if (!iio_device_claim_direct(indio_dev))
-			goto any_mode_retry;
-		/*
-		 * This path means that we managed to claim direct mode. In
-		 * this case the buffer isn't enabled and it's okay to leave
-		 * continuous mode for sampling and/or irq.
-		 */
-		ret = opt4060_set_state_common(chip, continuous_sampling,
-					       continuous_irq);
-		iio_device_release_direct(indio_dev);
-		return ret;
-	} else {
-		/*
-		 * This path means that we managed to claim buffer mode. In
-		 * this case the buffer is enabled and irq and sampling must go
-		 * to or remain continuous, but only if the trigger is from this
-		 * device.
-		 */
-		if (!iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
-			ret = opt4060_set_state_common(chip, true, true);
-		else
-			ret = opt4060_set_state_common(chip, continuous_sampling,
-						       continuous_irq);
-		iio_device_release_buffer_mode(indio_dev);
-	}
-	return ret;
+
+	IIO_DEV_GUARD_CURRENT_MODE(indio_dev);
+
+	/*
+	 * If we manage to claim buffer mode and we are using our own trigger,
+	 * IRQ and sampling must go to or remain continuous.
+	 */
+	if (iio_buffer_enabled(indio_dev) &&
+	    iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
+		return opt4060_set_state_common(chip, true, true);
+
+	/*
+	 * This path means that we managed to claim direct mode. In this case
+	 * the buffer isn't enabled and it's okay to leave continuous mode for
+	 * sampling and/or irq.
+	 */
+	return opt4060_set_state_common(chip, continuous_sampling, continuous_irq);
 }
 
 /*

-- 
2.52.0

