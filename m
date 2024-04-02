Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D62BD1C
	for <chrome-platform@lists.linux.dev>; Tue,  2 Apr 2024 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044448; cv=none; b=XX7/YTe/hErFy2GLA0I23HXDxmbDtcorX/DyVKmPlfZ9GZAbnbRbNno6ZH2Tb609lR33nrsftUH9N8393qtEDbNMANOGxF2AsuEf4PXJCCLDfRqgHtQHPxqNdskcuaMo/aTBy2CzzIaiPQqkzajCzI7LX/NeSbOA6u5586s8Xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044448; c=relaxed/simple;
	bh=VnvZ8USXywiPdli2AFm8g6I1VudpIc6SUGU2k0GmCJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPGB+es291ROSxl8j5D82M8QaGT2+QKp1KUy+F9NT3kYkN5AuIMETTKY4ptx09AIBNz91IxbuTzAQr4Zl60xUoA7kx9v0icDsEWP4SusphonNSMUmyPMa+nyv8Dj1NCgjEfvSvcos0J241dd3ddxhRP24pU7lpn02LDn8vpNPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WBlklyTM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WBlklyTM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a46cd9e7fcaso615360866b.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Apr 2024 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712044445; x=1712649245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=;
        b=WBlklyTMSYKW4sS9VJWej8coYFp90cEiO6WXLs77TOaPl65R+6E2uW5ohlNowIrz9L
         wGg59GK35uqQUTq681/MQVb9fT8im/79Zh3YFIFeTZc9QyOD4xfuv+Lgrpbuj/FUG1yJ
         8+RFdQgyjGNA9PKXbwxVsSVcnmBWpDheZ0dz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712044445; x=1712649245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=;
        b=UZhb75rj6NW00TY1bb80ECUAzcA4TDCqr2vI0gogLEPagAM0FN5VDDnYfuH30Jb/qn
         ph8of+ct7XTEnUgu6v4Nye/e2YB7haURp2XRo2p4gv+BZlmkuC3dg/++QY0bc/2DW+9b
         5RIQGIQovm+sYracN0ixrzX0vaKLn2SDOMUJ9LXjRf0EsoIh8/RWmgkvtifIFR6y35rj
         iZLIHHWqSFoIlZJK0Fmfgyd0UXLmxK2YAp2yMDZvyGNhkxCoqXvV9s4RBC5JSbHz554r
         WvjV5hTQqR7IOyKlhkYEdrsd+Pkq/Lw8zB7gKWEJemztcQDFXTgvdzmilR9eGCHBYnlr
         Awnw==
X-Forwarded-Encrypted: i=1; AJvYcCWX34HkfHbhQaAGzYbyRIZfKOfTSG43mx4MPsxTIiDTWcMyoe3fKAoHJ3T5cwFhbPbHzbJ9l4NoDTXRxkz38aFmRpKsilHpvPUnA7njt3qG
X-Gm-Message-State: AOJu0Ywn05VnEAsorgBHIUlfC0ZlYowDk1jx/6OLCRu73m6eLUdLqWjq
	wYafUWt741q1BmyRWFRcBDF+bF7IAlAX120qTIFh+vWVwXm9QzyYmo/pIgM2iw==
X-Google-Smtp-Source: AGHT+IEO3o3WE2Q6ehT7FdVQbjibduradq+vM90LrmVRkZTLj+wI/38lnWD5V3+vj2JRKKZyNZQGQQ==
X-Received: by 2002:a17:906:795:b0:a4e:8e54:7962 with SMTP id l21-20020a170906079500b00a4e8e547962mr403527ejc.41.1712044445152;
        Tue, 02 Apr 2024 00:54:05 -0700 (PDT)
Received: from orzel7.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id k5-20020a170906a38500b00a4761c94a5esm6227359ejz.107.2024.04.02.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:54:04 -0700 (PDT)
From: Wojciech Macek <wmacek@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Date: Tue,  2 Apr 2024 07:53:52 +0000
Message-ID: <20240402075352.3147747-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM device shall create /dev/dri/renderXXX entry
to allow ChromeOS VMs to access the OpenGL rendering
offload.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..afa4d6391b08 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -585,7 +585,8 @@ static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 }
 
 static const struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC |
+			   DRIVER_RENDER,
 
 	.dumb_create = mtk_drm_gem_dumb_create,
 
-- 
2.44.0.478.gd926399ef9-goog

