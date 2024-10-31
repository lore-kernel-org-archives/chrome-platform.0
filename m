Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E21C461C
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388447; cv=none; b=I1VwzhSzap62RG+Dux3xAOHyuczFvsWfgIf9mO+eixnpK0fDKIEDxkAoFSnxg1Y1hVMQ6Z43n0tG0hW1bMfAaOSxMs/jb8ZPKKUmMQpKa8xX8x4O/R/3ePKNebwRATnB0AMIjnv4xQyTvM7y+i5d4ztxiBuRQZEmPgK9phdcnz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388447; c=relaxed/simple;
	bh=eZtGUx42EcD+JSWC+NT0I8Ira/ZgQWDva53H8CbTnwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUIe609JPYPI26KjA/4Q9g8Tk/hzO3hWQfH/oYngG53u3evvUIbVeXSmlDljXrxCEB1D0Kw2guLG6jpOy01pdKDKe7O4tM9W04PeF4EyZ0l4dT67olJmKyj4BN2d0fsOwt1QbnJ+/fl6P+N4PHbPb6b1hfLrn/HCs9zi80af3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EWJ6qJs7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EWJ6qJs7"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1257037e87.1
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388443; x=1730993243; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eFpuHm2y8IhduDZB/M513Whn86C6+1mG/A5c4wAVb0=;
        b=EWJ6qJs7ZxRqXM9X1nvSQwV1zxV2pQdRp5Yx4B4HW98+S1lOSdNDxK2yjrlgQXVp8i
         yfv91LIS6KKGDJ649EkzNLquYKh0gWdjDt2NcwLU489tfPFehiwhnNQCpPME4QRPsWb7
         61wzBEZkGkxUuO2aqp2MsifQdxWNQw2Ga/446usNCU7rj4Clxy6E2zRXCF0tCHCTV2P/
         0gyHzF2A9ZNPstj9Rel9DOVuDptgDPEz/wBgVAkjtOWClfBpV3RN89LGr3nS32+FO/O4
         +HMK+AjWNmJzyQoF/b1rBij3BIBFTIRKUrOSYb6RISziJ3VaGxP2FA3i4+Wi5Z0oF92l
         3+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388443; x=1730993243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eFpuHm2y8IhduDZB/M513Whn86C6+1mG/A5c4wAVb0=;
        b=QufxR2khS3MXfKRv3f1WMjZWq4PDsUf+ZJaYlxDs1LMouucDg7yhYJtmp8cCwI1/Cl
         TrPfxMyX9AQl6X988LPEoT0vQPjseOXgm/1cNzuWrQn+uWQH7EpEat7IszKWd6MuFP6X
         lRH5PeVjd2brl/E3IsHH2fNjM8f6JsUi6tOKfXCF+8ftrOjSGV088njQaShaB7QbV9g+
         jfUsAEucCaJ6saEcqy5F2x0ZtZPGTBR61DX5foSM48hTrxX5lKCyHcrwp3SFZT677O7g
         kBDi8k+/ZcFwIP7mHaE4BjUXXNGV23PvgxC1g5GbsVnWne9EihzYUGnncJN566iAfjL8
         B4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpQ0Mn42jM9/EB2JvK2RCxdPsxbu5MkZA72zmG3Fz2Tdy/6FfKsWEBXC+WiKFAQgrws6zjTIjVXcpIcK4SDeA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3tib6CtcxaENaQCp05LWb6KhvYhD36010OLSyqIC+XXpQwtNY
	4dU8Z49Aw36j8fHoFugjQR0MZgHfDa90uLybytHx97ENITyOAb74W1jEn40DZQC8LQ6u0n+4cNm
	H65ItOA==
X-Google-Smtp-Source: AGHT+IH9GtPIDfEpLZ8dUQUUPpUuX42GuH32Iyi1Pg0JcJazEapLSrEjVmA9nEmKnKLQDMdChJoKlg==
X-Received: by 2002:a05:6512:2341:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53b348c8978mr10450230e87.13.1730388442599;
        Thu, 31 Oct 2024 08:27:22 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:22 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:10 +0100
Subject: [PATCH v2 15/15] iio: light: apds9960: remove useless return
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-15-2bcacbb517a2@baylibre.com>
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

return 0 statement at the end of apds9960_read_event_config is useless.
Remove it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9960.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index 7b3da88885693c488807da459ceaa1cbb3881bcd..d30441d3370309fce9d6c717d42b829ff1db3174 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -749,8 +749,6 @@ static int apds9960_read_event_config(struct iio_dev *indio_dev,
 	default:
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static int apds9960_write_event_config(struct iio_dev *indio_dev,

-- 
2.47.0

