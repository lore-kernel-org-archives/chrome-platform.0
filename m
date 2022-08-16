Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFAD6AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:49:08 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so150142pjl.0
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=G5Rnb6R8LxrH04YqlaaVs3BAEfiQZLlmAn5liFR/QWA=;
        b=I/IJRn+koVhgGmLgv0+RCQtbGiYLzzyOKPB7K2UgOM1X5/GwPfuMEJDfiHpVNAzIUS
         ykcuQrcS2DUhLhR4Jsa33ZkItMFbpRlzSSZFBM+UuuFyDsAY1EPgTx/qv09muzAgbNri
         haJSMhPDL1lP+INBfkZTf3t/QBmtpwJsWJJN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=G5Rnb6R8LxrH04YqlaaVs3BAEfiQZLlmAn5liFR/QWA=;
        b=OSM4tsPr7p8vds8QakweZ9YPWYf1bJybJCOBOKbo4JUfhpOROm95C/8D8Qa/CqQqYn
         yu2rtQVojhE6N76ejiUFVTQJlr0BSnT6zfgRgfCPe6C4XwuZa4TTTRSCmenJISFsh7+u
         DcGw9GYlV+7qdCWIw7qRA2Bg2JKqXGoM9TTDoNuJtIPKT54i6Wtpm+1bs5NOqMbKOcLm
         8MRot/moUydwruceiteKaPjgjEc96h0MQrsJGHbFx+GgDzEygqmealkHpwblkBApQ95U
         B3fU8hEmPG0VCE3Vqd2IiWkHvRRpa4doGybNwf3Fzr28kbhJunrOS9cQv5zBCLrx+OVm
         GPBA==
X-Gm-Message-State: ACgBeo373jX5WQNCN0pksYPreG08/gGyIOrjDmNT3iXwEa5DS33KePm0
	RKgjZCDYewd+nW62N2PMa0brVQ==
X-Google-Smtp-Source: AA6agR5pEws2IIXWnpsQhLgSr3fcNjIB9/QGDFB71vQ4i3WuDxmMpibaAxbriYPENctF/SPnw3d7rA==
X-Received: by 2002:a17:90b:3b8a:b0:1f5:1df2:1fff with SMTP id pc10-20020a17090b3b8a00b001f51df21fffmr570148pjb.169.1660686547767;
        Tue, 16 Aug 2022 14:49:07 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b005323a1a9fecsm8916650pfz.101.2022.08.16.14.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:49:07 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v6 0/7] platform/chrome: Type-C switch driver
Date: Tue, 16 Aug 2022 21:48:28 +0000
Message-Id: <20220816214857.2088914-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4 of this series was originally merged to the USB maintainer tree, but
there were dependencies from the chrome-platform tree which caused
conflicts in the merge tree, so the chrome specific parts were
reverted [1].

v5 is a resubmission of the series with the Chrome-only parts (since the
USB framework parts were merged successfully).

[1] https://lore.kernel.org/lkml/YtadE201j+dt5jJx@kroah.com/

Original cover letter (with parts relating to USB patches removed):

This series introduces a retimer class to the USB Type-C framework,
It also introduces a ChromeOS EC (Embedded Controller) switch driver which
registers the aforementioned retimer switches as well as mode-switches.

v5: https://lore.kernel.org/chrome-platform/20220815063555.1384505-1-pmalani@chromium.org/

Changes in v6:
- Changed "Chrome OS" to "ChromeOS" and "Type C" to "Type-C" in various
  commit messages and comments.
- Added Reviewed-by tags received in v5.
- Fit some cros_ec_cmd() calls into 1 line (Patch 3/7 and patch 4/7).
- Inlined struct initialization (Patch 3/7).
- Use device_property_present (Patch 5/7).
- Misc. other minor cleanup.

Prashant Malani (7):
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
 drivers/platform/chrome/cros_typec_switch.c   | 327 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  18 +
 6 files changed, 401 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_switch.c

-- 
2.37.1.595.g718a3a8f04-goog

