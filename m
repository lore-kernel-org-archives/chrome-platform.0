Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715971DE8B3
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809613; cv=none; b=hKgah+T5yDhj57qO9WWyXRym8GlIhuFizxRsDMYISFSZ+EN7BU+P3si1Jhp22ZT26UUOtuicyqBQZ+tU185I7sGDmJo4gsb1NaLJCB5p9EwtV3Xv3sBCt2nXRs6gt36rSpQimvYVKv3fWlYQGiNf2wFE+waOff+zVg6uttNbhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809613; c=relaxed/simple;
	bh=P5NZbbFKye8GqSKijmH2j8hmBxSuTTWkUAi9/ZWgQC4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GkKgXehOp1npDsrTng7NMrElPqxHMF4u7clVdpaEY5cMLAfCMkvFxVP1+Onxqd3orwQqwSA3m184jWuGZoF9qVqMb3NGsd5JQmhMrOouBCxNNtJtwPPCZGpU6qcw/MzTq7aUU3AR1VT3uYikHMeZVuHs+u88eqJUnXaOnhx54ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K1kSoqxa; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K1kSoqxa"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso408554a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741809611; x=1742414411; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GCtXfZQjeCD3fq5iyjoL5SOi4U37CC2OFkybAtefkLw=;
        b=K1kSoqxae+/Yyz3TluHAUDO8lRNR6yBjWT+mL8T+sLBmTzUSh8wkeHMEyomASNqQBT
         8xwg+HgOdlVof1QtIWhHkNZwsF49OMlyw+nEahhpUaUAeNxJiuYXPqnq6RfM42+Vp3M7
         07pcVmPzLiaspe83aOPZJ4nS2VHDVLx1KsBzmYV6r3tr2YZQ4zvG43jZxt4tyMeamDQc
         GNxKTPBNIX8WQJj5DNiFzC/57I3U7x4PYs2rwGa0k5cEBfhvYwwQVOJ03RTrL0gesL6s
         ENtaDD0RFfPrOGeQ3CxCYp3KaElwrDvcvN+itfDK+7+6DniyF/XLuDWaw5lXsgtuppvw
         DM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809611; x=1742414411;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCtXfZQjeCD3fq5iyjoL5SOi4U37CC2OFkybAtefkLw=;
        b=G7evCvgVFoU5Pw+4tiyMGL07AK1LwPSF+mQ7HzlvEi54mVHQEAd4VSRvcSeGYKLKTQ
         T6YJxhXGivaO2K87W7iijEW4LoQVu4JfCNVPKZU2Tz+W8+S5gRAHurumerLJwHj0bhnq
         bmGs+u1dKdHgZ9JduU66hfMd7ZsEBWlytN0za6WAfN8i91qooF7xNUuRYnqVRf6ClQhv
         lcSKRbIcloBPEKvcynNdlxol7o90cjQT2fo6B3cGCg3CBv7WChIQ11rYz9xUlck2N10o
         vdIevkpQiu8iEqsqMWlEAoOo0Q7lYsC1+AEy8sMqLQRyzd7Lg3bpGSOVWOUFcnQpKrw3
         k0JA==
X-Forwarded-Encrypted: i=1; AJvYcCUebrDwrBXGfjwHQzvRyrt/2Eossr+wqxwIfI7Hoxyb9SaBnxmf9F6y/9mklgBu9KHa7lvxKIZHRF5cDy7eqwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ib5iS/r4TfYBBPabYFwu/UuHIgQAwQLBKfQXWRsjaPoZJHkB
	Y+Dqwi8tceJPM+wEhgw9j2ulTckIilpHt1ADngvqeNWHEMD5HNe3HLYjqa4gz3LHvy3+pJANfwo
	BnQ==
X-Google-Smtp-Source: AGHT+IHv0lWNMl7veaoEBiVdC1it/rtCEXkxkD7IR0gVxFD7q3EHrQjh4nCeL+gbO2bxgEmR+LqkqRyXAro=
X-Received: from pjbpb8.prod.google.com ([2002:a17:90b:3c08:b0:2fa:15aa:4d1e])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fcd:b0:2ee:aed2:c15c
 with SMTP id 98e67ed59e1d1-300ff350ce7mr11396305a91.28.1741809610712; Wed, 12
 Mar 2025 13:00:10 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:59:09 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312195951.1579682-1-jthies@google.com>
Subject: [PATCH v1 0/3] Load cros_ec_ucsi from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

The ChromeOS UCSI driver (cros_ec_ucsi) currently gets added as
subdevice of cros_ec_dev. But without it being defined by an ACPI
node or in the OF device tree, the typec connectors are not correctly
associated with other part of the device tree. This series updates the
cros_ec_ucsi driver to load based on device definitions in ACPI and OF.
It also changes the cros_ec_dev driver to block adding cros_ec_ucsi
as a subdevice if it is defined in the device tree.

Jameson Thies (3):
  dt-bindings: Add cros-ec-ucsi to cros-ec-typec device tree
    documentation
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-typec.yaml | 13 +++++--
 drivers/mfd/cros_ec_dev.c                     | 39 ++++++++++++++++---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 ++++++++++++-
 3 files changed, 68 insertions(+), 10 deletions(-)


base-commit: 9fc83373f0ffb8834da48b1446a5c2fef9525bb1
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

