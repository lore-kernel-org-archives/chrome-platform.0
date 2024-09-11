Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84843154C1E
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039735; cv=none; b=bPnd2VC8wHbTkeScEWPsm1sekwMxeMpG5YyOIEUh3kQoSIF5BmZ/MBgj1GS/nAt1TQvYDRvmXYX4Nm4F0N4ky3LC3n9cEcVdDy6v/fZXZVJJBA5RbG+D/JJRX2BE5yMCjvJX7fjRYutL+VoXeB1HLTLIYmdMQl/UA6Gj9+OXpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039735; c=relaxed/simple;
	bh=WH9TQBccmD+rZJ3vfv7UzS/68zcsvwxBedWHmlT4AQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksbLIMEfOEPKL0hHTHFst1mIW9CHEZx2g7mn+e+RltAeAJlanG5Zs0QMgt7yV1kDygzN1j3wz+8ddvRT3oFo4Lbh+SfBGh5LXDW2f3EJjv21r+Uy4L+fBxSHWi1DftsasFcuwjYRKSv1DO8cKRJCR0TFQ0/OuQMy1lwA7fdwOQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QHtzaHhV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QHtzaHhV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71911585ac4so1214555b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039734; x=1726644534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwH4RxuOgmEV/VtpOzbgUmR2GAZBgupxo+TGOE0kG2U=;
        b=QHtzaHhVTbf3Y3VCAQIUj3GRouuwM5a9sAZTn82F+ICuiW1II7T53iE950n5uBAnfi
         I3E/1p8WogrS8qWlO2RVxlr5hf0nF6BrVwRcE46482AdVyYVE1S+ac0REVit/3XUZ5E7
         yDdGRKSxedPQiPpje9/z28GQ8k4R2ezZd6UaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039734; x=1726644534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwH4RxuOgmEV/VtpOzbgUmR2GAZBgupxo+TGOE0kG2U=;
        b=BSeDKmK03mCoVigGnR18UkFBEboqLJPz9LIV2DfG6N9U8TP8mlSEw24kI2D4HOVH1D
         D3EpdQDOiyC9VyZ3DHzWndAJeUI3i+o11DM+b4ZFqKGGevkvaCWrS+TvNeviyFmAB+jR
         xiVGgAeIJNNhK9512mi0R6gSFlK8itspXC36v5QmQ7EMe7lnWqgCTTy+a/OMrudeMmej
         qzYlq0hndd5vp+ZIfdlbuFPO75Lub2eYhtGeCj6F69tQ1lAgQxeWqh9wGN4gAUfsbUNd
         EdnxxL+SFfzDc0wsvKI5wYhC7V0zgQ46AqMlTYwk8IPikszbDwX2Hed9jzxukXBTu0jy
         xmpA==
X-Forwarded-Encrypted: i=1; AJvYcCXffu7tSHbraSXBZC5SqozY5ktkbc/XL+Kf4tUw/4u/aEcGxm4+qIY5JlgQxRcc7IH6L19qGhnU1c2OBeKfKI8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyht7Z4LQL4Qsz1qIUOpzeX4g+AJneGkQH99xyl9omRSo1p2V2q
	KtzgPNYK7jNyhJDiQq0D82GKG0mi1SjwMJGUJw9JaWeSUQgyPL+gplDJIn5gqA==
X-Google-Smtp-Source: AGHT+IE516O5LzHPomwlShsfozQVhv9kW9/2NJZ52HjZuQpukTdS9x9UaAx49lZ9H3HGK77PP1P1/Q==
X-Received: by 2002:a05:6a00:4b4c:b0:717:bce8:f8a9 with SMTP id d2e1a72fcca58-718d5dee47amr21431629b3a.1.1726039733865;
        Wed, 11 Sep 2024 00:28:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 10/10] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Wed, 11 Sep 2024 15:27:48 +0800
Message-ID: <20240911072751.365361-11-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
None.

Changes since v5:
None.

Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 8d1cbc92bce3..251e084bf7de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -14,6 +14,7 @@ touchscreen2: touchscreen@34 {
 		compatible = "melfas,mip4_ts";
 		reg = <0x34>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -26,6 +27,7 @@ touchscreen3: touchscreen@20 {
 		reg = <0x20>;
 		hid-descr-addr = <0x0020>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/* Lenovo Ideapad C330 uses G2Touch touchscreen as a 2nd source touchscreen */
@@ -47,9 +49,12 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -74,3 +79,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b4d85147b77b..eee64461421f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -358,12 +358,12 @@ touchscreen: touchscreen@10 {
 &i2c4 {
 	clock-frequency = <400000>;
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&trackpad_irq>;
 
 	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x15>;
 		vcc-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
-- 
2.46.0.598.g6f2099f65c-goog

