Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC02BF010
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080792; cv=none; b=OnZ1uv2qYh3/QnJvSRx3HJs3TYk5FXi1y1E8R5lWh7bHZQTHIfp9GL3Kgsz0Qup0A+Z7tN2AAw4smbckyaShxr5IhjWg6UFhvbC5gx6J5wNcZi/spVqqSE1VFGYm4x3uXqSBKdeXTjmEYTtFbZnqLSDgUQse3yVVV/Bjs0EnIkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080792; c=relaxed/simple;
	bh=YhWSDmrnOKoze3ApO91AUyBZ85d4Lcz4lg8oIS6fHeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nh+uWzpbH3yl/N8Q40o3FvHEnvTj9imSjiG2BfB4W3h24m72ZYEDDY2d7PIRvabSwbVK6vW8OCSw0Nxb2Q+KdrRh8SvD3MRPslVcBcUvK41RlWszl7KshW3llYncr+iX/KjfEvGzOsFOBoONQ39mvPZIqANxlHHL/+Teuyi2o1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KBJHcPf5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KBJHcPf5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso7946406a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080789; x=1750685589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5YN2QkU5k06/pOxdUgeF6W/BLj5Q3PBTEndQTl0KDk=;
        b=KBJHcPf5UF7yqRRLhvsCrHkyXoedv6D/KuNvBaMgZgrlqh2tM/Kz7et7IybyabZH7t
         wpyR6z3vXxzFCaNO4HnIFygvq0fOsmsjCGlBu9cqKZHJgx9PSOuWG/7ePaVPQTX5Bih1
         7Xa6w0G7V7LnIFhyddLblnUz8JDwKYgK2hTJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080789; x=1750685589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5YN2QkU5k06/pOxdUgeF6W/BLj5Q3PBTEndQTl0KDk=;
        b=vVd0NRZV+tXGpdOsqSEcx4t341s84ZszNAb9Y7zqyZStEZgl3RDKna7lTMKIUmIIYK
         fqISdzj2VsR76ZjVxez7FS3OL58STqNDzTpyZd+7AYvFdEGckdvNJb0t6/Ei8cULUV8M
         YlP4NC/MMuE+t0dd1PlAfO76M0jCQNffTSqU5HJTXw93p0ALH54Bs5V2jN7Tg4l7WOry
         mRVcPuHIbwP/3y2lmJPS206MxNWWplppDxQDedazOoiq37Ys7GeQctRUR4mVLEYxmbWp
         xtpq4YAPEInLxZr7udRDSe0KooB7FCrVBkBhMnzlaeQFkIvKKTOCm7SunZnylYFk+Qwb
         4XWg==
X-Forwarded-Encrypted: i=1; AJvYcCVdGD/c82WNRCiAcJdElDGN8fYJY1wnHvAgdoCrlOOwl86m5eGJXUh6evhci3Pza05TVM8bYlTDIXpXEH7IQMY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTtLQa2pC4+ATbU6/APVJF+jihP7YmZvCVlVkpZyVIOhc48/oS
	0A/WJ3kFZ+7dcwdgupIN5+ZEZI99u8/Mago1W7UZs5zqkqAuHGtsALCrLiOBDNPq4g==
X-Gm-Gg: ASbGnct7NNtlAYfMjZJHWlGDmfa7kPr/NZhwV9QHzMrEw5fyDteLZx4JxaVOAk+s3PH
	NoctggsMTjrxuN29sX/+M+nW8sS1Jik/67W9gExynEJ+UPT5uf9CY26FcD/0GKXEo71No3iMCIJ
	rJvyWbp67kE/VenFZr8Z6CQCpmf5bbbuzXut5LiSs/GZMni74eqotV+59t9qgnYM3CEyQ2CCel4
	C/Cf5+BB5vmnPcCnm4q2zRZLGiDTOCavLHw0qr7vppa6Gnz2zH8fqpJybdMy4fQuq/MmVg4rhIH
	hLrlQRUQgB4kmBk8XO5cdVR8c/N+UB540rXLoW1JBnj6ycEFTHbk+fO/FQPcLXvgEpUaWUbp65d
	WkFWwus8eyYfcSJLFpIAwwQKLoAlSNCcvz0dA03RPonCCFkvd6habZPltwg==
X-Google-Smtp-Source: AGHT+IExI1WmkrxVe9zE/JbZig55DtGz8Y0L71WuTd6No5iWi9+KVXEZJTRNCO03hIbCfTQ5SWPVVQ==
X-Received: by 2002:a05:6402:440b:b0:601:6c34:5ed2 with SMTP id 4fb4d7f45d1cf-608d08346e4mr7846954a12.4.1750080788784;
        Mon, 16 Jun 2025 06:33:08 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:08 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 00/10] USB Type-C mode selection
Date: Mon, 16 Jun 2025 13:31:37 +0000
Message-ID: <20250616133147.1835939-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
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
`altmode_priorities`: Allows users to define their preferred order for
attempting mode entry.
`mode_selection`: Initiates an automatic mode entry process based on the
configured priorities and reports the outcome.
The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If an alt-mode driver does not report its status within a defined timeout
period, the system automatically proceeds to attempt entry into the next
preferred mode.

This series was tested on a ChromeOS Brya device running kernel 6.6, and on
an Android OS device with kernel 6.12.

Andrei Kuchynski (10):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Expose alternate mode priorities via sysfs
  usb: typec: Implement automated alternate mode selection
  Revert "usb: typec: displayport: Receive DP Status Update NAK request
    exit dp altmode"
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result
  platform/chrome: cros_ec_typec: Report USB4 mode entry status via
    callback

 Documentation/ABI/testing/sysfs-class-typec  |  34 ++
 drivers/platform/chrome/cros_ec_typec.c      |  11 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |  17 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   6 +
 drivers/usb/typec/class.c                    |  95 +++-
 drivers/usb/typec/class.h                    |  16 +
 drivers/usb/typec/mode_selection.c           | 505 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  42 ++
 drivers/usb/typec/ucsi/displayport.c         |   4 +-
 drivers/usb/typec/ucsi/ucsi.c                |   2 +
 include/linux/usb/pd_vdo.h                   |   2 +
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  12 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 18 files changed, 775 insertions(+), 17 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.50.0.rc1.591.g9c95f17f64-goog

