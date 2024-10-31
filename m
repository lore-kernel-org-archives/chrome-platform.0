Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E431BE84E
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388444; cv=none; b=gf1inV8OEawDMwqUcXLcnW0Mo5qPg7F6mWZzPXPiGHzNrZX8GMIIqp74GMI6oBFqLJot9H7QO85m/6gKc8wyaw/sHc+cqVHWX4IsFS/9q6g25jtwPgyEa4NVr/mA+27mtwd1g9dm0zcXMVyful5X87BaE4d9HXSUIknTmJ+dIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388444; c=relaxed/simple;
	bh=VmHbF416eUCiuhk2pPyLWQqW2F/AFbNe29dYg0B17jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWJ3cj5LCra7ajQ18yxziYthe3+ANQca0nILL5XtFeEJy6tXPxhOMv+vLaAK5xagHIOHMLQbTygFCtMOoh57I2Q7g25vt8jytcd/FFf8apr0fAoq0dzlwvwORPJWPlqLYnqhc60ucOokeOXQVQ1UewU2ms7kd5wFfs++0HXZLyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bpYr7CIy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bpYr7CIy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so9454185e9.2
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388441; x=1730993241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQxEAbikG832i9VGoZJgFYk9AEf9LJDD4S/9KzYjDMo=;
        b=bpYr7CIyBLuZRKsF6/3u9YkQqVYn7pe1G4JyMUdkUir2Jcj7svIgNdfdskOfWkyX1x
         OoSvs2JPo2pAZ0fjZ2SwZktaNWWIQmZ5ByZwnSNMxHDfehWMYrTCXMNlZNVsim9n3lbz
         C1KQMlI4f18dF1f3BavXmHH2wZL0Tej9SV9vkkDftg2VI9Z2izd71PG8LXVuV2NWBgp+
         9xOGZCig//qk1pzeZHBTDTTQlMp91PRvhr0w4CRz6V5VrjUGFsxmDrSOdfSQKzMwTH6E
         9lAIwPeo8DBn3fU9ME0oxawFfEqAlSTUz3cFu7JntnvYRASWMIpUu74WQEqw3h+8lXzV
         r7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388441; x=1730993241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQxEAbikG832i9VGoZJgFYk9AEf9LJDD4S/9KzYjDMo=;
        b=jzhi46S9ur3KSQm4G2Q0o8VIvFanWAFfyljf7WV3hGuuTUJLVcze9tGfGZ/1hI0Ur5
         AZXWzkIGZo0d3nNDiPSOEqmXXQSteVr4WDYdS/Uf0eDha6/KZ8pWQDU0/zUsuzcumDJd
         tpTyaydN/FMQmYW3vojXbMW+erNqhLBjFS9WmcBlzA4hMUOIAjOOcmT33Bq6n1zuiYQr
         32plUXgp+qqDlm5z+jKoRzW7Qk2cqVQVadLDSwsCmOQpqCgg/2iQd4N9mIqEtAHFCgmm
         yC3nz11Bq6b+vKWDqOnjg4h62OD6EBeph0Q8tme/POdvkrXfDljsaszw18IFyKMDEUSk
         x6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE3EkSc0xZcvyCQVthGuaGRWYKIEakHV7QOARtl6GBGZ1e+/0WvEHBhaLHcYjWRZ6emwtNDI2HgNyWB14p7eo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Y5jXZLetbq7DYTjv5mq1KcRsoQxXkXagI1XSBXzU7jG/BiT8
	yZKhT1tL/QbUm3l0JOFRTO72aszmsUvlROcX7Mc7htqdh1yF2NvA4zKd0/lHd+U=
X-Google-Smtp-Source: AGHT+IGjIoWlwinfZhKBEIrRl3MA4S88J1QJFbpNcM59olLwoOacmA/yBDxxHNOfzvA4r4tdWOJ2fw==
X-Received: by 2002:a7b:c848:0:b0:431:53db:3d29 with SMTP id 5b1f17b1804b1-4327b7019f5mr37167515e9.18.1730388440670;
        Thu, 31 Oct 2024 08:27:20 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:20 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:08 +0100
Subject: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in
 apds9306_write_event_config
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
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

Simplifies the regmap_wite if branch in apds9306_write_event_config.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9306.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a630d42fe9b90438dfe8 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
 		}
 	}
 	case IIO_EV_TYPE_THRESH_ADAPTIVE:
-		if (state)
-			return regmap_field_write(rf->int_thresh_var_en, 1);
-		else
-			return regmap_field_write(rf->int_thresh_var_en, 0);
+		return regmap_field_write(rf->int_thresh_var_en, state);
 	default:
 		return -EINVAL;
 	}

-- 
2.47.0

