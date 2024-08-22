Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89441865EB
	for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318460; cv=none; b=LousnrJncNRIfsEAqONHJ9rvHQW7SMNt2LtHNQdVxd20+WO1pCHZ9VTJ5PjRBSxXbwxqarIOzTl6rAeO9j+ZdckgPONSnt2RpiF8HYDVjUm5sVllgdCJLBOJYEe7Vn0CXyvabIuzQGx14Hk23unXhIt3UiMQpPwiadByUGRfQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318460; c=relaxed/simple;
	bh=KPKZx+o2UwLiNaiDemeY/MCCfCJXoZ6VeunQ3tP7UxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzRXL62V1rB2iORVLvjw+h96WaywegXniRe65onhiMr0DSr1zeIjaaJY8ReMWXq7Qc58YjF3b3V3HafW7QvXuLkSLbybObJJrjwbE8Edaz+FWB6x3pKs7dlEZTT9Z7DrkSnU3ceGmBcI2sipJjDBYhHI6Ext7NNjWWdD/uC9OTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JFUkGO2f; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JFUkGO2f"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-714226888dfso520037b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318457; x=1724923257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0ZXsCUO90vlD45ZJO1I+QT/1oidv8iaRsna2l2Dubk=;
        b=JFUkGO2fLLv39+8WmOR+51eja6ugfnXxKTyFoCrzEVJljnw/XPpf4aZLf7bBVLkkAG
         gM40hlEg93NfXG/nfLJZoIBLGE5SQPGWkudXAUd89utDf9HaIqKqlQoo6FVXMXb/4RYR
         31KbKiRK0xrX1KPXWobC/g9Z1+qeM5a9QUIu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318457; x=1724923257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0ZXsCUO90vlD45ZJO1I+QT/1oidv8iaRsna2l2Dubk=;
        b=qz92BwAdWI3/MytgAiOBvU3SsQvzPEQWFd0iJCTvVBfM8M4wuXVUh7r4EH+ZD7K84y
         paT05K+93J4Xp13HQOKUJhaLZ1JDbD9qStT6XJbYw+dMoHfAErux53pJEbi/IqndOrXe
         QpLXKfFx8rf308t+kSIwvulbnA/T2oCrYaIxi4KOxLw516cSAcZSJLbCECdtX2RHFG4m
         QRzlmRGs9XKUgTVuB88pMWqIOFOiMRgBIaNSbE/Iz6Wlm6IwkXDjk4Cc+cwKkUUe6x0R
         GFe/GVYmxUO95nHfH47RHBX+ULcUTdvJ6E+sMDbHlcgLU4LOIax+8sQy0TxtF5IoE2Uh
         GUpw==
X-Forwarded-Encrypted: i=1; AJvYcCVhvSHiGETLU8cSwJH/hTvn5FsnShSBL5SK1JtcW+NPqvABhbBqChIJ8oq0aTzSXb0UTIbJ3E938mS7Lysrs7g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq6LqIEdFrMy1Aq0Uown5zoA7Kde1hb/psXqxAsZCw5K/S9MPb
	dnWulVaDmk3pPvxRR6NjU+wHjGlz+aieDOMdxd2FTEjLeAxetlZjC77q+BAIog==
X-Google-Smtp-Source: AGHT+IGopbbojtmE4fS/IUOg0cpO0JEZHF2VnB3L6eDK3aI3tJHchVj0lRN1Md7MFI5PPKTGcEf3AQ==
X-Received: by 2002:a05:6a20:2d26:b0:1c6:fb07:381e with SMTP id adf61e73a8af0-1cad8180a2amr6660606637.44.1724318456919;
        Thu, 22 Aug 2024 02:20:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:56 -0700 (PDT)
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
Subject: [PATCH v5 10/10] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu, 22 Aug 2024 17:20:03 +0800
Message-ID: <20240822092006.3134096-11-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
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
2.46.0.184.g6999bdac58-goog

