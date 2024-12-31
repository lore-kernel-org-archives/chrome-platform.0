Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80C944E
	for <chrome-platform@lists.linux.dev>; Tue, 31 Dec 2024 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650668; cv=none; b=AVtHdhGZMVDgk5uxph3jFOB/4goQMjEOe6XX9FpAYAohM6J6T+NSMCNHx8ZYbITLngqUUDxhIUDig0JRmlkjqgUxRxHnIsHzuFX+U9npWW4siA4EIs+v4RR4cDs2HkaT9x8FS/EcG70cz4NWo8DzIdndR0WxkbRq0XZYt9dwfv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650668; c=relaxed/simple;
	bh=bf+GukcEVltXNkTKSCrQQDQcHFBuI6bD2HSUYKuGOIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cpCSVuIlD/ctyRK3zi455N9xVB3M4T8rU7nthwlB/U6DzkgZL7d0m8pg03+l4QNRGy5UBBcm5XdAjNvtd6ItPUogMcVIy9rDBzoRnkv0rrr3YE8Nd9bc7uJcukxAYSKDDdrCdzp3ApE2laQ3ZAmvkpLvRJnxv+LBKfPwNcnSKSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gmQV8EiI; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gmQV8EiI"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so1259238a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 31 Dec 2024 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735650665; x=1736255465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0k5mVd+fLDtIL8C5inwIWUNpfV6H43E4vdNm1qt9/0=;
        b=gmQV8EiIgu5yhnSPSFRZSCg8MgfhLY7zVq6RswmM/lZ98k2Id2lC9xSRyqWlcChUJK
         R89EJBdem1dpNzO+W8c+E38XboO9UFNLw9Msw2CbwXvG0DhDej1olUyCocDQLmUeAfHS
         1CYD+MPNlDx4wxe3imi1cPAReUrtIDiGRguNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650665; x=1736255465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0k5mVd+fLDtIL8C5inwIWUNpfV6H43E4vdNm1qt9/0=;
        b=Qp9NweNEkJLkMuheYVjtlleHEf0o9QzNAempTF0mF3pnHYgEEu8jpIzryk/T2wJTMT
         i92bIpUwM5tiZZUmD6DqAyWAb+dlfAUVkVE/4Deo6srwQsrfW/cu7QiXVcGbHQVl+IhS
         +9Z+SpZoOeay9y5EcIf7I24DycrnfbeZJos1or7Q+kyfF0iCMhJIJwKx/8Ge4PipOY7N
         OUm78OltLDSHeu8ymPqYxTzPQZoOQ5MDeo4U/YY2lmOSXnK4ZMxbg2+F8EiYP9Loca+Q
         ZVObX1Ywzy1w9uuAiXiWil/xvaUBhwUn2KgwiCfm5F7lJ9JZ3MLpKWgj13y6syvS1xSQ
         E+8g==
X-Forwarded-Encrypted: i=1; AJvYcCUwaeu24QEg1aTAjdvO+OtyuAz6+kR7Vrrr/6MaLgs9MR5mWriGeyEgTdKfj/TIhey7j09taHNyLC6srr8SWw0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1eBxWdi2ny6JarridCeQcQepqDu4DLdwbG9qZzHZ3gtCW83bR
	P4y2jpXBunbDXbTI10N1d+WkSjt1tpgwCz1HoD7/ZGP3QO3F7zNx0+6+OnJa
X-Gm-Gg: ASbGnct/IUr06ogkYoGg2kkyMt6NUgEK/J4BjatXYPNGG2pOGuHkGIkZYB3YGZjzsBD
	vuw8KKIDGdFn33dDbBEe71vHyQmWytKUnTnmXfiCbHtnMxyPpTpVyx7R2wT/CGIHYNs0DeUUsqg
	jDTmCey02SFDRhrDxOUGYi0S6mE9p77bAsYOFpSJy5gcgaIgMbCjCD0F9VPV5U6JnHbbl/Ivlul
	uIkoDZ9qRqVMUhIK+MnPxB6LdS8V9wn42cVbZGPC0qYl5NNxtPrt/IewquKX21ZX6HCPOAeZvpS
	imdZcFP/tKQ/2l4KsL0aQ5FaSH0eu27JqZJ+
