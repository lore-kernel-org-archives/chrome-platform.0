Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B853A874F
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632437; cv=none; b=iX9S82Cify+yr9e6Dxi3jSQKf2TeUxHpZbVmM5Z365vodTdlTP8NHhteV12fJAZqon6yeZVln00DRunJGy5W5IBscZFLOsomvRM+e5U9pRnPvPnaM672DPvjt1cwOv7ookmbfBi9HbgGfpoPItr5z0SSTrgaxuSIdG5Akw2h6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632437; c=relaxed/simple;
	bh=EE+LUrGjrLCUzObF2AhS0Yq8IeA/ddk0uB7J5ixxoHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHjBY1qIGQuGlnipz3MZ1bCi8F1ciWgyFtmo6GO5eLNRE59l2A42b9De12uY5DgO8bp3cEEzujpSE1blD7t4BzYrrX30RC1nIVb23QUTHIKxxZCbKkPTP06qtNmlPTYFME0AaSIed/Xk/CMpMN/QW42jQ39Fk/Hrb5xZX3s3IME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cK6p4fQD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cK6p4fQD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383cb94f742so4512399a91.3
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632434; x=1788237234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=;
        b=cK6p4fQDLeLKxu2cYUbrX2TPCYDh/kNWTOiodVpOZtlIRsSpA53uk1k6vcESOdzBY8
         3J1GpSx0SvwXOkEr2aRgoxb0Bjq0Rs+Ll/xmIC8whJVHBXLW1rcuPufcR56kth5rkfdG
         mOV5HNR19pE+rhPjbK1UU7kN4jBrjyvDHgAjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632434; x=1788237234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=;
        b=DLopR6mVWBnG8wqos+9SS5McPt8M0vEoqONC7yKKOcI67l3kRoTqVvGwB4f3qC9jRC
         HUByZJ7GnUzYesu+8C4qJl21C6SR4Voo6zlQkIwgw+f9zUSi4wZ/yzlwjRF6o3olvC9D
         wLfom34pjiNsLHhlU5TcsmLwt/yAdkzIoObWQ0IeJiOc0O/ZH3vaH8jakRPEYIDy85b8
         wtepjnTiykJj8w9FoYVXjE/J5xf7jFh+oTbAsD1pgwnV3ndAHjBIx445hdCbMhOQDMtF
         B6gB5vwY5XG0hgidhsTRzlCesb+LcpuT5WT2S7jMDU3Q1FHIZ3/kelJoxTr0AHexZlII
         V3sw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7pEwxYttNhXCONSfWhKPc8KuU9FSkwNm9F5UiAsyLcEWWIbFs+ixakEFJMTHbH4CQzFyOeUJGoXqdeBMOFh4=@lists.linux.dev
X-Gm-Message-State: AFuF++mbHSYtL3aQ93vO262zEvNV4/6+aeeZX6Sa6Hc8lCAR3c0vkxkt
	pUGswxAuy2WX4ui8XcruoAkkh5b9YTqEY+TMjdadCqTdNmoXbH+KsZb4PZfc1CHFDw==
X-Gm-Gg: AR+sD10rWH2zepO6faxdiDW5MtO0EnAExaytmiIytXG06jIGHEvMhY8vbBXsirs2Ll+
	ocIPkJJWZ7PQ/oenC8Nl6sGMwJC6V7fad2iEHdYCeZ4MozOgPbzxmCl2zHXJ/9I0E+1eXd+64x3
	EvTVduIMABbQFZ5rr9PzLR04VReFBe9pPypCfPA74opZnKAUMm5YTkMPn6XLp/NPKGtWnW9atsj
	EkN6ynsOQ9l/RkHPMv2YOfPBl5Rh/LIfuiz3P2oxSZiwl03Z20kXTTFIvIFQGDlwb+gBnkn0wGg
	FvuiSw8h3dcspihjdRn48Uw582C3ke52gQ2b+kVSfz278NGOo1Nu4fJgGEpFmMIa16gpf0RW1Ho
	Cv93j5f6ugLCPPhGrmVm3LRawmA1ls8s26JmVtcJHbewSWNhIwdj9NGADk2kNfioo5eaQnZPIZf
	EjlD1KvBdEiT4fC67Gkbjd7oqlkYu71RGQQnaqdCMNyTjsTj5bTF4lQMPM7WuIK7t1bOk9mWKDo
	8xQQQluG2aqjneN+NIus9sXFjrsDP4QLFFd2p4X77EELho=
X-Received: by 2002:a17:90a:d44d:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-395dee7e2eamr44794746a91.1.1787632433680;
        Mon, 24 Aug 2026 21:33:53 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:53 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 25 Aug 2026 12:16:24 +0800
Message-ID: <20260825041628.988369-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
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
2.55.0.860.g4b6b3295ed-goog

