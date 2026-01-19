Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C36365A03
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828722; cv=none; b=AqLrGindk26BZH/HYuYTCwYWiEjuzCP7IvKzSZ7U2bfldOYoFi/VTeBcMopdLBYdO+TLNv3mfs+nH0CRO2Xhh4S161gHtWtDV/f2Q2kSq+vAcR8720a07vSo3ubdJctxikXEYiCdAmwcXt0E5+P920/SoWiY/gRNoCm9lq4ZzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828722; c=relaxed/simple;
	bh=mMG+Hn8BawRbQWK4kLNveOLJbx1FyWTF834qhx1Dno0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LAVcNYQIccwAlXpLbIHkGX+a3csEs1ptgniPxDGPIy3zhhRVCdnR7wG+ftN/JUIjHYDp5eeoRM+5qbUF2HvBwlcXja+doldzM7z0+wb55NSSmXrWLhpvhITWBt2eJ4fivaOqMdIGf/ElRE92DJ2FVTLSk3aAWnFVYyZWa8vBLsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HfxnBug/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HfxnBug/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso6722763a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828719; x=1769433519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRNnwiYKOAp913PL4zbruan81hvYhlt0XTNkvMtBRB0=;
        b=HfxnBug/VUBut3DQW4JcS+kAhMEwCYB/kOdUSroJIYcT8cat3qMuYXxTvpy9VhQccV
         ImLj1nezVgY2v2J8ZjMGOs7anKtrgUdTW146Cv8CzSiIloiIfs5Cuj6Cdx1xEp1JuXLM
         eN+qMU+dI7iaaUlh7VKcxTqrierk2DdSgAJr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828719; x=1769433519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRNnwiYKOAp913PL4zbruan81hvYhlt0XTNkvMtBRB0=;
        b=PNiDSg4DNLN0JTZZW54bRPotNbWjmXV5ZEbLrOzDyEszwmbuwnzVKO96Q0kBkRR/J1
         CruYJ5MZrtQZAke9Ok1CK9u/RS2+m3IWs99qgck4hOTFPSImjU4KTFbr61f8rcUziIzE
         l0dNL6lIEKWL9HZvlYuWd19yPVpymBDvgF/bIjEerCoDArD0+1fZN128k5UYxbXwLVtK
         FX+82ElrN1NMHhoVtcWDy6ucpH6X+GADS3JrvKZkwWQxQwB71HveKgl7E8zm2zmieDYz
         v/mlPeOXRx6Nr5O/d4UZpf9+MoMImN0NPgfRXXa5OXf2pKF77x8r8NW3mVC8kgb7CYwK
         SJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCX+Skf+OOcyOJpAAqAatChH/bMmKcGYBq8l7uM5x9QEjQFc60T6pgPhyhSHI93BuUtosKIKjIokYbnV7ZYlBgo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9HUaAIBm+ywrxGLvPcPCFOV5+ooLe8v/aMvV2Ildy5ts3/pOm
	Y5GHtJC7IM0d2PzgoEygDy9VbGHYc0PIq312T/w8zSFTRQx2Nwc6c587SbklHAIwZQ==
X-Gm-Gg: AY/fxX62d93cYTOp7QIydYkvDp34m5J+DiCPpqeNWQXgmLY7aOSePG+HS9j5Sb9GE1f
	53t0S654MfZ+19iJ77i7vIf4HHR0IWe18fK16jSfhF3yqcv4reN3mpjA7sTGSIBhf3hEstk3QDV
	76xzWYp3NxrsMYFam1yeugSUK0rJHAyZDn2Xp6mIpGMZfCXTOcLwHosUJU/8w46r9798hvH417w
	Cl81zLv1NmTFa+XgW6a5rmRHPxSeclews9FDrpmtHmzTHZH0kewDSZIMLc4WF9UhvQtUaEyML/l
	LpFTdJJWUJXl5KKMrk3933zePeeSG9DrbnNFDhWa8lNsuu5uRGoPLP57QI8UtRil3DQrPOXuaCs
	4/22kMo67uE6RWmvg6TW5bJP4eeSJKJvwUisqpJQmau57MFQjQlthmRgLvYklZNmQqkbuiHMdki
	sU2fwyceX1TRkO8wX+MuBByfssX0aJqsEfpz7900IPkZvWiGjAKO1DtYMZFp5QeNj9/fiCUgD6J
	REy0EG7
