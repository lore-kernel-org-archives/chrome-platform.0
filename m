Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DC4398FA
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620474; cv=none; b=p6ZqoIhDiiVowpDWJpm8GY9ekMnu8FFf7o6f4USIcabdhS7cSEHNjPOt9IGH0Y1hVxjqLlRDlKqJb96rPl3DzDiLs33L8I6hRfLXEIINhVlX+mGA/UDlCc+HX2ED+fIH/m8+vLJCC+l5mXZzY7dklHXyKBDHH9obZ4Ekm0z2y3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620474; c=relaxed/simple;
	bh=YmTP+U2Zeto/TOo03rVHUOI/jAzel7OhJkJFnUSba3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWCrU7CERYG6phfZuDadqWbM561TJHeSgesCSRbMCpF5MgnGs5qL5kYGlDUyHUMp71ESPlbrKhbIqlktb6cIR1bwQe2obf/+RpIEdcrqyjHvYTbX1U2EzEk6SjwE8DRce6bOtScakCKAjkx9BUXTmqfFNP0Hfepa3ab8XVLfHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iMu96kl3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iMu96kl3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so108677905ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620472; x=1785225272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=iMu96kl3MjK5dKghVuhX58Lb0q+paURw3v4LrZWLyVmP76Y7cWW2LWY9UGsPspW1Iz
         VoAMth28yMXtYdn+2DPezeMK9xlc3R23YWwMJ35YTGR0tb0CgkhHby/lXHoj0y4g24m+
         5+GNecySDXoDsppCVeNuMR6l/HgCFpmzTFM34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620472; x=1785225272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcG83pWDuxaLzQNicOj1pF1B6XObkyNl+NSmg3vDNXs=;
        b=rjSp2dqpwoHAyT7+i8PfNSYQ4l8Y6cBmTPuWihfHd0ql+7usMFBgPu07PJp5646J4w
         ZPNLqZRa6eCeG9tEIPFudFLgg0A0ud84+yiS9+3Vd0y3gcGTcgRvTk36aZ2VbehaEVAC
         QiflMmBnpmHgOL4zESZj97DfcJm0EBqQ92rNMs9q/21h30ZyH6c6JLtqMNHn1FnHMFEl
         KfzdUZplxd7r18S130hn5zwzALZLIOa+Ry6qTDpWa86KUpfOVzFPJVmMLmpXknePnKlv
         QcX1FEoPxB5naYAjsyAfCsI8Kkiub22yeDsQa3H0Hclj2gFHcnwUD0FeA73TJaoivMKX
         PqIg==
X-Forwarded-Encrypted: i=1; AHgh+RqirIapaA3NzoGJ5N9MbtaI+kNGhs2MxZUQARlbn+DCuVBoDCSKu60fpIjsOmY+3Ewlg37P18r/dn32oGcboQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvgPNZ53sOnv+QctTMjvUEQl0MQfbclg9GeFVc0BbKoZN2IXVi
	HTThe5BEUJYfHUGb28vypxANVDJfmYG6OPEiti+z3mclboTfHh9qoXSqlSY6I7xwug==
X-Gm-Gg: AR+sD11fmdi4CUutJ6qPn10BTJ/7kiCASu4stHYT2e6brCXFM6evddGt9608aVs6kUg
	JEoJHvjsFIo16ufel5wVNPbXBMSZIYRAcZeLiYJvgEGT+2tr2+AxZaSxAKfF7PaNy0qxstZAb/k
	04WnnDgGKK0eRvA+3MgbfhTBnv5BP5S/UTpdV3RCwVJ6sX3b8GSoYpglaJZBFHWDXzX4ubPIbgE
	zIVxgxj06kTv/FxvANu36/xm5Of0C6R+qkMOnl4rMRoVMp75W513QVLdSk0aZJfo8LwOm+yb33u
	cab8DcIqPxarTCytCxKCaNFVym9JyB2+hYZG+B4pWLwfepcaZPNBf7iQznMah6D8EoQBLmGHXx3
	iFar9920ctqGBI9z7fk+2wtOiybYjkwr0q8spj3JXGIvFtozh374neNreob/aAuOgnpNdDHrR1l
	P6Z7HZTysHgOcY4VTHP0U31pRUC13NJ688fU2X8GjSvWc3XBnMf2fqDfeIB2lEqluG/qXMfA==
X-Received: by 2002:a17:903:2b06:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cf83635d95mr15956285ad.26.1784620472296;
        Tue, 21 Jul 2026 00:54:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:31 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v3 9/9] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 21 Jul 2026 15:52:23 +0800
Message-ID: <20260721075226.2347933-10-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

