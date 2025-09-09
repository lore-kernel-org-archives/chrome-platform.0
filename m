Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA3146A66
	for <chrome-platform@lists.linux.dev>; Tue,  9 Sep 2025 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421042; cv=none; b=j8CY5txD+XszKCObjWqkkI5TAfO7+6MMKHxDyMr4GraKwabgyhRhy2Xl+XF2zVSJLSEda36+9mnVinL1mA+AGWc0P6F2eqHB+ryTpUq5F9/pLz95KWSAUo/HKyhUax9YqYVEFc5fmB9cBQ5VSwPkCsAt/XuYAUC66fIWAgnNl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421042; c=relaxed/simple;
	bh=TfgD91280mBYMbtyc2gQAhw5K8G243a5cAzgwqvOrWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBbB2rglQC55bP+P+ucPrZblpkELYSXETMkao+D2JmOtT1w5cvgchMMivjLfCAz+rky8rebJT4MlHueNzO+RBYRsn1+UJ8B1bbqBHisme63sISQd9FSKivbb4JsElvgQFmttwrOqR7GaYvH7aMcfuxESu7cvsaQ7vBWOhmXBmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k0sOI2e9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k0sOI2e9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b04271cfc3eso756013666b.3
        for <chrome-platform@lists.linux.dev>; Tue, 09 Sep 2025 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421039; x=1758025839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGGblSmY23n3+zeJrFP+XTBfpalkEjJ+yTGcmc0kj3M=;
        b=k0sOI2e95NNk/UwZO3bvoTGpaw5USmFbABWijl4NKvlnizRwoF2k3fJ3+kIQxe2X0Y
         J5Ws6p0KtAb/zpHIOAiiIOhMj4NfMhqy4c9h/4qXhTlg5OxZ+WG17NvGZdamI7aE60nm
         5E9LOQmrUpVm2STXOm2KWLGc75T+tkjB97qG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421039; x=1758025839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGGblSmY23n3+zeJrFP+XTBfpalkEjJ+yTGcmc0kj3M=;
        b=D5v822d964NUqfHgajCfUmKcghTdJxMnkWtzv4ClwVIVPVpm7yx3mVVahhsI6pzLIS
         sr3maQPLqKmBm38/Hjsd44YBviraQATsqe+cFEJ0b3/yc+wpBPkfGgJx+mMLyw7JC7vr
         FfpWGkvmvnwEfPLymgA8prp5kffdHDdpYY/aj/OAILdNyoynajFB0YOof+651n4Iftgl
         WXrtB2KtHYUUHrKkTaIU1ZFkGyG5Mqxt7W4kOe1v7XZSYUDRgHsq5B8Do/3QhRifwNgO
         70fbaoujnMaCUD/nOV34D1ur3AQe02bckh93EVpjUOjSQwDzwvq6jOp76vpCXRUZ+P4Z
         +vbw==
X-Forwarded-Encrypted: i=1; AJvYcCWd1y65nkLhYzBf4+9PVSpqvLWDlEBqE9+ikPf3ytlsnzJk8d+Ay7I+qlObEux/LfjLG44ROrq2P+rq98l+Auo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH1QJh6IAbUab0pSRsd3J1UWIn/nHAp7QblKmvXDBHrSeNu4I2
	5lEIdyB3K21fUljRZVHqUreExs8+luGQT6juEk3BtcML8CnDDJaGoJx/SE1+D53l2Q==
X-Gm-Gg: ASbGnctGtj8anvXSuvIJO8I7MeEZOuvdBA9NXabrv5wTUBX1sKAyIkRG7+NC4N+JDhw
	49VwU9PwfNPt2t4KB+272DzongaIsw6ey6vqGo4yp5lzw22X7/n/yKj13IfdxWJ5oTNjGKoc9IZ
	2HQ0ek6A7X6E06dutGjwBMF9/4wC4Fo/QK3PrOQoT1++sEhh6gWAcP+WQhEFTmRL1Y3ey8F+XRZ
	ZzJ+poF85MdEpar85s4hkcLp6FSB/0fk44JObL/+B/wnpu8E1TgfKHpZavstNBjazsGAecZczI8
	cRO7ZYYkTyZOvMPsZcmwhpv41XodYRp5M/Q8KrDaLyZ8k4HrLFZ31DpbJ+8LCGzyNL0Tb/YRQ0E
	0RPGR1j9OHPu7nVRhlUt1jcdb7CkGO9PYfq7lHh9bDA+AUsg/oagsnRA0zIf80MpUT3YnGxYZAH
	8IKnzx0egyrsB2rvk=
X-Google-Smtp-Source: AGHT+IEP5lq99tnWBWbz1GGVF0Gt4go+YIyrowIZeG7BiR/j4Mlu3jscXCr+tcpjkuM3py/ouJ5XJQ==
X-Received: by 2002:a17:907:9342:b0:afe:e745:c3b with SMTP id a640c23a62f3a-b04b13d20dfmr1011225366b.12.1757421037456;
        Tue, 09 Sep 2025 05:30:37 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:36 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 0/5] USB Type-C alternate mode selection
Date: Tue,  9 Sep 2025 12:30:23 +0000
Message-ID: <20250909123028.2127449-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
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

New sysfs `mode_selection` attribute is exposed to provide user control
over mode selection. It triggers an alternate mode negotiation.
The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If the driver does not report its status within a defined timeout period,
the system automatically proceeds to attempt entry into the next preferred
mode.

This series was tested on an Android OS device with kernel 6.16.
This series depends on the 'USB Type-C alternate mode priorities' series:
https://lore.kernel.org/all/20250905142206.4105351-1-akuchynski@chromium.org/ 

Andrei Kuchynski (5):
  usb: typec: Implement mode selection
  usb: typec: Expose mode_selection attribute via sysfs
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result

 Documentation/ABI/testing/sysfs-class-typec  |  11 +
 drivers/platform/chrome/cros_ec_typec.c      |   9 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/altmodes/displayport.c     |  19 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |  10 +
 drivers/usb/typec/class.c                    |  37 ++
 drivers/usb/typec/class.h                    |   4 +
 drivers/usb/typec/mode_selection.c           | 345 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  25 ++
 drivers/usb/typec/ucsi/displayport.c         |  10 +-
 include/linux/usb/typec_altmode.h            |  11 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 14 files changed, 516 insertions(+), 8 deletions(-)

-- 
2.51.0.384.g4c02a37b29-goog

