Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF11B21A5
	for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761173; cv=none; b=KeKyJduMuaqYULeU96hmf1ha+h1vk0unppx0LwKlOGdVdGcNadaIZmuEXiX0tccYjfZYADg8b+yGJbBjL/yfMgpHH6iWmNSOC1xQo9iBdm8zYBSZeQDU1hGzsHhJ0c+F5xJo8mRpVT6XSeC1vCujN9roVMHS5m0ajdEvJNLJvtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761173; c=relaxed/simple;
	bh=bpTnp9nT2dKpE0zNeVdWpkY1GIIYuomrwdvCKfM8qu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgh0IG6vRP2tNx403wrUBOqY1NIEqho3Bdp0ipeQ/W4BPt9lLTedDqqJyG5I4SrqKonh1F0heqf0UzsLuaY0A703J7/k61BHgakhxFIf3l8QMLnTWfgqdQ56TH2nFte2/jR5xeh8CsouxmVfI9mlX1IfO+NDXLZdXa2AYqGFbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tcXNzVQn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tcXNzVQn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d8901cb98so1176451f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761169; x=1730365969; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIQ2MP5pDvvYrbfNGj0xV8zPitW4RS++GGpHycvY1/k=;
        b=tcXNzVQnD0CVQN2u4udVlqB7q29SRhlIddQO8Ga/CmP+qSuSHUhWO/o5GKJSmR5GgB
         dsz64uEdAoocVGGPKXUVxG5GTTp7qemZKuAQCgScXzKsiSHslcXd95PZC+rB9/QRGjhz
         JXSMpEO0VQBrZwbNrTMb8QNE/vyWkRJJJfo/KCmFRB75DcaXwnGgK4tx2m9lDemppzyU
         VJMaLaBWysl6ze1FwRep51YtswvLk+oOVh1si25LxYMr3f1pctiopIBkW9va9wqxGtfF
         uk2QJuewqWVh5fPCMe/XqHTAy+xAc7Udl+EWxpfiMYJLmSI1w3yHmD1+LtL/nUmMMwwB
         Zd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761169; x=1730365969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIQ2MP5pDvvYrbfNGj0xV8zPitW4RS++GGpHycvY1/k=;
        b=QMrtHVyfeW4f7HAIhHvgI06l5lkAMqm7Ee6NDFOGApQPzE5hVIXESNwwJ9tMQZy2hY
         +3dRT65VN4vxz40yV0/Y5LaF+ftIF0K+4OPGzqVy5G4ldLcMxsPDVQnfE2S8TTHpLY+M
         Sad5wAk+ivE6HEquEnwPaSn8DyG4fkJVtVdKb8W7jiSMfBwQ5tc72CBkKaCUIIAsIQJq
         DOUySNEEXUfYef7F6mqcmFyOip4G7OpliFSoVTZYib2ZVJDX5GmTPXmC+LxGD/9A2BQy
         Xyq/IrktG+nb+xUXH+OCUzb2ehrZABxnVIo+vNy65AkL7AEVXQeuomFf8gvWMyfxcCEj
         8Fhw==
X-Forwarded-Encrypted: i=1; AJvYcCW0yoMVTXDJTXNRNBP+A3umcF89kd1bZUBIVB5yiUj01Zw4jNm1NMvAMKOwZ6r4lHLsQj2PRkDB3Ju965Njbxw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+cv/dZ3n2tQrtDa75t97oaYUNc53+p0euyc9FpXCIQ3AiCRcn
	pBofEcwrfrbVBu9eJFCZCjtKv0PBnaphWdsr8Osutd204sV917aWfTfabKWotCY=
X-Google-Smtp-Source: AGHT+IEntWBLa/5dqURskXL/ARSqsAtqEzMl2o5Iyp6sjz8yTHvxrX3rp+R1PtjRMJFP/N8oYDaypw==
X-Received: by 2002:a05:6000:c8b:b0:37c:c4c0:4545 with SMTP id ffacd0b85a97d-3803abb4947mr832029f8f.10.1729761168701;
        Thu, 24 Oct 2024 02:12:48 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:48 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:23 +0200
Subject: [PATCH 1/7] iio: light: bh1745: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-1-7d29e5a31b00@baylibre.com>
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
 drivers/iio/light/bh1745.c | 48 +++++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 2e458e9d5d85308fb6a13d9dbd845fa03b56a40e..fc6bf062d4f510886f909509d8115f0cf892f3c4 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -643,41 +643,37 @@ static int bh1745_write_event_config(struct iio_dev *indio_dev,
 	struct bh1745_data *data = iio_priv(indio_dev);
 	int value;
 
-	if (state == 0)
+	if (!state)
 		return regmap_clear_bits(data->regmap,
 					 BH1745_INTR, BH1745_INTR_ENABLE);
 
-	if (state == 1) {
-		/* Latch is always enabled when enabling interrupt */
-		value = BH1745_INTR_ENABLE;
+	/* Latch is always enabled when enabling interrupt */
+	value = BH1745_INTR_ENABLE;
 
-		switch (chan->channel2) {
-		case IIO_MOD_LIGHT_RED:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_RED));
+	switch (chan->channel2) {
+	case IIO_MOD_LIGHT_RED:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_RED));
 
-		case IIO_MOD_LIGHT_GREEN:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_GREEN));
+	case IIO_MOD_LIGHT_GREEN:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_GREEN));
 
-		case IIO_MOD_LIGHT_BLUE:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_BLUE));
+	case IIO_MOD_LIGHT_BLUE:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_BLUE));
 
-		case IIO_MOD_LIGHT_CLEAR:
-			return regmap_write(data->regmap, BH1745_INTR,
-					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
-							       BH1745_INTR_SOURCE_CLEAR));
+	case IIO_MOD_LIGHT_CLEAR:
+		return regmap_write(data->regmap, BH1745_INTR,
+				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
+						       BH1745_INTR_SOURCE_CLEAR));
 
-		default:
-			return -EINVAL;
-		}
+	default:
+		return -EINVAL;
 	}
-
-	return -EINVAL;
 }
 
 static int bh1745_read_avail(struct iio_dev *indio_dev,

-- 
2.47.0

