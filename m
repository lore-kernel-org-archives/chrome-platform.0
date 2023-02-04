Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DEF23A9
	for <chrome-platform@lists.linux.dev>; Sat,  4 Feb 2023 13:31:41 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id t17so5571264pfj.0
        for <chrome-platform@lists.linux.dev>; Sat, 04 Feb 2023 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJHNnZjhyF9xP9t2anATW0hxAaKdfiKK9SSVPi+BG58=;
        b=RllsiPfUAZgN/YqUZ0I2+ghL8fV8veiD/KenKwqa9wFIY+XBFrzUDV7HjGqouhkbpc
         EQpLJHQtc2E6qAlaaKgmXBES8WdWpLXsSv9SSWR08yTlzhmx1Jf/6dBLG9f6yJ5cf6e4
         zibK6Rzk7xMcx+7epK/EzNXW3u2hJTOtnLc+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJHNnZjhyF9xP9t2anATW0hxAaKdfiKK9SSVPi+BG58=;
        b=AdiNrjXIo8GPLGONBeU7tXeJFeH6P8ws9CNSqQDl/Mf2AteP+9BDzB8LCZ+VEYLo7o
         F+GzaIijsgf73hwrFoCDp5/wSq2IOSB9i9NZJqak+9+rPhTUpJP6fnZWs32aDFTqfUhX
         /spq+O5279pMaLoLJ7j6vDkGUooMTpobmuMs+t3QxImkLzV/QV8TAq+Whbx10pwgluHg
         ULQ7ycOxzyAG+iR5j7li/gBIbQ2hPr4gLxHQcvH5IfG15Nqr1sq9s/ZI8SAVEaRi39n/
         ImXe+o/DQr5pAEkkPSP1ehtXMQWIeIEX2jQp5H/KCbdeWX8P9mEERkpnvkHqKieYyV2a
         usFA==
X-Gm-Message-State: AO0yUKUwe41o4D5LlwuEpeIF9nUU/tabqjAL+CxbcmB4FMye4tkoSTsb
	WPXmGvtreir5rct3GLxMJmyzMA==
X-Google-Smtp-Source: AK7set9qV3tVb6Wvb08ArkIYSv0QgI48jRd4FWDCy3A/7jgeGh3bAAtFFz45vVCuuiH+t10ceDEvvg==
X-Received: by 2002:a62:1541:0:b0:590:70e0:c6a9 with SMTP id 62-20020a621541000000b0059070e0c6a9mr12602932pfv.32.1675517500923;
        Sat, 04 Feb 2023 05:31:40 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
        by smtp.gmail.com with ESMTPSA id 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 05:31:40 -0800 (PST)
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
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Allen Chen <allen.chen@ite.com.tw>,
	Lyude Paul <lyude@redhat.com>,
	linux-acpi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Xin Ji <xji@analogixsemi.com>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v11 8/9] drm/bridge: it6505: Fix Kconfig indentation
Date: Sat,  4 Feb 2023 21:30:39 +0800
Message-Id: <20230204133040.1236799-9-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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
index 8b2226f72b24..46c35d34bd4f 100644
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
2.39.1.519.gcb327c4b5f-goog

