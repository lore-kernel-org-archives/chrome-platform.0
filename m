Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8151DACAA
	for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158179; cv=none; b=jKQMLMyhGR7t5qmRT7H3bq8i+PcrXuAId5u8T68Y9F84++yPv2BOT5FoxqPo6QJ/FP9UFy8PwlYt4Udc/V79gfliulFWl8UXLlkLQI6seS2iRaL9eMI86cbONVCK0AsWT9+cjGtCjC06CurG1bA0GP3WKmWaSYsqPo3j8L9enN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158179; c=relaxed/simple;
	bh=V9z/vaLUXaKLZjuP3iq+CpCGEU1lqT/fL6h6m6KfjHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLbxsJNab1RTV7MS2JDWxzXVm1kL9DI5Yt1rUnK3UaTOonWdrgUcK2/NJXgutGNN78kaBuoaGrA0XRgm0vpkmaDJdYChGuwgX7m1wjQFACfqRbSVEDii1TiPIAvBchLQPGsFsoq9xMPTws+CNQZDwWYXn935gjDV4GwuMz4QNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GGiCzcCw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GGiCzcCw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cbcd71012so7012395ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158175; x=1729762975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgdGGrdxh1yrmxMi7ELq+GCDozx5PI/JXUv/P9EgGw8=;
        b=GGiCzcCwQzQHS1VbHiUzqi0x3eAKrz6zwVErKklqRGoZuPHEZNJlnaDMgPVxC3TQZt
         k2gGm0zvtbYxhVHlEDAtR7WaBAFOlELIUDv4TN9jHXIswV4yQbTcHAN4B0H5N6IBHElS
         hhNj9aWIh9OFoB5lpO7cU095XZiP6XKX5T5H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158175; x=1729762975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgdGGrdxh1yrmxMi7ELq+GCDozx5PI/JXUv/P9EgGw8=;
        b=vXdpjW6ZcmyQE/XJNBSiJPRusNqEbCRjlD50239dWQhkD51oLDSyC/A7QpLj0t3tpm
         9y92kh3YsrUWhUBAgWhkHj2X1ejsK8CmZjdXpyetkm0aoky+koF8MfqXKeIorGmT2RFx
         2nk7rMmCefMf85/8Ex3kOepikXRYKV3E/j5JmqjyHp1Z853IP3YrZiycMuOw59qv/Xf8
         UkOzARCXMJzg4Sq2y0/HfXzc2uLrZZxWVF4I994oEN3cMhh0A6jFDtlRo4uOcA5pP4vW
         sJbJHJHoIOPZ0vIZjdUlfvWCytgCd2YwA93dSISXjZv0IIpOq4gKQz11uQh3ByJVoQO7
         MeXA==
X-Forwarded-Encrypted: i=1; AJvYcCX1e+MP3Cw46TXKPTr9OpxhfVCiROUhqiPlhu9L+6IKRU+788QIA6OY7H4VIx4/i2mxFouiRwiFxpkYjnGElEU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6IR/67GdRsk2woRe4pI4YzGt5qbDSqbxOoywmTNJazTD3P1sy
	4BcBG+bbguFAdSI6nJ9S5JLRUAGDa75W2M1iZdhBAXCSMrzDwiLGrqwF8YDuVg==
X-Google-Smtp-Source: AGHT+IHVU8qRS0FvlAaYy1P680aH2xlYaVBdegJzFVdyqHN/XTuDFiVaYaam7IEGx7XhiQ/wL2kUcA==
X-Received: by 2002:a17:902:e80d:b0:206:c486:4c4c with SMTP id d9443c01a7336-20cbb2abe0dmr282504325ad.57.1729158174895;
        Thu, 17 Oct 2024 02:42:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
Subject: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu, 17 Oct 2024 17:34:42 +0800
Message-ID: <20241017094222.1014936-8-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
References: <20241017094222.1014936-1-wenst@chromium.org>
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
index e03474702cad..d9abd68da369 100644
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
@@ -56,6 +61,7 @@ trackpad2: trackpad@2c {
 		/* post-power-on-delay-ms = <100>; */
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -80,3 +86,11 @@ pins_wp {
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
2.47.0.rc1.288.g06298d1525-goog

