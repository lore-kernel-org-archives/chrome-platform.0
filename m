Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FF41BD4FB
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388443; cv=none; b=ihcnUfZSm5RsfoULWZsIOd78LVENUgnnWhDFjxq26SLk48ufQhaZT6rRWRh/MM/5yWrV3SYrtBUnmAKRUvgo/9rPpkZotFaj0bVoxBkztgwbjdMU4HMXGRIuT0F9AFyA/kSGBurUT3DXvVxusy3BlqokNljW2HCPnr3tranHCdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388443; c=relaxed/simple;
	bh=PmGalM7Ef6Ks5hbegfAqXArWEMF8OjNxmIq7YA4FlKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHlf0kX+SLuIfbbSxB8vg7a6C+gyZZMDfazlD/NRHBhyoGiVMZoUUoWfKBt7pXEcmSn4yASb/OuDvdLQpn4AuA11o9LILS4kxXUuLUE3iALaoQEnTgSSUMlsdWeWCScsfyNKy6KLoBlll2Cyyaoubxrhw8WCIxEWXMuvBXFHuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yGOZ2Ghj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yGOZ2Ghj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso8935065e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388439; x=1730993239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+Wt5gEXGTTMFhAf0TDuO7kCimt1FNZkZpqrNk88/+4=;
        b=yGOZ2GhjgiPs+9fZaBteIjdBzhPTej2vhQmgPh9znel00vBxU46CX9hp8BYKwEDpzU
         D4PV6ASi2QHwd+O8BeOImNhyAqWYJxVsvn3vILMsIOWgeOsBRyB33QjvgFD0uX88itpH
         Fx5Yg61qCBCbsf8UzFWGD125ewy7ae0F0tol/mdMdxqjrIJhNwwc/6hAXJXRNpDEoOuY
         6UY5pgjAKseE3ikdVDCPUmXqFH6OdGdx0DZaeeo25Vjaa1CefYnhAzD5FguJm7ERmelG
         54g8dMVu7IRUXezEnpU+7tmyJ/KWMUXu7lXGO24EZg6kS4Zf/cFZuOkaIHgwN52rD66Z
         xBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388439; x=1730993239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+Wt5gEXGTTMFhAf0TDuO7kCimt1FNZkZpqrNk88/+4=;
        b=ZU8JjJR200dCQDf3t4oLJG/oTfCN2u2Fwl+eXNWoDKFVMHTq6OcsXWVtmjh4JR4p3/
         zwy3i8apJM9glkQcvuE5gn+I2YErgajD2cgRgcVAnElYYodmtiAqfkLEjWtrxkhkSnc0
         UUzfm238k5UX1k8vCr2SqZ0AyMBrJrg3eIHxZgxBvJRkyW/RwN8Qqb/SJOunJu0mM66z
         hIIqRvPGoXmfNfQQZB0u+ColJrFjm09pfidYaYpajSGOEUn3v5/QG52IZnIRReAZTUao
         5zUmjSCN5Dl6j1PO5NuCRuYWTFywElUiCAKlSQBK3AYetRA7DuIPEcOEELCrYj/mV7Hv
         AkJg==
X-Forwarded-Encrypted: i=1; AJvYcCW62dN2Dla6xuxpjivA9+rxe+7HeSdsHI9Z/jCXvpHPIj5RNfY3fRxpfg4OGXhyfkx3e+ApZKbtLwtbpJ0BJQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8VfxXpVDDlrgbkBhcmxHg8yKDpodAkLscZaqHEJfFJfwHWwsp
	8AGc6lKD4/k8+Cpawqc7mfF8VPp8qJlDYiRCInnalKgwavqGN0UXd3ausdajKRg=
X-Google-Smtp-Source: AGHT+IEyu6FJS8+aBQtlI/2iMWr0qg8SLYMIc2U9veyCeAFrXBtLbW2/W+xR+K+a9Ow41bs7++cXAQ==
X-Received: by 2002:a05:600c:3ca1:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-43283255489mr2254255e9.16.1730388438884;
        Thu, 31 Oct 2024 08:27:18 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:18 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:06 +0100
Subject: [PATCH v2 11/15] iio: imu: st_lsm6dsx: use bool for event state
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-11-2bcacbb517a2@baylibre.com>
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
parameter, update the signature of the function it calls accordingly.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index caefa15e559b8808051ff1c7f82c3f36c947933c..509e0169dcd54e773540c4e3f1b56e5b737f80c3 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -1865,7 +1865,7 @@ static int st_lsm6dsx_write_raw(struct iio_dev *iio_dev,
 	return err;
 }
 
-static int st_lsm6dsx_event_setup(struct st_lsm6dsx_hw *hw, int state)
+static int st_lsm6dsx_event_setup(struct st_lsm6dsx_hw *hw, bool state)
 {
 	const struct st_lsm6dsx_reg *reg;
 	unsigned int data;

-- 
2.47.0

