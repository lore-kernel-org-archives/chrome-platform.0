Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C11420DD
	for <chrome-platform@lists.linux.dev>; Tue,  3 Sep 2024 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381040; cv=none; b=oKQvW5UyfdlT78GEHboKKWLvAAztvLNFcFWmaSumAZG7avvHZ1gQc+kNWF3rDZWMtZzhgXaxrpHRaGaej/u2NDFwQsxwWLTdIdlOCIIbI6NU4jxEVDcC1WddBIHDSRbzzYpEEpJ/nvCuz4Dsbtc1HMm13NgQ/sNnBvpIHg4ZgT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381040; c=relaxed/simple;
	bh=aFs9NPS8WCqwFZ1JxE68lfWCZWeMKzBWN/teIrkNEHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ERyfkrueAu/DcOV3cXGxx8vTcfosamagyDq4ISicWlr5NvSgjWfoO+t5xIR1q8IbUL0ur+dJNgWbhHePDLNJ3euCxrF6i8uDpimCHYfXCEiBaH5FnR5Ps7jANBJxK/+yx7bXEdjvEgIk8IOkCnzxjX2nUrwB3ceT7DOjWLOFkAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EnUB15Np; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EnUB15Np"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bf009cf4c0so5681202a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 03 Sep 2024 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381037; x=1725985837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQdB3z5uEVHYQyhOM9/l8a+1Ce1iJPI+CxBf8lACdy8=;
        b=EnUB15NpcLNuGs49c4XWQkDUZjgOKnPikbolA3M7n3yURpBszFaome489zM99UqmOh
         0XkKEMiWG1DA5vF+CN6ScSdSqTQbGxavHg8C7xPUDnCWz70t2olwiZyJE2LrsMO13Xoo
         HTmHaaDg7uhOMWHzU2vgTJM/JJo6OaxqP+6ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381037; x=1725985837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQdB3z5uEVHYQyhOM9/l8a+1Ce1iJPI+CxBf8lACdy8=;
        b=SsCvbhox+kpnDLeKi/Bo8h1wy40bNSA+MnAvZV83u8TW7D+V9fIx814gwT7R+yjZoD
         JN+xjhBh1t1ifV/mMUOBH0nTs8BNiSIKb8SJOWLMVCR7gCR+W9OzX6UjKyBbVXohnRI3
         WxX3v8hv3u7YMotest8n+GU54wEXcd8xt9zZvs43htTImXxwDK4XcOjZI4zFKIN23Wbv
         sLu+e0IW9xGhruTJbuab2Z0HkqKOu0e5V/NnWWKgYVxr7ukyP4tqar2bRk2HBYOKJzwt
         nilDoB2xYr0VnXLLyj5zFNRgPLPTTGuRFj6u8l20lje+n6miFPw7f5yIgUlylYQVCCGf
         LnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU585huTmbguzPEAA2ByE7yxFclVomuG3PCIRlDKHFX7bzHFoplA/YBru5s9QirILFVlQRGZKTKXI/WMlg2XNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy44/Kr712Mugycy6Qg6k/QnpVmuf1P5d93U7N8gF7huJY+Y+pV
	UIR550wTBg+AGPWhKd6/S0azt/6gLrq5x7FR1HcjQ7t1O7Tqa3m/cRmOBIfe
X-Google-Smtp-Source: AGHT+IFxMW+43lrpAPVQhSBnzxQQCxffpIliq+fv8lcta5kGrjCZiV+i9JKs91BkiAzgF+OD67RyCA==
X-Received: by 2002:a17:907:2d24:b0:a8a:1b59:59bc with SMTP id a640c23a62f3a-a8a32ed4f2cmr99476166b.31.1725381036746;
        Tue, 03 Sep 2024 09:30:36 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:36 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 0/8] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue,  3 Sep 2024 16:30:25 +0000
Message-ID: <20240903163033.3170815-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series implements a UCSI ChromeOS EC transport driver. 
The ChromeOS EC is expected to implement UCSI Platform Policy
Manager (PPM).

---
Changes in v5:
- Increased WRITE_TMO_MS to 5000.
- Replaced DRV_NAME with KBUILD_MODNAME.
- Added comments for WRITE_TMO_MS and MAX_EC_DATA_SIZE defines.
- Refactored cros_ucsi_async_control() to dynamically allocate memory
for a message to EC instead of allocating the message on stack.
- Replaced type names uint*_t with u*.
- Removed ret variable in cros_ucsi_work().
- Updated ucsi_operations interface to align with changes introduced in
  v6.11.
- Replaced test_bit() with test_and_clear_bit() in cros_ucsi_work().
- Added trace events in commit "usb: typec: cros_ec_ucsi: Add trace
  events".
- Added netlink in commit "usb: typec: cros_ec_ucsi: Add netlink"
for debugging and testing puropses. 
- Link to v4: https://lore.kernel.org/all/CAB2FV=6We88NrvN8NZYt8NkMFH9N_ZBGyUWVUpGwPdja2X_+NA@mail.gmail.com/T/

Changes in v4:
- Setup notifications before calling ucsi_register.
- Cancel work before destroying driver data.
- Link to v3: https://lore.kernel.org/r/20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org

Changes in v3:
- Moved driver from platform/chrome to usb/typec/ucsi.
- Used id_table instead of MODULE_ALIAS.
- Split EC header changes into seperate commit.
- Fixes from additional internal reviews and kernel bot warnings.
- Link to v2: https://lore.kernel.org/r/20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org

Changes in v2:
- No code or commit message changes.
- Added drivers/platform/chrome maintainers for review.
- Link to v1: https://lore.kernel.org/r/20240325-public-ucsi-h-v1-0-7c7e888edc0a@chromium.org

Abhishek Pandit-Subedi (2):
  usb: typec: cros_ec_ucsi: Use complete instead of resume
  mfd: cros_ec: Don't load charger with UCSI

Pavan Holla (4):
  platform/chrome: Update ChromeOS EC header for UCSI
  platform/chrome: Update EC feature flags
  usb: typec: ucsi: Implement ChromeOS UCSI driver
  mfd: cros_ec: Load cros_ec_ucsi on supported ECs

Łukasz Bartosik (2):
  usb: typec: cros_ec_ucsi: Add trace events
  usb: typec: cros_ec_ucsi: Add netlink

 MAINTAINERS                                   |  10 +
 drivers/mfd/cros_ec_dev.c                     |  25 +-
 drivers/usb/typec/ucsi/Kconfig                |  13 +
 drivers/usb/typec/ucsi/Makefile               |   3 +
 drivers/usb/typec/ucsi/cros_ec_ucsi_main.c    | 351 ++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c      |  87 +++++
 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h      |  52 +++
 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h   |  92 +++++
 .../linux/platform_data/cros_ec_commands.h    |  54 ++-
 9 files changed, 683 insertions(+), 4 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h

-- 
2.46.0.469.g59c65b2a67-goog

