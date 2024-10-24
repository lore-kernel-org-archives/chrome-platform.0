Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8863C1B6D1A
	for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761176; cv=none; b=sPwzRoGhNxunltENLz5DQuxzAhNLhIBXJJt0F/LAkUEDTRkjFSU3FRoDWdwT1EuzfYvw9mH+vznXguchK0VxPQqodXUCsbGM+aO0+mSCtU5YZrv7z8CSt2vw3GZQvdACVK+uPznGVSM9JkxfmOHOL+4mDnP7KQhkrNrlGrrt4zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761176; c=relaxed/simple;
	bh=n6B+DjS2nlSaMuuYUonULXAepr11BX8wK2roVoPsJ3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfHFarzw6sN0SKsZvatCydIXHxOnd/B4pLYQsJwNNRGgU1NC9Jbi+Fblc6x5IiLB+SL25w68d/ymUIoHlM4YVDHxEr7cRMEO3QG+HDX3NbPXe44ZJmtPQ2B15b2Ip0tmJ+KdwKOmKMZRaNrHMscbs/VDmXJ3+rBEXD7Av+hXqko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2wg07y27; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2wg07y27"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so556053f8f.2
        for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761172; x=1730365972; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPO7uddPmJGeRvDQ4DDNm675wgeGPQg+TX6wZtIY7Fc=;
        b=2wg07y27xLbJHts7XwAUcU5I2RhnNs2DrH3RXLJfkCpkOznhh82/ewKsrxX4BaNub1
         8kK3obYmfLPeNfnNRTAKs0sqOTt8fhfNJmfGA3E/hBB5FPdRqp4XDDEbcDgcKUb8eSpU
         Dcdv9I4ZyWwingjvpdXlHrXB69jIaLoRbZE2TP5gHTjpop/US9WMb/tCMYNKUYSEbS1o
         wzCiKHoBU97+exFJiEbkxNGGGU2bQVXcJPEmEyJYrdcEUbL3mSlJh8A4h9ej4AJma41d
         SaoLcseCcFyxnRJJsxZpc4CcQ3jRi+GgwBIC9hgX+/LmQWXkfwdKeiDdn8+9woSoBPfO
         Uh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761172; x=1730365972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPO7uddPmJGeRvDQ4DDNm675wgeGPQg+TX6wZtIY7Fc=;
        b=ITB1WYq0+TS85jR6gDnZhroZTEKMhUF+0tNg7fD7UnCxrENeJb43c/IixQCkKD2moO
         naZjWyWjXfElrUvUVhdVVpF/32y+J2YZnPXIxd3H59WWdxxhqodiHbqJD6XSTF3gCjlo
         ASgeAT9KSSHSS1D2saffLMSUiJLIKCneLPxD8ajYOqXC0oeAoXZFXftPpsmFCrLA5Kqk
         XEmtmSeH1HM56bm8PnB/i4JPBb5Ohh8BdSXIeX0yRhiZTZuHkd2PIr1p9+npUF9g9MGZ
         zuWnR3kMI3HZSKjEFk+kv19noU/PqZjLxtdnH2UmH1JJxSK0GaPSwzbdGOMHmm5ppvXL
         xS5A==
X-Forwarded-Encrypted: i=1; AJvYcCV3duvyVVFxJ6vP+5tuZWHRfrxNES37vUncedQfq1yWifPS6viBcAZ+jnB/pP5dFCvPE6FrvMTBZEdH7zJcVh8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5pRdIhAOQAUJt21ujHl9o5RUoiv8FRaBdTeSCQrzRi7G3aCqh
	CUPmtnrlaCp5KmUv/Kom8TVx++3vhajy9iMXG/b/v+FX9wLAxZSn41z4LiH+iPk=
X-Google-Smtp-Source: AGHT+IGaN73d/bgLeVCGlsGNxd+TOv2AHPR97BWrXwTr3MwJBwZ4zF+VJDI71VQ8iFHk0s2jf5QZwA==
X-Received: by 2002:a5d:438d:0:b0:37d:5042:c8de with SMTP id ffacd0b85a97d-37efcf06011mr4293964f8f.22.1729761171775;
        Thu, 24 Oct 2024 02:12:51 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:51 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:26 +0200
Subject: [PATCH 4/7] iio: light: veml6030: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-4-7d29e5a31b00@baylibre.com>
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
 drivers/iio/light/veml6030.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index d6f3b104b0e6be8e095a1ad9f20acb81ce492630..95751c1015909cd80543a559673f435d1a168f68 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -826,9 +826,6 @@ static int veml6030_write_interrupt_config(struct iio_dev *indio_dev,
 	int ret;
 	struct veml6030_data *data = iio_priv(indio_dev);
 
-	if (state < 0 || state > 1)
-		return -EINVAL;
-
 	ret = veml6030_als_shut_down(data);
 	if (ret < 0) {
 		dev_err(&data->client->dev,

-- 
2.47.0

