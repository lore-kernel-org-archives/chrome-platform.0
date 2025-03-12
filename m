Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E024501B
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776253; cv=none; b=e1qCtLMl6QEmahVqNV1xfS4KECvnYpnPNSgccuZ1aZjGyjRDRDU4qG9Tx7DmAKMCtiTGAh7HR5/6/75tz1SWd8v8nsbLtsLc0rtPfG8wfAhjfYH5EQ4V64y2MVDIYHEqbfsQ9cGKMj+NVJU4EfIA8Gvd0latV3FmtwnbBeMAYls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776253; c=relaxed/simple;
	bh=6KzaDgXAuvehobhCqyAsKe+VdJwH/17xKtj+Ekr5FFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7DqzkCSfZqY0ILSiP4M1GNlkr4kY23//hHsmSIlBhYJSEO86hCw3xtIDUbxGow3mFtn6cPczZNXfSUqrXPoH6fJueb/OlUX5u36CX6LiXmgNKuiPe0xD0d0e0trBCYQQ5ie06uaaLbOJO3EymAecMjTBpbL+1iVUIke4E0F/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JAPyV7n6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JAPyV7n6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fe9759e5c1so9871315a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776251; x=1742381051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0rwtvzwsfEIt6EQwRB6Y3EdYF6stdicwqbW9nbuzVU=;
        b=JAPyV7n6gRH0SaDRZWyOO6BDJO+TjhE65OYBXnNpNrQIH4USxIuSohacI8wcRLoH/u
         D8pEAJ0KnwjqJ8KqcoPMBJl7z1arfSz7a28Zv9gcExYN3SYZFJYTvwqAba8UUSVFw46R
         xxp2G8ie8U6+7Zj7TJ8WbHx9xIarF/6lT/o+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776251; x=1742381051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0rwtvzwsfEIt6EQwRB6Y3EdYF6stdicwqbW9nbuzVU=;
        b=vDFS06B8o2RVzr6LLDlLCXG3MwyBGzrFuPUtOpJDcNLHEtF3mW1qiodH4mB7VIkbr0
         cGNZBBPh2mxFc053QevyDcZYd9hpjUqDopsTE52u01H01jX5rAnZTfJybJx9N1F4jUBw
         pLNNkSGhLJi2YIfpRNqPmQYDA/qUgDtSBGB6Waf5La+n9fDQuWE0ZC9Kv4pLbRnQr8xx
         M3gW0CdpMiSPlCfWbgBeaqCJw0ybpzejJE3WdQvXh9fbdOsuMwKCgHEYxkYmLKBDMJNn
         QlfZZEfqHa96TGcs8hXVNzTc81/C1O/R9QvSlBHcK+2UYqotKRmg4f2nSnrsyP3p0lxf
         jNlA==
X-Forwarded-Encrypted: i=1; AJvYcCXDCBDnNpEOkUKjjrwO8xnM7mlkaxmfriD1PyNITU1UImq8RfJwrB3WKFYsgGMuTT1YnQOsjUMRnVeEX2x7ypA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBnJ9+58uL9SCCuklg32prcKnT5I+BFIHWdfuojIcBvsRwZ5c3
	qI41OqLV6YxOCWfqQk1T3seiJIC4gBCrBuWdHUYR5mjiL2ID70EUbnWrFbxU6Q==
X-Gm-Gg: ASbGncujhWtQaRKl7+gf1L7Kj75zBulKgmWh5xZs9ryxLMywkr8xe4RaT707F7CJrZB
	UCDqcWqP3XbydaYRwqp8yYgFDfvKQtxLtQaWp0uiCdtIRiiCMTkhGx9lRXWMetbNDkKJZYvLDlh
	sgYP5p783BQaHhVn2+CBtM6pEAjBfk+01R7HszHBRsdYCooGohOItoeTZV1zauIhRPAKv7f7IrO
	w+uyLjU1HDqOZaeFyfGyRGCqMq/TrrNRQe6jCW7PCNQGz0j6/Qw//FexSd9eRyPxEP3wgcTQT0x
	oVwS4J503JmYgAgOGBgbGhz64QEncO+CimGIdcKeMv8n51CxSo5S2kTEekyMaxc=
X-Google-Smtp-Source: AGHT+IFJEDyls+cbJCxBCdhAUNOO7qiruVd5yhiIVXsu3lvkvt9Y01tOY1MADvDbSxiriAzgZl2LFQ==
X-Received: by 2002:a17:90b:35ce:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-300ff0d4869mr9687514a91.8.1741776250694;
        Wed, 12 Mar 2025 03:44:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:10 -0700 (PDT)
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
Subject: [PATCH 6/8] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Wed, 12 Mar 2025 18:43:40 +0800
Message-ID: <20250312104344.3084425-7-wenst@chromium.org>
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

Add a device tree for the MT8186 based Squirtle Chromebooks, also known
as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   2 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index ff67931e7821..77ce29608170 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -65,6 +65,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-squirtle.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
new file mode 100644
index 000000000000..f721ad4e5c97
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google squirtle board";
+	compatible = "google,squirtle", "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "elan,ekth6915";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+
+	touchscreen@16 {
+		compatible = "elan,ekth8d18", "elan,ekth6a12nay";
+		reg = <0x16>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c2 {
+	trackpad@68 {
+		compatible = "hid-over-i2c";
+		reg = <0x68>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	/delete-node/ codec@1a;
+
+	rt5650: codec@1a {
+		compatible = "realtek,rt5650";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 17 IRQ_TYPE_EDGE_BOTH>;
+		avdd-supply = <&mt6366_vio18_reg>;
+		cpvdd-supply = <&mt6366_vio18_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_codec_pins_default>;
+		cbj-sleeve-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		realtek,dmic1-data-pin = <2>;
+		realtek,jd-mode = <2>;
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5650-sound";
+	model = "mt8186_rt5650";
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>;
+		};
+	};
+};
+
+&speaker_codec {
+	status = "disabled";
+};
+
+&trackpad_steelix {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index 822a177e7c19..8a196dc9a96b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -118,7 +118,7 @@ &i2c2 {
 	i2c-scl-internal-delay-ns = <22000>;
 
 	/* second source component */
-	trackpad@2c {
+	trackpad_steelix: trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