X-Google-Smtp-Source: AGHT+IEe+9lDwjXm0earALoLdeE0p8a1dVvo9dnTrYmjVrHTtFQ+RTu1kPyyl+VbzeIPCTmVnxPETQ==
X-Received: by 2002:a05:6402:210b:b0:5d3:d19e:6d57 with SMTP id 4fb4d7f45d1cf-5d81de0669fmr30312163a12.34.1735650664906;
        Tue, 31 Dec 2024 05:11:04 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (60.27.91.34.bc.googleusercontent.com. [34.91.27.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679efc9sm15876651a12.47.2024.12.31.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:11:04 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v12 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue, 31 Dec 2024 13:10:45 +0000
Message-ID: <20241231131047.1757434-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
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
Changes in v12:
- Fixed passing of cmd argument (from '&cmd' to 'cmd) to cros_ucsi_async_control()
which caused compilation failure. Verified also that all compilation
failures reported by the 0-Day CI passed:
https://lore.kernel.org/linux-usb/202412240743.tzTftk4H-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412240903.xAqTOQpa-lkp@intel.com/
https://lore.kernel.org/linux-usb/202412241137.ld79A9Iq-lkp@intel.com/
-Link to v11: https://lore.kernel.org/linux-usb/20241210144527.1657888-1-ukaszb@chromium.org/

Changes in v11:
- Updated cancel_delayed_work() to cancel_delayed_work_sync() in both
cros_ucsi_suspend() and cros_ucsi_destroy() in order to wait for delayed
work to finish if it is running.
- Link to v10: https://lore.kernel.org/linux-usb/20241204194900.371696-1-ukaszb@chromium.org/

Changes in v10:
- Added cancel_delayed_work() in the cros_ucsi_suspend() in order
to prevent premature wake up during suspend.
- Added cancel_delayed_work() in the cros_ucsi_destroy() as well.
- Link to v9: https://lore.kernel.org/linux-usb/20241203142314.3892422-1-ukaszb@chromium.org/

Changes in v9:
- Squash "usb: typec: cros_ec_ucsi: Recover from write timeouts" commit
into "usb: typec: ucsi: Implement ChromeOS UCSI driver".
- Replaced out label in cros_ucsi_sync_control() with switch statement.
- Link to v8: https://lore.kernel.org/linux-usb/20241128232035.1525978-1-ukaszb@chromium.org/ 

Changes in v8:
- Set .sync_control in cros_ucsi_ops struct to point
to ucsi_sync_control_common().
- Added explanation why complete() is used instead of resume()
in cros_ucsi_pm_ops struct.
- Updated s/miliseconds/milliseconds/.
- Link to v7: https://lore.kernel.org/linux-usb/20241115155234.1587589-1-ukaszb@chromium.org/ 

Changes in v7:
- Dropped the following commits for now as I want to focus
on upstreaming cros_ec_ucsi driver first. Then I will get
back to the topic of trace events and netlink:
  "usb: typec: cros_ec_ucsi: Add trace events"
  "usb: typec: cros_ec_ucsi: Add netlink"
- Squashed "usb: typec: cros_ec_ucsi: Use complete instead of resume"
into "usb: typec: ucsi: Implement ChromeOS UCSI driver".
- Added "usb: typec: cros_ec_ucsi: Recover from write timeouts" commmit.
- Added usage of common functins ucsi_sync_control_common()
and ucsi_notify_common().
- Commits:
  "platform/chrome: Update EC feature flags"
  "mfd: cros_ec: Load cros_ec_ucsi on supported ECs"
  "mfd: cros_ec: Don't load charger with UCSI"
landed in the tree https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next    
- Link to v6: https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org

Changes in v6:
- Reverted to type names uint*_t in cros_ec_commands.h in order 
to be consistent with type names used in other parts of the file.
- Updated comments in cros_ec_commands.h related to UCSI.
- Added missing sign-offs.
- Fixed memory leak in cros_ucsi_async_control() by moving
ec_params_ucsi_ppm_set request buffer to stack.
- Replaced cros_ucsi_read with cros_ucsi_read_cci in cros_ucsi_work().
- Updated changes in v5, it was missing information related to
commits addition:
  platform/chrome: Update EC feature flags
  usb: typec: cros_ec_ucsi: Use complete instead of resume
  mfd: cros_ec: Load cros_ec_ucsi on supported ECs
  mfd: cros_ec: Don't load charger with UCSI
- Link to v5: https://lore.kernel.org/r/all/20240903163033.3170815-1-ukaszb@chromium.org/

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
- Updated EC feature flags in commit "platform/chrome: Update EC feature
  flags".
- Added new commit "usb: typec: cros_ec_ucsi: Use complete instead
of resume".
- Added trace events in commit "usb: typec: cros_ec_ucsi: Add trace
  events".
- Added netlink in commit "usb: typec: cros_ec_ucsi: Add netlink"
for debugging and testing puropses.
- Added new commit "mfd: cros_ec: Load cros_ec_ucsi on supported ECs".
- Added new commit "mfd: cros_ec: Don't load charger with UCSI".
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

Pavan Holla (2):
  platform/chrome: Update ChromeOS EC header for UCSI
  usb: typec: ucsi: Implement ChromeOS UCSI driver

 MAINTAINERS                                   |   7 +
 drivers/usb/typec/ucsi/Kconfig                |  13 +
 drivers/usb/typec/ucsi/Makefile               |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 337 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  28 +-
 5 files changed, 385 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

-- 
2.47.1.613.gc27f4b7a9f-goog

