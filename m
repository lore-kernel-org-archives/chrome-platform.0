Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD77FA
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:19:58 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AEE1E40520
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644826796;
	bh=EbCeV0x/sMs+Jsxt5g9p8vtgK7tOVPzaf7TxkPV9Qwo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YTGyysoi7/EX7GpmevTv0P8buQzccWWhfkjSPdPniMpIkcE2k8RwHNfykd9dkJOl4
	 tDlfIYvNYvPwW70swf6k4QWdIDkNcmrRPFQ2vppOAWmpUqU/VtUlB4o+xRqvTWyJFh
	 O8A18uh8Y5W7ncBcjwxLXoaswF6HOd/iWQENOGIe14tw0DVHTN4MlxwzPGxRc9TsWr
	 j3RKCuh/IKICi9QSogGh1ZUEYQHTmN9eQ0IfVOC8rpz23iohSuchUuDE7iGCWiqHNX
	 3bspGZ0FxumDA8yGOqCinvyxskYo1Wtv6DAbKB/o4UYLNDur2+gujgTXlO+RHtkeTr
	 BbD/QDO4YqwFQ==
Received: by mail-ej1-f70.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so5440518ejn.13
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 00:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EbCeV0x/sMs+Jsxt5g9p8vtgK7tOVPzaf7TxkPV9Qwo=;
        b=tk3Gd9Kt4VIZR03HsM34/CWGZw24IIeLrbTSl1VRZHD2f7qpkOWJC/IL0NVgHWMhJQ
         Epq0VKwOkN7H0zFlbdf9qzjleQwWUlL9emOFo0O2LrNi3EMIkNDA0s5x+deUZqUqdEic
         vE5atlAqFHWn9yDy47HxSZPtcsuJKpjkrS17PzyYaWYywn++CX0kO7pwAL/Q6Yd3+Ii0
         FdPTqwJFi8076WUx+X1rvMQUlV3WI1e1SC3jIBnjOaANZ1duedsF/JE78urhh3JLwXs/
         6RzV7JjFOOb1rMaGOtDkt9x088jWaZkCIdbOYRg7lEME1F+3eAI215Y5VOd16l+nvzCB
         D4lw==
X-Gm-Message-State: AOAM532OqB9KoN4Z7tDQD/nuVjcFOKLiZcncou9GMZSfRTEATsCoPSCj
	r3JhIyKBgew3UU91WRWOCN6uKwMJLfXghe6WqDhdZ4JEPUBjcFQkwHu70G3uVazvxHppVsKefjS
	Krg5WHrKHifI5C8so7+cWNNnA22U4GMiFlsVXmO/rS1BVzg==
X-Received: by 2002:a17:907:608f:: with SMTP id ht15mr10447786ejc.498.1644826796184;
        Mon, 14 Feb 2022 00:19:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuUtAFxe/AINzxrq5NNy+IKE6ovx3e9DkEU19VgsoD3pIeaS61uCEwn2sfqcNpphQUr0Ojgw==
X-Received: by 2002:a17:907:608f:: with SMTP id ht15mr10447762ejc.498.1644826796018;
        Mon, 14 Feb 2022 00:19:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:19:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
Date: Mon, 14 Feb 2022 09:19:15 +0100
Message-Id: <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema expects PWM node name to be a generic "pwm".  This also matches
Devicetree specification requirements about generic node names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 78296ed6fd29..732e1181af48 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -637,7 +637,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
index af46a60b4b98..1779d96c30f6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
@@ -705,7 +705,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 7c22f0b062be..dc17f2079695 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -421,7 +421,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
index 0896a6151817..a7c346aa3b02 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
@@ -20,7 +20,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 4a6285a25f77..e7e4cc5936aa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -708,7 +708,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ec_ap_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
-- 
2.32.0

