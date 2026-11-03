Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680695;
	b=MdRvlak/iB1NlnZuvNROvxVPXiCwqSqbQxYPjhycS2yQNsK9T76LG+iMrQtDA6aRLGXJ
	 2nK6Q5RnaGmpO9n6iP67N86bFUcRMWmSfBnfx5FAlcxxbg4qWBXXm7BgQT2MBBPaIJ5WO
	 hVgTNtwnWDhjgq313CIa1XgftYv2/4PHST9rT1FSw6JeVNas5Kd+zrdpiVwnIzF2bWFvb
	 Hw1qghtfi+3zmrA29BXz5LeKMvb5fSuetuVflUK8ZTljQtA3B6LTiVxXfHiITuHX3v8pi
	 8TKYWtK2YCxJhDZYJAydXArJgPQbWWpGB3kc1H579WSezGkeYjunvJklkL43h07ZUTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
	b=DhIEi6nnigvVl5sQqwMyGOZi4bqTAvnC8rqo2asz4wlTr+y8kMQiVjoyTA7N3TmoJjWj
	 7KFi2tX0qe92DDYQNct2zaNQd4zFR2GTYvS2CRcy4NR+nsBHwtCGep5V1nst9N3NWjc9v
	 KhciXmuDPXCgU9OOfiYc8TTPWxNh6gntbPHgo41C65ShZ87Dg+O581W0hHia/HsTvF5BO
	 Ij2vY10/UR2NdlA8HYb6nWqxfZvdqozqEAmKnb/MxmN5z3AS0zCpmpqwIFeR/iA9AgN/m
	 xqvg5HjB5sJ1VFFuvMkkykVeqpSPLdtVUOfuU8aa9qdRYd4H4xLxhg5q4XRrkT3aZtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IGUVsCDq;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3001E606A332
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3001E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IGUVsCDq
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2773743a91.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680694; x=1794285494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=IGUVsCDqHGX2WP1UxXjjbxuDavyD+G+6ufzFsBkhjKhlZdyZMoDXaS94t5+6YFZ37J
         U4WXvi7Z1R8ithBiwDnfEr5PYzI+qGZ/wqqUEdJ4oSW6MA8CGSwmojng90ChoX0S8/9/
         HOP0u2r5R6M/9b/rQPnCqJl97ztAS/dNVUuik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680694; x=1794285494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=jHZ0pOGGzyWAxJVuJicSKfep7m1h62QLs41c5mQ/9tnEnr9KN1+H0ehiZISC9Zb684
         h1DTtNUqyxtfkEwyHf4pi0Fre0ZKL0ZoO2eaFi5oI8zHF9NfczUzHv4vgVfj/YwMOwcV
         tIdO8Ez0TwsqgEwpedZzXCM9AdgFGIj1peahNi8zmDzqMX5SQFOo766jcThKdFWg1ecu
         BA4xLJgYA2LmXzTd64klnH1qPbW9h+4eSOvxJLpbl0B4UQe3gmoiuud8DgWpl1QKEfF6
         ICWju5smyNiGAxjjj1EyOtOqyVFlH6bW1XSJ5dpVGkekMtJbs1IFa2Gg6VhZtkwWe1DO
         ejTA==
X-Forwarded-Encrypted: i=1; AKwUvBwPjz5gQxqH/Ji4X06JjyCSS1UL3TTT5gy5D3KBzWyIUhNETtpm98WAIj7PjWdlYu//XD3xbTL14dpymUgG+r8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZLuOrQoueFrea4wLlFRk+4QZLfhQnc2SiciAVrI9GvHRDEQqR
	i5m2j6k4kA2hY9hbHLXwbY8bnLcS6FbjhWSrasFvYJxQ2GnxBdQ3XOcpQLpePl7sWw==
X-Gm-Gg: AYBFou0XCaOoz/dP/koPS/fAuOJdmkHT6MRAlH3klmtRQUhmLg2maWEn/h3hHPKGPkH
	je3zLdejZqkMb3enEi9GsPHkg7d8za6fWmv2KaaIJmyHGG82a++fQX/LT/3rRIwBsJmqbNHKxZx
	4LOhiJRhuXInLAlpX2iyvXsp4ugyofoaXFvsNOa6e706DzPdynNmhhDZKqqxuEUlFr5bFLIP89g
	USvm5LMe8hjekdyC8XhUd89nJ1XmqM/dnPkO0kgwqDCo5BuRB2GXiw4pYbYTCMDMDhODaNTVM+r
	ddO4zXMYLIT1srtLhCQXkfARPiqQPP7jcArUNsOsqC4bLlBOVUELKj40rBJTa3dVZe0nTmpjofU
	0Cboj4TDTkc4r9HCuQRo50uED8/aFX6HRKh1JAdDqeYZhxvG/zsqaU6+eNA1cTHPRCBDAZVoqZN
	/FGkFeKqxc/MxhanfEEzzUf244tbTYRUUuIk3X+I6U8cgCAvxIfO0Gb9YcL7gQEXRl3jVmaxrwj
	4WXIzitA83PuICVs34o7IHM4NfQXTdfktz5e+w8/X2YPJHoNPJbLvx0HJEDSdKQcCmrnYr8IXkT
	hvYBxWGbaXY4nU2A7Mip+SH3+mG3w5M0gw5PBfszxxsZq5Qjp9tfQx7gKWP2zksOAtdipNUqGmX
	GzF7H+QPxOzsH
X-Received: by 2002:a17:90b:4b10:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ae89724b06mr9920661a91.10.1793680694591;
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
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
Subject: [PATCH v7 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  3 Nov 2026 12:37:31 +0800
Message-ID: <20261103043734.2179858-8-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
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
index 777da2129e77..2c6ec714e117 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1098,7 +1098,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.56.0.385.gac671c819a-goog