X-Received: by 2002:a17:906:f5a2:b0:b87:b87:cdbf with SMTP id a640c23a62f3a-b8796b85d1bmr942630166b.53.1768828719421;
        Mon, 19 Jan 2026 05:18:39 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:38 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 0/7] USB Type-C mode selection
Date: Mon, 19 Jan 2026 13:18:17 +0000
Message-ID: <20260119131824.2529334-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces functionality to the USB Type-C Alternate Mode
negotiation process by implementing a priority-based selection mechanism.

Currently, DisplayPort and Thunderbolt drivers initiate a mode entry
separately within their respective probe functions. The Power Delivery
Controller (PDC) retains the ability to activate either USB4 mode or
Alternate Modes based on its internal policy.
The mode selection mechanism disables Alternate Modes to be entered by
their respective drivers and the PDC. Instead, a priority-ordered approach
is used to activate the most desirable mode.

A new `priority` field is added to the `typec_altmode` structure to store
a numerical priority value, with all priorities being unique.
If the port driver supports the mode selection feature, it must set the
`mode_selection` boolean field within the `typec_altmode` structure. This
indicates to the alternate mode drivers that they are not to activate the
altmode separately.

The mode selection process is managed by three API functions:
- `typec_mode_selection_start`
- `typec_altmode_state_update`
- `typec_mode_selection_delete`

When a partner device is connected, the `typec_mode_selection_start`
function executes the following steps:
- It compiles a priority-ordered list of Alternate Modes that are mutually
supported by both the port and the partner.
- A dedicated mode selection task is subsequently initiated on the Work
Queue.
- This task attempts to activate a mode by starting with the
highest-priority altmode on the list. Alternate modes are identified with
their SVIDs. Activation/Deactivation performed via `activate` typec_altmode
operation. The process stops as soon as a mode is successfully entered.
Otherwise, after a timeout or if an error occurs, the next alternative mode
will be activated.

The `typec_altmode_state_update` function is invoked by the port driver to
communicate the current mode of the Type-C connector.

The `typec_mode_selection_delete` function is responsible for stopping the
currently running mode selection process and releasing all associated
system resources.

Mode selection is initiated only once during partner registration, and only
if the port driver provides support for this feature. Subsequent
mode-switching activities can be managed via existing sysfs entries. Any
modifications to altmode priorities are relevant only to future
connections.

This series was tested on an Android OS device with kernel 6.19.0-rc4,
PDC: TI TPS6699, Realtek RTS5453.

Changes in V5:
- Use the no_mode_control field instead of
  con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE
- Squash previous V4 patches 3/8 and 7/8 into a single patch
- Adopt guard(mutex)(&sel->lock) in mode_selection_work_fn()
- Use dev_err instead of dev_dbg, remove the error message when exiting
  the mode
- Update typec_altmode_state_update() to only reschedule the 
  mode_selection_work_fn task if it was successfully cancelled 
- Clean up code style and alignment issues

Andrei Kuchynski (7):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: Expose alternate mode priority via sysfs
  usb: typec: Implement mode selection
  usb: typec: Introduce mode_selection bit
  usb: typec: ucsi: Support mode selection to activate altmodes
  usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi

 Documentation/ABI/testing/sysfs-class-typec |  11 +
 drivers/platform/chrome/cros_ec_typec.c     |   1 +
 drivers/usb/typec/Makefile                  |   2 +-
 drivers/usb/typec/altmodes/displayport.c    |   6 +-
 drivers/usb/typec/altmodes/thunderbolt.c    |   2 +-
 drivers/usb/typec/class.c                   | 100 ++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/mode_selection.c          | 283 ++++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  22 ++
 drivers/usb/typec/ucsi/ucsi.c               |  12 +
 drivers/usb/typec/ucsi/ucsi.h               |   4 +
 include/linux/usb/typec.h                   |   3 +
 include/linux/usb/typec_altmode.h           |  42 +++
 13 files changed, 483 insertions(+), 8 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c

-- 
2.52.0.457.g6b5491de43-goog

