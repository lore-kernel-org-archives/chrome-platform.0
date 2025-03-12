Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF10241129
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776243; cv=none; b=cpnBnI994hQrFphRf/8H8/Ixmxcbb8UcpfNfylCWD3iOXGQpBuPzMhbjZBbq1Q2+s8C008UHcojvhZbWamHVo2Ck+O+H3K3wNPl9x0tffS7XRfHOSWpkZbxhj5ek6J3uBINJEIOemgUjld8D+qeEDYU6LAHxwFcLzduU35oL9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776243; c=relaxed/simple;
	bh=2Anzpiobt5eRAIZfWn0A1phCfsIccv3FOHc5jmzOe4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8HPvLOh0GGFKhH2AZ4CirqXzijjh/JH/hnf1a9NUvy5GnvQjgBBoYXBPANBPH558ZbNpA07vH6CK8OP3XAay03/ENnffz8yhJBiLr5WK/9DALXC/5XAALLyKs4knOR9cMFqbl88GgMZINFIbDPchM+gO4e0xdPMUzMWCR2nhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QdFP6Gob; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QdFP6Gob"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so1284705a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776241; x=1742381041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=;
        b=QdFP6GobVSHz4qv4GlitbDAyWT/bOHN8mOkTsN2kF9hAkWsPqDIbvHhsghr5hfk4Pl
         Thc0HHjBegz1a6XxI1zPPSlGLm+u6shY1x1Q7T5l0OWdlV9OtYHIJyAD39mv024tblWA
         4xFK6kwFgFPrEtlcEVw4veHlqQsb93AiY449I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776241; x=1742381041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=;
        b=J/STgeY8+V4YQkPk9cf9tIwqhL0/s2U3axU1BCp8LWe5xxiofIu7eAXJpgO7Rg0X5T
         2VRCjoAwoyOb6Ka5TVpwDkkseF5y84y46/FIJEO3QBiXVWuSnlSJ9dBT+bj0t8/CgEt0
         4jBV48/PMU5sUzq3RmtafnqS7L2lRInhxAt3QaagmVSfluARrX55c6YNODg4+86bDKr7
         7W/ydF8RN/v+pFt9Dhe5p/8NzPAaNeuz+yOJpy/2NIR4vpq7/VqBT6QMPgXTXRQuE85e
         E++P+p97lNT7i2XU0fvLZbX7cgebAq604t01r5Li8FzzPayorfeI8zE3dBdT5FKt5cDi
         Jkjw==
X-Forwarded-Encrypted: i=1; AJvYcCX76LxpG9Hb18cZVacdUT4l9hmk7z8t8zCije50V9koZ8X6ZXL24kXlwkEv5XzvNWFA8sUIw62Cm0JwRmqS/8c=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq2goOwcYUIBRgd0nagkONRIm/NJslSjp8529xFIahzQC6IqmK
	nXccoil1wMhI8BITT2Vaf/sx2cFIOTCfU5g6cN607VKM3j3Pk50Q5jH3oAtRgw==
X-Gm-Gg: ASbGncsWywZNcfg8yt5I9EHzFnHeZQ1iq8DtlKI6YgcPMI0STolfJcwunBX/P75Y2AO
	/CiNe4Mj0JtauRIiokI/dJ9Nfr/Iz2aI5WEzyYLbp7f5fyVo1WHN9P2UikwJq7+BpXN8A+956q6
	QwRgn8VJCTF2F89bGWG84M2OUAXMGpzjVXfuFtLXTXyFAbcbrbcQNkIRRX3dCGwIs7Kr3FoptYB
	3jKP+pSIm8bsAx9DZ199ErRXEOuQkeGjpATvxwxg9GEORstU5UERYJsnw45aMddAf1DKgkPVAnE
	DinnMB9LJBle+qDq6y9oqx7Zi85Lpdn1DWJ79Jg4tfmuC298H428u+bo66gyMew=
X-Google-Smtp-Source: AGHT+IFVcVkyWzasFzgLcXK9na9pqX5Q0hBXH6KQUhneK1y88uS9e76oMaG5HptT/l+HGn/E0FP3lQ==
X-Received: by 2002:a17:90b:384a:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-30100546828mr9403835a91.12.1741776241373;
        Wed, 12 Mar 2025 03:44:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:00 -0700 (PDT)
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
Subject: [PATCH 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Wed, 12 Mar 2025 18:43:37 +0800
Message-ID: <20250312104344.3084425-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 49ddc504c160..f0b4ccd81c4d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -291,6 +291,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

