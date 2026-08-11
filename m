Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757944470B
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450878; cv=none; b=Ad+FuFUjL+/WIQcj0JvoQH3c/HYA8Tcf2nIBN5/6DV8/FjWG/D0rlx1byhYfFqBT/gVe4RVjrFFtySp352FvzwrNc4UK+of+XX7NoU6haLZdzV/VNOHuPCkMGcWmVcpAxVeT1L3SWw5wITKhElMzcL06vSDlu/jyEfMJzD0ISio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450878; c=relaxed/simple;
	bh=zw9K5bulR5RCbQzcch5UFQFm1ClqUI2Eu5cBqRJdZYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGALX0YA8Nx+ySTZYY9Kx4b4VLKL1l711nTs4SultSU2rkxQt/V1TxPJkSMYiPen6wgUq8EG1jbbby82LIze13G5Ck1e1BKPLfZ89VgglhOgsguvo3f23vTrQyDKjtn2fUpn/jNNBzECbLEtjHvuTfJ9SZHd0kr/UO910t3vOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U/RE0hHp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U/RE0hHp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3454332a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450876; x=1787055676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=U/RE0hHpmlJPa2cWpviInC05xmsqSphZPmE/4wHSSwxv5LlD8FGxlyqGle6Ghv4JNS
         Ecm3XX5G2HfbTF8GIWoCz9+8iw5/28JOgPrZEMACGOFXFg6pn8xoreJBFeOyaRidSXIM
         iflDDZEt0lgzWGDHarzgBaBaOQdAzyMY9oTWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450876; x=1787055676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5LbZtLdzstzREZ48zu7bbbJyct6fe22QDz6/0rMi/0=;
        b=Ss8DEMSLb14ESXZpg9XVsEDfEA1q1LnQlTIoej4KgcmS8AqmFY1uJuDXKlVLBduY79
         2x/0Y1RCtxyD6x8Ol2eBUmU0JC09IALfM36uUlRqq8Ba3Gb91THCmrc85XzAApVqb6LA
         QwhjfHZSJLHFrbF/HSf+px33acQZeLLc6hiG5+GwLgjfgM5LSc4yXFUT7WkPrrSatUFi
         9eI8TRjNCyiBD3wYe5x5XRu5kLED71NnR/2IvG6ti/5QubNG3Yo9ku9y3iHGCtMk+tRI
         BGfIMbcVvUK3Eey50c9wiMlvkiz4GrOg+D1rbLYDYDkc1P6niS745u5NIhkt1Hp2hly8
         rUtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjzmfcRJMLMeymvq483k5tCfKDmx2I60LWB0v4M8KFFD8LSD1KH3lbuLo4xE2F62rR4F2siOzuarI13HJsVOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxB+Zu9b0rfcSR6MqP3dV4EixWnpI0y/q3P+omLMWK1ek4CCXd
	+mMzDSsSHSDHTQlaGbMi7qaJf7cO6O9Fi/y13qY6n4ev/lloXYkd3Iy9fTfeF4gLew==
X-Gm-Gg: AR+sD10srEs8gTNgbx4brnd7tJIljXuoJWr0JSnfbol9BUKuiQdQ/OIZaZ4xMZhY6Qt
	tc0adBtuQQ3aUUSYeErRo2gjMKdn1X2c6OkaKF4PRd40RjUWtjkHBQcuNphE21jiojgenCyiw45
	y0xIfREX5Ul6m/ywehC0/6G8fT+VKOpnEalZnfYfjatbRjyPhwp6nbeZwxvTo7joSoUPffw0fY8
	bfay9+1y6EsJ89VDs7+77GBhVHtBGHMxmrayErZsUwWHtNNlbj68D5CFm4XkEXwzmDwZ1uWr6bp
	j403PRlNY6utlOx3GmXrq4ojYlJbL6QzrGY4TjouwSPIBv3u+k3YS9phe/+DL+OdarazrxQZZP4
	umc8RrBQ5JOR+QUfKPsU7k7q5SLKvYtUv/C+3H5WL+XSGL6BmtLH/vXu9At5Jr5tOEvySI5uXiK
	u8fK5Du5rTZuyS8ChggP5Jzp1kmII40sxYVWD5NzTZ6WzaiQs1S7bzCM5EMaegSXgiJdCGjQjJ3
	M66TK4bsPYdvR/tHpBZv3EbZjXbsEm5um4cA6xEtSq7Og==
X-Received: by 2002:a05:6a00:234a:b0:84e:915:d7eb with SMTP id d2e1a72fcca58-84fa8889f0amr2532844b3a.37.1786450876479;
        Tue, 11 Aug 2026 05:21:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:15 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 11 Aug 2026 20:20:09 +0800
Message-ID: <20260811122011.3539250-10-wenst@chromium.org>
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
2.55.0.679.g6767b8d81c-goog

