Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B4F1102
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 06:36:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id o3so5652245ple.5
        for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fENEN34IT/T7O956m7l86FcgYrM9sywQ94rNqD2QyzE=;
        b=i98NnWxjozZ59t+dRaFmVAlXBybfgyFrZ5UnP4Yr7gkA/2bQ1+uLtDBF6WFexl6RqD
         2V582Wf1NmC7A2NYhywly4bif+z7sse3dbSdr1iTEN0AqrNGb6DRPQtKsaUFi0s96OBt
         0XV6q61uVbarfAPyAdAKtxxYhvTnuQpeIYGIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fENEN34IT/T7O956m7l86FcgYrM9sywQ94rNqD2QyzE=;
        b=QH7X/1qG2I7ny+QSTV7VBJQodCNuO8GwkLW3M6TyypKp2mnKuSVl+jIHUBxsskET10
         f0o2g4qC/OyF0cZiP5qd6toCBx68Fc0e03vqwXD7RLCrhTJyfgSPVps5GpHm1djpxTCn
         t9ZBN4OqMhW6+fy9l/Tm4CKSA9vOzO3sVf11CXkj9JJKdEvRjVrXz3vfYcJCetYHnflE
         gxeJpS3AZDldynqp3amx/QvjEs+fqhci2qOVewzHkJmrddyuARleoIOLHezLBR2181S+
         BeiJKQRT04ugw7VD5ZvJPRpBkyN9bg+EkVHxZM+RfijO0i0rU6ePHzBf6xAaPs5e52/a
         ZOUw==
X-Gm-Message-State: ACgBeo0MMGyK2ZB21HBWicc2gHJkf+yk8DiHN6cgQ/ysKCwFZhqDsGWE
	xAHbLftgcyGGA6z4gy4xxGhUuQ==
X-Google-Smtp-Source: AA6agR7t8Co7+xGl827bxRP0nRPyfmh8nLZeu8WhuAZ10rNRrS8iohPRVc/KY9hpwLfxLeXsxxLVMA==
X-Received: by 2002:a17:902:d551:b0:172:55a6:bd34 with SMTP id z17-20020a170902d55100b0017255a6bd34mr12173075plf.13.1660545416245;
        Sun, 14 Aug 2022 23:36:56 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id 200-20020a6214d1000000b0052db82ad8b2sm5988233pfu.123.2022.08.14.23.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:36:55 -0700 (PDT)
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
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH v5 0/7] platform/chrome: Type-C switch driver
Date: Mon, 15 Aug 2022 06:34:15 +0000
Message-Id: <20220815063555.1384505-1-pmalani@chromium.org>
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
It also introduces a Chrome EC (Embedded Controller) switch driver which
registers the aforementioned retimer switches as well as mode-switches.

v4: https://lore.kernel.org/linux-usb/20220711072333.2064341-1-pmalani@chromium.org/

Changes in v5:
- Removed first 2 patches for retimer class support, since those were
  merged in 5.20.
- Added missing ACPI Kconfig to Patch 2/7.
- Updated patches 3/7 and 4/7 to use new function name cros_ec_cmd().


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
 drivers/platform/chrome/cros_typec_switch.c   | 332 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  18 +
 6 files changed, 406 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_switch.c

-- 
2.37.1.595.g718a3a8f04-goog

