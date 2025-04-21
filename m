Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF6A2620C3
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230393; cv=none; b=R4oT0GQywwOo/MtqBgyxfIMP+ychlWaJoDGSv5wXLyPieaNCj1DI6oH59BNUFqwGmkxGy8UhkS8NmmBjXWJNvGD6zIkq+L/ipYkkQNyWss4oYhn96auXbacrGbil4+EiX3IJggU+J+/I+DyAJW0AIW6NA0ii4rEb0s+nupVEmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230393; c=relaxed/simple;
	bh=FR04IaMx5M3reYvC9Ul0vGkqy5dkFbswq922BLXpjDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSlFnEX4FqwMRVx25WjMnAQnj2UbqW1804kU+SkzvwSjVc0mbNfSesKpsB/xPuferBvNyUNK3UfYJBNUrbrqGYAX46C0IZbP0uScf0ci/EdfmNnN8NfgXuDsIFbPey1MwHrCfAtypbp/C2FgMEH35FYS7bGwSSkjF6RsZjVz9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eCEbcncJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eCEbcncJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227b828de00so39098475ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230392; x=1745835192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=eCEbcncJ6hvxa7GS1chTf8AQQldPdIOdJMcYS2vroGVpinKwPF0DsH/ZI1VZpcTpyH
         LrrpoE/caHDPYmbMLXVTz04EEOeYEQDbNvqegCgpacA+8G8cdNybGGVJNnDXgxIdsxqa
         490+LslrLLmEpkgVdXQ1E+1xX2zV5YqpahKjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230392; x=1745835192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=doDUvp0IBMnJ4hoFbKpL3K1ceKwoWIA+402uI0gaROSYJpogzr4kYDegKuY+QAR17k
         oOKbpO8Qecxl+SSYj0fpvLfnZTt1e4QtaXBTaG6v6IDFqQk5z1zKk+W/w/1cg7+/AnzR
         M0/M9XuFphIlT7t+kki4GevD6136ffLUHO4tv/FLGzohLBmxxggOI9VPwdrUrSI6FDmh
         oqGBVZWLMWrJEOs202kmvNHghrouNeV0gWF+jc+1MD0aJwyFbCj5kWGFxgYPclPDZBNA
         XcCPw0HU+vB8+LfIMD4A4dCTBHXdTEdJsVFuzAto4Ww4J61wjVLaCNwoMeFIvBrYhL+O
         i5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWiIIZip+VoOiB+sZomQbM+duWMEiGigIbWclUkcpHaduLrdM7U1ZoWhs33ShTzYI1WrDxk4Ma0sHcWx09zg64=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTCe3ZmsfQ5LRfhzo5Hsq+doLL+8l4vVKyGKm+2GAkNMNvnbv9
	1hpZnyKpPXR9G/XM1U8UATgfZxr2z/mfOsr3Kfgq7hl3lYpAys3TgblhbtFxbw==
X-Gm-Gg: ASbGncukmwE1UcIv6b60ZynISUu2njH4iMemVlcuix5boR+Fl2QgT9CCpYGwGhpZuxv
	MtgTcJhfNCXH7uoM1wpctfQI7BBepjiGxICRslVVA0GviIkLJycuXvojGhlRuNJZxhhJxS3M8Sg
	S8MrGsRfdg/qGxtC9e76vgLXAPE7hvhXwurxhbjbHRuZo5M+yAD5No2Vq5OnYpA0CZishvd92C6
	a3AJQ3mQ2iY41pIPdseTTzWsfFWPcewH0AqwUKv1fOeS9/et1/H6Nhp7KLszeiJ2AHpdYQJiCOX
	xD77hvaqLfEeKJyT3/ZNxpiVpkx4xAflXXwpnbiceMowJ+PVrzym5wq7WtQ=
X-Google-Smtp-Source: AGHT+IEzP8P3BuI4W7WctpJECwx8nzR8w2GBK/ppnOU1J4/hN4o5Y1Q6ZPLjik3RIkoMMrSDGxWajA==
X-Received: by 2002:a17:903:19eb:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22c536063e3mr184062165ad.32.1745230391767;
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Mon, 21 Apr 2025 18:12:40 +0800
Message-ID: <20250421101248.426929-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.49.0.805.g082f7c87e0-goog

