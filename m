Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D15F1DE2B1
	for <chrome-platform@lists.linux.dev>; Wed,  6 Nov 2024 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885671; cv=none; b=ILFs5tX9kZU1graWcdTlchmPktQ6OjsUNgVR4UaXjUUN8TOhOz3mveW1DRXFMW5QgUv9Q//VPrCHNXKkmgevMug8MEsFlVx+ZN89i5zGbP4KttMbYBRCGkFu0OV5N3iYvQzpYX2wA1Rr5Wk4N+jV5k4Um1eKTKVy8liLVcEJF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885671; c=relaxed/simple;
	bh=fbfS5+0BG4rw0gOZBk/i1Plr3VDHJVhinZJf5GjxUnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBAQx47RiHlA450189gRMqtB2FeEYCxnjaTgHx1VDBQMSJU4SHFr/e6xxt/KXF9lFx47mCR8/MLv5Sqp8VGOhXuFylDLK/Vxx2Vos97WejP2xSThHCoFQupBDiQt+c0usMVUEPuCsgEhgr7EdI9eRLk15iz+FlHaNFhBfb69boA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LID4rZEN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LID4rZEN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c77459558so54642435ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 06 Nov 2024 01:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885669; x=1731490469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/GF/Qtpn6msAtbROl5IORl4ZiQde9+aAMX19fZKFEE=;
        b=LID4rZENeoi7WwixSqcgAdM5SJV5nAY0nAt7+Ed/O3nl3vMhXDdaM5dAMwbAtx/K8U
         OE6zLFhAnkBDEETiZtE/D6Hi25/8tlZXPf26k2etH7t2yUGFUUazR52Us3fDK539GpPC
         RJPRzd/p25eT5WmeWWX9RgC31Rol4AOp67jLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885669; x=1731490469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/GF/Qtpn6msAtbROl5IORl4ZiQde9+aAMX19fZKFEE=;
        b=pvdVpffBTqChzEKNNE38SD/sTrI0IBdwmVivW71uvzG63FOzxDzOr+iKtVi15QxsLE
         TrwBCE+YGs4kO7k34rvl4DTBOrX4T8/cPvb2U2+tQ/k7aVMTNMOK71RZJsEChyH4zUXw
         JXNtReRy3rqniB9T9K2nK4oOeXo89DvmHvwFIy0SeeVX0byi9waSC8IcI61fbkPCo3IT
         mFY+5htHZ7S6MLv2f+J7Pj+t2IxibQMPz4qbtUjjs81Err/cG0my5rmoqAK5rmf0uUL1
         5Q76CO9Wwug3Bp13HlOdmY6qbxR2k8a6aPUp6oHxPaspt5HGB1hkiroq0wVNkEdrpccO
         5aww==
X-Forwarded-Encrypted: i=1; AJvYcCXaNblJDFVEbaHBWkdgaLX6zG7T63drwda61BQt/Qo2ZGtKbe1ueRfQ685FV8affIUsWGjiyeiLMIo9RALEQso=@lists.linux.dev
X-Gm-Message-State: AOJu0YwO7Tw7MrUla4xADVSHhy4VLhi7XSJwLp4LijOc5N+NDFPhwfza
	cav140z/wYu1AQvF+fuFn4bQt6azf0Bss+FlcY5WXROHpbqgR2a0CImzqA/fgg==
X-Google-Smtp-Source: AGHT+IEFJaxMs5mAqrxaj0N0qXwA3k96U3FQh8ZQNA88MZaxh/utNb59Xt8KT+qflVg8MQLvbAXTtQ==
X-Received: by 2002:a17:902:d481:b0:20c:5d78:4d8f with SMTP id d9443c01a7336-210f76f2d29mr381797155ad.52.1730885669470;
        Wed, 06 Nov 2024 01:34:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:29 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	stable+noautosel@kernel.org
Subject: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Wed,  6 Nov 2024 17:33:34 +0800
Message-ID: <20241106093335.1582205-8-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
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

Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Changes since v9:
- Picked up Doug's reviewed-by

Changes since v8:
none

Changes since v7:
- Mark touchscreen@40 as "fail-needs-probe" as well

Changes since v6:
none

Changes since v5:
none

Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index ae0379fd42a9..dfc5c2f0ddef 100644
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
@@ -35,6 +37,7 @@ touchscreen@40 {
 		hid-descr-addr = <0x0001>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -47,6 +50,8 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		/*
@@ -58,6 +63,7 @@ trackpad2: trackpad@2c {
 		 */
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -82,3 +88,11 @@ pins_wp {
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
2.47.0.199.ga7371fff76-goog

