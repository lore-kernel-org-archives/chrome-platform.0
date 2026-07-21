Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1F439348
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620471; cv=none; b=FDrdQzz1NeHll0GsIpEGkJOc5s9nJnP1F39p8Mh4q+7Ymzs+1wvI7B7eeUoJPm+zVHuUUhr/Zl6qwhDtsvBg3fZhN1J2qEa1WSXtEQlMQvExyhKySkcRHDcl5peKCFqnMIieoJIeeyK8XnUTnwXGbFH5nMWBSKnd5QeDBVJHOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620471; c=relaxed/simple;
	bh=27P+kO3E7rZQANAahmL4oW3JH5FufBpKYuQgwu7HS8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQK3uZrCzqu3j//smJC2tE5ZYHQ0tEiRCx8Wm1+0mOlpGY7KBf/yUNc2nNG/hCYXsGzjtE/Nl0JCSna3nFeHl5bm/aDldFoqRhNTfme2/+OXw+nNE3TvekSR8JJwE14P6I8Ed/kln0dshWxpaxiM9/pSD1HAMkT96ydwee67g/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g+z9dWTE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g+z9dWTE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so75662035ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620469; x=1785225269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=;
        b=g+z9dWTEby2aKr47Beyzwj/bS32BI3HLBoJvRzjeysDYmjvLZIi4cXhwOA634680pB
         yJctzX8ogAUhIkt/mQqIJePh7989e7ntvFlAgTzB4Ow5CGXZTEH2E9dUadhcu63F5uFG
         DkhUN6eX7+W3Ynr7h5rQ8f/urTUrpXjZ4WpHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620469; x=1785225269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpTQ+x9JRSQEI1YUOvflUoQb8hjimFA84CnTWedUkpQ=;
        b=JFiHD2jRudvkUOc6ibLVoPEtP/yZghqG4N7Ga2oPMwlYSR5wckMvFYAVqaltK3Y0tM
         4HX9m1/i7Y3AhBp7C9eFb0E44WXHOjiKH465EMU4JfX1zgWKVa3Va0RXVwjjVBY8AjQc
         RrezdRQp9LSkzHi2DoRLkrysm4bzQ32k8/Q44Y2aMYnUXslf3bItnwKBHHfLz2OHwiRN
         h7V/Dx1ftzrHvNiyvM64TX029AeIJp+knlzNpDM5FnoID45+f8IK+Crn7lIahQTlUJAk
         Gzi5TF/nIOi47kfT+PUGbaKyLyvYh6pnIxAlNuKys2876Lk24m5LS1WVbBwZehvNJRwz
         +4nw==
X-Forwarded-Encrypted: i=1; AHgh+RoAlLJC8XVC662P3U7ZLgbCjAo9H0OxhQqG6SUbZLR8jZonNBQ3f51B/uvIglt9S5tnF2NP/L7Q/M/PGpZPzFE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGnccyTWwatxZcI2N9iRq5yASWvQPBUuwGjzc3h5WMsbQlrkBF
	Mcs/4kEloyluYM/ppjVh0OHlIUbDSyC48/XejjJaWAHJMxiyA3hC6ZS4j8aArdIShQ==
X-Gm-Gg: AR+sD13puvzwS5a1fl3O99H0ghle6FHepIJrPKtoWkJHxlniLnjiNByvowXNTuKDV+3
	+hZEdyBJZXDCYlu4NxJutEtFGoIEMBOlv3n5vlOvHKMP4AgAu8uiGcSI084p5+2mGKt4KvPELUu
	p0LdSo1/bMYsNX7/gvWeBDUxElTEHQv5L52vpVe3qdnsv9WOaPRb4anm0jCLcVB0HR+8LEjV47T
	/2cTJDqgjQo2ML7cG52V7wFTM2ycpqhN7dMPe0ZFOfVPqVAHCjcy5PaeHTibrYOKZJPyF5VGRNO
	qp3e+9WCR47tdrs9z5ykLGTZjm/R8lcxvj5luBdRD1W9hGGa0SyfP+UWK9ZsK0VOueBYZBxOYsu
	ayGvQWidi3Ybt2dN/kruXSgMt1ownMYZN8YFluLomJ5xWQcG1QI0RPIDzVK/5SUgV6m8WjNg5Xu
	8Zh3zLkisZrHQGpRexbLFCTYtkPfr6eZ7Eti/GeHu1ZBY6VUhOljHBkC9XzoY=
X-Received: by 2002:a17:902:ce84:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2cf348369cfmr185433115ad.6.1784620468826;
        Tue, 21 Jul 2026 00:54:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 21 Jul 2026 15:52:22 +0800
Message-ID: <20260721075226.2347933-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.229.g6434b31f56-goog

