Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B21376
	for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 07:23:38 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id c13so3726500pla.6
        for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEJ/hqMimN4a6BWdX8wrAtk4YGGTAOomy2QG8zFa0Sk=;
        b=JsBNDLxSiQKyWMztSLBCTECeA3K1onS/X+Stsxf7Hb//MaIFXVG2xcGNGgWHsbkwR8
         DcTU2AyCw7pBv1WZapTZq9nDE4n5r33uwAui5FNB7yGgBxD/rcjMot+dAN35rIl15hJT
         oO0f28H1G2AZyql3cE4wKDCUrGiyxPjRwErpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEJ/hqMimN4a6BWdX8wrAtk4YGGTAOomy2QG8zFa0Sk=;
        b=1Q+igGqDpryIlzX4S/V5h0jrbVVnoZuXxpb/h2a0jW8RlyIA29PbRfH1aNsUBb+Li+
         VQSb0X1ZGfGtOvDLDqkzFa2hAj43rpz53EugMAG3rywhXEy48OGZeaFdjaARZjy1b5Gf
         7ZDdJKkYcZyi1SHJJXRFsGAmM7A2zmsVsIVdYYRVwzEU46zRO+tv61gznRV7f32mjYMB
         RBAClHoQRTiO49xmq2xeiEnM6uxxEZkyrrRg2gNMZvJxjvZeZuBAB71RkKXNYc9V1uhd
         Ri/z6wyC3sYh9nwuh4+BqUMQg0OnQQqNtCnvQs3YeQ2S7dr18iN7Gs6Fv1k5BjiByo6m
         ItGg==
X-Gm-Message-State: AJIora/Tz6DQH1XQMxlsZaZ54ihOF2geeIhNPxRAKNp25/7bs2XnCUoy
	K3hbpLTq2jliG43yzQ3YmM4Pvw==
X-Google-Smtp-Source: AGRyM1u1WXLZ9QcxqwlVQlitWLXmlWLZbo7OYjJCN2WotXPOMB3vzYDRgczBBfFtt6CC997VjU8CVA==
X-Received: by 2002:a17:90b:1c12:b0:1f0:2836:7799 with SMTP id oc18-20020a17090b1c1200b001f028367799mr9190065pjb.139.1657524217972;
        Mon, 11 Jul 2022 00:23:37 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b0051bc5f4df1csm4012839pfq.154.2022.07.11.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:23:37 -0700 (PDT)
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
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
Date: Mon, 11 Jul 2022 07:22:54 +0000
Message-Id: <20220711072333.2064341-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
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

v3: https://lore.kernel.org/linux-usb/20220707222045.1415417-1-pmalani@chromium.org/

Changes since v3:
- Updated Commit message of Patch 1 to mention that no new
  class-specific sysfs files are being created.

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
2.37.0.144.g8ac04bfd2-goog

