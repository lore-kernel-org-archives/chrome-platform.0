Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AB3CD8A8
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041918; cv=none; b=WabMEjkmz6aek9xM6qDME8HTFnsvY0rDZad8+BDRzau5onbXtbZNvp/Z7HWYjTrD79chxMxfF/0uFMkoUqVQRSEBg5J6Kc35OSQq5adq84VyRc5e2sHHUI8nfUxaokJ2+Rnw289PX8kZPtEweoXguMxmkN8Bdzqmy8RpmZ79thM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041918; c=relaxed/simple;
	bh=iS4Jf6/jCwjgAYz7f9Ed6IRXIvpMwekq5NKW96Q/f8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzHclSd+mqOt/iGemPxnhny2C3nZf8FaoVm+MreZwjegzm6UVPqnPwh1X+33OKsY7U5KK2ukomgSpXxmhv0BbE0qRNIgjS2xpmpSt5XquDO9oV2YTi8k/U85vJbES3z9xOD39USb2diRTaExmwZAdx8ormwVNDy/88VQZB6HHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=YqTeoMb+; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="YqTeoMb+"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4043b27ddeaso876609fac.1
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041915; x=1779646715; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=;
        b=YqTeoMb+TiLKnCkQMp6iikO+2fM4qo/4jiAwO465V7XhnTSaNWT7q6zpanFvX9wUFX
         ptBX70JI3rTHDTnI1Eet/kliVYU2CP6beYZhhvqI+uKAS2x3r79zr5YXgLXkedNe8dDy
         suH8HKl87L0HEdnq21GyR0xvNqRi/q2bYpZZ6BsKBDahocwo2/T+hZE9obJS73cSqgw0
         PJUPrqn8+NmpwzkjWfMWieAEAyoLf5n/xHzgubvOOiw+6IFHkf1N6S1Vrkf8wscoIB5Z
         cTb/VFt/gwql9cx7/Mffm4ea+JRY++/YobrD/NtQxlDqZY21IqpILbSJuLRVIDlEpF2C
         2vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041915; x=1779646715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=;
        b=pvmYNooNmCDCDQOfTBYXiFzmXa3Dy8MGlNIu1SwpA15VPBnL/WTkGiUQyYEBws0ESN
         LkIBpaBN7A7XxNxpw4ZxFEDWM7CaD0SSA7jQfoDynDWaISQIZumjWIwIf5qEe3XE98vK
         nXYzAH3O8izaJL83GSjFBkccMD89WnVrrwVqi7doZOy5PJZN9F9DPOqNrgJ3QXOAvfz0
         VwxLlP789whTs4uj+QH8dWr77fdqdJstaTqaDiC/TEvE6rWTjoAxVWtSAoxBklnPEj3e
         hwE8nno1pg5/3LJx9iKLT7QIBlVWLfJQFmMShvFRdYbLGrAHiemU67jwM+zCS5TbxeKN
         PMGQ==
X-Forwarded-Encrypted: i=1; AFNElJ84gGCnSKsVIKh4VBqWfDhkOp4n24tzQi77uo8w0ghXOejQ92GX6imxei4HxNam3A5wWPXahMpY85Te+EqANu4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEGnvkS/7MBhuGybzdttufBNJPysoxF4Xjq2SYgAFBH6onJK5m
	6rs4qmaeS3Mv0QU3ymZQATLJdnIxUHDcFXJOYsq1XRf18fI03xruPuFlnXlQPMTK490=
X-Gm-Gg: Acq92OEAZNDybvDxvN5G4X4qSynNuGW7fEO7sP39dNc/Ybs53biD3UroRTVsTfkkwHY
	FMm04OENCoNHbNQr0VH/x1avRl/NBn0AQKNhWD9Lh6SC1piQj2lEsMcr4fFoNvwGW3xWAsoNafb
	kp9ac9FRyGnQrBR3WOt6WwJYEEYiriMdK//iwMgYJoMNMByWxhDXhouuFp2IER7CbIsf2SJegmY
	k+kH8YKpVD6Ku/YLNk11t8weIYGEt0Tw8Orz4Mos4jYpBkgD1BjbIxzSL4c8Sb9RAruEgCYEMVg
	yFxmR0RkFlVN4nz7uRL6J/r+nW2bbiDUH5yKi82DrNTg7L6GhcxitQ7dJMDeGlpl8PSEitCyE/Y
	ima3Uj8qR2yxF5DjMISNezH8pTOTBVnPdqn2Bm9sknZJRFetfpi9DK6fZkxZcoB+46hhmGcpyzx
	wy6oJMaJ893N+VGswL3fOStW2xrj4=
X-Received: by 2002:a05:6870:249c:b0:439:cf80:6393 with SMTP id 586e51a60fabf-43a2d9e7bfcmr7616057fac.14.1779041915129;
        Sun, 17 May 2026 11:18:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:23 -0500
Subject: [PATCH 6/8] iio: common: cros_ec_sensors: simplify timestamp
 channel definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-6-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=iS4Jf6/jCwjgAYz7f9Ed6IRXIvpMwekq5NKW96Q/f8c=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZY5lNWSWQqxQfk4uVR1kmyHsPoVsVNYqIx+
 qnGwFvJ+n2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGWAAKCRDCzCAB/wGP
 wPePB/9RG04S1WGAlHEaFY+gM7XX9kJzGfYQvsVLrnb9HziWNIBAox4TGSaD20qYJkSvGsvZU9u
 1Sl57NFRld907Z4ohEajFprIB5hxn76yqOQFag/p4BnUDTBIokjTMi/SQ7+FIy6EK9/q4oT0wCq
 RRZQWdwIjdANiLo+eUBFPSDrslKvprqg6kgLwku9TCLrwbplgFed/uOiDPdZEBoGtuMq0N/CMkA
 FABssCiGug7FzwbCfnfJW8Z5c+Q+DPClR63Xbc2tWTRYdFtuKVf+SIJHb0QMaazTaRHX9ew7IzN
 bI2icbiholgNnAiJFhgHwR6XOd7ByyqUTiseleiH1zZWvil4
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
index 6e38d115b6fe..802c811dcf75 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(index);
 
 	indio_dev->channels = st->channels;
 	indio_dev->num_channels = index + 1;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index f34e2bbba2d1..bf49453fc051 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(CROS_EC_SENSOR_MAX_AXIS);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_SENSORS_MAX_CHANNELS;

-- 
2.43.0

