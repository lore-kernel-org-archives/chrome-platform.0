Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3621D0172
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440469; cv=none; b=ua+bkhFvhs0W/1MPWphw08jmNH17vFni2sjsgazg5+BXRytwe1inhy9WievkOjxQphMM/HMUfR5+YZKXH3wvRB1i0d6P6ZdqNssjTjWgFjla0gXsKtk+eL8bTsaYVxvp0CWvuoBIU1P7yGS3O7Zk12bdxUy4NFAw93CqULbS59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440469; c=relaxed/simple;
	bh=TETkVZ+20vH6yp0NjKmhwjdtI4t+kdGs8b4C7PTUYyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mneRjjtgyHqBinfk90Q+8k476PBwb02S6G9T0P1NuzMEzEBdDOKpdSDp1NsshwNxR4m14pA96teBr9m93EbjKypAwSlusLLJrLdukl8JuGbcV7ibdVtKem2Cz1EvjLoc5SS3qXBgp6R82+WMVYiymVQuTkOIZYsK8l8vPYQMSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MLNG//oJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MLNG//oJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71434174201so5171669b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440467; x=1726045267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBItDi4n14IYuM9iuwfGhl3IjynLmMqAt1J2tlAZIYM=;
        b=MLNG//oJNxpwBkDd8xAXEt+u1UWQGG1Wnci50K8JPKW/k4qFC095Q6hhGqC2ucj/4V
         BmPgDVRfCoBfaGag01scKQZsXWNaUMab4GVAvWveYh7qrAkUb/v0IzdtuDKMRctjxNIW
         z/rkhogLROoL3q2yQUTTArSZ8YaXp3rMiTTGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440467; x=1726045267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBItDi4n14IYuM9iuwfGhl3IjynLmMqAt1J2tlAZIYM=;
        b=DTSg3ntH+gxjeO5eGxswb01SAohvRAvi+ib7OhtqVsKMAer7o1RlEmukQIlV9VB/pE
         Jj3DkGQCbo5ImMD+S4wgs5bkoOdTI5b+W6bUoUhJWAiF/uPTeO+HB4k5IbVZxTcmj3wB
         W0w6u+4vvl3kKg9NSAyViQT7EENPldKJGKxtAFNwjfUudpACNXHUI1d54J8R2+Wpu1Ry
         lKGvHwnJ6XGvglZG9umVjPHUqDJ3x6GNqA3Ihmg7Td5XRCbhCJNiOL5DVPMmsEO9LtBd
         e+8g9BG/s4H7uuxkxfAeKgz98CVYFFMabFh7/1Ewb6I6/GvmBnjQdxwQO/7tBjA0C8+F
         Dq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+swo3kH4S5fPmDUP32surPPwbg+KNEYZiMfGJZMvyDfsACViysALXq+RkOaxThMGU0xCb7weqSqHpQYr7Kac=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIBKUk28ykAXsWF1BoTvTC1JnPDAA+vMfEvx8nbZDoeCvPhc/N
	QOe01ViQcjWTTimVeUj/5N3WtFnVaMdQDFrbwYYfuxNu2vgNMTbpjEXRFMNTnQ==
X-Google-Smtp-Source: AGHT+IH2qucxlwAjWUMwLjsKdIgEfhg67bYq6GG+aNowoHtwaNabhMzLvVoNZUyf17AzUzRmQ7DIlg==
X-Received: by 2002:a05:6a00:9282:b0:704:2563:5079 with SMTP id d2e1a72fcca58-7173d0069b0mr16668781b3a.27.1725440466605;
        Wed, 04 Sep 2024 02:01:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:01:06 -0700 (PDT)
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
Subject: [PATCH v6 12/12] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Wed,  4 Sep 2024 17:00:14 +0800
Message-ID: <20240904090016.2841572-13-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
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
2.46.0.469.g59c65b2a67-goog

