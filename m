Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680700;
	b=QHAGlqiehBJlumB3SYvirwLcGEOhsNkqSZzD9fiBbtJ8mKNoytTDGfuWSwrQvy0KCLuI
	 ab3cirwo7YjOtLf9HkaIiRN9vCrnSt8SatFZkegPntHu/I6URZA2KZqN9e618bHY1ieop
	 /h5Cb5eHhGNkaNq2XsDc/TRnJbWs4uj1L7MJ/mc7EeDAheaQOLk5hYVyGW6EVSvFqKKwP
	 9uOdLoehLPgjhtQXssdHdZtpholSIW1VnZQn3XgfgWX1kkk+VN4DlKxg/TFeRqZqeL60p
	 y563vwo/fyghp59KWZg6cCiUegiVP7z5D+wCsaM1qXLhYo+WcKAH0y9+ZQQ97R0OY+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
	b=1hhMomWvGGBleXS6N8j3AxI5ifmvMOFj0agMb1vzT5UIIAUHS4SUow8nDG2ysJ0+QBTo
	 yfatKvIFzMXBdb0HMKgGMDAGx3KALTWG9wld3D5A5MAT6ilo6NOGUHHtR5Kmt3QObn9jr
	 BTRwqSGZsVMwTy2qJVPtRltswAp7mn7G1uubIhiT0ZX146cAcil6fckTG7vsmF+GUEdz/
	 QJutazm4CE/0sQnAedo3esODKtKC+JachUQsMvk1MOzZfjBSpmgOG2o7srMKz+tNOfkLN
	 a3iekYozT4K+hE9JM8URdsQ5QN8ttE5x8ex2EL9QXrgLsWw7Ao5BpAcH9wpUyDMsnEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EbsENiLm;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9269606A326
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9269606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EbsENiLm
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so168803a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680699; x=1794285499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=EbsENiLmbg/vXMk4Zd0tck5yLlj9OlgYerzIXQ2hSsqVyHYrDlH9ZcJOXSpQtoPJ29
         u+7O7UizVoIIjrYwHswfSbnQK6K5q8LARjUsIDZw8IDsqH8pGOZ1qTGdiYfTDuRW2d7M
         2jy1KLKEUnkGKSsJc7/ilHHrHGFGtLe19W47E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680699; x=1794285499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=TWWcuYYv9nFcrRiYZgIqK2MwHYgwNRW1y/Pfqap7XSVixWaTz8kMBJa2LCaH2usw6T
         +8i88KzpjHBBZos8sUsW937ZvTOPFbZKHv/guQnCeuZgmLMd7ddCky+JoZw8ot4dY1Hn
         nUrrh1MZGaR8Fmdk0OPfk31Rp3wa1kszHPn5OCYJiXQMvdcQrZbV30N79wl5X2snUjvv
         504lCOKQVxCrhgi8wMiM0RIj+Rhj4VmAW9cdi0/cL4YBxp0L5kDu2vBhZh7AiTVN5k+y
         AwyyCmNWIP5I4VzrsN3JeUyQXorldjjLF6++xXLuQBylMH52uXErCrmOIWn5W9KlRfZE
         pi8A==
X-Forwarded-Encrypted: i=1; AKwUvBwOFxnC4NQCi1nXMw+uXJOf5tWcJ+PtVdbc6fCK1QqO/MhnQaLv3Cg+tGDkg7r/49RIoecxPGWCACwbujGSCXs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+3q0i1kjtV2kCeAZCON2mm873YSfbiyN7SBIC2sEy3+cdM0E+8
	8GiS8Qej77GWZBOOr1J0+eRp7OsmiGmb1+D8HCNsgO1qRZoTNpMPkfM7WYHKb8FgWA==
X-Gm-Gg: AYBFou1VYSmHztxTAUGYAtnvrFKdou3Mw4WbZSZLfV0dkvSQDm23KYlN7W4ALKzVJnz
	hh52UrRFrvZOMX0loxwBGmvySh0PNflsBgn80qDWDoYnPA6Wvxhu26QEKqJw9t5MutlJuJyJKif
	22EaxA0UTUt5vKMCWEXtzYc/LWDbM83zm3Y2TNPy3lmASGKekbIbX1wUk9YlTxk14WlK8TSAany
	48Wv5LmGXdZXyuPXOgDskqnRKExoZHyD3RW/JGagV7m9BunA4y45ESImd1d1t7x6PVLC6YhMe+q
	xk6CPQBJa9iWApx+WtY/ANNwSVpKx5G/6I/afX7qi9iDs7V+NC0aZ61tfevhP43k/BhTF1/sADv
	w6OuGa5z7uMGdWjcz9rDlCPOadSesVn3wcAG5cucPVGmrAR05ylPbIW0Q3I0c5mIjUuY5+Cj3V5
	L8v6rR1piNk1XHfXDWJkqklE0AhBH2m9XRbxLdphIRuuT2YjRWFMP1M+XrhCICwJB2ijQvXYTeK
	XIJSw9o5VeeNh0peV66tIWd06nQuWf6vA9ALkYk6jN9dOnmKGgi7tcNpPB4kFC59WaygpV4ZKn0
	8xcfngCyDU5zpsTU1xav0+flj4BRwEa9HcJSW8kaHrVdXIsVVGnZ33y1wkvcIH20lt4UI5IrG8C
	K8JgQ+BoMyprwt+AYnQuf/l1nMgASFFNSYQ==
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr6631601a91.18.1793680698982;
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
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
Subject: [PATCH v7 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  3 Nov 2026 12:37:32 +0800
Message-ID: <20261103043734.2179858-9-wenst@chromium.org>
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.56.0.385.gac671c819a-goog

