Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEEA13A885
	for <chrome-platform@lists.linux.dev>; Wed, 17 Apr 2024 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713350312; cv=none; b=aSSFJozC15gEVzlPQRLjH02zRXUhoeDsfxnBnaYLQqQgK16sVt2GLsXbPifeByq2SECQmvjfzYoaXyOA6LAwK2V8Qm7sSi8/Ah4k8zoxiikrbinmAxKFWnqJKo8SumpXFQJvvvoIpjSKbo2oIGNsc0BEjsxe3SOt81j00w2Hs1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713350312; c=relaxed/simple;
	bh=HLEm82Qikg0GgPMP8b3IoYOKgePa6VSQprOKe1d1g1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+kpRzwNsd7oKzDxDOncP2SXqBrQwRkqfQ/KfHdt5OeFkIxUeadYvtjwySCiCmgiDkP9MxhlFayqzCM5UIQ5zxl0meaJxNCSikCNKmujqqdcnVerWvdGNynEwI36UGh1OENtA74xbS091Ec5gCIRG75LsSWmcbU8Tf6eEBd5mVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DDF/HRVl; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DDF/HRVl"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-57013379e17so3957221a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Apr 2024 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713350309; x=1713955109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=;
        b=DDF/HRVlKxNhXqMDwC5eqpmMcidsjqwKs7Ka4sRP1v0P63TwDagi3btJmABjEE6YVI
         ZrCQMqkp8U/Igf/NSlcG2RfdCM3nryKx0/Fn4h3Hex29ywG7fJUrqa7UGwUPj4t0N2Cn
         uPd2jxWwsCPXdcEp5cZJ2hCPDzDjYIRkNExjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713350309; x=1713955109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=;
        b=PnWgbY/XJkuLS3NxEeLYraWQEt5tyFm0tLfoomgSXuBZf57KLC4C9os4mKmOZnEfH9
         rDHzjiOg5CUxRSzmFnk4d2lCNKveFgIY5WjHv/InKIBD65zhFjUegO1WKBMaDOiKmZYt
         YOGtc+JpuUZJjkq349vmLsCBOsvPwUL0ltxZ/wp6EPzqDxl/MLvZM+jNhK96fDO3EuJT
         rgeL5/xFQW+GiWQGx3Je2sbXQ0YVmQKwEAgU1QsDg/jh32Lmj46tvsy9mBfreufLbULs
         cEU/4Hz8RXiNvBs3w9+73pabOY+Ewzp8Env3U67HOTDVDHJFSUHSJLxU6WtMughGYhyA
         wsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3r4j2lmc5TwxXCO1E9p2pW4FkrCk7xYwpjxqrLNMVy36G3TxhwTI4sYWyZpc3XkMwnMnMAX2FU2pgYtQ8AucCcHumhBj4xuCK/mddbpPA
X-Gm-Message-State: AOJu0YxkEhLvWnZiuoXe64zncCaz1Dn+GaU5RtNXT4J/dg6on0hNMyEn
	J8lFTNg8cEA1YB06xKLWfqMseKMHnACPyTd/NnzYyY39HoiKtTmkAK5DwPeN3Q==
X-Google-Smtp-Source: AGHT+IFVcPG0J5A4OYw4wVn0Z7fkAtpovNHvVRNRPx9roE8nRmfmY11gcOt1EWpA8oZzc73jAWSbAg==
X-Received: by 2002:a17:907:928b:b0:a52:54d5:7915 with SMTP id bw11-20020a170907928b00b00a5254d57915mr9533946ejc.74.1713350309663;
        Wed, 17 Apr 2024 03:38:29 -0700 (PDT)
Received: from orzel7.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id gf14-20020a170906e20e00b00a51e6222200sm7989488ejb.156.2024.04.17.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 03:38:29 -0700 (PDT)
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
Subject: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Date: Wed, 17 Apr 2024 10:38:19 +0000
Message-ID: <20240417103819.990512-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case there is no DP device attached to the port the
transfer function should return IO error, similar to what
other drivers do.
In case EAGAIN is returned then any read from /dev/drm_dp_aux
device ends up in an infinite loop as the upper layers
constantly repeats the transfer request.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
Changelog v2-v1:
 - added "Fixes" tag
 - corrected e-mail address

V1: https://patchwork.kernel.org/project/linux-mediatek/patch/20240402071113.3135903-1-wmacek@chromium.org/
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 0ba72102636a..536366956447 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2104,7 +2104,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP &&
 	    !mtk_dp->train_info.cable_plugged_in) {
-		ret = -EAGAIN;
+		ret = -EIO;
 		goto err;
 	}
 
-- 
2.44.0.683.g7961c838ac-goog

