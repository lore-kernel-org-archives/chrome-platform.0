Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C5C2FF15B
	for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133883; cv=none; b=CaWB5U5ZGX6uGuTgdXWesQJ9vMTWHR5QGuIY5BZggnjiGOz3hoPaaG810DDRNufFZfG8SiE6th4rvv6WZud5HGUHa4xE1MhHfzPrIeXt8HOjn4Ms+mi9D/JkkheohUAQGqf2b0ZxtiMYPYl8XNZogBd5FSf5OlgS7ta6X1497GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133883; c=relaxed/simple;
	bh=oUpwIKailPzvywGQy1+pcev8O18sL6J2IAoIiRpAS9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBSzzOOn2MVB7tOnmXoVq0tiEKMGavmfQKgMB5MV0bhZ6Hl5KAcDAF7+gAl9Y/bhls8dVSoaflVUiJ2DSesMMx6L0IJFmnWlyB75x6BfD8vHSe4hN8ykGcUb6JDzfV7XDXVQ3Sc/L/MlHkTUoxKkhpV5VpdmNHm/iecwpdmee54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S2eXUGM0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S2eXUGM0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78d5e74so863165066b.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133879; x=1756738679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlAw1YUtoUP+479H9eosmlH+nUKupTZr0DxeKyHdVeQ=;
        b=S2eXUGM0jljvMqLcQLvivJ3BljfgsNWGTjb2MMkgoRaqHqR8BSohfVdD6TZlblcit/
         zEbMncbZfo3kZliDEHS8MXZwmyZBgA94myAeD32r+cYeeIo/rSmq07LxaYF/loJJqZJ7
         eE0XAVOTiOOZQMdXllwYLTS/3eAdaZv/elF+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133879; x=1756738679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlAw1YUtoUP+479H9eosmlH+nUKupTZr0DxeKyHdVeQ=;
        b=h7cZ/52wuQzhjwoWSe+FwjUvkPDiVod1DNvppzGvXgilu/FeLj09SOPe6uZ7Kb2OHN
         NzbmjXNUi2hvMxALJaHmERLkdL6NnMm9SbiOeSMOrRDISMqVhL+3AKheqt8KOaDzRPHM
         4g5J3jMKC1M0UoMSMOznVayJqqeIqkRxd+md0XWIIOo6NyY0g10l5fbpaqPEBdT6BQly
         4SLAqp/9oT+OQe4KHtTnkOquf/F1piQWAD/NP3kda0FVPW/emIWl5HRcVyR0rDAM+fON
         8FRJm6zJUwpOt/LqJOvhSTSUcauzVIflB/r7NY2tq7YU4qY/doyeNp3c6yhW8wOx6FIN
         fkXg==
X-Forwarded-Encrypted: i=1; AJvYcCWVZsVTOh8fCZ2a2jQNvsSZhWxDopV8t7rba1E1gQmWX9ESHNyCKlj3N0wpzUQroXMAQk/l/r73av6ANMImw4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHA6xbhF0/2CbtLrHr2shpqQv4l4N2DqTX2m77p0TbEiZx2Ie7
	b+o7am9uuQSBH9+nv+kKA3oqNZ+S6sYBICxDH89EDLBAEoZlQVD6J15uydnYru4/3A==
X-Gm-Gg: ASbGncsO14U8a925GbdiNI7RKnohdazKsAf38ALa9QG6GGBw3dGAswYgsg7/NQkn360
	Crk2CTBJXFsAmkGMWHdFnf/7eTCEJI1Pw1koInJ0JXVKfHBchPnyLwrQp/4iUX1auoNtNoxz/I0
	6fsPl69Xc+PO9BKWCGHyCaQMMpMIxBIFogWkM6AmEXPYsCsUtI/blDV1lt3S2oCV7CzI/aOI4Y4
	RVjjM/Vq9ig/boopOLJnr1SvUmllTkuDOVKcJneiSBid6wSGYZOQOuWLpl5S1p2YtO6beq/Xklk
	59L/22gcCLRw3R4I4Mt6rTeGsd9U7ydfVcZiyqkvjh3Ths9kYyYO6pa1wkIU6+1hKXx/PGQgm/N
	je6AyV08sP0q6sCFB16KYtCwCeGci7pc3lNClNAmgV/49JUenqCEayshgOqB4Dz6fAwBjjkKN6w
	KezNxjjzodBJKl
X-Google-Smtp-Source: AGHT+IH4w3C3vXXmPRoJuMQE6RNKQ6r79mYIPhLpoSiofHkFSKhUxFwChIxE4MrLgFEz7TLiFmk4ug==
X-Received: by 2002:a17:907:7f0c:b0:ae0:d8f2:9065 with SMTP id a640c23a62f3a-afe294d99bfmr1196751766b.39.1756133879320;
        Mon, 25 Aug 2025 07:57:59 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:57:58 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/5] USB Type-C alternate mode priorities
Date: Mon, 25 Aug 2025 14:57:45 +0000
Message-ID: <20250825145750.58820-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a mechanism for setting USB Type-C alternate
mode priorities. It allows the user to specify their preferred order for
mode selection, such as USB4, Thunderbolt, or DisplayPort.

A new sysfs attribute named 'priority' is exposed to provide user-space
control over the mode selection process.

This series was tested on a Android OS device running kernel 6.16.

Changes in v2:
- The priority variable is now a member of the typec_altmode struct
- typec_altmode2port is used to obtain the typec_port struct pointer
- Default priorities are now set based on the order of registration
- The mode_control capability is enabled by default
- The mode_selection_state struct will be introduced in a separate series
- svid will be used instead of the typec_mode_type enum

Andrei Kuchynski (5):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 41 +++++++++++++++++++--
 drivers/usb/typec/class.h                   |  2 +
 drivers/usb/typec/mode_selection.c          | 38 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  6 +++
 drivers/usb/typec/ucsi/ucsi.c               |  2 +
 include/linux/usb/typec.h                   |  1 +
 include/linux/usb/typec_altmode.h           |  1 +
 10 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.rc2.233.g662b1ed5c5-goog

