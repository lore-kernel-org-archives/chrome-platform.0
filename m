Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D591BCA0F
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388442; cv=none; b=kpdj7zqdx81j+xHMloolL9ZipoqL4kE2qPem7C6Rqipz7dt5MlwlwBLZjcWVMyQ29clO3fELWQmO0UHVS/NomiXQFnYWZN1tby59cZNX8+bZBMPPPrh8+O86vJjPtbAELzo1rFBkaoymNPWnLw5eQBjXKMA2edvVleB+Yv3gYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388442; c=relaxed/simple;
	bh=lNWa0KqaStuVBH6MPmyCH56JtdUmYjodW8Uzx50cst8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsqJRFRF0+uCgK5UXO0Q1r02rcK5msVttimaF0oIB/qdep6j/Zx7VSbWh+lPHh2QkVwcWpnpXBQen+6NgI7yceIhOd9kE6SUXg5tj3HEhrdSI6mwkBzsuro+Jg/5EoG1Po+ktxINaBXkF5wtT9C7SlEi7YtPyST99SKVp7xXoiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ixmw7N4W; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ixmw7N4W"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1256917e87.1
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388438; x=1730993238; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFsb0303PjNI48V2V72P3jKH8c+L4bxDvzzJkb075Z8=;
        b=ixmw7N4WMRqea6PkRLnUs0ee3R5S5J1Z+8BojG9gUzZn6rB8WUO0J7cqu+lhSVfUI6
         nfXICCZmpt7mthPyuIYbNFXoBd5MzJjojds67+/lbCPdg5zXU6jiJ1pW3jK/AkwOjv/v
         AADYIrTY1U0sZ9tXQ/mKUhgoE3UmGeaHyyqvQQqHZZHAW3leplibpwilmzISNOYNlrJf
         NL5RQiYSuBdNegOERrZge+66tvgbmsP/KaLesK7oKeZNPj5KamDsmNRNDepv1Xvgg7PJ
         BOz7JteFHVEZHUvggEuHHC32utknwczb4WC/jEPDoX1ogsEfyuEsplZ8lwF+GPmmBxP9
         BAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388438; x=1730993238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFsb0303PjNI48V2V72P3jKH8c+L4bxDvzzJkb075Z8=;
        b=OKDKYwgOGd5Gswd48gopwIgysfyrtW7aw8yEXGg1fzyUPs7zqyjFPD+IYVqmY1D6Oz
         cinlcVgGJtGnP6WcF/bHfgY59bGoJDU6nUn/YAJCQDJeST1oq/kqgH21J/6gfjkqXOrU
         il6pDQ75soAdol6Q2kW7B/YtEfdU88uVAJ6FqZqLL0j7N+rBV4xdnE1nKDvk0Kx0ZcnZ
         SVwfJ8MHHfdTq8OkoWwI+9YoqpCHI0mdQHob+2jK8KzMKVX7upE6TqOMAOZHhQZGOLdU
         LLCnM8tSX2U5aAXjqFUn6jw+i50LFrNYD6kvtDghTh9+HynF2Ndene0rz+fDdVSll+4J
         Vrdg==
X-Forwarded-Encrypted: i=1; AJvYcCUlpnO8G0b2Ae5EKtEmmG2m1rR42N+NTbZYyC3gFsvTPo/Kit4VxsBdvAuSNw1YbSVXoiv5X2M94eD4cDeurKg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJqK6Wm4GU+iY6aNx68BTMj8ZJTC4mn0azdoKk+RUqtFo/Ftuh
	wERAXiDflynZZCexQnNmIphyxP0khmjQq5UAGhPK3KlUH8UiOyA8CcmpqdE3USk=
X-Google-Smtp-Source: AGHT+IGZJyt5pS0YUa3i9kFlv6G7+rYaLlulmcGcSn6EUiy6VmRiBhyhHkSniuvcZZRqwpxExeJiyg==
X-Received: by 2002:a05:6512:1255:b0:539:dca9:19a2 with SMTP id 2adb3069b0e04-53b3491c152mr9322585e87.39.1730388437575;
        Thu, 31 Oct 2024 08:27:17 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:17 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:05 +0100
Subject: [PATCH v2 10/15] iio: imu: bmi323: use bool for event state
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-10-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
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

Since the write_event_config callback now uses a bool for the state
parameter, update the signatures of the functions it calls accordingly.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/imu/bmi323/bmi323_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
index 76a88e1ccc1d89988eb52d6b1be8da0f5005f0e6..161bb1d2e761688dd740635f8a2830e9562d1b59 100644
--- a/drivers/iio/imu/bmi323/bmi323_core.c
+++ b/drivers/iio/imu/bmi323/bmi323_core.c
@@ -467,7 +467,7 @@ static int bmi323_feature_engine_events(struct bmi323_data *data,
 			    BMI323_FEAT_IO_STATUS_MSK);
 }
 
-static int bmi323_step_wtrmrk_en(struct bmi323_data *data, int state)
+static int bmi323_step_wtrmrk_en(struct bmi323_data *data, bool state)
 {
 	enum bmi323_irq_pin step_irq;
 	int ret;
@@ -484,7 +484,7 @@ static int bmi323_step_wtrmrk_en(struct bmi323_data *data, int state)
 	ret = bmi323_update_ext_reg(data, BMI323_STEP_SC1_REG,
 				    BMI323_STEP_SC1_WTRMRK_MSK,
 				    FIELD_PREP(BMI323_STEP_SC1_WTRMRK_MSK,
-					       state ? 1 : 0));
+					       state));
 	if (ret)
 		return ret;
 
@@ -506,7 +506,7 @@ static int bmi323_motion_config_reg(enum iio_event_direction dir)
 }
 
 static int bmi323_motion_event_en(struct bmi323_data *data,
-				  enum iio_event_direction dir, int state)
+				  enum iio_event_direction dir, bool state)
 {
 	unsigned int state_value = state ? BMI323_FEAT_XYZ_MSK : 0;
 	int config, ret, msk, raw, field_value;
@@ -570,7 +570,7 @@ static int bmi323_motion_event_en(struct bmi323_data *data,
 }
 
 static int bmi323_tap_event_en(struct bmi323_data *data,
-			       enum iio_event_direction dir, int state)
+			       enum iio_event_direction dir, bool state)
 {
 	enum bmi323_irq_pin tap_irq;
 	int ret, tap_enabled;

-- 
2.47.0

