Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250B8494
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 13:25:08 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id n4so39345987plp.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 05:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxRM/PCoOCxDf+zsytCKmU4ar/OZ2A7GqXtbsl7nte4=;
        b=J0VS7WLui1zCpCt2/h/AV4qwwcWX4Ce+bWuaMZNr6hYadpnsDAvbTmKUBFUGwxAuTJ
         TI7FvXyJAJPWbAQ03/TMOXgL1I1i0ksXa02E2QYNrrYUlCv7rekBy6fxO6tCCUa3xflW
         8Z4j08Z3orLIYWK2iiS1r/rIKHIBgBcc8mytA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxRM/PCoOCxDf+zsytCKmU4ar/OZ2A7GqXtbsl7nte4=;
        b=EbFJvs4YEiEmmooQxdJAk0qxnJOuj3NgsvcjFHV+JVqbJCVHSsk6NM8tVEwEp0wu99
         wE/94dHVs9QzKlYGZV5FNsSL+GRgHZrn+kZZC/M8FVRcBMSxmMhe9foAbkrwyFuIJGiv
         W2nVBVYgvkVjkXEUANw0De1SR8RLcCTP5zn3sOxTHZPymyfvjFQlJUlskcPPvqcwyl1Y
         AmK29QHwPwGveYKd4y197aq4OQ+YZWFQCHh7B/6ED4+p/1Kzyz3v7+ySeIunp6r5AteD
         rBfLG16lJw5YR5vr3dBZPxE03nsuoAETbibvcDMFmm7H/ox+fgFU5x4ZSLwu1jtKpbho
         8/pA==
X-Gm-Message-State: AFqh2kp9xWa93guxBlkZh/h9sq+H9BzMT7RV5oi6oS+QIudW/Z6nqe9C
	jWJPviyY+3nYkp2Rl6HBfVOzsg==
X-Google-Smtp-Source: AMrXdXsQia60q0Zhur9CIcLXBe2nO5mPw3xotOjEFHrq2DMxW23y1J9lLv38iY3I4QPCkh9I1Y7wbw==
X-Received: by 2002:a17:90a:b298:b0:226:b6e9:cd39 with SMTP id c24-20020a17090ab29800b00226b6e9cd39mr5636605pjr.11.1672925108388;
        Thu, 05 Jan 2023 05:25:08 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7a61:eb85:2e3:2bd0])
        by smtp.gmail.com with ESMTPSA id gk22-20020a17090b119600b00225e670e4c7sm1372682pjb.35.2023.01.05.05.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:25:08 -0800 (PST)
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Xin Ji <xji@analogixsemi.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-kernel@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>,
	linux-acpi@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Imre Deak <imre.deak@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH v7 0/9] Register Type-C mode-switch in DP bridge endpoints
Date: Thu,  5 Jan 2023 21:24:48 +0800
Message-Id: <20230105132457.4125372-1-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This series introduces bindings for anx7625/it6505 to register Type-C
mode-switch in their output endpoints, and use data-lanes property to
describe the pin connections.

The first two patch modifies fwnode_graph_devcon_matches and
cros_typec_init_ports to enable the registration of the switches.

Patch 4~6 introduce the bindings for anx7625 and the corresponding driver
modifications.

Patch 7~9 add similar bindings and driver changes for it6505.

v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromium.org/
v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/

Changes in v7:
- Fix the long comment lines
- Extracted the common codes to a helper function
- Fixed style issues in anx7625 driver
- Removed DT property validation in anx7625 driver.
- Fixed style issues in it6505 driver
- Removed the redundant sleep in it6505 driver
- Removed DT property validation in it6505 driver
- Rebased to drm-misc-next
- Fixed indentations in bindings patches
- Added a new patch to fix indentations in Kconfig

Changes in v6:
- Changed it6505_typec_mux_set callback function to accommodate with
  the latest drm-misc patches
- Changed the driver implementation to accommodate with the new binding
- Dropped typec-switch binding and use endpoints and data-lanes properties
  to describe the pin connections
- Added new patches (patch 1,2,4) to fix probing issues
- Changed the bindings of it6505/anx7625 and modified the drivers
  accordingly
- Merged it6505/anx7625 driver changes into a single patch

Pin-yen Lin (7):
  drm/display: Add Type-C switch helpers
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Check for Type-C during panel registration
  drm/bridge: anx7625: Register Type C mode switches
  dt/bindings: drm/bridge: it6505: Add mode-switch support
  drm/bridge: it6505: Fix Kconfig indentation
  drm/bridge: it6505: Register Type C mode switches

Prashant Malani (2):
  device property: Add remote endpoint to devcon matcher
  platform/chrome: cros_ec_typec: Purge blocking switch devlinks

 .../display/bridge/analogix,anx7625.yaml      | 101 +++++++++++++-
 .../bindings/display/bridge/ite,it6505.yaml   |  95 +++++++++++--
 drivers/base/property.c                       |  15 ++
 drivers/gpu/drm/bridge/Kconfig                |  21 +--
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 101 +++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  13 ++
 drivers/gpu/drm/bridge/ite-it6505.c           | 119 +++++++++++++++-
 drivers/gpu/drm/display/drm_dp_helper.c       | 132 ++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.c       |  10 ++
 include/drm/display/drm_dp_helper.h           |  16 +++
 11 files changed, 595 insertions(+), 29 deletions(-)

-- 
2.39.0.314.g84b9a713c41-goog

