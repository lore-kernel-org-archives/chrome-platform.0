Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDA61AFB31
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388437; cv=none; b=SU0NTQdHjlr/KnfyWH/L0h9t92RESZGMHQIqMt2riUFtjWyi62kiVMvjh0XgiHvC196JWGoMAirxLSjfpVXrDSXSsdGVYSyUebtFROtDjPOnva7eZ8BvAG3IXct1qzUx6QvruT3CEX//gP8AxDzsHeqQ5Kc1CAhsTtutTxdg7pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388437; c=relaxed/simple;
	bh=Crws9hBcBUgMNyTwteduHmHWY+ibF9suD+aQH3je7N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eq28ZMNVbpXn9FoQamkENMGUsakgZyX38tLprK+BTJB0oewhBWi78jYj+diACdJiLpH3fcPc+bZCsrcizby8KYxR/6+u4JfmoDwwLf+hcCrwApm4V7WCmFiv6NAuw62vvy71mLbfpAgnwgu6eTLEBbE/rZVZ8SMQckAziRcJbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h5XjIyFU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h5XjIyFU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316cce103dso11291305e9.3
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388433; x=1730993233; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeXr3qZeoMT4Q41ImmT91MFFoZboqwE1uhQTfbeavwY=;
        b=h5XjIyFU7J4K/Uz4XRca6E3bkw+Z1+xLAWCB9bNQQliNbKqQCSF5bOt9U6IV7ndnLt
         3r47PAy+Iv8oqzV81Ydi6omSkiyGz9FVWcfRQeUBnRBNSo6ywLhCskxvrcKegrdUR0cT
         OXZHWmiu4Tzvvp8Dw1r1iG0isNeP/7kqWWUHv1gBDn6pLIMyhjrFH3Jyh/DI9DFPl/Se
         PRWE44BOUyNlaww7dUSEOTWEmgZ7lLj35Yvys2osYp9JpCdEZu0pZ5fotWh8hOLQk2wG
         Ik+NlMadTg10CeGSl4RSWFW9DMQwDGNTLoXqChr+vvKJTvucvoVyVLFRZISLvf9jSYWq
         LGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388433; x=1730993233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeXr3qZeoMT4Q41ImmT91MFFoZboqwE1uhQTfbeavwY=;
        b=If1/3b22TH2KExJhMdMy1z10ji+9pU9/hFbLYQXProbVowF5MoEEEISyxc/Q2cYoHZ
         HxNIA2jNM+xR6GdaOfsGnoWIyruNA6DsudeMc8j7tfAe5d3er5tmTbeAOCYc5/lxGEwe
         EjuaKORlz2d8KTdzCaC/0b3x54I7CZmrdXIJFANVx5oo7/+lv8+OCW7eorzGEO7VrUk5
         smzvFp20zXzXNYkQyjxzpNN5lfCkROhnGl/DBhUFCPpQOleUCDNcDollfunBdv9tSM8j
         wgl9qdFy5Av9x1Ik1fq+0AhI1BF9fajkTZDkV3RPhdQFaf300Rc7fI+vUhg7HvZqR1kr
         HcRw==
X-Forwarded-Encrypted: i=1; AJvYcCXsvfN38GzRqy63OdfdYQHQsbZrvt7PPZ0qpr8Ljvxq3hImOXlqbGT92NP0c8xJ0eQIMpqN2rH7LdwlQ9es4+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YydbXDbdpBAWnS8AdY8XAb0OFo2C/IpmauhNQ7KjBDacbThUk+R
	MAxLhnWXEJEBEJNq+HiqLjIAD6wLCEQGjhIxUFozBLaT9YElcFAEwB0S/ekQXdc=
X-Google-Smtp-Source: AGHT+IHhKXOtU6WrItuY3dPBqGFS+YCmx9LFZrBINQBT3KJgqU4GZtX+T26R8f/M/h9JuV4y1clo3w==
X-Received: by 2002:a05:600c:5486:b0:431:52cc:877a with SMTP id 5b1f17b1804b1-43283296066mr2433515e9.34.1730388433589;
        Thu, 31 Oct 2024 08:27:13 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:13 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:01 +0100
Subject: [PATCH v2 06/15] iio: light: adux1020: write_event_config: use
 local variable for interrupt value
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
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

state parameter is currently an int, but it is actually a boolean.
iio_ev_state_store is actually using kstrtobool to check user input,
then gives the converted boolean value to write_event_config.  The code
in adux1020_write_event_config re-uses state parameter to store an
integer value. To prepare for updating the write_event_config signature
to use a boolean for state, introduce a new local int variable.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/adux1020.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
index 2e0170be077aef9aa194fab51afbb33aec02e513..db57d84da616b91add8c5d1aba08a73ce18c367e 100644
--- a/drivers/iio/light/adux1020.c
+++ b/drivers/iio/light/adux1020.c
@@ -505,7 +505,7 @@ static int adux1020_write_event_config(struct iio_dev *indio_dev,
 				       enum iio_event_direction dir, int state)
 {
 	struct adux1020_data *data = iio_priv(indio_dev);
-	int ret, mask;
+	int ret, mask, val;
 
 	mutex_lock(&data->lock);
 
@@ -526,12 +526,12 @@ static int adux1020_write_event_config(struct iio_dev *indio_dev,
 			mask = ADUX1020_PROX_OFF1_INT;
 
 		if (state)
-			state = 0;
+			val = 0;
 		else
-			state = mask;
+			val = mask;
 
 		ret = regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
-					 mask, state);
+					 mask, val);
 		if (ret < 0)
 			goto fail;
 

-- 
2.47.0

