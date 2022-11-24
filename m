Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043C23D1
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 10:21:07 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so4730567pjc.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKDzMB5fuyIKOWGUg1teGVMCu3uNeoCRybEoMSGH3XM=;
        b=AZ3ZiaNlTyWkDUA3AI6svtb7rNC4BSHFotUOkJax3CQ3W7X+Ri6AW6gPdCYMn6OXDj
         bIUJV4AnSunad2r4qQRf0bx5RJTEsVr8xljQHzTGajNbFsLC7LmAezam+ue5ZfUvmCQc
         dWJADcKv3hAuRK6JnoUcCq1fXOh1lRnhdofME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKDzMB5fuyIKOWGUg1teGVMCu3uNeoCRybEoMSGH3XM=;
        b=SFgUoabhNMSQOIzGdObzhYf9Ru7ZoNK5GG7r/ukiaUhk9HHdE290Dp8L/kE+G5g4LK
         oKdMEyKtI6KTg7jHsMvxBGKM1RyjX5KRpMWuELLBs/nbWly7teX0bbhuGqqiFeIqVy14
         pBpAQiJ9ok3Hc5seix8IsNyLyfJgSHwwVSxs5SKuKJCTKkviOiTO6h/nxJeINSrN84u0
         UnkrMqjwGpT6bLGWxkHgfyG5DGeAJKM/AeSI0v6sPHG8gvtK3dvt7N1z3sdnl12icRoM
         r/gwQcGos/33OnowTxIcVuKJpMHUOJN+hl7fKDcLh0m0H4NqNoiTvIGVQBcwv1ANNUU1
         r0Zw==
X-Gm-Message-State: ANoB5pkr2lrKpsRXcaN4M+4Kg2UDfK4uEQrWQn2iXZ+hA43ZwqdPbqRa
	4lAVx2ePAIsLNzyGygyVnSCErQ==
X-Google-Smtp-Source: AA0mqf7uce32MDEk2weA/QnGkYpN+4bihhCWnMXDkXgQE9HqR2K528a00R4+x8rxcAwAjBLzeizP7g==
X-Received: by 2002:a17:90b:2341:b0:218:a506:4fdb with SMTP id ms1-20020a17090b234100b00218a5064fdbmr21682953pjb.207.1669285266760;
        Thu, 24 Nov 2022 02:21:06 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d446:708:8556:dfee])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:21:06 -0800 (PST)
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Stephen Boyd <swboyd@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>
Subject: [PATCH v6 0/7] Register Type-C mode-switch in DP bridge endpoints
Date: Thu, 24 Nov 2022 18:20:49 +0800
Message-Id: <20221124102056.393220-1-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
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

Patch 3~5 introduce the bindings for anx7625 and the corresponding driver
modifications.

Patch 6~7 add similar bindings and driver changes for it6505.

v5: https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/


Changes in v6:
- Dropped typec-switch binding and use endpoints and data-lanes properties
  to describe the pin connections
- Changed the driver implementation to accommodate with the new bindings
- Changed it6505_typec_mux_set callback function to accommodate with
  the latest drm-misc patches
- Added new patches (patch 1,2,4) to fix probing issues
- Merged it6505/anx7625 driver changes into a single patch

Pin-yen Lin (5):
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Check for Type-C during panel registration
  drm/bridge: anx7625: Register Type C mode switches
  dt/bindings: drm/bridge: it6505: Add mode-switch support
  drm/bridge: it6505: Register Type C mode switches

Prashant Malani (2):
  device property: Add remote endpoint to devcon matcher
  platform/chrome: cros_ec_typec: Purge blocking switch devlinks

 .../display/bridge/analogix,anx7625.yaml      |  73 ++++++-
 .../bindings/display/bridge/ite,it6505.yaml   |  94 +++++++-
 drivers/base/property.c                       |  15 ++
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 182 +++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 ++
 drivers/gpu/drm/bridge/ite-it6505.c           | 205 +++++++++++++++++-
 drivers/platform/chrome/cros_ec_typec.c       |   9 +
 9 files changed, 589 insertions(+), 11 deletions(-)

-- 
2.38.1.584.g0f3c55d4c2-goog

