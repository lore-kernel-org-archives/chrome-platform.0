Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CF11B21A0
	for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761173; cv=none; b=FHsLtkJTqf82cnmlCpqS8610oM61QApUrs++xFw6mKkJp8alMsRmfghUsHUJZkYeZDYaRB/MzBqm5pBuGiXDAWqS9b1a6GhQ/dhQ352KaeiP5hA5mzT0OS4MFJa3vYyeKTTcmfZRU1q8VO9HmCXeNtMhs5ha7AwSbQX+n/tNaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761173; c=relaxed/simple;
	bh=QGdUMjRpMYxCmFq2pXqUJVmN8eN7QxzrP+sC6cNn0qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cnBCuAHF5Wic5Jkj5FB9fHP8LTb6ReeXg7CMklrc/EYCjmettbcwsv7bigpifg0Zld72dFVWqqTBqVlp1udKAzsApYgeMiY14mIiVpAjnWaWME1ypQzN1I8qlykU24Jua5ht6L8djs6lFWTMyhrlIH4XiL+TAQ3nzojb1MgTRKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PfHy77yW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PfHy77yW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so470535f8f.1
        for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761168; x=1730365968; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vx0eUgvgDMYu97caj8Fvwuv1gvofiM1BDQhVIQnSVpg=;
        b=PfHy77yWyXMlFhnUNRR+tT5GcHGQFZ6DI9ykx/GkmOibhC2Dy0pTzWp2yLm1Bkx/1T
         hCR03dnRNJKWxY/M7SNOCDYW9qspQDZJwiouw5+RKE+KJWA8O/zG7NGaR/veBunNnWi0
         tXh7gJ+JIO5m525dB7l20j7jAk6bSDH0u9w3LaQ2BLZgE5Rf/3C92XP/Ut8obHM9hOeu
         gKaZkhPNFkr/NVdOqMYfMqvIBiqWHgHTTZuFs+EoS3+p4hc3RCyjz+kFjx9gU4yx6EtK
         4GEVz7N5TC2018usbWQ33/NRBD/rm8YsYHB+RLQ9ARVHQYL5iUDS8xcFCQ5WUK18uKGZ
         2ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761168; x=1730365968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vx0eUgvgDMYu97caj8Fvwuv1gvofiM1BDQhVIQnSVpg=;
        b=j8Ri6GH2oR4+Qk0KrwjBraZumLr5ABXvZK1tKZib/NGFTcsY7GH9sBV+bxSQFVXg/m
         aZrDPNPy/iQPtp22s1FxOgNB2IyFKCmA1XpgO2sXqHtVnmz8HuDdUhBZbawQsZH/F/fR
         B/uwpFyF7FuWp7QY7rIQJhs0Tl18GlfcCnxDx0iJ0WbpY6FNVg5awY7kPQtlb+blO37G
         igoikaaTDcZovVL2xBZ698q8JA09A5r80ovyKeG7lnf+TIp7jKHVOxQh6DcpmkIKP4PD
         znUNL2bQHupMBpXxZyukxFI51ttdB/D8Chb7YnwRNUd83i32BN4jabFp4jUp8eeaEXj9
         dDYA==
X-Forwarded-Encrypted: i=1; AJvYcCXbNsCIIUofWSaPtxUjDS5I1TfPZeQiRNAf/icMibyAprlUlSTksuMZPyc23qNEB9MX667+/AXx3zmlPwHIC/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdY0OIx+rP29Gcmq7mboX4Nx5Pl58AvyCSg6lsOPwplh3t2CHU
	YoIArta4Dc2r9crmZKYdlSAx+V9x0OoUNhbpf4H1kfsWfpANEPYaBu0xqgnhf68=
X-Google-Smtp-Source: AGHT+IHA45txqMv6fiCd6E+I5xqCrbrjkPK/VXPgue7ugGcgW6QHaUAS7lo3qSSFpDfYjE1RQxWTIA==
X-Received: by 2002:a5d:49c8:0:b0:371:8319:4dcc with SMTP id ffacd0b85a97d-37efcef0d0dmr3531695f8f.2.1729761167762;
        Thu, 24 Oct 2024 02:12:47 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:47 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/7] iio: fix write_event_config signature
Date: Thu, 24 Oct 2024 11:11:22 +0200
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADoPGmcC/x2NsQ7CMAwFf6XyjKUmwMKvIIaS2OEtDnJCqVT13
 4kYb7i7nZo4pNFt2sllRUO1AeE0UXotVoSRB1Oc4yXM8cxAZcXGX0cXllWsc6qmKNxQbOkfFw7
 PFPQaNUtWGqm3y3D+m/vjOH4as7IidgAAAA==
X-Change-ID: 20241023-iio-fix-write-event-config-signature-1bc1f52fdedf
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
 Julien Stephan <jstephan@baylibre.com>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.14.2

Hello,

This series update the write_event_config callback signature to use
a boolean instead of an int for state variable. iio_ev_state_store
is actually using kstrtobool to check user input, then gives the
converted boolean value to write_event_config.

First, fix the write_event_config callbacks from iio drivers that are
checking state input, or that are converting state to bool. This is
useless code, then update signature.

This patch has been partially written using coccinelle with the
following script:

$ cat iio-bool.cocci
// Options: --all-includes

virtual patch

@c1@
identifier iioinfo;
identifier wecfunc;
@@
 static const struct iio_info iioinfo = {
        ...,
        .write_event_config =
(
 wecfunc
|
 &wecfunc
),
        ...,
 };

