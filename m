Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA871B6CE2
	for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761174; cv=none; b=Lw2UpHP4VhM44DwQLWkdx+letpVQPhoq4G+iAJ0o1N5F0ZHJdJ3flnt2izt97UtyY34nAzlqtTvMrOgasHm8Xg1Ni2OUbjJ5efwrv1R5enURckE2R1lUpJHaPmU2Wu2ejvg0ACJYCFYoKhKIH0uauCKkki0AV5MNDxaz5/1qCW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761174; c=relaxed/simple;
	bh=+bxVYL5wsOCq8NXOU21E6z0IfQCDA6+5AU4zgquajXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9b3zdIkjIXp86/LuF1Ul0s3+apHI5mfbpB26+fPYTroUeex8jqFxHBIIqqe+opnZTVJ7P2ucRWdHA0TcILAYooShvioSYlnZu3hRwWyXC3oiHhPt1zDlLSqigEyPm1BWNLmTevXn8BHbJ5IjORDIFHVrMnGcwDpJrwR7TtQplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xF7KuFue; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xF7KuFue"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4ba20075so428841f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 24 Oct 2024 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729761170; x=1730365970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duITNe75XLdkXVHfqcx4G37ll9Oas4mILkoMai22Wuk=;
        b=xF7KuFue5u31DBjNrpWJ5u60SPx/LDt4jy+dKD7Kdc8HBg+5hNBla/2etEYTKgtppM
         gRozvqQ/0d9QIRixy6oaZEL6c+RMrRXsJPXplAkqm/kNjOsv/M/reG2J45/wVPRAxcjg
         VqQHk7JNddXzwhB33oA5TWgrqJrxdll1XYKwQFoV+38fLFKWfDMvZpdZMQkMWfryzyre
         iQPqCILHz8hnyzLgn83oYo+8BAajvaupNbvYfUNTww/RRC8cITeu/gQEagzD1hawkhpu
         Q2G70CUEYxYV9WRY8p5eMTGNvncF4C4Q6PH1yclk9H8zho01FDRwMBhc29vBbMrd3FMo
         jxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761170; x=1730365970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duITNe75XLdkXVHfqcx4G37ll9Oas4mILkoMai22Wuk=;
        b=xADWv6/wvTLEszYH3/VpUElGNzQHWf+1GDV/uw0JJejPc0eU3n0dl/lq7lhFsRJGAR
         pIoRC4UNjSLQHrb3irX9yeNL2wVaQirko7TNaJ0tdJh2PHfunkxXz7qqHa+rSIla+mLJ
         1IhVFEsyRvei8C87xcUTS+MaAFCwp2B+eW+BTbs7a6gawzSxfrwBB9yb063rdGhqVhgI
         6N/rIVPME+F13OCnAoPEbFuK88qV5x5iDMnj3JTt6o3ID5/RsXk6KXLGfnGv2AKWVBnU
         5tNT0ODKdVLxXbl/rOuGEV6MrcnmiNH8XlW3gSDFmjNr5F+1110l6xWjB+FXWM+4e2qE
         6p5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmrLcrkncoKvikwBR6V8416+jZn08SKC0ZDsErx6+0EeIa79VVAxLFZxDFgqQsBhu+uRZ1MnV6d0j4h1NCRJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5n75cn2fAXQDjToZJKqZlBgR+NbbUkKiw2JNbK7p5q2KQsBOa
	gpaADGydjHDmBYpPV4ikoe+lmbCdEwYxFB1hazetXYqaTe3j2MpnhC9qaQbA1/s=
X-Google-Smtp-Source: AGHT+IFd+bjGts93b5OuoBtQQABH8NKlASdqk/65SlHR44FOjuSVpR7GA/iovKo4zKUodKx38sL06Q==
X-Received: by 2002:adf:f7c2:0:b0:374:b3a3:3f83 with SMTP id ffacd0b85a97d-37efcf85335mr3594577f8f.53.1729761169925;
        Thu, 24 Oct 2024 02:12:49 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94071sm10843701f8f.89.2024.10.24.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:12:49 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 24 Oct 2024 11:11:24 +0200
Subject: [PATCH 2/7] iio: light: ltr390: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-iio-fix-write-event-config-signature-v1-2-7d29e5a31b00@baylibre.com>
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
 drivers/iio/light/ltr390.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
index 8e0a3fc3d923a6f65d2a629c87e7bfd35d82a507..ff6b5d8b582b33eba60b769dff529caa00fb7244 100644
--- a/drivers/iio/light/ltr390.c
+++ b/drivers/iio/light/ltr390.c
@@ -558,9 +558,6 @@ static int ltr390_write_event_config(struct iio_dev *indio_dev,
 	struct ltr390_data *data = iio_priv(indio_dev);
 	int ret;
 
-	if (state != 1  && state != 0)
-		return -EINVAL;
-
 	if (state == 0)
 		return regmap_clear_bits(data->regmap, LTR390_INT_CFG, LTR390_LS_INT_EN);
 

-- 
2.47.0

