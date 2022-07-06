Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8533258B
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:16:13 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 23so14497255pgc.8
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pWXRp5NIoHyhpRcNJ8PbAa5aXIlOP8l12Bd4AXe9kl8=;
        b=aqRws9t920RS++2cRfQdhRuZqu/9tP3h3Gm9Q372N5Mb9rqUvb1V6aNHOQHnvsdpF+
         +rian41fTpmSnWlLJ+kEBQ238DR/gvKkfVdawPUA8zI2YmZRaQPI8IvCp9WnU3RP1u/s
         IBKR0p0BOh8GiiXuW+hHREqlCSwiRtqxTAEc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pWXRp5NIoHyhpRcNJ8PbAa5aXIlOP8l12Bd4AXe9kl8=;
        b=FaXmk7V9NDhNVK9dy3rLiEJDFFsAjqIa1QhcppbyOaJloLfdbmN7ALnDZV+5CLLEsq
         YB/cBIz3AC+D5DusVk9H7lmz1xOT/rX/04qH8yn8AlUFXUk8AMpBwjwkVWQ1aK3RumSG
         s42Gdn9oHKSUC7/VI7ReKbHuZvo9k0ppz/1Q2+2ad7O6d2Qg6PbeaJGY+tFe/07ptEk2
         P4/ta8q3BU056/mpKmqzNM/V+jq3PYNmdqTc6BcBrUL9UspXIMy/Hs7/7AFlysBHHDPT
         EbQbgagApyq9s5o7IPB0duTc5D29SR7zJZ9PT2jYqCQk3fz6u8BAP0bYc9Y96NpPOSk4
         jz0w==
X-Gm-Message-State: AJIora+yOrBpnb1O/4MJ5VWfGIrzWH+xWTzhBIb3AGiCaRBMFULVpHyd
	leDHSoFu0NUdcePxwGG/SFc+xg==
X-Google-Smtp-Source: AGRyM1tG3SsP+RFG7E3/NDUcbQK96rM/ehX0lO+/jKnmPnExRWXzRxoUIUmY/e4pLxxS4Ckpls1B3g==
X-Received: by 2002:a63:914a:0:b0:40c:f778:9bf with SMTP id l71-20020a63914a000000b0040cf77809bfmr34337527pge.526.1657127773124;
        Wed, 06 Jul 2022 10:16:13 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:16:12 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 0/9] platform/chrome: Type-C switch driver and Type-C framework updates
Date: Wed,  6 Jul 2022 17:15:04 +0000
Message-Id: <20220706171601.807042-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a retimer class to the USB Type-C framework,
It also introduces a Chrome EC (Embedded Controller) switch driver which
registers the aforementioned retimer switches as well as mode-switches.

Patch 1 and 2 introduce the retimer class and associated functions to
the Type-C common code.

Patches 3-7 add the cros-typec-switch driver

Patches 8-9 update cros-ec-typec to get and use retimer switch handles

Submission suggestion (as always, open to better suggestions):
- Patch 1 and 2 can go through the USB repo.
- Patch 3-9 can go through the chrome-platform repo. Since they depend
  on patches 1 and 2, we can create an "topic branch" off of usb-next
  once Patch 1 and 2 are submitted, and then apply Patches 3-9 on top
  of that "topic branch" before merging it back into chrome-platform's
  for-next branch


v1: https://lore.kernel.org/linux-usb/20220629233314.3540377-1-pmalani@chromium.org/

Changes since v1:
- Changed class name and retimer device type name, and fixed
  retimer reference release issue.

Prashant Malani (9):
  usb: typec: Add support for retimers
  usb: typec: Add retimer handle to port
  platform/chrome: Add Type-C mux set command definitions
  platform/chrome: cros_typec_switch: Add switch driver
  platform/chrome: cros_typec_switch: Set EC retimer
  platform/chrome: cros_typec_switch: Add event check
  platform/chrome: cros_typec_switch: Register mode switches
  platform/chrome: cros_ec_typec: Cleanup switch handle return paths
  platform/chrome: cros_ec_typec: Get retimer handle

 MAINTAINERS                                   |   1 +
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_typec.c       |  50 ++-
 drivers/platform/chrome/cros_typec_switch.c   | 332 ++++++++++++++++++
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/class.c                     |  18 +-
 drivers/usb/typec/class.h                     |   2 +
 drivers/usb/typec/retimer.c                   | 168 +++++++++
 drivers/usb/typec/retimer.h                   |  15 +
 .../linux/platform_data/cros_ec_commands.h    |  18 +
 include/linux/usb/typec_retimer.h             |  45 +++
 12 files changed, 654 insertions(+), 9 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_switch.c
 create mode 100644 drivers/usb/typec/retimer.c
 create mode 100644 drivers/usb/typec/retimer.h
 create mode 100644 include/linux/usb/typec_retimer.h

-- 
2.37.0.rc0.161.g10f37bed90-goog