@@
identifier c1.wecfunc;
identifier indio_dev, chan, type, dir, state;
@@
 int wecfunc(struct iio_dev *indio_dev, const struct iio_chan_spec *chan, enum iio_event_type type, enum iio_event_direction dir,
-int
+bool
 state) {
  ...
 }

make coccicheck MODE=patch COCCI=iio-bool.cocci M=drivers/iio

Unfortunately, this script didn't match all files:
* all write_event_config callbacks using iio_device_claim_direct_scoped
  were not detected and not patched.
* all files that do not assign and declare the write_event_config
  callback in the same file.

iio.h was also manually updated.

The patch was build tested using allmodconfig config.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (7):
      iio: light: bh1745: simplify code in write_event_config callback
      iio: light: ltr390: simplify code in write_event_config callback
      iio: light: ltr501: simplify code in write_event_config callback
      iio: light: veml6030: simplify code in write_event_config callback
      iio: imu: inv_mpu6050: simplify code in write_event_config callback
      iio: light: stk3310: simplify code in write_event_config callback
      iio: fix write_event_config signature

 drivers/iio/accel/adxl367.c                    |  2 +-
 drivers/iio/accel/adxl372.c                    |  2 +-
 drivers/iio/accel/adxl380.c                    |  2 +-
 drivers/iio/accel/bma400_core.c                |  2 +-
 drivers/iio/accel/bmc150-accel-core.c          |  2 +-
 drivers/iio/accel/fxls8962af-core.c            |  2 +-
 drivers/iio/accel/kxcjk-1013.c                 |  2 +-
 drivers/iio/accel/mma8452.c                    |  2 +-
 drivers/iio/accel/mma9551.c                    |  2 +-
 drivers/iio/accel/mma9553.c                    |  3 +-
 drivers/iio/accel/sca3000.c                    |  2 +-
 drivers/iio/adc/ad7091r-base.c                 |  3 +-
 drivers/iio/adc/ad7291.c                       |  2 +-
 drivers/iio/adc/ad799x.c                       |  2 +-
 drivers/iio/adc/hi8435.c                       |  2 +-
 drivers/iio/adc/max1363.c                      |  2 +-
 drivers/iio/adc/pac1921.c                      |  3 +-
 drivers/iio/adc/palmas_gpadc.c                 |  2 +-
 drivers/iio/adc/ti-ads1015.c                   |  2 +-
 drivers/iio/adc/xilinx-ams.c                   |  2 +-
 drivers/iio/adc/xilinx-xadc-events.c           |  2 +-
 drivers/iio/adc/xilinx-xadc.h                  |  2 +-
 drivers/iio/cdc/ad7150.c                       |  2 +-
 drivers/iio/dac/ad5421.c                       |  2 +-
 drivers/iio/dac/ad8460.c                       |  2 +-
 drivers/iio/dummy/iio_simple_dummy.h           |  2 +-
 drivers/iio/dummy/iio_simple_dummy_events.c    |  2 +-
 drivers/iio/gyro/bmg160_core.c                 |  2 +-
 drivers/iio/imu/bmi323/bmi323_core.c           |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c     |  9 ++---
 drivers/iio/imu/kmx61.c                        |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c   |  2 +-
 drivers/iio/light/adux1020.c                   |  3 +-
 drivers/iio/light/apds9300.c                   |  2 +-
 drivers/iio/light/apds9306.c                   |  2 +-
 drivers/iio/light/apds9960.c                   |  4 +--
 drivers/iio/light/bh1745.c                     | 50 ++++++++++++--------------
 drivers/iio/light/cm36651.c                    |  2 +-
 drivers/iio/light/gp2ap002.c                   |  2 +-
 drivers/iio/light/gp2ap020a00f.c               |  2 +-
 drivers/iio/light/iqs621-als.c                 |  2 +-
 drivers/iio/light/ltr390.c                     |  5 +--
 drivers/iio/light/ltr501.c                     |  6 +---
 drivers/iio/light/max44009.c                   |  2 +-
 drivers/iio/light/opt3001.c                    |  2 +-
 drivers/iio/light/stk3310.c                    |  5 +--
 drivers/iio/light/tcs3472.c                    |  2 +-
 drivers/iio/light/tsl2563.c                    |  2 +-
 drivers/iio/light/tsl2591.c                    |  2 +-
 drivers/iio/light/tsl2772.c                    |  2 +-
 drivers/iio/light/us5182d.c                    |  2 +-
 drivers/iio/light/vcnl4000.c                   |  5 +--
 drivers/iio/light/veml6030.c                   |  5 +--
 drivers/iio/position/iqs624-pos.c              |  2 +-
 drivers/iio/proximity/aw96103.c                |  2 +-
 drivers/iio/proximity/cros_ec_mkbp_proximity.c |  2 +-
 drivers/iio/proximity/hx9023s.c                |  2 +-
 drivers/iio/proximity/irsd200.c                |  3 +-
 drivers/iio/proximity/sx9500.c                 |  2 +-
 drivers/iio/proximity/sx_common.c              |  2 +-
 drivers/iio/proximity/sx_common.h              |  2 +-
 drivers/iio/proximity/vcnl3020.c               |  2 +-
 drivers/iio/temperature/mcp9600.c              |  2 +-
 drivers/iio/temperature/tmp007.c               |  2 +-
 include/linux/iio/iio.h                        |  2 +-
 65 files changed, 96 insertions(+), 112 deletions(-)
---
base-commit: 9090ececac9ff1e22fb7e042f3c886990a8fb090
change-id: 20241023-iio-fix-write-event-config-signature-1bc1f52fdedf

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>

