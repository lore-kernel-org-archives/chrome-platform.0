Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F879CB
	for <chrome-platform@lists.linux.dev>; Fri,  3 Mar 2023 14:34:49 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id ay18so1685728pfb.2
        for <chrome-platform@lists.linux.dev>; Fri, 03 Mar 2023 06:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677854089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHVZ+VnNQY1VzPPlDo4RAP9i6Qbo3Pi6kDQ9LweBh7g=;
        b=kZ0gy0TVDYVpEyx5k1fBhAVMme5rXgg/SwT+VwriFqd/bnnTL0q+8vDp6ehCEg2aY6
         xelzU7n+xvy2CnzEIM1bUOfnR9xJ/KpPJodkmQtBBr8SDXcLEgw/PnBMBy5jUziK6O0s
         IPzeB+jIzMOp+jhYirvAYNkhS7ZPGea2ftW8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677854089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHVZ+VnNQY1VzPPlDo4RAP9i6Qbo3Pi6kDQ9LweBh7g=;
        b=A8cybAbCIOIok4HwlwUR6Q7OnBPHKknHuzoLsEiPzvp2TdSEG+LE8/hWC/aaMZuRPr
         IAqaJeJ9gEQFyiQ6LXsMzJNruLWuKA3Xe/ohKDfmNReufY2LUUovpmbyZrdXiXXUDvm7
         Jnxo1jFuHeKC7Wdipt42Zyt7YAl7n+G7S02QZqdqz9xerU9mpeDwb9kmRH8HdE8YN4/r
         cFm6LNbub3HVCWbXFOc3WDwef+haU77RtIrCtCMCF2XjpnC0kFCK66dZlxur7+5Tn67c
         jFKai14myn7yE4YdaHXkK/uRAn7KhExG8uB+iJ+1La2CEPr6JVarKtJw2/RlNQy1I1NT
         u73w==
X-Gm-Message-State: AO0yUKUrOIJvKeU+hFs34+PFa0NZMhUcoI4cjlJJPxZudPZnksyE85uX
	LfIjKNVYRkb3hJIcXfpFGFyQ4A==
X-Google-Smtp-Source: AK7set/Su9/qxF3FX+QXeLLKhYKjpjcqzHxNBx3i8bX87evueJgBJYEN/za47i65oUATzsME96OaTA==
X-Received: by 2002:a62:1882:0:b0:60d:461a:d03c with SMTP id 124-20020a621882000000b0060d461ad03cmr2228523pfy.27.1677854089079;
        Fri, 03 Mar 2023 06:34:49 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:55e5:8423:31ee:83dd])
        by smtp.gmail.com with ESMTPSA id c18-20020aa781d2000000b005a8b4dcd21asm1767214pfn.15.2023.03.03.06.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:34:48 -0800 (PST)
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
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Vasut <marex@denx.de>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	devicetree@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-acpi@vger.kernel.org
Subject: [PATCH v13 09/10] drm/bridge: it6505: Fix Kconfig indentation
Date: Fri,  3 Mar 2023 22:33:49 +0800
Message-Id: <20230303143350.815623-10-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230303143350.815623-1-treapking@chromium.org>
References: <20230303143350.815623-1-treapking@chromium.org>
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
2.40.0.rc0.216.gc4246ad0f0-goog

