Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459FD2BD00
	for <chrome-platform@lists.linux.dev>; Tue,  2 Apr 2024 07:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712041882; cv=none; b=aSIEs+3Y2eOpEor6DMzDIGCvv/5+WbYoqcLdjMLxHfvQQgZN1J9+YlnL/qO9XtqVy27iapExTRblepiDDbTHL6VcMBjqO3KftgqZevd5+oF35qMbR25JM2pEU4HbiYoV+Me0lOQEQdCqalz/dOvcGSEPAS5+y8Q3WtIs/bRhlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712041882; c=relaxed/simple;
	bh=MQzXPp+oT/1/PFhqEjpGaOh1QP+W+l+TqjkB8HIEYRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdaKqjWv+yf8EUUsgHnNAWbK/eMPuEpYSmxmM2SQJ5Hnq+ar7UVvqFahB2U4QDthSXdfS1RXir3KrNTig6+SqiSatjI4zGf0OOPdoHLVCoMOUTUfK9tgZ/zOGy8/vwT9R/oQlvB78rvUkl9j6JakKuO6Xw4Uy9qip+ZYuqQyv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iv3hP4Ea; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iv3hP4Ea"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a46de423039so274604166b.0
        for <chrome-platform@lists.linux.dev>; Tue, 02 Apr 2024 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712041879; x=1712646679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=;
        b=iv3hP4Eao0JnagbxrO0U4rl2Km2QNOqQVUCl6iOsiiXXqJ6TWHZVjmvlvVKlDiWo2M
         JpJRIzMfhkdt3Y+t0IHM+QdOUfBaMPX4Lxacc0AJn5g0kujOW1AC7b07t5c+x6dgI5wC
         gYWDCv2eEfZMKy4nMB83Fio4Heq+CWWPqAsXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712041879; x=1712646679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=;
        b=Cl8ehNDHVH0DYAQVs0xnxoQUzeQWFf6NJwWqMcnYwrASnq7xAdiXGlTBnDn//6wKH4
         bdOk2+LgEl67my7u0ySd2aMtyXJB8s0zg0HIkwIda0GgjlgceTtbaS2WyWcQqogmz6wb
         r/KKwxfUU7Ye5yydrQmMQb8oSGusxhyi5RSs7vy0aeyVGqSo8+WgUn7kLPEy8xLRPV1g
         0wq3ueKa5/X3LOWkpuai/2Vna2Lyt8Lt6oynme3ldo9UTQAT36BlODueaUAyGwItR3vX
         lLZlPEQTiul6ul4hPRubpW1y7Ng/+/m16l6p1eHv+5UidvMaFj1Qkc16QtPaNA3W/S+U
         99rQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+BV2No+0+M/mHImshtWaBz9h+Auh16w4h3Hh2g4fl0Nuaaf1VsIYlN9sb+okO3wV4A/8idTzlldJxiFZ5THi0qccdGpGx7T5efqjFNwnf
X-Gm-Message-State: AOJu0Yz/BJXBZMsDhCq1XhItEXjREC9DX8OFh2rJvTUbf9MGXDc54788
	w745L9U8payNhuCgi2LyeEVvldUl7a/exRzkzwPWEQSofJgZ9/3Reflgv8KcXw==
X-Google-Smtp-Source: AGHT+IGUOjA6NKyVT/+ELVqwwCceZpb+FILLMln0YYk0jw8k+fwEMqxkgdfJr/x+JyjJ3SCGlsnvew==
X-Received: by 2002:a50:f603:0:b0:56d:e947:dd52 with SMTP id c3-20020a50f603000000b0056de947dd52mr471101edn.26.1712041879594;
        Tue, 02 Apr 2024 00:11:19 -0700 (PDT)
Received: from orzel7.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id g28-20020a056402321c00b0056c1c2b851esm6395171eda.0.2024.04.02.00.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:11:19 -0700 (PDT)
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
Cc: Wojciech Macek <wmacek@chromium.com>
Subject: [PATCH] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Date: Tue,  2 Apr 2024 07:11:13 +0000
Message-ID: <20240402071113.3135903-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wojciech Macek <wmacek@chromium.com>

In case there is no DP device attached to the port the
transfer function should return IO error, similar to what
other drivers do.
In case EAGAIN is returned then any read from /dev/drm_dp_aux
device ends up in an infinite loop as the upper layers
constantly repeats the transfer request.

Signed-off-by: Wojciech Macek <wmacek@chromium.com>
---
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
2.44.0.478.gd926399ef9-goog

