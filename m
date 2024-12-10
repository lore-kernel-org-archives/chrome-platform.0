Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CFF4A04
	for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841942; cv=none; b=KGuZ2qmm8HVNaWFny3ie2RvFz1XS66ap3qHkzk2u3z//QcZVIn33osG8nY9dSvUUPvIJqv3yNdqH5dziJU973daeAIqnSBuTIYZtPPBTOekRW0Qy5giW80Y0e+HDTahtX5uVZZjtCbNVDKcFolqiZ+GjxjhH7kLeOq9LjtCbMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841942; c=relaxed/simple;
	bh=NPi/4AlaJkSIeLQGC+XiqTxGvGTwWJnpv5WQvkXTK8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FQoNcLA0fLxILcZBl1ZiNBq1nMaQXzHnGHXn7P3m0Y9dKO5MhgApIay8NsOTFPDinx/jEAIbWussxV/CdH8CdH2rv0wjbLzUEKwl2akZ6ycTGP4y1N26Mzyhq1eZkRO2amQSI7l6kWIkh1HmfroyNWX6JJyKm1aRsM9L2dvMF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nOq9rMzm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nOq9rMzm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa670ffe302so471421266b.2
        for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733841939; x=1734446739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oW39J4O7Decd6iUb9vyPOtj+lmZctRYD0s4SZ/f2xo=;
        b=nOq9rMzmhqh1LJD02lOHzyhDZQd2CxKRGTfIf9msPHv1eLXVzOF76JEPmu3w0fifS5
         msgOHbBrVXq6IW9OH7/eKv2xKgFbLcvQAbqhHvZMOd9Z+5i9vaQPq82fS5yU3h+tp3ap
         P5HErjedliBbiqPiBGvbIb4cVg8Yjqi7t4Ww0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841939; x=1734446739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oW39J4O7Decd6iUb9vyPOtj+lmZctRYD0s4SZ/f2xo=;
        b=PDQ3eyld3f/hBIzXlMZHnipoAfnvcBZOLd8j9qOZtT2/ssMqcHB9aD0FP5X183h06W
         PTo+VFnsEhoyQrqejIWWt3utm9wHVdrv2e7uB/UHvlTYLNwVN2EcEYvZvrSwJ6Tad16a
         ZRd1GKNSSa/hBXVvwQ2zoRDpBiprRd5dl8uYxrXeBh/cxYdqglSGlYsTNM2dXh0zDoZp
         5KsiGa0O6L2JQwaskWA22x9C5Ygm0Qc+6Dc5gUf9xTfHw7hOItVpjWb4kAp6+AqmVYdQ
         86n5mziK2FyZWoyuVzV7S35bt40GMPbxsvxS0uZsND87b+aN/Nac8RCdaQ22gxwh0I07
         wQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFvP4Q3DOa6s25eCdjN3bUn+8oYiPxo01i9+B7yCtkLS2yUf6pfTdw6BAtRREFVIWbM7O7gKdJEsPItT7bjTY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG4aV90PVkyggw6ATGX2SLWrmVDR9v/YMZFORsaNiDdhByxVqk
	x5UOun3EwgYssQYUJb/ovo12hw5IDD5cn+g8x+E5iPf9yZHjamf2rYC70IaB
X-Gm-Gg: ASbGncvEqahDQyU3rz6cWxlBTqmAfH4otPW7AOMQvlTV5oDT7lfZmwxoZWyYenf+L1o
	WyKjjngmOykSW2IR334jAsvm1Na2mffDYc4fEwEFshKLCzdVFw7zQb9gcurDA07UVsw73tTt0Pl
	TGySfudECu9HwLygiKie5ljn9kOzLKjVlaMMEXzy539aEtIwulyMAVwuDiAFEqdJFLQtsYztYjn
	EYQf4uTDW9DXsqKBf/ePGEJbeA4uXPXrXiG8ZOKmxerXnU8HJKhXRv5xQ5Xm8pFZv8jc4Kr60ec
	+3XA33Akxb4+m7dFsM0uE0n9eieLF9hL/+cdIxY=
X-Google-Smtp-Source: AGHT+IHxk7OZwE67H6am9XucwO1VSzRK2+pKOkaNIsCW46Pf9x6hpvZYYK7Pv73tjpi9TGbJhjJM8A==
X-Received: by 2002:a17:907:9508:b0:aa6:87e8:1d0e with SMTP id a640c23a62f3a-aa687e822c2mr724240466b.34.1733841938618;
        Tue, 10 Dec 2024 06:45:38 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69dd81272sm168996966b.161.2024.12.10.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:45:38 -0800 (PST)
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
Subject: [PATCH v11 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue, 10 Dec 2024 14:45:25 +0000
Message-ID: <20241210144527.1657888-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
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
2.47.0.338.g60cca15819-goog

