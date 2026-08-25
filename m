Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F80332604
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632440; cv=none; b=kCu7A+SHR6M2zucje7OGNS30SATKHoQRiwsZAW5NbFNSXjiOn3Tn6Sl/vgdWCS1S4nKuJJlvIrWBAdLxnZ8lcKvxmdEOqATFig4lLh6IJoO344XKMs1lSOQIf6owmEqsImO2k7aqho9Ou0m+vh1wgCTxEatEZujyNnSst4dG+ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632440; c=relaxed/simple;
	bh=GMLwta5oNasseK5udjS+I9A6d+Krjq5yftEXv9H/4cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOFb8XopO7xqLbDExF6iMUG2bhlY4JX5j8we7ntQQ7qC7fww1m9+8wypHnER7uR0gBOgxy6ywM75Wav5GILMcS2Z+PK7DQs2DEukOCZk6JdwLBCvn1fmQK4+tV98jfaB6Y4SNN6meyNgdaQiDAFrBDvP2Ob/180L1JI0bT0wS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hDIPzwc1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hDIPzwc1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc149372c14so3123499a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632438; x=1788237238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=hDIPzwc1px74Trgc26MiyVH9iKzkCvPy5sCW0AfgzeNsCGxZgOafmLgQXn7STwRSWz
         mcdXPux6RcxoXn0ZOXyoDpIdQm1X8KRirk6X0xt8nSCRWFfVA6Bb3Qt96MKLkYBLGuVn
         cnQVoC0Ct0T/irJaZV2Q/d6oZNw4a1ar86wfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632438; x=1788237238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=fonC8Td3YmRy/XonSTAbVM8FmkxEmrQ9MpVpbsO4w6VRIhRAic35sG74T43S8CnXJO
         lpmbCaPJV0KaBFOJgp2Cb4dOa3B2niYfxcHA5fKfLIv9TxkZieOM+oO/23dQQi/uT5cu
         jx1eQob7KCVe+iTHes9mZXWE/beQYoJJ6Nrb2kX10ZtuR4qS/VLrI6qcoG5YrhPNloJ6
         zJAXQTO7CGYXzsnXy13iHRBg8/XWO6kMIf0e3vFHvpkRmWy5KEefZCYYDl7BQqErwOYN
         brsYlocvfKD/J5138BiSZPeXBAfUfT8McL5Rf3lLwucijv0d02drYjPNifk3uhbQQ/O+
         OQFw==
X-Forwarded-Encrypted: i=1; AHgh+Rou+CVoO4Yy07PfuOZsANrN0mCoTEBTSYIZBWQoXOIfMEQ2STDX72I9IBPKtoTRXUtkKcD/lurtlaQTCPk030s=@lists.linux.dev
X-Gm-Message-State: AFuF++kbKMJXalguIty8Tk5o/Fxx4cD+l2qRuS3c+za9wKMXHrqa0JgH
	kxKTAs13dfDx944a74AC0m5x4syzYBlkXOuJ9DZxtWs7jAy6HNLlp7ZUCJoTHqKU3A==
X-Gm-Gg: AR+sD11VLbetF6SFbyu95LX/aEYQ4VEcE88moWFEH0C1CS16FTzWhKz0KJhVYjf2To9
	mwXS+WGzn0DZuhnXmsf1lxOOtp6+BuD8WWmkQAqmz0QESCwVE87yN3nBGdYJgQJz41VAvvkxLe+
	sxDZaaWWSoHP/rIaWmGfatp3R7rOQYk65cMbZDo9HSY1Yfed3zvPnztZpK5N5PlkFhEuxp79Zco
	Udzrqi4m7fLtYIKpG4qTncB62OZCUv4x1bdyoCemo6sQRYcq/T0tl2/nzNI1ttCEs44EM9/8O/f
	md3VbFLmWLyWAouVGfsR0shiEhzuYfgNEHMf3Ld7vdjP0KN4ixbjBTDFJraLjn4kr7TG9cSKXQO
	+LVzljqiwy2cF6qE0uLQVPU2gYcBRU/GL+G3rWIozyfe0OMD1vFohbDAkNJavrkbru0iSQPED5e
	WoPXwbbG+6zUg1asS7r6iGtYgfx9j57mhojc1uItpHdpYUPDpcFZv4eRfb1BJImdPtcSIZP0fAG
	VeqpwTOM5KZResTlKyUCtEkAYssI3PoRPnrxza91OFsqN0=
X-Received: by 2002:a17:90b:17c4:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39646519363mr6944892a91.13.1787632437771;
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
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
Subject: [PATCH v5 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 25 Aug 2026 12:16:25 +0800
Message-ID: <20260825041628.988369-8-wenst@chromium.org>
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
2.55.0.860.g4b6b3295ed-goog

