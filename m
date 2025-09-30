Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD4C19D8AC
	for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 01:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195463; cv=none; b=Mc4oDILNYndCWaeiDsJi8H81fgFUhchbd4SBZ7+XcF+WA44cPf+xtY7jsc9TzY2O9KdBBS0jtnivU76dVE4ZiINnXi8Xb0CdxgAoNLfmxgYfeccI0GS0A1LUAbHcQAl0BfaSPQNgmVOUU2oOaRRqL8SPOB8BnqFNAP2Dnsat0uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195463; c=relaxed/simple;
	bh=5kgCx0B7GtxQuKmjJS2bFCsfsTvnnLoF8qyM/AecsgU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pB9zvq64L1DfhQ5JGJ1NgrPUQNm00GPto41Eh7sOeOLcIVB92J//cQc0N/ke6W3TJL/box+6h0C2zr2EvgzA3feTq6QcKmhstUzySMGc/l4Y7O26xrpMXbM1vad80Y3FZ8asawyeJZXpMcrSwF/3QK6sRFg6dlmLOwY2ZcO8h5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eJ+39MpN; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eJ+39MpN"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32eb2b284e4so8423954a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 29 Sep 2025 18:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759195461; x=1759800261; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J0RDHcxeZue32qFdwYRcgYnakUkcEXPAGHJR7B+xksM=;
        b=eJ+39MpNnfGXav+tZ8M2O8bB7g/pCUwHuJvefDKfdFopNGTdVjBDBlUlzYqhTbJOzx
         VaGv2Xyi2dZc2ScS6mLsJkLYTLayL5ObVDQj8NITos1gOK4l7XDyCg2YBhH2CnHaMVdr
         +V/cqMtZuoa90sEBvDlYHDB/zao0c2dUalGOHyYZ66kzZFfOwAcAMfyiBiLUb6RVPBO1
         mf2zCGRVLXc3jAqDbQR1le+qUnGNh4PZr8xxUhVpHZbF0bRPgEKI2/rquFwcbSQIgSRU
         KyVMxD8YVnF1TbDsUPcgTmoVw/4Pw5T3pVeuR6aJgkEG+WHZ+LpodxBLQNjPDHBVMDTm
         rTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759195461; x=1759800261;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0RDHcxeZue32qFdwYRcgYnakUkcEXPAGHJR7B+xksM=;
        b=s7SdB1mK+OXQKl9yKPz25h/zZ+PT+ZndKRis7iPufQpuvAemmUlXNHPQq5B2Y0A/uu
         fy0RADybX9GeKOzQHWLWp+opPtGUFcFHaaHv0mRu56EZsGPtlClz9/F1qVH7KlP5LpDu
         bcn5eSIbVx+rbHVe71PSpnHQI4LpEKCDFGrF5ntrYnP8sfoRVTQUCG91aGtgADNH8IOa
         jysbaAoNsKkPM38BxQXyf6egj0UYLMD9W3UQ0zIdybAfrVjjQ63gDbNr7Xm10SrIgxV5
         bL4Yu3baRd9up5Oysjrr5pZN4H/3xyxFkTe0vrn6GYdZhBaNKRsKkXhqb/zhD/NRLoIC
         X9/g==
X-Forwarded-Encrypted: i=1; AJvYcCUiDLv31uf94fnChml8mNzQaVCJWem7W3w/LlQN/G4u/UXCo4bCxMQPC7n0gJxe3X+9R/crVw4X1hBR0lR4P1c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi0+vfqT5EReLVLGsjd2yQUM4FSxrbFZDNEExYpwLYnuf16c0J
	f84ghRi1Hn+8YMIN4UzWtfzmv/IhMn7UaMN3qJiLDsKKnd1o1tVi6OUdYwvIxE5QZXEmaxA92+q
	/6+pJoA==
X-Google-Smtp-Source: AGHT+IGhtXfXwA6L9GaEPTI+0jBf9HTCFAgbC0xjyvLvK7pztlQGMoyItS01pkGETX20SLH0jVALCpowLV4=
X-Received: from pjqd1.prod.google.com ([2002:a17:90a:a681:b0:330:9af8:3e1d])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b4f:b0:330:6d5e:f17b
 with SMTP id 98e67ed59e1d1-3342a2ab8c5mr20908027a91.21.1759195461383; Mon, 29
 Sep 2025 18:24:21 -0700 (PDT)
Date: Tue, 30 Sep 2025 01:23:45 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250930012352.413066-1-jthies@google.com>
Subject: [PATCH v1 0/3] Load cros_ec_ucsi from OF and ACPI definitions
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

Jameson Thies (3):
  dt-bindings: chrome: Add Cros EC UCSI driver
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
 drivers/mfd/cros_ec_dev.c                     | 38 ++++++++--
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 25 ++++++-
 3 files changed, 127 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.570.gb178f27e6d-goog

