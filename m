Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A001A2C0B
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388435; cv=none; b=hWMdryCKPsWw8wvcF89gu4CG23l9GjFisibrOlY5gB/EZJGCPgUfQvgtnIH8ed8rL3/+5G2WuaqW2i557BVGm0YzXXfNMiHGjG51GK0UWaQ0MW6yQx118fVMB1gdbhzDbopS29Fs2T6rJjDlJVPPjXu2LlRAeG7K8WNvvysknhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388435; c=relaxed/simple;
	bh=kZPeAfwjTX0nVtcMBAGwS+F+aIcqAWknmwxu7TyCEZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUFwBixh36obIi+kVRcQpQNDWJW59k1h7aifEgu0whLF4yACOYfyrPV454pNGvEv50O5AvfdEXQyJ5C8V9IW7nqXVpbhz4aC0kmd6N3QfopdA2uarr4FTM9KydklmYj2EMSpRpn9UMHgDfcNUHTILAnL7I2KqbUwP1Iuz3rT7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E79hRNut; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E79hRNut"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e8607c2aso1153209e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388431; x=1730993231; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfayXnl3KgVE68uldd/53FtSQhtptu319uaFu0iSbt8=;
        b=E79hRNut8ymB91zrMsh9Uxn4moPAWgtDbKVf2FBxomCxt0C+O8SISOp58tI02tY2yj
         MGM5ZJ0Acjfkyr5BfO0ydqd0fgZKEsfHK08aI91t6OW/VUM0HBk2XZtXo87P1LDOprNM
         Faq+ZqHbtQMlN5IaBgrVHo+fGRE75BEI/wtD348hxBuA/D+ZIS4i03UoVO6lJMNbJTrM
         nDu8/Ilv4XtrCgYNbEcInjX7B2b2qVUmKcAzXH4zcK7bv786xrrBtMwRo2GdUzFhnBty
         FJXTKKf2u11XjUgBI6Hx8XMQ37WghUiOeYi+Xbp1rx1jyAs1Pv7i/9tTkaad/NMAsbiZ
         qCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388431; x=1730993231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfayXnl3KgVE68uldd/53FtSQhtptu319uaFu0iSbt8=;
        b=B31QfTuo+rcgX14avseUHZS7lo/bSiOLyAXhHh/W4EcpuA3kdQ0JO9K79CFfdf+UrD
         HubUD+csZ4GbMnQvJhDD6hGV+A8Sm1fT3pC8sbF8V5eO+JTOEPq/NOMivT01jQRT+Nyy
         8J75ti0XFDVWNMXVlrlep0PbdAxJOBvdi0o80mx3VO2Yh3c7MSn2OrsTqIERVxiU9Beu
         ELqmzuwQYVdd7gKM7wQcnQf63VWKWeODWh7dobNYeD/r0qNosH9ur/NpZmjN8TXMcavj
         xQid3rhZJVh3Yj/QsVomDORjSpuUtjQyOaa67fYvVfuMf1HhTOnr9iHgBel1GZDPLslg
         Q48Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaArGaTgTKtiHsIu/ASu6HkPBbDSv9hTDDZnttBU60jWzPLSkSDrrskgI6raraeDhsOuUGJjcZ1xbEDtmjdlU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdCoBHLHmEK+0M4NF49f8gSaKASnFVUfC9rB2FZXN9Q/MXUVH9
	o6GQ9LVA5dqbNPHKDGFtrNEEw3cAGVNRkAnJmQOdu/+AQ5SWF6skU8PiGwsvl8E=
X-Google-Smtp-Source: AGHT+IGh99tSGgSkk7UO/iFz05CAdTlnzxIFxRiRB1z7ObMWAVrMO/9RIhKBJVpF/cTnncS5M8FTQA==
X-Received: by 2002:a05:6512:2341:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53b348c8978mr10449686e87.13.1730388430582;
        Thu, 31 Oct 2024 08:27:10 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:10 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:26:58 +0100
Subject: [PATCH v2 03/15] iio: light: tsl2772: simplify code in
 write_event_config callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-3-2bcacbb517a2@baylibre.com>
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
 drivers/iio/light/tsl2772.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index cab468a82b616a23394977da1d8822d29d8941d3..26082f239c4c3aeabfe73ed100d6e885f5266329 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -1086,9 +1086,9 @@ static int tsl2772_write_interrupt_config(struct iio_dev *indio_dev,
 	struct tsl2772_chip *chip = iio_priv(indio_dev);
 
 	if (chan->type == IIO_INTENSITY)
-		chip->settings.als_interrupt_en = val ? true : false;
+		chip->settings.als_interrupt_en = val;
 	else
-		chip->settings.prox_interrupt_en = val ? true : false;
+		chip->settings.prox_interrupt_en = val;
 
 	return tsl2772_invoke_change(indio_dev);
 }

-- 
2.47.0

