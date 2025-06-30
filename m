Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548928BAAD
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292771; cv=none; b=bRcWsB0o4Zj+5YF3z6bNCHTBbO7rO/IOahrwKRoRziz7HVZJFupD5byYtGUey9K7LE2HzwX1mZ1PhbhtChf/7NyUutKe6JO4/MtM+lf+jFzglFzWEezETTrG7Ww77HRtsN3RWUGjl/mGm8W+4xnDwUsPmFL70x1GjLa6WbvJ8tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292771; c=relaxed/simple;
	bh=bMHPCmwSf/0UHN/+Dbhn0oR0tIkPxlobark4ljmFKMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PFAvBq2TRxR4AzBHjMcG9ygmtA2IYVQieNWvUq66RF/Up71vTiWslJlsSAB4JDbumF7jVR6kEvIRid8sSbfXIsHFCCYyhOLAW1ckhURJHV9WZazqIiv3CP8BLEnFSgLgBM2OuIM9wKrMwnm5ZDvqv2B5S+nCz2w4B/u+Z1VijWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TL1iYq/b; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TL1iYq/b"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae361e8ec32so530443766b.3
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292768; x=1751897568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPXqzMTVNtWkrqY32SDEDi5ZNrPEzXx3OZ7fxqg/7GU=;
        b=TL1iYq/b7xQN0Ganra53hvE61YpRP8VZyTDHY3TOO6POy7Au0bmj5XxOUfhwpSvQSM
         p9LrT64RFrAnU1HLgj8HU4Pct3zEhrZUeTpzluqPk/VSdfo3FCnrWnzdU8564xBptLjH
         Ji/YkVDNjXIAEzUTiV/Z1V6CQvwPafornbMCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292768; x=1751897568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPXqzMTVNtWkrqY32SDEDi5ZNrPEzXx3OZ7fxqg/7GU=;
        b=mFhdJf93/U2UgvmmcWM56dAAn3cFfv3cn9ZX1xKHc00Dki9tqOpMPaCW3yIuJrW9fN
         i/4o2/wpGKxOe4xbiNlDV1ddQhZTFLEmGeH9QlmmoP4D2szobnjbKcknZ3AyDM5CYQD+
         ZNxGQGjypfnx7hViI1mp1ChzyB0UBfU+aS/Dq2ylexJa5xZ/XmA5JWtE2SM6kS5Gbleo
         7lr/F6zvjYhmnzVGOaGdrgutDbQi/g3/pTqqyGtHPLSrxPC9LKco8eiJvlCaXogE03A+
         6YEz/Tq5Sq9Iy8fTQhGlYDYjIurSrUrRiwaR4gh/rDTvVQD5VLO3zQUXZsCtxE2gbzi5
         focw==
X-Forwarded-Encrypted: i=1; AJvYcCV7npyi81VllttEoFGRnbleAREMuHLO+918d2Fb+OOsc3qWNorsjQyqu7TpqVG/qD0+nPY9FZXshE730n4DilU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXqkUPKDTyqMuPpXjWKG95GwRTy27/Mx2nb+q30saOqxww4i4b
	xXNk9UItjwbm2oSlyRiOtujL33Rnq/1FBob07zulCNKS+37mIR5d1reEcyj0Fm1eig==
X-Gm-Gg: ASbGncsvtKBflXVdu0nXFOtrtTDEwIEDCUd48aA5QhJmzqQ2fqeKhpdrs/tgtmD1N4O
	8EnFUd/Cb3rSE6AwovjdYYyqkSGAnEWAmiPuOv4sGlRjxbudicQ2Cceas9gxAI42qOMr0McJONO
	nnqhatVDQg8e8hsdUj1lOljCJl2/Qdd3WYBXqo/nTrDActtwYZM2ZTXsDWan1FOvbvyqoiatmyy
	J8XbORux8hMX5eXRvG+yvUhoMywq25vwkzeKOd4hYMpsrsHSrLk41hNiktE/8OWgAwt4HsztiMs
	h0ED2KHXoghNMe42HSO5YEJ1zXGNncisCH4jExBb+CiHE9kdY6HpXcpfS6LqUQOH6++c0HCXCqF
	RN+hQ9TWfgBgpyHrQ3z61eR7D1+wDiUM1+c1bvoas6h7soab3oJlW
X-Google-Smtp-Source: AGHT+IGkDKPhreTeoMJMMTTbgIYsyB6qEooZPSD7ypLq50eF8X4N1KuKONp/TfysPQPg9BZXo77t8Q==
X-Received: by 2002:a17:907:94cc:b0:ae0:a245:2fef with SMTP id a640c23a62f3a-ae34fdbed8emr1390270066b.20.1751292767830;
        Mon, 30 Jun 2025 07:12:47 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:46 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 00/10] USB Type-C mode selection
Date: Mon, 30 Jun 2025 14:12:29 +0000
Message-ID: <20250630141239.3174390-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a flexible mechanism for USB Type-C mode
selection, enabling into USB4 mode, Thunderbolt alternate mode, or
DisplayPort alternate mode.
Two new sysfs attributes are exposed to provide user control over mode
selection:
`mode_priorities`: Allows users to define their preferred order for
attempting mode entry.
`mode_selection`: Initiates an automatic mode entry process based on the
configured priorities and reports the outcome.
The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If the driver does not report its status within a defined timeout period,
the system automatically proceeds to attempt entry into the next preferred
mode.

This series was tested on a ChromeOS Brya device running kernel 6.6, and on
an Android OS device with kernel 6.15.

Changes in v2:
- The `altmode_priorities` attribute has been renamed to `mode_priorities`.
Consequently, USB4 is no longer referred to as an alternate mode in the
code, comments, or documentation.
- Mode priorities are now set as a mode sequence, eliminating the need for
explicit numeric values, which simplifies configuration.
- The `mode_priorities` attribute no longer supports disabling modes.
Instead, this is now handled by using the `active` attribute of the port's
alt-mode and the `usb_capability` attribute.
- Changed `typec_mode_selection_reset` behavior. The function returns
EINPROGRESS if the entry process cannot be terminated immediately.
- Patch 6 from v1, which addressed a deadlock, has been removed as the fix
was already merged separately -
https://lore.kernel.org/r/20250624133246.3936737-1-akuchynski@chromium.org.
- `typec_svid_to_altmode` macro has been replaced with an inline function.
- Attempts to enter a specific mode are now limited when the operation
consistently returns an EBUSY error.

Andrei Kuchynski (10):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Expose mode priorities via sysfs
  usb: typec: Implement automated mode selection
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result
  platform/chrome: cros_ec_typec: Report USB4 entry status via callback
  platform/chrome: cros_ec_typec: Add default_usb_mode_set support

 Documentation/ABI/testing/sysfs-class-typec  |  33 ++
 drivers/platform/chrome/cros_ec_typec.c      |  17 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |  17 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   8 +
 drivers/usb/typec/class.c                    |  94 +++-
 drivers/usb/typec/class.h                    |  16 +
 drivers/usb/typec/mode_selection.c           | 529 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  49 ++
 drivers/usb/typec/ucsi/displayport.c         |  10 +-
 drivers/usb/typec/ucsi/ucsi.c                |   2 +
 include/linux/usb/pd_vdo.h                   |   2 +
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  12 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 18 files changed, 820 insertions(+), 15 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.50.0.727.gbf7dc18ff4-goog

