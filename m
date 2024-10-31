Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524991C1AD4
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388445; cv=none; b=m5sTprh0aaf0bVgeVSC2JGWa37XXN76U41rXhO1uPiv1sJhUfbQvjju/jJoCVtP2NDdRBdlLrkX+5RPUPt6FE8G8oKoR0L+WQHTYoeBmobFCqCsw/qBuenXWFAqZHwP3J9J9I+zczt552Yxr0crvSPvk6bNH/d3rhafIeFieBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388445; c=relaxed/simple;
	bh=2oxEXngbpuK33jMEyFTuIjbJNAwiW7RbKMMTMHofTaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZ08vQFVvHd4KN4hq6xjUcg0OSg7JNjviOPBQySBTbwy4UHGJ+5SgGYHZujHNWZCIYae92vdGpUrYpFZpg/4NmsOGEYfIS0293S1C5cJmo/CAL/ePyQGR6GtzmfTeoH/M04WKPcJjCn135Y8ySk5W3jU4lc0kLBvbqKiaUQkJm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V2bHJAni; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V2bHJAni"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so8648065e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388442; x=1730993242; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YCxmOEeimQsWbxSuJOXydqCcdjHVKIXSn+X4nwfNto=;
        b=V2bHJAnijXF7keT4w6ycTdqdbLDEAhhGsUmA/3tt7W0/Wk+tx0EhV86tCugSMf2Lyg
         Tyjjak87ce6BQT3dL/j3lmVUUzlziUtsH3xOeg6wD/tK0ic/tcHnzVFWDDIeXs90FBml
         cgD4gPs+iyRKuOIziv9fEpyQYm/N8nKKcaF5NLcD/s8lxrkTaQb0QP7RnVeRu0MTg8kY
         +LxDJ3PQcgzaVImxW/Sh/GRFRWcSZH1IRZldhcQcBqAbyFRPcAIb4/UzJ+7gdrdfHCV0
         3QiMeaRckQ9SUOxAtf2dkN78b00BzaoW5J5MkUdaFSMIoElZ0reNahiDboLrGPzYhNO1
         vdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388442; x=1730993242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YCxmOEeimQsWbxSuJOXydqCcdjHVKIXSn+X4nwfNto=;
        b=YzsezE4RbitMahoiP6OqJnCRMaA9qPtpo/nAV0zfyqDlr5VPU31PCPQULKvxPR2PuO
         Y8ZVBrNr6HE6GqLv9tebJBPRWiYOiAUSXjp3+J8aJYy4ViB8k5HvCv1wFeV5Q+j6fZcm
         zeJGp/QYvrbNuXAaMqXhE+gKGKKO1Xo86izk37NkO5K7nLq/q4giCx9qkU+ygzKc80zk
         FjHTIl8P7TahgqkjQuO7vDhZlsrWsGiLH7aSW3rbbf+vOu+Cx7HLbBBj1+EIFnxsh3XP
         RbcoehjqECS9YARyAiOUlDr9tjW6PdkJl8HBvRKew5n6QRfOT6yd9Ng9P8iQwQIXqQwU
         btVg==
X-Forwarded-Encrypted: i=1; AJvYcCVnoYOGT8WjIG7m+NxGZW5Hpk7pBSI4zFEzcglxV2lBRO0Ob5sOwRTp3rULNf1MUB/MFbFRh+FbD00llT+72Dg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0GhKLYC/jKvvHxukuu2QtHjfZMo4D9iFa7pWSjvHNbTFEhN5S
	tvdkpjaVobk1sGKLmIgLXrhMP2Zx4jDBDzVeKPhapgAJeG1Mvd53VsC8maMt9/M=
X-Google-Smtp-Source: AGHT+IGGmHVzwn16NX5EZfe8eqBf1qzHN/yW4gKwcafvrQsBbKKrxU9ApLBrOxE39bgUdtUYNo0xBQ==
X-Received: by 2002:a05:600c:354e:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-431bb9de8a9mr66687935e9.30.1730388441668;
        Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:09 +0100
Subject: [PATCH v2 14/15] iio: light: apds9960: convert als_int and pxs_int
 to bool
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-14-2bcacbb517a2@baylibre.com>
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
parameter, update type of als_int and pxs_int to bool.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index a7f0cc99f236685900f89fbc48de3be0e9a40704..7b3da88885693c488807da459ceaa1cbb3881bcd 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -133,8 +133,8 @@ struct apds9960_data {
 	struct regmap_field *reg_enable_pxs;
 
 	/* state */
-	int als_int;
-	int pxs_int;
+	bool als_int;
+	bool pxs_int;
 	int gesture_mode_running;
 
 	/* gain values */

-- 
2.47.0

