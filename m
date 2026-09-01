Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D59471255
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249017; cv=none; b=WYHOdv7g9jijEXQhXJWHlFh4umIJc+hODE/6d/i1dQiLF282XqlIk3Y7By/44Cp/i6RqaqL7Pu80lN/D0PTmL6MX5rfC4Ng7mfBoRrbEiErk0DZzEAqAYHpuB8tA+Sq5Hqr2vnpio0JG+Y8YIxnQce6Kxvq8Gh3y2mLBI8jz21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249017; c=relaxed/simple;
	bh=389GhFdcHXE9CQfcu38KBKyKduXJD5XyKzkLeecuPRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KK1Bhpho2ZV1E/tkC8T+qh7lihQ/hPd2TgAjMoBVYAcXmoTKhS+bsDKVvJ8O1wQBaTolkM9sT1PpOZRr7H24UE2pBXAn32EY3kYBpyZMCRlLfiUl7j0uYGevuIncMaporF2guy4Yo0vKHyn8GQyLaROHmdygHN1QTFghF3cQ5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TKMXJWXu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TKMXJWXu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d01663d816so4349905ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 01 Sep 2026 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249016; x=1788853816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=;
        b=TKMXJWXuNFZLgj2qAgDYZnnvXH+7zHLsy1EUyX4nDVq1PD6MVaEshjfOK5RVm8QVmT
         GhL9GUJ3vdNnQPoySqiyN6mT82RGIqCZGioyaunuxwwPdIJ9HqIM6b1GfpcfMkjd9L8f
         bFOfi8xbNEEsCTgBAmwdfRZHWZi333C9g9frA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249016; x=1788853816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=;
        b=Uc7gA08JoCs32fh55yVEQdc5RXuyd4teMpQ9Kl4rrm/6eLBKXYp4uZ08NEt2PLRkfp
         Vs+0fxoOv7Pi87p0syVaFKmabCFZCNyqdELSz7mCGKFjYzrtHIJT3FjF35uvKNErQDQF
         oNmWUpEEYJRGhBqd64M5SZk45zPIG7L7QY2MTVWE5zllRi3HkXH2JMCV+phae/QDoi8p
         h1hCr+BWAfowDRN69P8z3z49WEktrFEmVSwbrNiUMcObUb8XNrOonkWMXOj0PAKaCC98
         t8eH2VHRqKPsfjdhzbZ4exqBoojbh7Q2EgilEN94vObzVGYzP8A12K/odgxBMnZjRmLr
         WLeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqrwCHBs/Z3OTL6MMGhgyyJyROanFa/dzuRSFCIk5kRE0Gu0IB+r8ub1FcGbvFtzA/iOM6BJ4lTU4TxXiYf7M=@lists.linux.dev
X-Gm-Message-State: AFuF++nqaeH1HDRpGzkusH0WyqdJ/e0kW+iQEoOxqvbbyKcaZ72G7/ZB
	c4QbfBVs5/grP4MoNDoX6tWQLOrrDOfP+gIYQtqLCaX2TOdckd4pwkncSaYHpsJerQ==
X-Gm-Gg: AYBFou1h8S5Z1lCcIB7zpx2PqYT3wy9uurTM4Q4frgAaEQn10qak6BHs5gUUp7DOMeB
	tYmjxkYP0EHnnxnYZqHsQ/ospe8+SJLIt8VF3uMThKzqlKA12ccQr/R9sYkZlFmL1/56v1WY7Vk
	g4KQ/hhoPfulyzQIFLD3UTCipVoZKbJrZHnHetvRlMoD/ytBW7odhNk9y0MW0H3z1mlzfyKze9s
	ukhAINVqz+tR9GPp53L+QiKX+nCRQm8lGbl2xMSIAfyLXSSLrldW4sZSb31MJI7SMdAQfwt24sf
	GILTC622CUxJjk4DZZMeiMrQCAbZVaa/66qR6295RsONu+Aen/bztqVUbKSWdNfArGrkstiz+J0
	tNQcsN4jg6PikN2hhyazzmektW6SywUpyPxjad+HHBYB5dVH6lJ5QXPIhoBMYhEVP6Ch8hReCnN
	SkMqNyvlIsyo5EK6hvYcbM3AI3Wjc8xYtOIppQNmkyg5Zhf5au7l5/eCotWmbayzTIXAUrFiSGn
	wJmuZ3h24DaZ3xKFvyg2mYRe6RU3GFvbmDkDhP1T/6ZIQ==
X-Received: by 2002:a17:903:324c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d74df1c634mr532551805ad.14.1788249015708;
        Tue, 01 Sep 2026 00:50:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  1 Sep 2026 15:49:25 +0800
Message-ID: <20260901074930.764550-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
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

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
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
2.55.0.897.gb25b4bd76c-goog

