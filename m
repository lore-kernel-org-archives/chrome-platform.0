Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF123D4
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 10:47:38 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id le6so18847898plb.12
        for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679482058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBJWqFf529bD8jjCDuA2KK02mIaG17tQPXtMSxF+r5U=;
        b=Bs4oVb7r/GfydoLVRsXK6ciaCdAlCJGoVC0GBKWS1bTpRNwfiaabHTmJK2AHkPEPQX
         RzQtwPyf7FxbsQDNZxOum0m7WE6xa2OuCyyognSZd0uLr+HNNiSVsc7B2e8CU0z0XajQ
         9nmP92+emXT/ECYkmr+V9ptY/Dvk7M/yMynz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679482058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBJWqFf529bD8jjCDuA2KK02mIaG17tQPXtMSxF+r5U=;
        b=cT4DCizTsLKjRnu0dFwmlPR/1DQBzmyAlcAMJnwrW5EQkMM0YEZbRX8noMrAM8XPGl
         yyT4obr+w9/zF7/dB9P757b4qCdzA0b8kaN+y9GQz7EN7nid3bkyYqvuzgKy3JvK5Z2H
         pdesVSXaSoNo3h4BwqFlIDWJWA6f5cBOIZYw4Pc5OLRCOmvUlqMEyK8V4PVcKeWrKI13
         p55XhkaQ1mViTh2o2LLYFuL8HUT431av9a/ZD06nLuIK04n3O4ASOYFDx0uZ8QJV/ANF
         Vx1CWyOkAMYY8RkskpQ/eLGeZH/hie0xBHHWhsh7Lg51KdZT4Q4TwO9ks4cFk2z1aCK+
         9fRg==
X-Gm-Message-State: AO0yUKVleiyynoRE6Z1n7u7OHASEEgQ7m9+ismxyWhxLQzegBSUzU31U
	vw4f4ObGkNkOQ7e4glEkF+mzsw==
X-Google-Smtp-Source: AK7set8Ei3DqOnokIBECX7S8i8g1KL2mbbHUechKS4aqr0RMz86pm38BSbfR/++b+hwW4t2FFU+JAg==
X-Received: by 2002:a17:90b:4b44:b0:23d:39d5:f81e with SMTP id mi4-20020a17090b4b4400b0023d39d5f81emr3468217pjb.11.1679482058020;
        Wed, 22 Mar 2023 03:47:38 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:343d:79bf:55f9:1da5])
        by smtp.gmail.com with ESMTPSA id hg4-20020a17090b300400b002340d317f3esm9508742pjb.52.2023.03.22.03.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:47:37 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
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
Cc: Xin Ji <xji@analogixsemi.com>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-acpi@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pin-yen Lin <treapking@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v14 09/10] drm/bridge: it6505: Fix Kconfig indentation
Date: Wed, 22 Mar 2023 18:46:38 +0800
Message-Id: <20230322104639.221402-10-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322104639.221402-1-treapking@chromium.org>
References: <20230322104639.221402-1-treapking@chromium.org>
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

(no changes since v10)

Changes in v10:
- Collected Reviewed-by tag

Changes in v7:
- New in v7

 drivers/gpu/drm/bridge/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 12e8f30c65f7..28dc7711bf5f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -74,19 +74,19 @@ config DRM_FSL_LDB
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
2.40.0.rc1.284.g88254d51c5-goog

