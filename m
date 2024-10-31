Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C71BC094
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388441; cv=none; b=dYXR3Y1sPn+VT0XgUsUyWQ4Ng3Q7RDfzwmf/0RBrC0O3NCoVNRtF+NwjOiNHST0+GjvD28hvw4IasalewXX4B/dbNOWNCIyVBw04k2BktNSXbxHB/RJGLZaZ41/DOFDma5W2fMKrNxeTE5zhSbeyd2mlA1lev27MVwkSv7oMuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388441; c=relaxed/simple;
	bh=moWckWL94S/Tv0TXodewyrJjYwSZW6cdVNw+DrAM8xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G42TTHEWq5sZDi1tB7Tj2+eWBV86yBsPr+z4YxBiTl/k/Y5RckNvdN7foJATY7i91tMpXiH39X7Zyi0APrNDePhcnikp85B6+hv3/t0SnbwgLU5Up/5c0uu+mjEwFLFMleKIweZDpFtCsujnKxX5xv7Tn6EGeod9EFeHEYrnKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nhOfbpCk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nhOfbpCk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so9619945e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388436; x=1730993236; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91AV8uDRorYbhW21+smtHmhnNIXchkEJXBaZcxgDOnE=;
        b=nhOfbpCkwTEUB5lBvDafJUf2lTcdlGxJ8Wo1zc8Ym0b8xz2f5p/Kg4GQY32PFuIbwi
         7PvJysCDjgOruRQE1wAcMlzBybl9L2FVjfJupfnapphg5QttlTydGBkCMgJCCu8KaOfl
         OA4qm8sMqciJJtyJLHmdZ4mcaiSvstL75Ztuqijbu8etkQRI4blklwcJcCQBAnRr5Wq4
         xia3F3gIvGmx0tyzZva1IaD5gsrYE/eqR0MtVpmBdlq/YmGfsQZD4EcQaEVL22O5fi02
         nBLJxTLJGvd8Gw+7hRv2yTrZ3aFDq3TF20RZRvVPGxOFRvpYTNNAkurjY6R5ZRFISmUe
         uFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388436; x=1730993236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91AV8uDRorYbhW21+smtHmhnNIXchkEJXBaZcxgDOnE=;
        b=GR1QdAD8FxwivgPf+o//X6X1cMl/zkLEUNx0Gjd5tHuA/qK1mItCPmKGW1mP2gzEm0
         8oj16IdBFalUC1ULIqYawWj3z/psH6bitd/yXsQnzBgjYiaViOr3hwcjw5nNszARlfoy
         6VaGRQAgRBWxxXBkBxoYYiCVW6ZfH4BnfSC/+u6Qp9EQUy6XL0G8yAxah/eVgGsH/rTY
         zWi8bYfWknMTjNoIh0r+h2Fc4ZASVQq1TgmpUvX2ZOlTLu1wpfIOzV7vCMIHc5B+Kafx
         C/CJDUpxjRRf3LBC2N3+hMozkVY2RKI9j0wxmIFEeWmJZFHj4wRrdKCFb5NSbLnL9xzx
         SatQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5EPummP1rn9ia+fzCytmk/EuXcBxyBNX5ckgdRaPab7pB4c6Pk/AVFC9OU0gfq+qd8JYBSXu9gZukC/JAvpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVnLUt/g2b8nUX68gLX16d+uGQtbVGXryLuv7EjM/4Bi+ceVK4
	x127DzmkboFrtdZoTRuvDBi/XPri7vRvltAGtVJP6+j7P+Svo7yj2Ozh5uGHnmE=
X-Google-Smtp-Source: AGHT+IF/NKLNlGsRd/1UMFl9TQ3C8cdSO5qCxZ9mwQG+PgwUSTDjp5JjuM36PcnisykqTLYhpsYWjA==
X-Received: by 2002:a05:6000:4006:b0:37d:3171:f2d4 with SMTP id ffacd0b85a97d-381bea1c0f9mr3497430f8f.43.1730388436559;
        Thu, 31 Oct 2024 08:27:16 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:16 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:04 +0100
Subject: [PATCH v2 09/15] iio: accel: sca3000: use bool for event state
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-9-2bcacbb517a2@baylibre.com>
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
 drivers/iio/accel/sca3000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
index 36cbfcbba04d6920ba68bebd70d21bc3898a044d..3fb0f386c3db603714a746c28be36ee78d1b2a6a 100644
--- a/drivers/iio/accel/sca3000.c
+++ b/drivers/iio/accel/sca3000.c
@@ -1158,7 +1158,7 @@ static int sca3000_read_event_config(struct iio_dev *indio_dev,
 	return ret;
 }
 
-static int sca3000_freefall_set_state(struct iio_dev *indio_dev, int state)
+static int sca3000_freefall_set_state(struct iio_dev *indio_dev, bool state)
 {
 	struct sca3000_state *st = iio_priv(indio_dev);
 	int ret;
@@ -1181,7 +1181,7 @@ static int sca3000_freefall_set_state(struct iio_dev *indio_dev, int state)
 }
 
 static int sca3000_motion_detect_set_state(struct iio_dev *indio_dev, int axis,
-					   int state)
+					   bool state)
 {
 	struct sca3000_state *st = iio_priv(indio_dev);
 	int ret, ctrlval;

-- 
2.47.0

