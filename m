Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D6F2641E0
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230413; cv=none; b=Cx9QkRrpDaKPnyTlUtx6KbjIEW0jNwenGLEIUIlRUx/sMbgkb1CZt8sSFUzyRTODsRJNUpTnlJp14AspXFzS23+Fs/ldhh65xnv6WeifP6G01OecA3sUdacEixc1p07mPKjQnexKRjNjSnBEO7ENM6MiWF84I9Oy14FCr1D1aqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230413; c=relaxed/simple;
	bh=Pz2EbCAhTSbi3s1n0uikdRPmeNKPOIEQOu+qX+8XfSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvLbqMVSaAsOtrX3CrM5Ahi9PPl3Q/RxLF7HgRm7Gw9m+4s8vQhna6zm43FwM0guhQx5+fXXBFROn6dapmsjyOXJb9nitERgZRsMB7ZHYZcsljM2MUQio3cw9gyJrLtBFIhVzlJ+2SdDrOagyOFhjgGRJxwjvTf1Q01m5b3m0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oY8Z9aT8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oY8Z9aT8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224171d6826so54820195ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230411; x=1745835211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=oY8Z9aT8P022w2WvHZnrBgVKKIqOPtv2Ys6icBZy5rbfhAHYZS66AXQoyn6jY5jmTr
         6xHnJ8sQhb1jydnGpxT6Nti+iXacUns4e5bLaqXTRb98nqQlLLjDeSXpBwcXeRczbKXQ
         h2iMIbzFNrTeroQOo0B2HyL1wlYpd8tFGwH78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230411; x=1745835211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=Q2utaBDrH6WX9CPLXPkvqBUOKWfKCqrRb8XVxuDVnep1VY2AOceVaF5BVtofi/cg3q
         C0jmvMwabBL8LUtUZTH2zYQY/q1Anuv41zUDrxhUyd3weKH686mCO723BYaCqXcfhTW6
         +RtwdGtOdtBsG580cAgV7aIiL/KIeRQu2bOWMYlIFk82+K2wlmxuHhQQ3Y48UlUYY617
         g1LuyzKy4qXNE2KSf5pYNoa6V6zxWpMX0qkN7L0q0UhUTUQXAG4w0Io9Xirmn6dOMJWS
         aGhiHQLjbGfNE7T6yAD2GNMgKFdzKPgLfTWEdhbrcOV1Wt2YAu7AJkdlCCEkGzJvE8Y6
         1NUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrmlkfoJ/vkF53grKLM3lCz4UVhVY+P6VbijZZfOTLRBNwbAOljvQMV7rHINvCVyArpuPkgQDhTfGk9oaSj1Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YybnCdFjdruUl7bom8WfWOPzVoWFKfYhrqvPkRAeaQX2HgEk+gk
	DBaaU6ZSuErq5qMAdr0EY05kH0i+c06L6GwCINVxR17/6ScGKfUhmv7HBr0HKg==
X-Gm-Gg: ASbGnctMobrcvpGkV/rnuG8UmHmhHXGnWYbH83Ds/C2KiqlKmF0Eb2a+FKkbTKg/j/m
	1HjEQW4M5BFdhWvqRssI/fGbpcpzclQnk5kqaWPS1tYx4JOXmlhWl72mAPqC3OVHEc/yjCIajY7
	2sUrPnaIL3NUNSOR2SmM6w4SkkS1O1iq+qfUeiU1uxKTkj649GwJxEmZW7XcIkGuTpEMoN1mY4a
	Egpq4dw3J9Xh/HsDoNoutjiXiwGp0AoptgZS+Fd3ZgCHURs0N3tvlv+PBnap92fu4/sUnbQ3Hit
	3AeYt19KoUD4UXjQRuG3/hNVhYuaAcXTeIyrNP9SLH3fU5/KxZxvHg7/Oyo=
X-Google-Smtp-Source: AGHT+IGaSj2NjUkLJYtvrXbaniU4ZUkVXBRJQywqY5KHy1I4U9ywfY/tOoiirvNsMeMMe1Zel8Bsug==
X-Received: by 2002:a17:902:ce86:b0:220:c143:90a0 with SMTP id d9443c01a7336-22c535a7254mr159468475ad.24.1745230410702;
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
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
Subject: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Mon, 21 Apr 2025 18:12:46 +0800
Message-ID: <20250421101248.426929-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
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
index 10dbaede0541..f3cd612e5584 100644
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
@@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
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
2.49.0.805.g082f7c87e0-goog

