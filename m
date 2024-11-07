Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F1215C43
	for <chrome-platform@lists.linux.dev>; Thu,  7 Nov 2024 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007895; cv=none; b=EUkRK2O6PYdYmXJBA8LrwrZbOExL2C/gHvtyWYIWtmsd8k5s2v4UiHK1RW3gtIK2O82VVu4iC2tUhkGWWhgJWiLS50ZOzd5YTdgqDahIqtX9peSlCQsYyCW3+B2N+RYLOIsLLTrGxGQWm3ESEhWsWVgTtIcenXRds+uth6CnsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007895; c=relaxed/simple;
	bh=FhVtDKAHLNobaF3Xr7MJKIpcbXekOH7CtAljMKvTH6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liropENwASLAFJyhgQO1HUIRJCBC2MUGrhlSXU3uZCWHcsrKMS+aWhhU8DOcZax6eUcRw0N4qVWiCPn5NB28tEe2esSq8iPfj//jufNP/2ABxJbYN1LikctzRaStW8LSV9V84xu0TP3zecodh0W9I2orKTkX5gD5Z34OnlwqW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UAScp+5M; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UAScp+5M"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so998482a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 07 Nov 2024 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007893; x=1731612693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbvSClt+dAXUM1kgWg8I5q9vyT6fSjbN1Ij//6r0NEI=;
        b=UAScp+5MID8dQtbunXyVsqCxbwVYZwWJSI6roJNWQ+qCMXb7sIpKmfw4YL0wq9EJFF
         /Uyt8tnAFHaOf7i5mQpRq5x333cYYX8nTtFc2rWyWNsGUWBtz/1qpmjm8A/6suTNEbSD
         dP8xJteRTD06iHH/7H8y06tM/ppIFTq960V+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007893; x=1731612693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbvSClt+dAXUM1kgWg8I5q9vyT6fSjbN1Ij//6r0NEI=;
        b=SVCknir6OcDvvdS4esTVYyf+5zidPysWVDb4uz6Mye9XVaIdKdnvsiRscd8l/9ZEQN
         0x6KaeYRqM6QVgYr6bdw2LHMmLnyExyf/1Fr4EDCUl0ChfisBoAmKjpWzO49QezGVVAE
         74zQu4L2fltijaSxHi1wN46Cmu2sQJ5PIFUy10C5a4Wbuw0bgy5sW2d3I8sliko6mSdk
         3DzxdRiKSP3lHWz0z1fv2V+WbrJ015y0JGyQ37Y9WGGW0F8CQnUFMZi36zROmCNH4McE
         y2VkV21qoO61U/hgCEOngcbj2D+ZY57WcLAJ7yJK2wUEJXUaKrehPG8//m4rRV+bF/oH
         6Qiw==
X-Forwarded-Encrypted: i=1; AJvYcCUBvmhmB0FJRkgA6NVKPWbuRSp/pcGxEsyZXIURgQS2/KACjM1aS3hA1uOr8Osl+OMkl3JOKOJWxtKklubB5Do=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBN8MtB/VyrUTn0D02BrPSIGYWGoPBVNZYo2OsgkTfvHvP0zg5
	qRJqFoFqyYOUA3H2tZGx5+cF6j9Y41zTG3B5TR/zvI9M9uXLsIOoW2jcEhjumA==
X-Google-Smtp-Source: AGHT+IEbLiBW3PaYgjufhiOm00mstGi5fV/4ArJUPxEYJmyYx8kjZqmIWOQFXW/GQR4cVKjQcYgHcw==
X-Received: by 2002:a17:90a:e7cb:b0:2e2:e8fc:e0dd with SMTP id 98e67ed59e1d1-2e9b1748ba3mr394578a91.35.1731007892871;
        Thu, 07 Nov 2024 11:31:32 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e9a5f8f4e2sm2071802a91.26.2024.11.07.11.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:32 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] Thunderbolt and DP altmode support for cros-ec-typec
Date: Thu,  7 Nov 2024 11:29:53 -0800
Message-ID: <20241107193021.2690050-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Heikki, Tzung-Bi et al,

This patch series adds support for alternate mode entry for the
cros-ec-typec driver for Displayport and Thunderbolt.

Thunderbolt support is added by adapting an RFC Heikki had posted
previously:

https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/

A few comments on the series:

* The cros-ec interface will not accept any VDOs/VDMs so we simply
  ignore any configurations we are passed (i.e. DPConfigure). This means
  the sysfs control of DP lanes won't work.
* ChromeOS has two modes of operation for alt-modes: entirely EC driven
  or AP-driven from userspace (via the typec daemon). Thus, we don't
  expect the kernel alt-mode drivers to auto-enter modes in all cases.
  This series allows auto-enter for displayport but disables it for TBT
  for this reason.

This was tested with a ChromeOS Brya device using kernel 6.6 and built
with allmodconfig for linux-usb.

Thanks,
Abhishek

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series
- Revert rename of TYPEC_TBT_MODE
- Remove mode from typec_device_id
- Use port.active instead of introducing auto-enter field
- Introduce inactive field to typec_altmode_desc to set default value
  for active.
- Always make port 'active' field writable
- Refactored typec_altmode_dp_data per review request
- Removed unused vdm operations during altmode registration
- Fix usage of TBT sid and mode.
- Removed unused vdm operations during altmode registration
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match
- Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
- Pass struct typec_thunderbolt_data to typec_altmode_notify
- Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
- Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
- Change module license to GPL due to checkpatch warning
- Refactored displayport into cros_typec_altmode.c to extract common
  implementation between altmodes
- Refactored thunderbolt support into cros_typec_altmode.c
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

Abhishek Pandit-Subedi (6):
  usb: typec: Only use SVID for matching altmodes
  usb: typec: Check port is active before enter mode on probe
  platform/chrome: cros_ec_typec: Update partner altmode active
  platform/chrome: cros_ec_typec: Displayport support
  platform/chrome: cros_ec_typec: Thunderbolt support
  platform/chrome: cros_ec_typec: Disable tbt on port

Heikki Krogerus (1):
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 MAINTAINERS                                  |   3 +
 drivers/platform/chrome/Makefile             |   7 +
 drivers/platform/chrome/cros_ec_typec.c      |  47 ++-
 drivers/platform/chrome/cros_ec_typec.h      |   1 +
 drivers/platform/chrome/cros_typec_altmode.c | 360 +++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  48 +++
 drivers/usb/typec/altmodes/Kconfig           |   9 +
 drivers/usb/typec/altmodes/Makefile          |   2 +
 drivers/usb/typec/altmodes/displayport.c     |   9 +-
 drivers/usb/typec/altmodes/nvidia.c          |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c     | 312 ++++++++++++++++
 drivers/usb/typec/bus.c                      |   6 +-
 drivers/usb/typec/class.c                    |   9 +-
 include/linux/usb/typec.h                    |   2 +
 include/linux/usb/typec_tbt.h                |   1 +
 scripts/mod/devicetable-offsets.c            |   1 -
 scripts/mod/file2alias.c                     |   4 +-
 17 files changed, 793 insertions(+), 30 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.c
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.47.0.277.g8800431eea-goog

