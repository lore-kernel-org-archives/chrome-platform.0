Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6819F108
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388432; cv=none; b=oJiZZFTqm9PFScJka27oJA9PdtUgvwHfTG0yI0G+guqCMTLDQC0ULFVP44cV6KDO50Fw94guJ0e9NBwV8WX1PrgcFByUh3YQRMEuOfGnVFtlKN/2viC7p1Fc5axwdU8eOmnUKwv1kKEWBdNpw6p66W9bBwNANb+1VqttnYxcpC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388432; c=relaxed/simple;
	bh=9Vut/pZkI5+AeeMHTIj9VcCeQDmGl/kfwkk4LjEpZe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M62nkUSb1bUllkEmw1fJYVmAhK9mP+EUb2JL2y9ytaiP52zczrVThmEgpL+d9OpWCWgHKRWSOu4ufX4pfofjL689Ivi9CK91irmrNBnac2mD+5UKCeMEur7vxXmC3Sn59dySNow//gVGLtczNWrzHBqxzSn+L01sWJZ1gYSp+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=anE6MkJz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="anE6MkJz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d49a7207cso770161f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388429; x=1730993229; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q6n3vif9yRqdpFEirWIbpqWZyq5PPsTaLuK/TXVuwM=;
        b=anE6MkJzTqLg8RnJfafdV5UXdCwnblyutUtkHTc8Dq1aWsNUcxTCb9LDTWzQMhx940
         go499SQqsdNKe0oFubdokf6PaeuH8OiK3mDNQ2s+t8EUNqo1btREjtu9gLIkM73+SfpK
         eDvGAbtZ2Z2j0qJdmE/TKgYYvh4MsfHDxTb54sR3vJpauhe5nr8tIx3FHTJ1lPR/L2yD
         Q7DMstN0A6NOwYbAwHadZeszYh8a5FMcX50AISCYBLaBSRrCNOtyseqwBC9YclWHT2Py
         lvJr2Yij3CH429I2e+W485UG2DUHhK9eoA+qtGbXYHWu3kQ+KtaGaNLrKq7PZnHKQXyg
         MGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388429; x=1730993229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q6n3vif9yRqdpFEirWIbpqWZyq5PPsTaLuK/TXVuwM=;
        b=g06cQNz1fktdxtdNcRW293ZbJmCOI4GyTC6nkMt6Q4UJWjh+8PFzApYpc8xR9FeIkd
         wQg3loI1FUqfG3Asl6sa1MuAn1Q74KPG2niatpzctK/PqPAcYknRVHQ/XCrp+xHH1Wt/
         5QxbBvx4cBOGZQqhdt/CqIzSPyt00rvQ0FmRa3dPc/kxHnhVbOFMqjInUXAx51OtYgE/
         KFdgENBGWeSf1Wa8jl+2uWVlkSz69Nu9nxL2kfLOqEoclLPIITBtyRTwEYVawDhYvvPl
         KIci3KvyZql5GXLA7uombga3ZBkx4Wz/SUP8g0E0zTBrjIX0B0r3ceJBtViqj0VK9ufu
         kuCA==
X-Forwarded-Encrypted: i=1; AJvYcCX2GRSfYxb0d4DwxNmuCH+RgHdUQPzFWLixN1eoCD0LmZEXgD/YlM+aKxkaoc9mrL4PBe9dvFnPQPHb+KAVV80=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnQdZMmLeNmL2qQO9+5J2HFzmvJLr2jzpGEDMy6idbEM0LedWB
	i+WPh1ldBdRc7MjrFpGM+0oHvTNfhourqGx60fJrDkqZqy1vv99IBvh5xr6Sdxw=
X-Google-Smtp-Source: AGHT+IGaw7tHL795rWp+9Pukkty49eWxvccjSs+5mhazyr072wPwTV8LiZfSVUziuIlxxgcHMJ0lWw==
X-Received: by 2002:a05:6000:1569:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-381c7aa4a56mr334756f8f.42.1730388428718;
        Thu, 31 Oct 2024 08:27:08 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:08 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:26:56 +0100
Subject: [PATCH v2 01/15] iio: light: ltr390: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-1-2bcacbb517a2@baylibre.com>
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

iio_ev_state_store is actually using kstrtobool to check user
input, then gives the converted boolean value to the write_event_config
callback.

Remove useless code in write_event_config callback.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/ltr390.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
index 8e0a3fc3d923a6f65d2a629c87e7bfd35d82a507..3bdffb6360bcbaab4df1a2d39c8ea3813b5d6bd3 100644
--- a/drivers/iio/light/ltr390.c
+++ b/drivers/iio/light/ltr390.c
@@ -558,10 +558,7 @@ static int ltr390_write_event_config(struct iio_dev *indio_dev,
 	struct ltr390_data *data = iio_priv(indio_dev);
 	int ret;
 
-	if (state != 1  && state != 0)
-		return -EINVAL;
-
-	if (state == 0)
+	if (!state)
 		return regmap_clear_bits(data->regmap, LTR390_INT_CFG, LTR390_LS_INT_EN);
 
 	guard(mutex)(&data->lock);

-- 
2.47.0

