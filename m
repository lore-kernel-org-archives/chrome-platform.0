Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883FA2727FA
	for <chrome-platform@lists.linux.dev>; Wed,  1 Oct 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347232; cv=none; b=GkJsftOBTyZArJMZx2YjH/MtnKsbulRps+zFClB8X9nPF3xVyxX+NPEk9ExgmH//zzyHlbrqPiCwSjfBCe+FWot8iltvhI/jsQHvSSh6X8XZBXwWpInpbx9dvRfNLQVZQfSVxjRsSnrej/hfTRu3itjfPEcHUqixIe5Mvff3q1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347232; c=relaxed/simple;
	bh=oMlT0rSozXjZZ7YPGdWknn8R0T/lM0GFdFoB9iHdVUM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nOOKw+5xAmjo3N+fD/nGNtTwUNX/dkA2vLQ6abmN1xGeufZhloyUS7UEragCm2YE/MZPRpLII5c9lhYrgGSkDi6agJ0FJ6R+2H3zyIR3Og9J88THzPL/knV04D2X9yJ2c0OqsJAWyMRG/P5dFSp+04olz2uga1B0khCIK2q0MF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U0d5DorO; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U0d5DorO"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-27356178876so968035ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 01 Oct 2025 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347230; x=1759952030; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U7URaJzWJaVTawsdlY1mWcQUZJgD58fTnHuXHAWwV3k=;
        b=U0d5DorOCNI1tuM+R+RSi3hSLEvGN3oCHHMGtbUfdgN66p6W/g0cACYYO/XmtECiYQ
         C5cZO4yRkQJebDgj3lemar2BciKMDyOW8PMzvjJfyDgl11o3q4A19LY/rhX3anUflIYJ
         GYR8Zw20bXq71sAgPZV8gnFIeQJmVo+B1floaQ4mHFj9Qo1QJkhAqHcOQjBVqwySR/0h
         GvTuVo4lACY2/ucMCwsfciCVP0yRqY4XRyxd4b8WrVg2Z6sV413Kr9+NI9C0CKdD8vsv
         zpDTWl51FctjlguE63YrFFX/akXZqJx3Hndd9habhrniwHMuIW6yi1TuAmJIpQgV/qKy
         Knew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347230; x=1759952030;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7URaJzWJaVTawsdlY1mWcQUZJgD58fTnHuXHAWwV3k=;
        b=qN68gsN7wk6EisNo4bgJOHwncorQ3q3liup0DbNKNDLWZ9WhI5SruxL8GNe0BVhUen
         9mlHBgbxMeWXBfwEGjsDA8g8/PPIpbJmaBOKw8mWNezZAg/eD3N5pJGiA5zm1a+Bk2ed
         hkxYBoXV2gpKxDG9r8arovTJ2a41e8Z2tHLuVJF1jI/+niBWnnT8HzMULnyk8+fYEiUA
         WbaP6lBFVHlxd8LT5NMJyyEdTUQkusH8fAVhC+8/9myjbqafBFPEs7KmLNxSmhS9b5P4
         KedXVJYoLY1hRgpqcNhnatTHLXEIcPzRBzj9wwEmuK8lAH7milqTurWkkCJW0Qgamtl9
         ph6g==
X-Forwarded-Encrypted: i=1; AJvYcCU4yEEHlbUqGkgapzUDOxE2o+/cm1TYtVWfTCM+oYbNnISidkP70Wnb2WeCTzZsuSaL06tkJWR2qs8etBOLR2U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4/wYTasiPvzm0M3j7S3V9r/MngCkJzdPyvpLDVaM37ggMz6SG
	WMaP3ke3FNAoGXY+LlHrrGMYgO54SKMoJlSKnaopJ1G/RSSX/uA9aXTMz0Pbp1MPC2126QjPPB8
	AEZ6t+w==
X-Google-Smtp-Source: AGHT+IGkH0qUr//bkgYHfKtx7Vcs5BLj3vf2rBk7ho44eq/0TLPPDY1HD1e7BnRuPnvuJrQBf8vM8fjNLiY=
X-Received: from pleb9.prod.google.com ([2002:a17:902:d409:b0:260:3d:8a7c])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a2e:b0:277:9193:f2da
 with SMTP id d9443c01a7336-28e7f27dab1mr62308035ad.5.1759347229875; Wed, 01
 Oct 2025 12:33:49 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:40 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-1-jthies@google.com>
Subject: [PATCH v2 0/3] Load cros_ec_ucsi from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

The ChromeOS UCSI driver (cros_ec_ucsi) currently gets added as
subdevice of cros_ec_dev. But without it being defined by an ACPI
node or in the OF device tree, the typec connectors are not correctly
associated with other part of the device tree. This series updates the
cros_ec_ucsi driver to load based on device definitions in ACPI and OF.
It also changes the cros_ec_dev driver to block adding cros_ec_ucsi
as a subdevice if it is defined in the device tree.

For context, I initially sent out this series for review in March 2025
(https://lkml.kernel.org/20250312195951.1579682-1-jthies@google.com/).

Patch 1/3 has been updated to address comments from the initial review.
There were some open questions on patch 3/3 regarding adding MFD
children when there is no cros_ec_ucsi node and parents conditionally
checking if a child exists to create one.

The expected behavior of this series is to only add the cros_ec_ucsi
subdevice when there isn't a corresponding FW node because always adding
it would result in multiple cros_ec_ucsi devices and too many ports
being registered with the USB Type-C connector class on devices with
correctly defined FW nodes. It also does not look for a child node to
create a child. It is looking for a child of the parent EC device to
only add cros_ec_ucsi if it does not already exist as a sibling.

v2 changes:
- updated google,cros-ec.yaml to support typec ports defined by
  google,cros-ec-ucsi.yaml. Tested with make dt_binding_check
  and dtbs_check

Jameson Thies (3):
  dt-bindings: chrome: Add Cros EC UCSI driver
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |  4 +-
 drivers/mfd/cros_ec_dev.c                     | 40 +++++++++--
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 25 ++++++-
 4 files changed, 132 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.618.g983fd99d29-goog

