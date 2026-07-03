Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF43CF21F
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079798; cv=none; b=toirmN/iXLg2Cn5z/V8nWWfIM/++w425XMrnuaeIJlTX/5WQA5dy79CFHsO4Y7SOhG1ve/nxGUtZbXIhqOrzvIIUHjvBLjCRGVtgl0hCwEmhqtBHJa2fAxpRh7FfrwEsFnvod2Fr6ax4uwoYsmGKSehVCdDSXaY0xsZr0W6IcxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079798; c=relaxed/simple;
	bh=df+Oxwu59Tqkfv1QyLsVXk0WC83aGGx+cVeZR7rfgTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui+om6l1c1DCgqucCMr5R+WNOcSA9uUXBheU/DyOPMigUrpnzKI/uk5c5LClsOU5m+6lYa8XyW4KF28clM7CRpCJ9yYDQThLwwueLTwq7tcqqshGkph9JPjwhz3zeq9wJxDYFWsjbLyeU6RtU9UmsZwngUe1obIoJ6fhey7SRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bh6i29UM; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bh6i29UM"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9672e02e05so274234a12.3
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jul 2026 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079796; x=1783684596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=;
        b=bh6i29UMQDk0sR57eKBmqGjtUjVCExdOXnH94rHZfpRLwJRnio2msBj4ILnzSOEenA
         8uOi07f4ORXJPnLDCTa7ObVLj6owXllkkQTYAh/pMTKmUIrpdwCVI7ZtfNMENsl7t5WF
         4FMyazMwwpzknz48pnPhwOZAw3iIODIvsMF3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079796; x=1783684596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wQQi5qAJUnUkHX1saOq3zIx6e8dXlHzf8E6xF+VOzM=;
        b=mijwUgbMQWcOwAXJzUZN5hmlcVcOOS5DPq3hWOU/MeCCr+VljkuBKOpe83ZbZMYn89
         nx8FsoGkKmqWFeqCxuMoqjNCDAR6fSlegc3BSxybn8z2TZv8MB7q9gJixRsGZ4S71Qdu
         KJrIT77xJlNfK7aGGj4GiK9JhI9EAZkrUZEUk/gaTed6gGMG9CiM34R989hqrdqGdZjq
         LxhPu4uB9vhJi1uB29tHEcaT0DMbHSp5gu+4m0oJUxmryO7vwHRtiO8ndWFjL/kU87HY
         B4IbOR72u2J1aAAreZNMSnOxeVbd/Tt5wrK0YWCEPioxV/oeNb9PrVS/LAWdRJ+d/CTB
         18lw==
X-Forwarded-Encrypted: i=1; AFNElJ/lfwCAVXLH63SIQ70t/kGQuugOKkQlv+7oNct0UxKsygttyK8SJ7AIq/bJA7ALAKZuOOJilcJOq9+T1dKb388=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFYGd2WIZ8HLqt2vQTkbNOL/U0ALDM+naHPiaFv0+pHXg0i7GL
	4GDQEO8/+VdwVMmVC8T9zm/hL4je/fC8RfaqVMjo7pTTH1YywCg+cVF5uyA1f2eoAQ==
X-Gm-Gg: AfdE7cmFJNySe9AbeCJ9m3ggvgimLKhGjKfWwIBqRHCZBptcUoccSazZFDVz//sd13V
	ayvcKwgCJ/9R8WQ+FaYtC0Nuctg2bmSAztmmEvTI/VEADD1rTuHk6IgVSnC/nTnGnstUGaZQKO4
	L3Rj9ASaovU+Yurtiee1bO9xBi5ybPfVKzvSdDIn+G6h4PQTkct0PYyQHfMIm2bI0P1BaS/4qfR
	qfkUiO9l0k9oxKyVy578GXgqPoVlGPlhFaRD2GVPx51i87ilIuNzW2lGrusuzdwbbcebPRV9K74
	+m2BtEBt+rH6/F2taMDuHFPgIp2R5LXfPs1qNvmsKGsOvdFvD85/vAKdTwUGhv7FtIsgrub/vlz
	RNKPoT8sO6ktwqMNVM3z3Dk+UTeep8PJDBEBlYtJuFQXtYptFcKwKoTnJCA0AdZMnkOwvNzP1cN
	S3/cu9+4yULOd23deEXKXmmzBMjMSUSLFLNdESJ4JwZgWth9FNvr8xYvADiqwD9B3zyooAibAxF
	JKC2WtP
X-Received: by 2002:a05:6a21:b88:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3bfed0e254cmr11946730637.4.1783079795734;
        Fri, 03 Jul 2026 04:56:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Fri,  3 Jul 2026 19:56:00 +0800
Message-ID: <20260703115601.1323491-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
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
index 163960f58db5..147a8e9a3a71 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -90,6 +90,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.rc0.799.gd6f94ed593-goog

