Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756A1B85EB
	for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761177; cv=none; b=BQlIr8A9/7SxdwE0jC20XDGxDcUEDtgJDTrwotuIjL1kRNTacRrtYPoKG5/DE7kZUDD0m5rxvn79RFFENSYIBtDPonqQqnfbuQOcW98R0leZAcPYRr1ocOjGKU519OG/kQOVAu/RIQx62TWirx1nlbmBDAlntmha122aLlc+COE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761177; c=relaxed/simple;
	bh=EvZTfjPuH+Sw2tva9CA/YuYYsffYBvbQ9xRBfy4MGH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3DKxZpaXa15JxCfi9t/UAizDHNI5iwVNISXoYdMEbMDwhf6iFWUEPk60UtD7cZXW01TRa5PhN9W/QTRgPiNaOZKGW2XA0NM7bXOknzh8UD4qURUUqt4+k4NGczzB2SlFAid5525lFg6Q7p9RJN7UT9rBRVyC6jcmkcL2lD/zp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=osA/s7qE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="osA/s7qE"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e690479cso696712e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761173; x=1730365973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpXwrqa5mh4an1VW52USOlgjMJ2X4POeKu7/qnEQ85Y=;
        b=osA/s7qERAAxi+cFFAg3C1ue9I8ZyYim1svuwuCRCOMVkuvIbEHQ9Y/JYj3xlwRrnc
         J3VPXlbnunscf1YIfrh8apUscIG3QRb3qmgc4zOWb+hDxg/FuhEvlP2XAggdf0FblVwt
         MR8HH/opv+eRTjnow0ZhRSHSv3mfzbk9j3St1wiu8tVnA8e3IoSF7iO9nqo0zs+1Nr2o
         1yhqyT/ZwHwvKnQzKXBLRP+qQqT/CotzVesyexDe+rpSRtECpLy2ionPwQasg2Nis3zv
         9jW5bgYXnGHoQoKBfkD1oq+AdRhA+XnYyW0mxEYFJ3LpKZQ9D3coST2MRXAWa9XD8Z4o
         Rvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761173; x=1730365973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpXwrqa5mh4an1VW52USOlgjMJ2X4POeKu7/qnEQ85Y=;
        b=k8HvQydcDh39Hn+FVLTvor1Qx4vaitgiEWYT9K/U+pk8OLTocIPTf0A4u0Ubxa1nUv
         LrgOWTVDdXGKLrQB7fEOAO/aWxZavuTKrBa+kWr/DloF3aCkR4yjGTRzB3U66OssJ425
         49fVfQJy0rwI8iOugZLu3fGlQf+q0QGA3Ec6dsJWumv6q/SWb6xd5poof/RbXACeyW0P
         /gGN29VodVrFJiMbLE9FarTntAf3BUBdOtFi6eFSEYgluFovf8QFs2H6qynZRQIOqe3i
         lA0EkM/7dh00FS0KHRpIPOiJi9/MC0cQRFdIeFkMFXAio6tIwkWl/dOCCjLbI8+4uLZ3
         XFJw==
X-Forwarded-Encrypted: i=1; AJvYcCVGIA8LkXrLQeDZMZQRityE6+oZdkWzcKseajRgvPyNbuo59/pGq2AuE9yIVSF1IpLjGrjBkwl/cQfSu8CY9Xg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnj2kJZ5UiCbGztKaEwikOFSb5K8zRwdK3XZULMGQJu+FBS6C4
	6iiL4ojzHveL0fqo0brqN5oayCMCheEhIVza5L8ajeto2WU/Isk1UCTX6l+A2aA=
X-Google-Smtp-Source: AGHT+IHjMTzdOejYpXdaJTcSXe71t6xMLTv/MupAWuwwaYamFeQSYvZEYBgJNNUbqbvWU86WqzOMBw==
X-Received: by 2002:a05:6512:3a82:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-53b1a3392bcmr2894072e87.30.1729761173024;
        Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:52 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:27 +0200
Subject: [PATCH 5/7] iio: imu: inv_mpu6050: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-5-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 7 ++-----
 drivers/iio/light/apds9960.c               | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 5680be153127711777b6074da18a7a0f86211d6c..21ebf0f7e28fec302cbf8ab890fc53a3de6f36cd 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -1176,21 +1176,18 @@ static int inv_mpu6050_write_event_config(struct iio_dev *indio_dev,
 					  int state)
 {
 	struct inv_mpu6050_state *st = iio_priv(indio_dev);
-	int enable;
 
 	/* support only WoM (accel roc rising) event */
 	if (chan->type != IIO_ACCEL || type != IIO_EV_TYPE_ROC ||
 	    dir != IIO_EV_DIR_RISING)
 		return -EINVAL;
 
-	enable = !!state;
-
 	guard(mutex)(&st->lock);
 
-	if (st->chip_config.wom_en == enable)
+	if (st->chip_config.wom_en == state)
 		return 0;
 
-	return inv_mpu6050_enable_wom(st, enable);
+	return inv_mpu6050_enable_wom(st, state);
 }
 
 static int inv_mpu6050_read_event_value(struct iio_dev *indio_dev,
diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index 3c14e4c30805e1b596ef2380f94e6aa3e92082b1..3a56eaae5a68f2891d061871c7013f0b5447bb47 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -762,8 +762,6 @@ static int apds9960_write_event_config(struct iio_dev *indio_dev,
 	struct apds9960_data *data = iio_priv(indio_dev);
 	int ret;
 
-	state = !!state;
-
 	switch (chan->type) {
 	case IIO_PROXIMITY:
 		if (data->pxs_int == state)

-- 
2.47.0

