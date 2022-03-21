Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF715CC6
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 14:32:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h23so20351626wrb.8
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RccDfbuFs/Yz2WrfhL+KkjoyAgUu2DNhvPj6SzPznLY=;
        b=MTu7SXp2mMCpLDiDwJeKrjiCt7ymx7U0UG1x1U6bTcaLMpAK5p8CBpfjbxlZvnr36d
         maBuFhYOfQZReSuaI9sCQW4R/chbZxL9lDaimRIeZ2mhkIgo0yiaaGr3nf1tGZJy7yQW
         7CdcJCwmF/gQa/Miq1bugA74rDusfk870DyVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RccDfbuFs/Yz2WrfhL+KkjoyAgUu2DNhvPj6SzPznLY=;
        b=feGXZWnbXX3tLIWHsU1xtVVBMEZJDGCFNBCREr1k05CihADwJvDimkN0353HoYHCLO
         v6kHoc0PBZeXyR1po/MhBWJSxd2eq5+9YnGRDEydKIB/31IKt1Ore9ll5ULM3BlEIpxd
         MMcwrJi+Q/MPChzIcR8Os2vOZIMrUkGdnOMjy9bsA/CSwPSNv5AV4ROOjq1xUhoa2iv1
         I6MajIAvliCfF98++ooZqNuHcbmVjJCRk2JV0zrpY+DoiPdFMSEE5FeMC2ibgVNC360z
         GvpBUdigStE2jKutyr8Jwfg3piEbUgwF4N2GpEkULU8kWOFii3wc2h6SLKe0AF1DIT5+
         xo9Q==
X-Gm-Message-State: AOAM532+TteUKwdMFlMiWFH9Eg2gDOX53ZWSrA2l5pkrrIJwLOddFLa+
	TiORrmo/9nFXbmRX4UezOT9iFA==
X-Google-Smtp-Source: ABdhPJwOqVlJwIVTX5II/TL9iAxFRONy6Vxcp8R+6SJpH47T6+n5NfKeVrNnW5xISpuY3ByAgkxtJg==
X-Received: by 2002:a5d:4e89:0:b0:204:2ee:d87 with SMTP id e9-20020a5d4e89000000b0020402ee0d87mr8406009wru.9.1647873158156;
        Mon, 21 Mar 2022 07:32:38 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b00389efe9c512sm19092793wmq.23.2022.03.21.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 07:32:37 -0700 (PDT)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Baltieri <fabiobaltieri@chromium.org>
Subject: [PATCH 4/4] arm64: dts: address cros-ec-pwm channels by type
Date: Mon, 21 Mar 2022 14:32:22 +0000
Message-Id: <20220321143222.2523373-5-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update various cros-ec-pwm board definitions to address the keyboard and
screen backlight PWM channels by type rather than channel number. This
makes the instance independent by the actual hardware configuration,
relying on the EC firmware to pick the right channel, and allows
dropping few dtsi overrides as a consequence.

Changed the node label used to cros_ec_pwm_type to avoid ambiguity about
the pwm cell meaning.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts     | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi       | 4 ----
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi              | 8 +++++---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi            | 6 ++++--
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi            | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                | 6 ++++--
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts           | 4 ----
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi   | 4 +++-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts         | 4 ----
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi              | 1 +
 12 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index dec11a4eb59e..e2554a313deb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -15,13 +15,13 @@ pwmleds {
 		compatible = "pwm-leds";
 		keyboard_backlight: keyboard-backlight {
 			label = "cros_ec::kbd_backlight";
-			pwms = <&cros_ec_pwm 0>;
+			pwms = <&cros_ec_pwm_type CROS_EC_PWM_DT_KB_LIGHT>;
 			max-brightness = <1023>;
 		};
 	};
 };
 
