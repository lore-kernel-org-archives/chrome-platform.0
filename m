Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A92571
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:41:58 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id q64so8017809pjq.4
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPjxduVrJWs9QjkeXTkdGS+Nv07pQY0+SOufeW3dySQ=;
        b=RpAYkJOfA9L7CmmwDu2y3RUT2VZ8BPL5S7CgOAobzmYDX14UbYITzBcCxSqCEKXaj8
         L43GAz9HivY57f1AvtG3stC1vtrvt3VmSV+IIvj01lMcS2zMnn+13OsuIuFOeBkKF42T
         2CtXmxRkIDsJ+Ehgy/Jpy7gs810xHFExVUPY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPjxduVrJWs9QjkeXTkdGS+Nv07pQY0+SOufeW3dySQ=;
        b=oNT8VYexX6pny9ohDhQN/SGZEcmGAjGDIeX9dVP4jmzLYebQ8Nv65moUorkvF6qL+2
         L24MuWjLb/3QIiPGYGQGVezrT8k+IPQPxLS6mF7Y8Ikq5Ror/s0X+qssA0rP84GP8l1+
         XfP87Gsju9ev7NQwZg1CBUXTPj77v8pmDEdL+1xJ07zRoE85td/4+/VFw7FyGKAH90AE
         H2dCL8i1BVruwuPErW8e83Ni26Pbg9km8rQYCXvpMLeeY3FZfR5s+RnK9ViYB6D0ylyY
         3MgRej1Bh/noGpHk4W9tbTToeO0iUvxbmH23TPpG/uAS2exKBAc8bFtc9gThRZxI92Sr
         UKnw==
X-Gm-Message-State: AFqh2kq0wk723fPGo/piTAy86Al5hLbDLUMX0nX4JH1slQU8xBLBeyDj
	HIbe0ayX+1nAQaciF/BasWsgfA==
X-Google-Smtp-Source: AMrXdXsJUMy5yGt4P7Kj0mESf07gcAEwmtyLrYjI8vTiLBeap/Oa8psGVn860Qyq/HogUPY4vUqZIQ==
X-Received: by 2002:a17:902:da83:b0:189:8425:730d with SMTP id j3-20020a170902da8300b001898425730dmr91679245plx.27.1673253717716;
        Mon, 09 Jan 2023 00:41:57 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:801:a736:715:9a15])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:41:57 -0800 (PST)
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
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xin Ji <xji@analogixsemi.com>,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Allen Chen <allen.chen@ite.com.tw>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/9] drm/bridge: it6505: Fix Kconfig indentation
Date: Mon,  9 Jan 2023 16:41:00 +0800
Message-Id: <20230109084101.265664-9-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230109084101.265664-1-treapking@chromium.org>
References: <20230109084101.265664-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the spaces with tab characters in the Kconfig file.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

(no changes since v7)

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

