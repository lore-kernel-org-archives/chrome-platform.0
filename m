Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8AD248890
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776258; cv=none; b=iQiSkrLqWdo34wfrF4pwJ2IafrCylV7aUY10kmcj/pW4S8VN2LpsIigdGJ+G2YqPoqQwagGdgSw7At7FWmZj2VQkxHsdFl6zb61l/QQR2S+fU+naDr4JOkARIR6MDPLGsw9LklqlnPcuMrDfIXs22kFPSEwh7JTXFr/E62UDN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776258; c=relaxed/simple;
	bh=kZEgbPTr1PV4HkxJ04HuVryLA+DQhqltwm1xDNvvkdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJoQtwneeOzEBdltxA23LDV0ZcgF/jXjAY1ggnDTXnfgFXxc6EYU9iWqzYycQ6+IHrrnF4U0y2wFqwEmrbw08XEg2a8MnapR4pRhU+gRtmAKnC/Krvts8ghn7pv3kJKkXfHggd8J5SHMfW8n2X8rLYJ1Gs5zrH6uxxOwuV6+Ru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cZ0LO+aa; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cZ0LO+aa"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fea8d8c322so12789235a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776257; x=1742381057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=cZ0LO+aaHwnuiC9gJMexbIXgV1kccWQhDf3OiWf7awkQvlaeqU65VGBHoM3pG1e0Ha
         s83uWehG77KHwecFsD4MMkuY2uGpNEA366ZpGyYpO/XIWojYNpjYRL/mcd+mIEbORYVU
         OwTkh/t5ElOaa+DcYH1iFc91c2aqr4rj7olF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776257; x=1742381057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=Q9gs4JhCLueOF8XBbko9Acuwt9NcatZag/aKOuQxk394W1874LSCX2RecojafdCbkv
         ZxxUD4wJXb/XW43o4nw1USGDbJv/38zM8ab7XBmFaCfTzrQ/C9LS5bSQKdP95GHbbp5t
         HPMOTPtD90xMyBHFXWTOhhE5XNhwwY9U1lYMPDNYFYFFdP4lY1lHSyVdOfJM/ZQj5NFQ
         Zxd2clLii3XLFrVdn6SARfO0cjyO0EX1lsnIKbmOC++vC9F0UKXLl8Q4a7on4pH9AXHT
         RQDVeCpg6ZacvNxcGSrb0AlyRemVVbdIeneCwmhimuj0YI8JWrImiirKkmORY0H3dZW2
         ab0w==
X-Forwarded-Encrypted: i=1; AJvYcCW8/0BcCWm8dPEABODJPU1lEwsTqo0RbFE14Vv1j05BxjE5kETxhUF/Nzzpcpn3C/DMfFQIrNvb+45Y44vG48w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBdZScO7wgw74dSkxWIiHVhS3yflSLVaoqGuSBXdr/BRrvoRDK
	EYupgD3aEcG2Uc8zNofhwdiQIjWyeFeIytSVv5Vuid4VI6la0A89BXj4/tbj3w==
X-Gm-Gg: ASbGncuwQ+LjwJwJbCUEuIZhx/ajMpseycxKWMSgL4bhJqdOsJUZFqzG4bahDXZb5Qi
	U8Ah/ocVKK0mTadhCyZfhPMZph+r9N45/4P3Y6BPkVPc5v4vxZzGFBz6Xa+dXTgwDEUf3ZN0G84
	VlegvuUCLpb6p9YHycGs2XWbl6a0Rloxo6Jan49/9/5ctjNzmxDyzXoTcoTnkzb6P5Ig9i1KYr1
	eCKh6cIhOo8oix8NynHimlUCx8cAuAeUokRSOhsm1Vpol63bEkm1AIUVwY4JE7+oGyFYIIC2DVV
	7Mcr3U6LWIZUxOjAE/e+3o1q9O09sjIyafzf74wapy3ALId7PKu4/ewyQF9WU/I=
X-Google-Smtp-Source: AGHT+IHnJ9RN+rcEBHk26VixrUf4szFNagmQDG8odQqs+oPATVUlo/6Tywg9lfAQyAwSqd1m1Il2tg==
X-Received: by 2002:a17:90b:1a86:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2ff7ce59755mr29857671a91.5.1741776256738;
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Wed, 12 Mar 2025 18:43:42 +0800
Message-ID: <20250312104344.3084425-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index eb01851e1cf5..a3ec583f316c 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
 static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
@@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 	},
 };
 
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_touchscreen = {
+	.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth6a12nay",
+		.supply_name = "vcc33",
+		.gpio_name = "reset",
+		.post_power_on_delay_ms = 10,
+		.post_gpio_config_delay_ms = 300,
+	},
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{
 		.compatible = "google,hana",
@@ -89,6 +101,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_squirtle_touchscreen,
 	}, {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

