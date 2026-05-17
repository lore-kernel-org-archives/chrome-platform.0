Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8B3CC300
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 18:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041906; cv=none; b=TVKSGR9QtmW7XPs+L69z0QJcTIfZO9rEc86roaXeIKrxwpszd9qmy6ANpsDWSmbzT1aZWLCtcE9XveGIIjgallk5WbupgmcTCdILvpsATwyQBp1jLxkxflsyOSHO4dgp2bfsswRLU4lxormGlbaW8vRhshuCvH7ttBRe28lHTMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041906; c=relaxed/simple;
	bh=YHpI50wSYZTXW1ieL+zX+tDCAyrdW9auMcLS2k6lfoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMcjWeUJ4yXccJvsiykCGJYIsxE6TG5Fi3lzHaJBQPe54Y4Re64hWyXhGDIIn+S2OJeBHXgt7HNrlAVE/EuoqmtUOvr9iuYsieYqV/jS1EcGr2M0Mh3hL9AhJk2PYb0KgulptB4mzvRFHWpF2e0+DysscIH8hbATGI+4LyHsVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Z2JgFGZp; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Z2JgFGZp"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6949192b843so229700eaf.1
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041904; x=1779646704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=;
        b=Z2JgFGZptEsAqhwwOqHefVFAuTOJ0hs0P00NForgjrmS3A5J9ff00S55bwk7HRRaiM
         AKu16qkOH/Qbmk66I5KF9d3tR5o0xJisq36zSCAQTODAqy5lRDvyo7r7MU+b/H2gaxxa
         t2g5M6ZmcOVkDP/qv2VVBGzAkBagsdZh8Srq6R4/WXCLeUWW+JH8BYW/0O5Elq7b1A6k
         mugAtxnV44p9PaC6iWkurrrYr9aNMplkpMqbMwEufGhVpxFvGa++x4Bp2lLkx85zcy7s
         ouKe1oGE46aZGngRdyirPUeovzWZ+JE2TBFXnHU487Tqddwkxhr5Wo5itYhpo4XVcsvm
         fZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041904; x=1779646704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=;
        b=Pz/vSU2iXdtcBcWbEPymMFDeh+7q98l4UTtOQVan7RJ/WLpxTgY7W3xsuj7QZZ2BLx
         Rlo9yQEHBnUGsAl22S4FT8PwTjjlBt4bdxYRIW7BAFVj0PGnKwh8C0VKeifbRBuSN5yY
         N4OE2FpUkX7/T/EjV/VnRNbx231BvdX8ms6yUW+Pn2D9c/yLfaccJNvKascyPy8GD+m9
         kM/wL0rGZLS0+4BLoFhhV6bU8qXBtPEs61bJ7Z2gbVjFOhAbSiE5m6eKRPiPRBLwDwnr
         F+Kj6JytRSr9SHsxaEV6oGSy4yWTaDvyqtvyNoeoEBtLL/dt5+0UKZvfyoR+vfx/1DwR
         mExQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xgEgk+aEWNvDxUlZ5a7/EAID9J9+2K1V48lsz4SI4Ua9esNSg4rwTBwmo5zuRE9iGNXEkwdhEHpW0xJTiYZw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQ7u8U7oyZUSFg7RnKkwGGooWL8oHs0b3tjiqc8tdrkc1BnQB
	O2ayojF5FORxesfjdIx9mky6YlX5LNsboBcPz7h5AhPw8ur/JTesQuFtyyde3uFVB7U=
X-Gm-Gg: Acq92OH2MPrw3DHoVTYg8XZFhb4kMXp5TPovDggpzXHO6bW0bPDy8Ja4JzqAYgGWtnB
	Q/tSEIm6oqldVD8ZFoqXbkBnmz59QN0EvvjHM6XIorV+yNJcRylJDUd7oUgsFrcjiTuW8uNTwgK
	syBkQmDHAlc5XvxfUD+Auk3TrJVwbJ/eO1TeDgfBxh2kzlwDQWooo264MJze0Srr6NvEJEIN6BP
	kkeFnngqSGD2U0j3nYfswQ3h9aMRKnV3sOpQz4XPFYxeqhBL/XlDzVoT9PbqNRf71M1RozcURUH
	1lUbVv/HCEY7m8q51gKHFHlVPp0f0NQzuB0TH/qz9G6rawnYOxsOmDcVs9V5fx1xrsUrBnJXjA5
	edchzoyl7CN1GbqmgGCqdFZ0n0U6pL0FINBVyNRpBjlg7D/+6QW80TUFIkHKqCgKs8t2iXa87/D
	sH8g4FQ+rbXAfunk2vOQGdyBZm3qAoOXNuU91qDw==
X-Received: by 2002:a05:6820:4c87:b0:694:9707:4e59 with SMTP id 006d021491bc7-69c953dd3b3mr6941197eaf.46.1779041904452;
        Sun, 17 May 2026 11:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:23 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:18 -0500
Subject: [PATCH 1/8] iio: common: scmi_sensors: simplify timestamp channel
 definition
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-1-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=YHpI50wSYZTXW1ieL+zX+tDCAyrdW9auMcLS2k6lfoQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgY2aTT2VX5TYgMCbz8OOiBDnYFmV3i0a+6HO
 ro398kMNK6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGNgAKCRDCzCAB/wGP
 wOFCB/4xQ4eSKQgFfsKouXQR3vu8NexauORSshAXou2t3MRLSZK5t6EF9VUuh0inu/5WRCWFGej
 u4u1nzKt/RtnOitc15cyY9Nnn7nkczdAzczNckuYghWXqK91XhaJgcRwG/HFuNtLIj4lKoxm+Sf
 q0Pu9iIKleW9yv4r8X+98Kbv5DjrCSCaPYDHTexcSLUAT8wJohTJAL71EMnB6FODtdCObmx812I
 rURmDEmfF633QDjdS0XJe4MEqg1T4IkiUhtfcGY8NszNTCxYMwSfI7i0oUR13FIruJz1m3VsXVT
 jK2zkSF2GmXef8vaZjcYIebODvZ4ngMnNUIx3PtA78Mw9WPo
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

In fact, there was an error here as the sign should be 's' instead of
'u' which is now changed to 's' by using IIO_CHAN_SOFT_TIMESTAMP().

If we find that this breaks userspace, we will have to revert this
change, but seems unlikely since the timestamp channel is well-known to
be a signed 64-bit integer globally.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/scmi_sensors/scmi_iio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 5136ad9ada04..86e1782deee5 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -419,17 +419,6 @@ static const struct iio_chan_spec_ext_info scmi_iio_ext_info[] = {
 	{ }
 };
 
-static void scmi_iio_set_timestamp_channel(struct iio_chan_spec *iio_chan,
-					   int scan_index)
-{
-	iio_chan->type = IIO_TIMESTAMP;
-	iio_chan->channel = -1;
-	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 'u';
-	iio_chan->scan_type.realbits = 64;
-	iio_chan->scan_type.storagebits = 64;
-}
-
 static void scmi_iio_set_data_channel(struct iio_chan_spec *iio_chan,
 				      enum iio_chan_type type,
 				      enum iio_modifier mod, int scan_index)
@@ -629,7 +618,7 @@ scmi_alloc_iiodev(struct scmi_device *sdev,
 					 "Error in registering sensor update notifier for sensor %s\n",
 					 sensor->sensor_info->name);
 
-	scmi_iio_set_timestamp_channel(&iio_channels[i], i);
+	iio_channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
 	iiodev->channels = iio_channels;
 	return iiodev;
 }

-- 
2.43.0

