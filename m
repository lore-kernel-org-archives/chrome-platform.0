Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E22627E5
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230396; cv=none; b=mknj6eZF4X0ky11FwBZXdTDEgaZ/GJgZl6rOHIkPpZKgXvT34PR4A6ly8dQamweYtpIXQ9m+butBdlX8vxeAQvNMaB2C0Y/ryR+WWwNMoHDT4UKtAau6U8YqkT6v0qKYRiJnNlkOxwdH4ZqI1LGRYpgKsdpcx+LRk+CcMB1tVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230396; c=relaxed/simple;
	bh=34zm+yxWUtR/Lbc2SeD4Q2rTlj6zy2/A2wbsfBG4WVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9TsrHxR6kgH1Czy7blXtmxYdPheVdurZflfC2l9NDGlqAWSc7mSaaxrTEZDSzSRDOcLjOzIKS1jETsl9aBd0Iq6cevR4g3q2GLANZWD3UdjpSgIhlHSMW/IVvdX1JWQ3Km/bYDUj3Ckk/sBLqoCoY6MCEEhrEDi+DamRr0/jTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jl33wfLO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jl33wfLO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224191d92e4so37706955ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230395; x=1745835195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=Jl33wfLO/eElYjUx2HGDbiNx7ecm8ZHmKqscJUXfzjU1CuGZ8hDaZPriKky60dlbWH
         aq/XYxUHBN+M8tHNLxerEC70k2HrzcnppP+XM+eJKXo6pA5yNxUM14cLoY+rFJmIA8km
         PLc7tz0UQav1LeOcsUOR4IOn9wUsPz36Nk71A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230395; x=1745835195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=dxsyKn18oowMBRYjRKhIN2mxrAOJ27MkOOEH0dyhdFpiGmKbf3gjO7A2zCAxkjxHuW
         JsSc+92l6uaa+FQ0HyRUESveAqmWuUeuQPtM02WpM9PxQ1N9q+LzjcP4pkp1+CjqG4IA
         gLxNO14dMW2JY99uAfQPFgljeJm8D8Al0FWlFwno7QciMDfGSW6dks+3aZfjHyVDdw4X
         XEHLqy8MY2ChaZhyzm+akNymIU84W6c6QjJWCIAtxr9F/qsbrPKcvlM9zIwjNbk5lyuL
         tQXnNmtBTgfo9G0nkFbQcs6ZNaDHghb5URwxNHrO5P942rVq4RKHl+EhGKiPpFynpjfG
         q2zg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Wrur1IID93pVYLG3L3jpNAi3lGMFXgNq+C6HibRvwaxQf8G9e54BB3FuZ0uc3SqinbREVJseDavSwCil57Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfe1S2CLEnu/4LuMkZakGow0kR0RNlsE0TXWbvKwY1mTRfRUNS
	6zusd2GGvQuUtt0YTX4YUZFKNFsCOBfzD/edGFuHA4DA2D0Clv5NVPx8W5s20A==
X-Gm-Gg: ASbGncslNIs5qnScvJoPPo55dwMJr8+Q6WrBZRran9Cxq2eU8fRI5B3b6LctAJ0886E
	MHI0Qj1dyg4cRZfxULmtUTUl5q+Bx5mqyQRSGRWpt3DkyqukNgyEiiFKMIKKpA+7ndYLQclamYj
	heg+rAoeC3oQ8GZvxCoqjmpOxJYvtivlNDEeWPUFehpfRqYB31WYOm3nLj7s6/Q+8taApw7nnAW
	iWMbn1SyfNUm0mAwf1lvtY9NeG3jcVc1BL8zyMVIjcbaURxMdQh5r9PRNa076D3NpGXWDEiqZKO
	zS8lEgX5/1G5EHsvzxsfafd/Hv6R/ss0nyatOrdx7wLyCVNflVRHJ+6qyXk=
X-Google-Smtp-Source: AGHT+IF+AnZFOOLJPlbiAxkDb/YuGPI7JP89xIJch2irCDOD6BFYAkiFyfLLQWgKCePZd7wiHYd+Wg==
X-Received: by 2002:a17:903:3c6b:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c535a7eecmr173618945ad.25.1745230394801;
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
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
Subject: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:41 +0800
Message-ID: <20250421101248.426929-4-wenst@chromium.org>
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
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
2.49.0.805.g082f7c87e0-goog

