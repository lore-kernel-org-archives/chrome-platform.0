Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1372638A6
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230401; cv=none; b=XfiFxcVxTiVE4ACe2DvVVpnQOlsTm+3xJS5HjFAHdU1wp0rOrr/oTnfhWXWrKVmJa6kK4WhgjNh5QGbJlulERmhzwWeWRz++aMA3mbwigz08qRDi7aNPNAFxEi0EF/dqsm/9KN2os88/2mWgWMhJl3XZNEXLAd0sWAO06wx2TcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230401; c=relaxed/simple;
	bh=5XUtMoDRCkTRdh5mvmKCDd+dNP+k6uqdEMLM9UzaAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEzf9SmkpBsYV4ncCKkOpdgpGZNBkc8kvVfw3V/p+pu5+zOLwvsLJPJykX3gX57LVFikAHpY7I0e24RFPRFlldUS+LTAjE3frt0Xk+lznnzTCAXw2Xr1O+OYoB0qAVllAdO16OXqfvSM/jsyTUBDwZyCci3UO9zYya2d3TtvnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g7ny9/GE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g7ny9/GE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227cf12df27so33005035ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230398; x=1745835198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=g7ny9/GExDGwCwNS+X30Mzw5wMZkr/0gghjP4E5oDIrDyhu5d2j6j0yGLS3dAL1T8B
         y8ZFygsi7P0T0e8JlqMAFf4trDMciODCxzy26Tr2pmY6bT6f3dqcjZN5Frx3MqGYdDLR
         xoXeyVSOHDhkZ2pUm8KRCRF/eGncHC/f/eFfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230398; x=1745835198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=mGA89+FMq/3CiRW/UxUyILMOczXhhgveMSSv1PKBYh9NTNgLQKw0XAxYVexEWXXws4
         IkZvnWy3LBO298RDNCT/8SbHrjhW09qex4WQmWop5x0DVICCnAeYWXGVkNydbwFf1gf1
         C6rhNN2Vmw6TP/eIETD7J7XjnV0TQpUHTcqhWYVVxWoahEoO5dx/cUporgKRLyaxBYb5
         t1KlHEw6dd3LA4nWBeNVlqD2GAGQ0zuWeE3igrdcx+dODS85Gcay7x/OD68WkpHMQUEm
         GHxV2MOAlYOQ140n2We5Sc4OWbwumIX/uSC9naq0G1Q/u5wk0OTTf7dJPg8AYK76u9WP
         mIyg==
X-Forwarded-Encrypted: i=1; AJvYcCV7f7m0SGZoKyRC5i4uZCqTkTz3VPjZqaq1ZXixo5mu9AIP+3E5/ca35ybi3oR94toyo/i4eEg7tJ2qU+7mANM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmqydsMgG/yO6pmot9ybvg03paNTN5ZSxm+15jHBXVcrw9pwst
	pZrXans32zsQYz/3PHJDXGjbde8gJPP2qNuEPKDeTBJ+AbOia642vBThwQjmGw==
X-Gm-Gg: ASbGnculdx+yTvaCLZiMYfo+U+p1k9TFHde0yHIaWwSdluLqEMuD1G0rVrE2dMzYXLw
	GjIllTJ/kdBbz6EIGz3h6hF8/KNBkPUTvfCiAfAAP4DL/YMhQyXX+EG7MBc4hWMmqSNS6+wfO/f
	VXascRE2bggijHjHELz4RztBWDJBMu/yRWAbUS2pWi69IMot+ML/IzkR4m8XWo38tt4+nnt28kx
	M4vNQWg18XAMnMBvXv+OJmgHJuMMZG9vBnKla8m47r0XZ+/WINAhtWTZwb0QRi5mwv7YP9xQ4MO
	Wo9tlhnXZVtWQIY+wMrhdNHJVx9oB/IhJbG2tqYwMYCRPE52MoogKdakkJrjI+kwOydT1w==
X-Google-Smtp-Source: AGHT+IF6rGXrSzCpvaNGhX4xciML4WX1Qp+Xf99qU1svwwhGPd2mOXprUmL/S+UqQYoWzSfytulsaw==
X-Received: by 2002:a17:902:f644:b0:224:7a4:b31 with SMTP id d9443c01a7336-22c53e38f33mr139591965ad.6.1745230398086;
        Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:17 -0700 (PDT)
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
	Douglas Anderson <dianders@chromium.org>,
	stable+noautosel@kernel.org
Subject: [PATCH v2 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Mon, 21 Apr 2025 18:12:42 +0800
Message-ID: <20250421101248.426929-5-wenst@chromium.org>
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

Steelix design has two possible trackpad component sources. Currently
they are all marked as available, along with having workarounds for
shared pinctrl muxing and GPIOs.

Instead, mark them all as "fail-needs-probe" and have the implementation
try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8186-corsola-steelix.dtsi      |  7 +++++++
 .../mediatek/mt8186-corsola-tentacool-sku327683.dts    |  2 ++
 .../mediatek/mt8186-corsola-tentacruel-sku262148.dts   |  2 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi       | 10 ++++------
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index e74e886a00cb..822a177e7c19 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -123,8 +123,11 @@ trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -197,3 +200,7 @@ pins-vreg-en {
 		};
 	};
 };
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
index c3ae6f9616c8..4dbf2cb73a81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
@@ -17,6 +17,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
index 447b57b12b41..ee5bc2cd9e9f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
@@ -19,6 +19,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cebb134331fb..918f17385ba5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -390,19 +390,17 @@ &i2c1 {
 
 &i2c2 {
 	pinctrl-names = "default";
-	/*
-	 * Trackpad pin put here to work around second source components
-	 * sharing the pinmux in steelix designs.
-	 */
-	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
+	pinctrl-0 = <&i2c2_pins>;
 	clock-frequency = <400000>;
 	i2c-scl-internal-delay-ns = <10000>;
 	status = "okay";
 
-	trackpad@15 {
+	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vcc-supply = <&pp3300_s3>;
 		wakeup-source;
 	};
-- 
2.49.0.805.g082f7c87e0-goog

