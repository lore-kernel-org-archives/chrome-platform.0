Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A42B471256
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249021; cv=none; b=AC8i00CdThBZbGQCBFttBCPZgAYcsUmNasH4oHQkC/HC/eCNq/NQeOou8eZXziCZVuIa/RZo/pNIheaUk8u2RQBUkGUqH14/oicyWh+aJRIIIgXazPSgHoVCdowdRiiTau2kQKLSxDwIeJae2KfH7ihh/bk9kT/HuyrfMArer6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249021; c=relaxed/simple;
	bh=/rbvHcyLFzkOkhdGFkadotpTkB6WTk/HoLFqLifD8i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4Mkz0ezK/zM33ne470BgnxvmVPuEGrRRnFJDEmgbQw5HTISOIid9p0hx9dIH5c4Ygrm9tw5D662l0YRkSycn7DcUGILPZwQ7ZRuPgNWVnYWK92KUpa7CZtSlFedXVH53rXtZbDOt11FkPcNdmedPxwcRUux5O84yn79KnIinu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GXYBlt5S; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GXYBlt5S"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d71ae3455aso8934795ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249019; x=1788853819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=GXYBlt5SKQoR4Vm6OSrrLCAMRbTGog1YFQdkK6FsRbbeSAaiGhisXv/h/BrgOqA1l0
         ulwGeFLc1liIxpictkV43KlYW79KkQUI4FNNMNON/j1rR+8j6fuvWKf8UowqYdqSy7y1
         gwKD1y5Oa5QQHgcXvTxti/1nbzxLJioRa6qoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249019; x=1788853819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=Cj6R4E/gmatHPzparwY/dx7TlFIMXh0puaEHvtG19BgrNpGSbnXCEeQzx6hoUi6aNK
         CxYxizFUazFoXJIxivYfLKLQFNlTMVfzeoMTTNsU2NWiAc8Y/boMDYlrrlNRI42V7wne
         jbe3h+JSbTu27hBd4wNZUHK76/6ldi/QCDS67dneXfHZ1jns0XYNXKLndGEG/QZf7bjo
         vNfH9/TvXVHJo5ZLxvu6ikMyhoDalPoDZ3Obm7mYalHt288HHi4mglT1F3XzAnW18Qpn
         YX09TMQ05UebdHy0AvkN5JldLrsPtveR2ahLQ5i5tXU+0yngLhSNadBMFlsQHy70jI62
         kPeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9L9KktN1qt8IAFhOChKKhdjGxUSgcA4hcSM2cr/Dh09rLJmMaLuNwpJr+njs3JyOHnbiy3IDFfvzLYGk4/p4=@lists.linux.dev
X-Gm-Message-State: AFuF++nbLz6x8Ct27/5CMdvO1xalKRJnPJSTaYUn9hOGeeTQZaCTmXKs
	WHise/oz7uh6hyDgbxoN6sf98XRlm5dkLCrOh0ADHfZs73vmMtGjDv/+ZnetfXqtbw==
X-Gm-Gg: AYBFou0IaN/jKtmmmAYzvlBZwi2hsXQSSJhJFh0v9fVb2Z7ufXFl0qxc2eRv7nOIJ75
	sls/CHAaRAW0nZDOk3LY/dS+nys0/PHqD5UlSXIQkwBK2C1Jq7fvM7hGlKJCwAqN2hwLY6mR1ut
	va3xOAziiAsA7AYIaFWa9mEhAO2mafuZg6YbmGv4WNqoAm5ud5w4qKizathN9a4Yv/bGCqIc1lV
	XBpZ7VA6lrh9l+eqrllb4GImf0rTzInI+M8trSnZYHAOZxFvBTXCtafhujcnyFvnYzUaKiqICrc
	VWoqBzBGyNm0Yd7gNvh6rt9+wZGwMd+kj1Cs50V86lI9D3ZTkTBCLFcYQqypOuFByOzJvNUjX/i
	IQf7NvjmWAotmcVyTVjzQpzv8GvTn4OS0RTeB1Sbw/1dFaood253Ou6CZsJl4ChnEj7dnt0c14b
	Tw80j+n3BITwkeRXmjEYvXeL732o0d6SP2ofRAnSS/v1/d8d+7Brx7jlFu+f3FeGWC05MlXA44I
	yNkCDQqP2G5oX79HmW+eWDmOSGmK4NpiLBGbLDfqc1QG4A=
X-Received: by 2002:a17:902:f791:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2d91dee456dmr196089085ad.15.1788249019467;
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
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
Subject: [PATCH v6 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  1 Sep 2026 15:49:26 +0800
Message-ID: <20260901074930.764550-9-wenst@chromium.org>
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
2.55.0.897.gb25b4bd76c-goog

