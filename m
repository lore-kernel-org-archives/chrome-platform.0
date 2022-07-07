Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0AC2F2B
	for <chrome-platform@lists.linux.dev>; Thu,  7 Jul 2022 22:20:53 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so149780pjr.4
        for <chrome-platform@lists.linux.dev>; Thu, 07 Jul 2022 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQsjAc0YQIb9NGXs3HwZPWuZRhoPR+NwcjVw3jJIBFQ=;
        b=XbKmDZy/WMqhyN9B6r1DiEk/QAbsScJ+CPdadwH6TXX4GDj1u7aiAI7fl26RJaYYGQ
         FV81cwccRYv5EVCLSxS0nmWI5PSdob23rpAO9QjAZG+FRRv7VHpQUaS4dPfx7Hb4IS1O
         tUG6Ya1zI60mw6iAXPx15Eus8qh9MgnPMjvTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQsjAc0YQIb9NGXs3HwZPWuZRhoPR+NwcjVw3jJIBFQ=;
        b=AiPRF2PCBTCDp/sJ89PhvZM3oXv0JvUetHAMIzQondaRGDL+xMaumj/tbDdGAmd2q/
         AsO2YkSPT3EBJa4utfOnWt1T5VygneY79s8oE4xEdZWAGJ1nc1ZZrW8h/sTT7SwKr6d/
         CIRkGTvOSG8VOYo4ycKDGBwcuSdUccwNGQMgcE3DPvf7+8hJsQMOAR7QXPVYD0Rxffw/
         U84kAHqsakD6xchlL9wEuOjznjTETyAx/U1o7VhAWtzQZuYhyx/PYVsvlQG2f5XaZkDe
         j5Z/Jq4IKx1tvy8ttWiNYDpzImvcxPJtfQdZyeGOzfF2KFFBLcoW4V5/kQJIptGRzsDk
         9ehA==
X-Gm-Message-State: AJIora+aY8yDHiFlnjc/jC9T3tV+R76PV/yrj/mZTGlWo0u8DJPOglcB
	5zNgeI/8pL6egKwxSNG6oGxpTA==
X-Google-Smtp-Source: AGRyM1sjFfRCrP/YQPVZOHPRuRcIuvCoR1wzUjn4/i2bvcYMaksJCxhurBqN4qfLnF4xhiqZEw68pA==
X-Received: by 2002:a17:90b:4f48:b0:1ef:8ed0:df4d with SMTP id pj8-20020a17090b4f4800b001ef8ed0df4dmr7617959pjb.224.1657232452829;
        Thu, 07 Jul 2022 15:20:52 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 66-20020a620445000000b005289bfcee91sm5545657pfe.59.2022.07.07.15.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:20:52 -0700 (PDT)
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v3 0/9] Type-C switch driver and Type-C framework updates
Date: Thu,  7 Jul 2022 22:20:07 +0000
Message-Id: <20220707222045.1415417-1-pmalani@chromium.org>
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

Patches 3-7 add the cros-typec-switch driver.

Patches 8-9 update cros-ec-typec to get and use retimer switch handles.

Submission suggestion (as always, open to better suggestions):
- Patch 1 and 2 can go through the USB repo.
- Patch 3-9 can go through the chrome-platform repo. Since they depend
  on patches 1 and 2, we can create an "topic branch" off of usb-next
  once Patch 1 and 2 are submitted, and then apply Patches 3-9 on top
  of that "topic branch" before merging it back into chrome-platform's
  for-next branch

v2: https://lore.kernel.org/linux-usb/20220706171601.807042-1-pmalani@chromium.org/

Changes since v2:
- Fixed missing "static" declarations, and removed newlines from
  function signatures.

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

