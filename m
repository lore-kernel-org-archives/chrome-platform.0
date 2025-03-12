Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A923F393
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776240; cv=none; b=aPUMUbQw5K3KAgHFcBLiKlQqGf5Yspam8KC/3BWdMGkKTTd0COQ/F1SNyU7GQTLOKan3cwLwCQ28IbZDqqvqPC8Sp1sQIjfM7NntIAwPvScSwuj7wQBKaMQK4hbx8kbrlVMX8N+BVqGDtl1Mera5bMwbGQN/R31VRaQ+vjqCbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776240; c=relaxed/simple;
	bh=0DwS99z488I3Fc/El27D+3T6XkxoLUUqA5oX8NRuukk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM6lZRRuOsyWZhCmMFjltL3+XzYcTgMkEi7HIrINXSjwchEG1sllmOIVc2YRS54Q+nV7ZtT/lZ6GjixUsl3qy9tPjeBcvT3vtaSS0VzXWHlI54lKgbLHetYmPWt+MobxnOUghnF6rWFeVmWh153uaaY3DcO7lLJHdTyyXbo6V9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G7IGcdb7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G7IGcdb7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2243803b776so121726305ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776238; x=1742381038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=G7IGcdb7ywdT/MPgzF/xk1l+FuOvj5jWYzKXoMDJZC6y857eltSz+Q97AGhb6OlS2b
         QaHIC4CuLxDMG44MHkbtweNLzRl1qFa5N0n38pOdWgt/WH1d2m0KA7w3i+Xol0hw1/S6
         qVwCnnhDPUSd1fcdPRB+TMIQVgCjRdA1ey2SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776238; x=1742381038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=q0N+IfxbBUInVgSrYfiU3BiDqFXmVcAMeeMl4DXl9kKnJb4rBu43N9cxMpjw7ffWJs
         0FhOZk6ZDlwyn5MShqXTBfHZ16V6PM26w8EV4N9enuVjKxr0mE/ZYmqt5+RUJbXaGuGH
         Iy9BrFxzJBUajmS3EB1/iQcyHwHI46FO0dQCT4KL+zkoq+kYLKOufKz8/0JVgUvZjMGR
         3Q8WqdmJ28bfT3SujfM1EIYptCHC4hZmz5RHymPY2OMVIRYym/7uPQBCKHtROKNq88RT
         Vx9Y6mV62RR09BTjuBzEtErc59NNvIOhDw5oFHdXBWddjejq5+vIXSjzGvqSS1w9itBH
         9nUg==
X-Forwarded-Encrypted: i=1; AJvYcCUZFRGB77W17qOp5YNnELocNV6i0NPsHIgRdzXEsXkCpD5cYjAllDf169OP3OQNOIlHQm3NMkOXlmaFzVrw7RM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWrizlE51AKFdr9pd1z5Oz9UGJQNL1iHncfyq263I03zREdO/S
	T5hqyEkMdECRE/j+SP7hVdI6D1/nmOXJxAajD1sc/b96Ia+oe/541DnQYiutmQ==
X-Gm-Gg: ASbGncubx6n2O2vYXqheAJAMcrPnBDQMBxkRq9fZ/S4cz5CBP+l7dLsCz0aiD1xmuZp
	Tq1F7ct2FEtPPGwULAJTiAM9gE0I/eE1TtsKipm+tCeDH+DI9cvbnbJne6PgHOALN3LYPMsHFTD
	2a7wc6USfZorDgDbXkOIoIqaAEQEKh0oPGd8IrYXm+ZDJcLphCydPIcXvWzJog/PKzh9KRB5IFp
	uphgM4vZpwxGl1pHd41HJ3q5bbnrgte5+tOzBzt8m74DEQadFgONN3fHRFaNEjTDalmf9FhD0LD
	6L1ovUEQiVV63o7UXdmKxGsPZ761V1/vWFsYADQ5Ck54uxwidaPJKe577qUhoVs=
X-Google-Smtp-Source: AGHT+IEi3t/oRgH4tgJIjV7dZt0tXAW1XWislifFGuRCmj9fEunpdxZYOlzBA/knNfUOTDyGKEKM4w==
X-Received: by 2002:a17:903:2445:b0:21f:52e:939e with SMTP id d9443c01a7336-2242899465emr387459965ad.28.1741776238354;
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
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
Subject: [PATCH 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Wed, 12 Mar 2025 18:43:36 +0800
Message-ID: <20250312104344.3084425-3-wenst@chromium.org>
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.49.0.rc0.332.g42c0ae87b1-goog

