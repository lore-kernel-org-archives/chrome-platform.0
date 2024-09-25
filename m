Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB911BC2A
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281517; cv=none; b=orSgFTd/SYXpemeTDd7qmO9aoUQuR13fE+MeYThLrT/QNYttyAbBrTAFW8B/bgnxhU2Hm2aT4rQgBFVqMyBOaLmIxmA4eU4OtrkE/yIhFtco2HRKCd509DjEPrBHGr7575+lEe3ag906glbsmqjEcBcpTXjTjtdsYZD1z5Zr10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281517; c=relaxed/simple;
	bh=GJue/+u8mABPlZVbGPZ2WTyeSlPF0P89TcjTAJEqBcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4LEtV4grwiSCB5DsHChIndUToEMCQ0p6DNoaT1FX0cdz7zESHryuFhsWidwblTOvG/bkVeLVy0luINss6c45dMWnAztdxWJN8rIHIevizBAllVP2fR5E4MGAhBsOOARQ6Q9/hKrJuxBb3lDAeKKW4xwJgK9rBFWRFLoUXSqFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LyORZhy4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LyORZhy4"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d87a1f0791so63260a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727281515; x=1727886315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3bnx6Zh4mamf2M1m16i5ArTu3cLGPl0b4fDr+jRputI=;
        b=LyORZhy4Boz6IL/7C0ZeEEsuRs5m5IXkYdy/Kundgu4eAc9YrM9VADiydCpnPvtxhJ
         0yIRs6HXOLnjx/lhbelWy+1e6gymoGRJsSuuhAOoemtGVAJL9kQF9uWCOEEtb9h+PhdN
         DZCRQCiyT5nIjYbdWVSpgJwTjCpvO6wBA28gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727281515; x=1727886315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bnx6Zh4mamf2M1m16i5ArTu3cLGPl0b4fDr+jRputI=;
        b=CIYnW3NNGER6EV7s3AanlKWbEndZK/oHXct8tHKEs8D4M/PTUBga69nWK1d1ttecGU
         SDTh7B0rFNG5t/Wlg7aB2zRqRZL1ZFIsHBxdi7QvQFUttC5xR/zMVGteHaODSTpe0x2H
         PgFBqx8cQmq/B8CmWsDwmuqWZcPKN7PaWYqc3gRf/xwNddfkWOQR653nvdOP46hUUSLl
         k4ziXN60XQy+lkjDAO9uO1zTQuEukDFCuR3II+qEAM1+UK32IW7dwrZwKffNRldJNp8i
         +lmzO4A7sHWvLCMcyd5mf9Q/a2alP6oeWG4i4YTahy5UE/DhV9CKwjrQ+zcpOr8lXEiH
         BWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8DC3OTZx4nqxnatUWM2I8x1iR4S2+b8pwr4O0gA+7Kknrsu9p5O/eT8YgSJVtZWQmWhBzSEBZFtOYudwfnNc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdJk7UVRp8NPpbjENn9pyH73Ynfw+ekr4x+s+Uwnw4c6XH0S5U
	OSoXbPGlBRq3FWdZmjpDBwO8c8y2+rWGs1Luozzk8aa/BF5JCBy7am6M+LxdrQ==
X-Google-Smtp-Source: AGHT+IFmomGt1zx36Co4VLTbp3ZotqkB//xP4LtEBzby9ndEonhFlY1+uOXpqHVO3DCfXwK5T6IKOw==
X-Received: by 2002:a17:90b:3510:b0:2cf:eaec:d74c with SMTP id 98e67ed59e1d1-2e06ae5fcf1mr3879528a91.16.1727281514917;
        Wed, 25 Sep 2024 09:25:14 -0700 (PDT)
Received: from localhost (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e06e1ff886sm1728377a91.31.2024.09.25.09.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:25:14 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org
Cc: jthies@google.com,
	pmalani@chromium.org,
	akuchynski@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/8] Thunderbolt and DP altmode support for cros-ec-typec
Date: Wed, 25 Sep 2024 09:25:01 -0700
Message-ID: <20240925162513.435177-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
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
  or AP-driven from userspace (via the typec daemon). Thus, we never
  expect the kernel alt-mode drivers to auto-enter modes.

This was tested on kernel 6.6 with a ChromeOS Brya device and compile
tested against linux-usb (with allmodconfig).

Thanks,
Abhishek


Abhishek Pandit-Subedi (7):
  usb: typec: altmode_match should handle TYPEC_ANY_MODE
  usb: typec: intel_pmc_mux: Null check before use
  usb: typec: Auto enter control for alternate modes
  platform/chrome: cros_ec_typec: Update partner altmode active
  platform/chrome: cros_ec_typec: Displayport support
  platform/chrome: cros_ec_typec: Thunderbolt support
  platform/chrome: cros_ec_typec: Disable auto_enter

Heikki Krogerus (1):
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 Documentation/ABI/testing/sysfs-bus-typec     |   9 +
 MAINTAINERS                                   |   5 +-
 drivers/platform/chrome/Makefile              |   3 +
 drivers/platform/chrome/cros_ec_typec.c       |  55 ++-
 drivers/platform/chrome/cros_ec_typec.h       |   1 +
 drivers/platform/chrome/cros_typec_altmode.h  |  48 +++
 .../platform/chrome/cros_typec_displayport.c  | 247 ++++++++++++++
 .../platform/chrome/cros_typec_thunderbolt.c  | 184 ++++++++++
 drivers/usb/typec/altmodes/Kconfig            |   9 +
 drivers/usb/typec/altmodes/Makefile           |   2 +
 drivers/usb/typec/altmodes/displayport.c      |   6 +-
 drivers/usb/typec/altmodes/thunderbolt.c      | 322 ++++++++++++++++++
 drivers/usb/typec/class.c                     |  34 +-
 drivers/usb/typec/mux/intel_pmc_mux.c         |   9 +-
 include/linux/usb/typec.h                     |   2 +
 include/linux/usb/typec_altmode.h             |   2 +
 16 files changed, 918 insertions(+), 20 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/platform/chrome/cros_typec_displayport.c
 create mode 100644 drivers/platform/chrome/cros_typec_thunderbolt.c
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.46.0.792.g87dc391469-goog

