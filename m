Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3868A242D99
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298244; cv=none; b=k42RGea4MhutIBPON+ta75TlLDSjCq9wz1Mfl7xKnOpLhK0y1CpRY+G77dusmbR+CCRDtLAFoVaqgu/KkEt4hkNJE4qUokdTEulAZHkffEPY9rUSNFgmgHEAVYcWMO3lVYSm9gwlgrhcIjh6dh3qFY6ic17/qm2jd4OJ7ZRPezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298244; c=relaxed/simple;
	bh=CdRSPzRZhrLXv9SkH2yFf0/+V2Tpe2TdwnPx5t3lia0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmls0bF7bVVTBFmkkVlmfsGdVJwpyZBTkG2Zv8V+JCe3IZZwKDbZNW5ft3YmSMvGLz2e4yitDUSgweQCcOhYsj5GPP6DkvWVE4QbriTIQdLAX9ccDfN/TvYne30oeg8S4cRtyqp7lq7wrVOlDlGL32O90m+aNGEceMCW7hOf8I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nb+VnzfW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nb+VnzfW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6157ed5dc51so7324842a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298240; x=1754903040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgC/fq0UWX7rdpZAzk3F1oBkRyQKH7WIGoqghZqLQ0U=;
        b=Nb+VnzfWKz+1dHOEsi3NnE86rC+y1PCDIZzcxRzpB6TbeIEeae4JbId8P5IJBY4Z9k
         5TC91E8KO2QK5gqZ36WsFsNJ+OOyaK7WYHEpUugz9sq/M5Vq0gJI7b33qwhlt825wBCb
         D/2exdPEp518jkawvR4zkug99MVhWF0DqIYzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298240; x=1754903040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgC/fq0UWX7rdpZAzk3F1oBkRyQKH7WIGoqghZqLQ0U=;
        b=JIUDfvHeGvTwaxZScrKBMgGsMq4hP1bh53GjrbXFx2HXg59WpAdlh/N22n3U6/BAVK
         zig1WoZs7pkiGc6pwCNpKjyt3HPngPfUEyE/AcK1FGfBRDuWSs/YPnwi4+p60ffSmDwX
         7U0Ano0wLeGA4En11JJwaDkBFQSEk36TLn4OBTBh+dGzcSzWiY1Sk9mNdG+UhiAmdSpD
         a0bAaUOeEdd3nmYB+M4TLoCVQfrY8HdR4yIREprbPremUY9ZEbZuUVXiPCt8dLW/rukI
         2qMI+bwtj48mzGA7hMKf13HvYqWIk1boOq+JCHBFguB4+nTuYuISJsn3SjMdlAoWmVax
         0Gfw==
X-Forwarded-Encrypted: i=1; AJvYcCV6jgzmIZq8QRGPjtQDBKkv1iAdmOtVF+RhQz5exHZ/4W4FKDAnNiKUMyH1Gud37qOhSq3kyA7ZylmAczSb8hw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzryjE38tTfoL4RMJeFyonHRw+7YsP0k0Q3AkH/6utNDhdHmDQc
	OLNWl7f90v2ky+iQ2ozQ50IRk8+nhTbpua0pYyjQeyUpUpCXHFvkjPMJeGX8Wujr0urQ6A8/VC1
	f+XA=
X-Gm-Gg: ASbGncvbG8XEss18MFq3+ABJX9q55YWlbH3quNZ1p6qmknWPgokG5GByh0V+LAdr11N
	aaBw87v66KOhfrmMnx9wxyFtkDSvccLA3FfFtavQ679KL5Kxbi7B8BWNPIxTz5MFAe96MBQpqAS
	KEwsOl2qN/2iGXUKIzAayMR/5oyWp2qU4uie5HVkZU0si4rQR2R9Dr6DJRiGka+p2lkZkgO1mO8
	AszjwSJOLMlNVKfI3r4XqCxRzpNJ5TFzGLqKiimzuQ1d4aNWLjzw1LrgiPiWi0109IsrMC9tNn+
	wWF4Ca6d1w5Ezkyh3kLcp3xwMU+dxNv6wpZB1hDu6XW1ua0WKQykQXC+qxgWxUTjhPZOCSoFn51
	T5V2oDDC47M90pBESjiqT33HQ+gMIsrsfljjhFvXHhqxQo1CWUnN0L7873VP1ZYQJtciRK1EamA
	Ekd25urvUojkOeMrMrSHU0UuOt8w==
X-Google-Smtp-Source: AGHT+IEWZlH6viZQ6slELtEy7DIQ1R5yHsUK/PokBkKf2bvVo1I7/RrcEV59t0yajt4CFWb2bWNEBw==
X-Received: by 2002:a05:6402:1ec8:b0:617:4a59:c5da with SMTP id 4fb4d7f45d1cf-6174a59c6bbmr3476589a12.23.1754298240446;
        Mon, 04 Aug 2025 02:04:00 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:03:59 -0700 (PDT)
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
Subject: [PATCH v3 00/10] USB Type-C mode selection
Date: Mon,  4 Aug 2025 09:03:29 +0000
Message-ID: <20250804090340.3062182-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
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

New sysfs attributes are exposed to provide user control over mode
selection:
`priority`, `usb4_priority`: Allows users to define their preferred order
for attempting mode entry.
`mode_priorities`: Lists the modes supported by the port, ordered by
priority.
`mode_selection`: Lists modes supported by the partner and triggers an
automatic mode negotiation.
`entry_result`, `usb4_entry_result`: Reports the status of the last mode
selection attempt.

The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If the driver does not report its status within a defined timeout period,
the system automatically proceeds to attempt entry into the next preferred
mode.

This series was tested on a ChromeOS Brya device running kernel 6.6, and on
an Android OS device with kernel 6.16.

Changes in v3:
- The mode_priorities sysfs attribute has been made read-only.
- The mode_selection attribute now exclusively lists partner-supported
modes, with mode entry results reported via separate attributes.
- The driver returns mode entry results instead of error codes.
- Constant values are used in place of module parameters.

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

 Documentation/ABI/testing/sysfs-class-typec  |  72 +++
 drivers/platform/chrome/cros_ec_typec.c      |  17 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |  17 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   8 +
 drivers/usb/typec/class.c                    | 212 ++++++-
 drivers/usb/typec/class.h                    |  15 +
 drivers/usb/typec/mode_selection.c           | 575 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  54 ++
 drivers/usb/typec/ucsi/displayport.c         |  10 +-
 drivers/usb/typec/ucsi/ucsi.c                |   2 +
 include/linux/usb/pd_vdo.h                   |   2 +
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  12 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 18 files changed, 1024 insertions(+), 18 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.50.1.565.gc32cd1483b-goog