-&cros_ec_pwm {
+&cros_ec_pwm_type {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 8f7bf33f607d..eaea09d0f8cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -92,10 +92,11 @@ volume_up {
 };
 
 &cros_ec {
-	cros_ec_pwm: ec-pwm {
+	cros_ec_pwm_type: ec-pwm {
 		compatible = "google,cros-ec-pwm";
 		#pwm-cells = <1>;
 		status = "disabled";
+		google,use_pwm_type;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 0f9480f91261..ff54687ab8bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/cros_ec.h>
 #include "mt8183.dtsi"
 #include "mt6358.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 14ed09f30a73..bcdfabe1860d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -77,10 +77,6 @@ &ap_spi_fp {
 	status = "okay";
 };
 
-&backlight {
-	pwms = <&cros_ec_pwm 0>;
-};
-
 &camcc {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bd5909ffb3dc..3deddbf97cb3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/cros_ec.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/sc7180-lpass.h>
 
@@ -222,7 +223,7 @@ backlight: backlight {
 		num-interpolated-steps = <64>;
 		default-brightness-level = <951>;
 
-		pwms = <&cros_ec_pwm 1>;
+		pwms = <&cros_ec_pwm_type CROS_EC_PWM_DT_DISPLAY_LIGHT>;
 		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
 		power-supply = <&ppvar_sys>;
 		pinctrl-names = "default";
@@ -260,7 +261,7 @@ pwmleds {
 		keyboard_backlight: keyboard-backlight {
 			status = "disabled";
 			label = "cros_ec::kbd_backlight";
-			pwms = <&cros_ec_pwm 0>;
+			pwms = <&cros_ec_pwm_type CROS_EC_PWM_DT_KB_LIGHT>;
 			max-brightness = <1023>;
 		};
 	};
@@ -543,9 +544,10 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm_type: ec-pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
+			google,use_pwm_type;
 		};
 
 		i2c_tunnel: i2c-tunnel {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 4619fa9fcacd..8676c8a677b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/cros_ec.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -379,7 +380,7 @@ pwmleds {
 		keyboard_backlight: keyboard-backlight {
 			status = "disabled";
 			label = "cros_ec::kbd_backlight";
-			pwms = <&cros_ec_pwm 0>;
+			pwms = <&cros_ec_pwm_type CROS_EC_PWM_DT_KB_LIGHT>;
 			max-brightness = <1023>;
 		};
 	};
@@ -771,9 +772,10 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm_type: ec-pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
+			google,use_pwm_type;
 		};
 
 		i2c_tunnel: i2c-tunnel {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
index 0896a6151817..48bb2159e126 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
@@ -20,9 +20,10 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm_type: ec-pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
+			google,use_pwm_type;
 		};
 
 		i2c_tunnel: i2c-tunnel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 4a6285a25f77..e6dc4bc57f01 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/cros_ec.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
 
@@ -27,7 +28,7 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&cros_ec_pwm 0>;
+		pwms = <&cros_ec_pwm_type CROS_EC_PWM_DT_DISPLAY_LIGHT>;
 		enable-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
 		power-supply = <&ppvar_sys>;
 		pinctrl-names = "default";
@@ -708,9 +709,10 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ec_ap_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm_type: ec-pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
+			google,use_pwm_type;
 		};
 
 		i2c_tunnel: i2c-tunnel {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
index 31ebb4e5fd33..5a076c2564f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts
@@ -55,10 +55,6 @@ trackpad: trackpad@15 {
 	};
 };
 
-&backlight {
-	pwms = <&cros_ec_pwm 0>;
-};
-
 &cpu_alert0 {
 	temperature = <65000>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 9b2c679f5eca..324bb8871fe2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -198,6 +198,7 @@ backlight: backlight {
 		power-supply = <&pp3300_disp>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&bl_en>;
+		pwms = <&cros_ec_pwm_type CROS_EC_PWM_DT_DISPLAY_LIGHT>;
 		pwm-delay-us = <10000>;
 	};
 
@@ -462,9 +463,10 @@ ap_i2c_tp: &i2c5 {
 };
 
 &cros_ec {
-	cros_ec_pwm: ec-pwm {
+	cros_ec_pwm_type: ec-pwm {
 		compatible = "google,cros-ec-pwm";
 		#pwm-cells = <1>;
+		google,use_pwm_type;
 	};
 
 	usbc_extcon1: extcon1 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 6863689df06f..e959a33af34b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -84,10 +84,6 @@ thermistor_ppvar_litcpu: thermistor-ppvar-litcpu {
 	};
 };
 
-&backlight {
-	pwms = <&cros_ec_pwm 1>;
-};
-
 &gpio_keys {
 	pinctrl-names = "default";
 	pinctrl-0 = <&bt_host_wake_l>, <&cpu1_pen_eject>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 162f08bca0d4..181159e9982d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/cros_ec.h>
 #include "rk3399.dtsi"
 #include "rk3399-op1-opp.dtsi"
 
-- 
2.35.1.894.gb6a874cedc-goog

