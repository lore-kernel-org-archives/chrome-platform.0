Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98C15B2
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:41:10 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so12059924pjj.2
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 00:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvDWZHQwpvKie5C72tGHmAQ6sZfv8YroynlOrleElYk=;
        b=U24SMwym4XO5a1DuvKl8w7srmqMZqB9kJ/2YqYdY0KrTcoWwAq0icIAmJoi3Mw+jwn
         S9j79AshfjXLOjx45XxwEmpSg4Hq5w6j5NOD89pUlCLsyRfSK0UYpb8f7YpTeGkBwVti
         2zqPAE1L1ZtNfT7WR+UoRMBOt5y2qujMyqd6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvDWZHQwpvKie5C72tGHmAQ6sZfv8YroynlOrleElYk=;
        b=EeAbw1DfLm/QFDF11VqM1Js7Egrc5J8qXATsGZIUuNM2ptHMeajhctW08p7u9WpJUG
         MAdoyYwWvpQhsm3dKM1UnNqC9bPH1+zxXZf9XMULgPVqOaSG7Z5J30wHK2Us1uETCvBZ
         NWa9tHhBdTdQgSA/uNf+JyOrb3xf82EGYXEc+PgK8eY8yIVmlf2V6MVIZ2W5wexs6XEg
         8jnQdTp39NvKfgDvlK7P4m3BtX1pmH5/5G0026Bj8iSzbh72eIYlLDTh/awJjqtcT6SJ
         7MLEQihWK2HESj+1WM6BDlflxJ54tEKOS4qNpx+tTT7HVBh8k8yrBhvGdoa1+3OQKENX
         J1hw==
X-Gm-Message-State: AFqh2korqFfJ/nDCshVHBGc1txNIxrx5YJgZan9UUOUXh1BqVqHQ/10z
	DlS1qhfEzdKQ4EDVnUdtOWwf6A==
X-Google-Smtp-Source: AMrXdXvErfWkTTqkYXqCcTRPhl3nuYAiOdO4pV5+GFG42BRyamfTFPV2hppmo1bSKtP/0yaUjMaeNQ==
X-Received: by 2002:a17:903:130b:b0:193:1a2a:d054 with SMTP id iy11-20020a170903130b00b001931a2ad054mr8581657plb.30.1673253670220;
        Mon, 09 Jan 2023 00:41:10 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:801:a736:715:9a15])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:41:09 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Imre Deak <imre.deak@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jim Cromie <jim.cromie@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v9 0/9] Register Type-C mode-switch in DP bridge endpoints
Date: Mon,  9 Jan 2023 16:40:52 +0800
Message-Id: <20230109084101.265664-1-treapking@chromium.org>
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

v7: https://lore.kernel.org/all/20230105132457.4125372-1-treapking@chromium.org/
v6: https://lore.kernel.org/all/20221124102056.393220-1-treapking@chromium.org/
v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/

Changes in v9:
- Collected Reviewed-by tag
- Fixed subject prefix again
- Changed the naming of the example node for it6505

Changes in v8:
- Fixed the build issue when CONFIG_TYPEC=m
- Fixed some style issues
- Fixed the subject prefixes for the bindings patch
- Fixed the bindings for data-lanes properties

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
  dt-bindings: display: bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Check for Type-C during panel registration
  drm/bridge: anx7625: Register Type C mode switches
  dt-bindings: display: bridge: it6505: Add mode-switch support
  drm/bridge: it6505: Fix Kconfig indentation
  drm/bridge: it6505: Register Type C mode switches

Prashant Malani (2):
  device property: Add remote endpoint to devcon matcher
  platform/chrome: cros_ec_typec: Purge blocking switch devlinks

 .../display/bridge/analogix,anx7625.yaml      |  99 ++++++++++++-
 .../bindings/display/bridge/ite,it6505.yaml   |  93 ++++++++++--
 drivers/base/property.c                       |  15 ++
 drivers/gpu/drm/bridge/Kconfig                |  21 +--
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 101 +++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  13 ++
 drivers/gpu/drm/bridge/ite-it6505.c           | 119 +++++++++++++++-
 drivers/gpu/drm/display/drm_dp_helper.c       | 132 ++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.c       |  10 ++
 include/drm/display/drm_dp_helper.h           |  16 +++
 11 files changed, 591 insertions(+), 29 deletions(-)

-- 
2.39.0.314.g84b9a713c41-goog

