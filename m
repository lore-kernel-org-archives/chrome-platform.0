Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6641C07
	for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 09:52:12 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso4360065pjb.5
        for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+ZwZOlvy1Ieyd+NawnN26j/EK/CvIkDa4Muyk3m0b0=;
        b=daZg1Pec7EJrMORTMITKYWij1J4BgliqjsZvb3TbYCCLcJJYZeZTMDf99ihvRH/kTf
         qxVIbEHtaec6WttYcZTg4c0AYs6bRMwz5JsRVbGRpthUOwl5yb6srFbp+pgjSrWwn4nv
         0rSdKxM9oSYymDaRhj4yMXFEWlGma1u8CDn2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+ZwZOlvy1Ieyd+NawnN26j/EK/CvIkDa4Muyk3m0b0=;
        b=jNGPHSuz2+PpkNEERQXnJ/7f9+E2DlOtbSWsv5yVtR/BX83KN/O4kksmbcERyffclE
         n6KaoqAFElcBxwvmcIEaDdi7nOkDG8RvJxohNTZN+N2EpcZyqkQn4r928Pu9TqSzszUT
         a1chppF8va3WHNXiQyjObHIIm8kbeG5E2lWVH/yzCAcTab0xxSJKseQ7sIb9WZayf9SY
         bRxEvnSksLlk1Zfm5bdZNJxNlDBmySCaZTJ+5gBzlwi/0tsBdvVEWgAdpgYlY+7ko7Dk
         r5XUTppGFb6Z0hifG4C5+yHbXRRAnghrsw+C2jFPnqMfxzARN/MfaXL041Vftg2xhdLv
         zMIw==
X-Gm-Message-State: AO0yUKUGuPeg173yHQ9ki+UigTfJlXobw/UBP5Kwh+LmiDa55yyFei0U
	ZVZEWpXb5lM5gkmQA5XLy1RTEw==
X-Google-Smtp-Source: AK7set8HfGPAaKpQmAs84raUeV4ejCG0h7+PitATt7AQBNDfQ8PcDz5YsTFC935Sjmq3p9k0M4//0g==
X-Received: by 2002:a05:6a20:429a:b0:c0:c9b8:64 with SMTP id o26-20020a056a20429a00b000c0c9b80064mr5162345pzj.17.1676973131621;
        Tue, 21 Feb 2023 01:52:11 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:a1f5:f58d:584e:5906])
        by smtp.gmail.com with ESMTPSA id t25-20020a656099000000b004eca54eab50sm3524918pgu.28.2023.02.21.01.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:52:11 -0800 (PST)
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
Cc: Pin-yen Lin <treapking@chromium.org>,
	linux-kernel@vger.kernel.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	chrome-platform@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-acpi@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v12 09/10] drm/bridge: it6505: Fix Kconfig indentation
Date: Tue, 21 Feb 2023 17:50:53 +0800
Message-Id: <20230221095054.1868277-10-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230221095054.1868277-1-treapking@chromium.org>
References: <20230221095054.1868277-1-treapking@chromium.org>
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
2.39.2.637.g21b0678d19-goog

