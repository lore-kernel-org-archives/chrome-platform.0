Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7024292C
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776249; cv=none; b=b466t8c1SQDa50mot69s57/rb1ffP1a7DTWa2qev/XWRQHoqd6d7XsTMoBxrr6r4SIhlGzXJhX31evdBqRNFTH25HaAoPEbfbC11njVZXasz8NP759BslnbG4J6WVA5teFEU5Uh1oy0M8xUo3n6HrtqB7EFM/p3wmexsbmEoZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776249; c=relaxed/simple;
	bh=005DS8QRrzpQdoXyb+W7Av4A9bD2sm0mlAHOBLREaMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PB7tZi5M829/cuauFIHRdQ58HHSIkL5lZybPPUlYlRt+yjHJLNSXVYGuROmsz3SXyfg6I/agLyNF9OH9EIonzVyZiUWgVDO0J4+aCTLA+Q225ysrQfScf5tF7iThZxAnMGoAT6m2IvzN3JS4M0vB8Rs+AbzccD9UJmgM5AY9vGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IPCFC1wh; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IPCFC1wh"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so3697164a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776244; x=1742381044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=;
        b=IPCFC1wh5XWQ1CgoMRhK9aW6ALoIAGThPz5BuYAvmQ3kCWhH4oywCQm7ChYWrO2gBT
         ZnQAkD+ZllDW3bFUlaECaTuD2D/VPLMbtFLOX2X5HHv0QGHwGnH6jAY0wgDX9g4pphwW
         kyeDld6oT9vgX75p71HivER0nICccgNe9ehvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776244; x=1742381044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=;
        b=i16QMliy3jjPWZUcyQDIa9gEloinnW8Z+YSSNgeTwY+p4viPlpZwVhTY5i3CrHJT6C
         M41upMQ5Yx9U/CqTgzgZlCRMWx6U+1VZ3b5jPJkRh2iiZsxI8sIAzQALAAlkFyG3BdyO
         tOczgOE5W3WsXTpSj5l2A2a16Zt+IuOANXc3VGOstV8VyPN5oMBy41IKx7m/VMztg3yw
         pq0Ox1NX7SP4qONmoKHl6lUClcJ8A6gOVsTNTfssiJkBf8que3NRVPWoLytiRqXMZbCg
         rAGG3hGlX/1P26RYzD4tzZ26m/8BDA8q5hmhoJIBkMhdwRyL0kkOh+cLY+UBGVEv2mtz
         U1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8xo08T4Pr2J3yG5a9PzBrCEqxy5lklbs95xKb1kqn/exggPV2j3v9stFHO6LiwPF6SOQdhdcohs2igvPUsds=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Hk1YvHyFVlq5oFCRuH50cjqcB2aiNB2k4PYcfwcmcJN8sUzi
	kHPyZbNi38RUl+dFtZO9chgJKbs5ARbyq9muvEwCJDG91gQR/Wk5IP/zQyN//A==
X-Gm-Gg: ASbGncvqJDPtS6mQqwW9Kz47W9Frw8W2xvWKQ+fEypmOniu8IAO4lmYsv+fS/a5+Lgp
	nX4Iy3+mX1X4XNMW4HxN9uZorD1JD+xH6ykFRwaIxh9pFz8f147lUYpyyAligvjKBJ6zOsbwYou
	+5gy8g046HveSzjB6DtA+O+gc5Z2gh/lLXSEXeNuotcLr7BdoQ/FMJYxmb3lA7TflhW8wT6OYSy
	5yixUwNUPbKE/nkh0tHAt4KjOysGZoqUUZK5iFa5D5rscbb8Vr+4bfK2Pc5h1R8Rc/G1eAd0mQK
	a+hhEwgL5TOep2i0WgFxOjE9YQUi/a5ETUj/kULL/peGO9V/f2NhLo/OBim6u0U=
X-Google-Smtp-Source: AGHT+IHJj3ClCl0G4w7uRfbh34yNw6y58jNADTnvGcCG6MJZbH+QLxVptAl9mfKjSGMGz6TiuUUEtA==
X-Received: by 2002:a17:90a:d88d:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-300ff368043mr8303305a91.34.1741776244552;
        Wed, 12 Mar 2025 03:44:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:04 -0700 (PDT)
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
Subject: [PATCH 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Wed, 12 Mar 2025 18:43:38 +0800
Message-ID: <20250312104344.3084425-5-wenst@chromium.org>
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
2.49.0.rc0.332.g42c0ae87b1-goog

