Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA9B4446E6
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450873; cv=none; b=Q2i0wuqFvRP9kbnI4DXv5R2E/vuGu40kZSPFhMkRhMtuJqEJrlShXm3z7HnIGaG5c15Xiz2S6pAqZ1Na0v6KBntMwBm6yxExg8IkKKyKcEIGb/KwkUykfrk8q88apo2fq4PpBbz9x+SQnZVFM7cAGEUPmv1ozvrHuefZGUKrjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450873; c=relaxed/simple;
	bh=AcYr1FXo/iH50loWw6bRNXzrMnv1gP4UhMWCRYTk09o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4F1wS+yBIy3GzYjOXdPODwDnWhZw8P4ymLDhAasJiVi5TXOJOaGKWTllhfmObSbaqezZmP2uYXMHMjb+FW3ackf1j66ZHHRksu2Ci5Z18LhFL7NCa4sy5cTr532zWZzrZBcUseWbezA3kdNnWqDTJjRGR03tEub35VfigyLNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GVhF3ZWF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GVhF3ZWF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848743155bcso1083728b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450871; x=1787055671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=GVhF3ZWFAn8jkx1Bd8NGUiJqG2l1HUym6bjD3yayw0VWVm8rBuBjttToVKAbpqXGO5
         xnMGuMp9DXPjle62KHdg2f1yDpoo6SulBUIdNF3TYKusuDjGVv6CYvsRqDyXvi6u8wfT
         RW9ZoJmYRY1eLRgEMJGsQJhyltWmisjtwehDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450871; x=1787055671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=dg43mraB69j8iJwcilHIejc3h89eMJ4iab4EAQAeTnJ4UKZH5l2siKbD22pg2zGxiS
         4RskhQJZYM/aGb8zbeyX9/xt5IHVXf7I5uCrWWJXId7bzWwxjbXN+ZBs+/g6hwy0e39z
         jUHzYchZgkzolbKle5KDtujtezo11D9OFwccNwgmqo+n6UpUAfAPFr295vSoq5retl07
         fH6DMNaF1wTSKhkkTaNX13R4Agh5Sg5CfJYC40POecO43CZ3bIRIl8o7SyOrAgVusfqG
         KsXM8X01yfHpDoCd/IhbHSjFHYPT/G0G+mcOyZhkc6cDJZ9DYt4t6VOp47pO9TbGD5sj
         6shg==
X-Forwarded-Encrypted: i=1; AHgh+RqJplJd8SDCmjS56KY1gdXRgoHB3Bj8w7zBi1/Sod+f08D9j9D3xwl8t48DHcq2QKrtkfMwhHYZpvC1CAedCVk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW9NX953/5+Nds0xXUrz7IDhcdMBYrjGfvVOo0w1HWVWC+3vDX
	89VuxbKhgynCFIQJEFzjo19OG2Ip0P8hhnUJW2j67OcWpURIM8zi95cCLT79srTClw==
X-Gm-Gg: AR+sD12xuYhZRf0s3dkczVLEKi8qx32EZ0h4IQwovBpVoh3cTXxya+rp/64DNQJaGpC
	jkBNkmbUCezJ24Prcr5WGOMxAqwt5tEC7jGuNUhzvljWFT91ZLsEqTJp/4a7gPNX++ScGcT+iUI
	fWxDEhaPSxHK1o4yL0xxs4RSMotd5n2MrFQnAToXTJIreQ82NJccMPEs+woZquyJU5l4HvZsgLd
	1Vy1wJcE1L4HeXIwXZllkoqwOFagLFqC1AjVUmQjix2ZuOn33jINVvgVjEm/8dNRLbxWyM81NGL
	kKWq0M5PL2syO/tEEorVW4Gvsk8C2+TNP4Y99A5FaHcq9pPOFSU74eEuJ9JnkjbZen483U3cI3n
	+Je3K4u3lAMp9bSj+wksk3NoaUdBN3AphE5YOsTAyLsL/r/llE869/ANSP639/RxlgfflEetl/N
	nuURzTwHbLRZzckdviB1jfZdSuOXC9Usei/HZ7jjtdbsjw9sEXIhxAAmzpmQSUbJ1Ygr+w3PjpV
	6raICn0htaRpXeum9r4Z307FOzc3Xovowb5qSnLgx1WYw==
X-Received: by 2002:a05:6a00:17aa:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fa86e19e7mr2769479b3a.12.1786450871439;
        Tue, 11 Aug 2026 05:21:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 11 Aug 2026 20:20:08 +0800
Message-ID: <20260811122011.3539250-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
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
2.55.0.679.g6767b8d81c-goog

