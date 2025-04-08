Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAF32356AE
	for <chrome-platform@lists.linux.dev>; Tue,  8 Apr 2025 02:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080800; cv=none; b=LuBJkNL97yRjTwCQO2Vfr3v6o6XeQDfTPe0Lkz3L6zG2YgPt31+p+KTCWKfl7wxqdwT7sCWMHsI4urCkSuWZFn+xBe08qosDFjrA60G0eSxqX8mGcg9Tg+xPLJLU5cuNJxxvfRiYCdJlY1Oup/yZfiSi9p4vEGljZTXSTkXnFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080800; c=relaxed/simple;
	bh=GlZWLABENJln9JuG0rHtIge7k029ZMQOKPM4RNHoN2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R+AQkJt90O2h4SRpUU+7NQmnBMyitvIt03ZR9CrTpffQdrIWi5zK+MLEvFu+tBfjeFe19I4x3uW6/BvezYWisLABknmRPeJJMadT2MHM4S8UbFRHk5RaAFh0VHzLQ7OnKk1TQFoAdLmd7mLJf9AgH+HPtcROYa5s0ouO/WZ0x68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/bT6g2Y; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/bT6g2Y"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6795324b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 07 Apr 2025 19:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744080798; x=1744685598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQaDjxACdPEUQ4vCNuqG8VAARrxNSVjkZ9UiooLYn/c=;
        b=j/bT6g2YZM44tD/EsaCJPlwrDLH/S8N4xBR8WnsmIkxAloSyJocldoici5fTLF8kTw
         CZ5IdtiXJR55jG6aBHa4XYVv5RXa97KZFHd+doU6PFFeattpRN39LoOMISrt6RCyr5ts
         ATwP3/B6mpMv+WGqFdRjWUq8akDnJB1X3R15cVw0DrqKwn94bZwxdtQ93zH0yITZNyC3
         NGQgL2QEs/CfIc8iC/wKdPRUH9vBwn0HVwRdbfxDxzAzEuXCqISdAeYXXQHLtdIXPh50
         Oy4QNi/pSwpV/Oj+lIj/MdwdU20dRT156LTW8fu+hisF/Hk/1bIZADdTAfb/sLtngoWc
         xm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080798; x=1744685598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQaDjxACdPEUQ4vCNuqG8VAARrxNSVjkZ9UiooLYn/c=;
        b=u1O+4qkksRbDGjLR3cVqPu1Jj+UCMyPM8+JtKispPximFIqZqo4cqnALy2S/oUHAY9
         wiMN0Q12VToL1X8Vjv657d0dDJmZ73s4GuQzvFv73/giu0paDwJS6CNzCELNX51Bqw+b
         cI8wiK86BGUbbACglZsNy2xKqzZfhDJVnjKD7Da3VDMa7LwgWQ07yxMbjwBNEVCnUeET
         XkaiwESDMDNCzyD9yG+69VgiXEcAcBMnRnLI9ngfZQ9+kd58TypYn2DAPgSXCd30TGzO
         wpuFgPXeg3mD3YrmZloV65XhmfWKhdCMKGCfWF6P9yvvSPYYmTjsVwquPXvuxYx4bPMk
         fTng==
X-Forwarded-Encrypted: i=1; AJvYcCXn8uTPDllsIdLDbEX/66/bI4MqyA8ZTPoOpaNA6Wgsm4HR94XEMFQBJ4UFUi+DF1PUcJRFvnZ9P9EFLTYScMw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu09TOL6jVGpYUh6m4HODSQw7WuUhC7hz6I/ZRHtt+WC1Nih2a
	Veyf2m324rzOpCTrcaHXe/ZK+Dh9kTCiKSPEWuDe8oXHIbvD7WSx
X-Gm-Gg: ASbGnctbVHtUjl6h10fZENH74XIkYoImQr2QMBM2v3D/wSYxs9ziOiIn0wQIYu5AWrC
	6qmKKwIoqJPoQuHVjsMYbE2ZUCd1iAecj3kaTkeyupUbImUXCs7uOrohSyw1mOdTetPVuGFQu0y
	uDFActt5GH06xJAlRC/hPT3aAvPSOGe4XYcfz0GpoGc2CmzbNphw64dKJgzucdemd2pvwK+xs+m
	44lLmVZggc7hQuUQbkvvpXZlhzUofpeNqi9SYeA5AFVDaSFjPd3KwwWUzUYD0H2ia+gfluR30jI
	GbHq/XLQ7lefe7uHEqx+VHDfvWIO12HiTo8GtSmJRrOVQQ7mf27WXyPCckvbkVJ8MAn0/rUZEDw
	Ocn7gdtcT6LV7GnM9bTaY2t5NH3/Rk/JkyLbrla3fW5BvPVZOiB7Hhsg20PrR
X-Google-Smtp-Source: AGHT+IECaHrQ+Szc6+kFfW5D5EOAfNaIogqst7p76eUHcSzRzQmyMnSe3v8/og+7l3p/VwYQwZWQCQ==
X-Received: by 2002:a05:6a00:1147:b0:736:a973:748 with SMTP id d2e1a72fcca58-739e4f79870mr20193054b3a.22.1744080797573;
        Mon, 07 Apr 2025 19:53:17 -0700 (PDT)
Received: from kells-Predator-PTX17-71.. (2001-b400-e33c-bd7e-da8e-dc2a-f3ab-1a8d.emome-ip6.hinet.net. [2001:b400:e33c:bd7e:da8e:dc2a:f3ab:1a8d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9e9db78sm9700148b3a.97.2025.04.07.19.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:53:17 -0700 (PDT)
From: Kells Ping <kellsping@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kellsping@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Dirks to the match table
Date: Tue,  8 Apr 2025 10:53:09 +0800
Message-Id: <20250408105306.1.I4aa60f7aaea0752932636a188eaec8b3c7d44126@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kellsping@gmail.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..a8d31c3126f8 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

