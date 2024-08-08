Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625318B47E
	for <chrome-platform@lists.linux.dev>; Thu,  8 Aug 2024 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111207; cv=none; b=hyrq2uVpncQV2vw78pWmM6lVA1jgahRQV7GniGCPqouYGOoET1Er7+Gi2zZfyY+p2H4LpXWZGL5F/IPxy7WloboYCNUCXvRZw9J6Q44Hy5LiFdmFZURslDL0zhcdzK+I4M1JeR8Sq8yjLXwwRET+9L3gAWZp45egrq8W/K/YZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111207; c=relaxed/simple;
	bh=y4je3VWsBqj5qjHQT037MyYHsD/meXwgpUrJ0PrYeP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GR4aL6ryy353aC2uvekKGHsrduwMpruVALfSZHVd9R62lwXBw8G2ssIiJYmor9fUsWqasbQEJlTMkOUE3581D1JUPECOxVcUxEDOlpLXT/NpalwqF2lU0BliVUs1whrtxZSxwI1dPvZGUkeVbtCvLxB62wBVmp10EMyLfU/PlUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DjdUnW4y; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DjdUnW4y"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd6ed7688cso8194435ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 08 Aug 2024 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111205; x=1723716005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=;
        b=DjdUnW4yW8+zWFCJW2M9vJS4y9Kxa/zB23V9WmFeXc7t0ijzaNEY8BCXyfM0xV2b6d
         hSbEVERe69Gl9gl4YBoM59n/bLqw1dSM2gwYCRtBTCCdRBOoTKnAtctAcT+XXM9oQfRs
         TDeJNEmDpgVD4Y5QS7VPFPfbk0jf/kuTJfpMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111205; x=1723716005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=;
        b=c7IvdkFme9ELjpTKuI8DZZOqr105XvtYMAIIV5Y+RtbQnw8JXzbyaVOLv6r3s1Tsaj
         NHFf4frlWyXeHAEituWGVNGSdnsB9zBSIQzG1qSJLRtqVLdBLah5RnbqECrYZ3Dw99Ci
         q2XQBLBqAGjzxHWQiOtRjGjjjkjJ/At3F0TcZcBV3sRTABnL1ikk23afnpVJZiRyPDnT
         zzhca5eybQzGBSyPJ8QkDrshcLplzA7/BVHQsUyYpqEfaEXkS/3/KIuYbltsrkGrUNnW
         tmTBwYbGLiroQvk15TyYXo8OifT49o18CR3L+6+9QUiSaBFm5wRtGhIzNvKSEqnUA3JX
         iKnw==
X-Forwarded-Encrypted: i=1; AJvYcCXTalMZ4z/WKa1hbkP7Zdp3VLM45LvtpOcRnNJCvG5AqW99yXUyK/CLh/huRFdqvbByM9G17H161tcLIwiUF9qs4GHyY5MUQim3ecsZgyPO
X-Gm-Message-State: AOJu0Yy8Lo/sDNE6CQ/CJlZOghQHXi9M1JgLTXZXzcow7TwDVQYESWNo
	do6lLThlju4hs/3U+SG6kC9GChRRH7wRhbqdXPQPRHkrzhWE0P2vIWGGtuitWg==
X-Google-Smtp-Source: AGHT+IFHYCH6ZPttGWJyX5orsjVgIQjNRW8T6hIcAdANhk3iA3ouOxz6UxT/mqu55va9bKkOzlc4Ag==
X-Received: by 2002:a17:902:ce81:b0:1fd:7724:c783 with SMTP id d9443c01a7336-200952654a3mr16237775ad.36.1723111205352;
        Thu, 08 Aug 2024 03:00:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.03.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:00:04 -0700 (PDT)
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
Subject: [PATCH v4 6/6] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu,  8 Aug 2024 17:59:29 +0800
Message-ID: <20240808095931.2649657-7-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
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
2.46.0.rc2.264.g509ed76dc8-goog

