Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D95392
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 04:22:12 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id d10so11942067pgm.13
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 20:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08tc41QAkvFbPfqG9xFaXxlEL+CygmRv6gbW1qKfyT0=;
        b=B5rTvu21cB1Pvztm8jHvC80rb1+BLt39TQzgQuAiwLFONfkM0ra6deRHzxhaRehscV
         q8pfteWSIIfiqIsRaEUI/7FuMhjNZzIwC9hAyEuO0YNO0NKuDHn4sJZgF/nHP9Kgvlqv
         9nHCV5KdxevdTllYWjnCYu8586wYWfMkDf8lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08tc41QAkvFbPfqG9xFaXxlEL+CygmRv6gbW1qKfyT0=;
        b=F73T3X09CTX90pstowbjKFkYXo6IvG0a/HvOnZo7cA3oelWYiz0JAp1d/f9HYhHfKo
         oS7DQq+oXkXQ8FL+/QFO2sbKv/9c0F0/hd4AAs3WhTIBFqFu+RUnQYlNauymIeoRvFVv
         EA5kSFeeEHlpu+BtJkMqf/UeHpUZLJ/v0WoP6tTz+m+5LV7t94i9DSX2sPHLk7feIM7O
         BfKiC70mpV92dngbSEEF7o7+ucBVBLO/Dfg6gtpjegGCR1QDTXY+Qp7d1HlyYwQc+Jcv
         DNlUnSURr+z4hCKGLnSDW1Bg+OB6a7Nmp5NIUVZnE1hKFEXc5Ee10PL+eewaJJywDcWy
         ZNgw==
X-Gm-Message-State: AFqh2koBvWZk23kJCe7JL/D8H0TiG+JSJmeIYS0RqtjL4rpBrgPjhmhF
	L2ixMR6ROerqCXKKQC+vdkbdCg==
X-Google-Smtp-Source: AMrXdXvPDWRWvAEy23yDATr61v6ibCe4oHiINnKlEZfgCwdIByilVS/mdvq2OI8+1KVsEpuEH4ZCMw==
X-Received: by 2002:a62:870f:0:b0:582:bb80:58d7 with SMTP id i15-20020a62870f000000b00582bb8058d7mr4747262pfe.26.1673497332331;
        Wed, 11 Jan 2023 20:22:12 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:594f:5484:7591:d074])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78bc8000000b00582579cb0e0sm5519478pfd.129.2023.01.11.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 20:22:12 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Vasut <marex@denx.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	chrome-platform@lists.linux.dev,
	Xin Ji <xji@analogixsemi.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>,
	linux-acpi@vger.kernel.org,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v10 8/9] drm/bridge: it6505: Fix Kconfig indentation
Date: Thu, 12 Jan 2023 12:21:03 +0800
Message-Id: <20230112042104.4107253-9-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230112042104.4107253-1-treapking@chromium.org>
References: <20230112042104.4107253-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the spaces with tab characters in the Kconfig file.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v10:
- Collected Reviewed-by tag

Changes in v7:
- New in v7

 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 57946d80b02d..737578dd57ed 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -85,19 +85,19 @@ config DRM_FSL_LDB
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
-        tristate "ITE IT6505 DisplayPort bridge"
-        depends on OF
+	tristate "ITE IT6505 DisplayPort bridge"
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
-        select DRM_DP_AUX_BUS
-        select DRM_KMS_HELPER
-        select DRM_DP_HELPER
-        select EXTCON
-        select CRYPTO
-        select CRYPTO_HASH
-        help
-          ITE IT6505 DisplayPort bridge chip driver.
+	select DRM_DP_AUX_BUS
+	select DRM_KMS_HELPER
+	select DRM_DP_HELPER
+	select EXTCON
+	select CRYPTO
+	select CRYPTO_HASH
+	help
+	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
-- 
2.39.0.314.g84b9a713c41-goog

