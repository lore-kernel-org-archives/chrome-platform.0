Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA3134AB
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971800; cv=none; b=dUWPivo1fQBSP8FGiJrTaSDw07NwTFawu0V/iWthYQbMHJLUyqNkYU6qxFQ5t3SrFff3tKWm/KPHJl8bZVxRYwB8kR9uJA73eKQEX+hk9casUo4jJ5bxNR0F+jaui1PhLxugXJNa06AmVWTS8zm303C3ncSFJJV533Wa65VDADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971800; c=relaxed/simple;
	bh=UVEbaZKRJ1LV6jOrWQZHeNwiTFK7Bny9uchXuSQMfiI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LxQBXAwDYtQyxolPHDc0rDL9ax4R3KMZWXHcwuRGB9gmEbUVXm9NOeuRdyvy8J1DDLTgJDHw1V7i7zpN6yvHW6Yo5ZOtDN7y46RfgnJK7/rE1/VeUCLDgn3lW7wuXuhEdt/ElI9ofIzk1xybqIu7QWKkR4Pi3WF6ApOWLOTnSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CDXJfsGr; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CDXJfsGr"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so709299a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Oct 2025 18:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971798; x=1760576598; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+jfxdpog7qXbji4SutVkM+hfLqi/HKH+DHfYf9r2Ww=;
        b=CDXJfsGrn4vJBdBPR9marS0h7H3NIMXGRr2OxxXcftnopelqkP3IwrixiPR66CCCwl
         oOeFYK8mpF7glDwU+8W2NKEalSWQpc3lKsP9uOR5nWaa66jMgQcS2Iw85WD8MRLPygR2
         +4UkWCP//k/eB0KWw59dsCetmjdtUhuGgUk+Tz8Y5J66oN9NVXHNf3QIJDi9IhHiBFzk
         GtzWNgRSH3uFAp1dxlJNGLnVz/IAa3P3+NPzcE237A7A9L61jESF6ogXsoaeJDxOUzCE
         t/wSqPEUltj4UebappSi7U9EdyDiOM6BDgWbky1aY+tHTF9AokH64r5IiWR/jT+vcL1/
         D+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971798; x=1760576598;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+jfxdpog7qXbji4SutVkM+hfLqi/HKH+DHfYf9r2Ww=;
        b=B/2on6APYmpahdvvHu6/PXFnX59Ax5R70/dOrZUOdzPY5mCY+hjK3XsHq/5IQwKqcr
         d6fOuCULgvT9uaaXuqr7PCnuPu65+zclHVeZjONg/ABCKYakMbeAmNh+8W9hG9Y1k6nD
         EqZSeL3D7/SAX9iwBaAivdXEOxbyRJ3f6+53ydeRq2rcmxkK4fyFdgU23HS2GceVngnc
         XFkysU5iHuXvu9OLQSRnUzPW+mJOAzbZuQ6Nw9/CvBEa0NojK8ZtLuMmYbWIZoLvDiL2
         5p21PuIAW8E9/SbAxfHX1OQsF0LSeOsnvDvoJmcHZtaZo8eC56n7bYceNhEWnDg8GczK
         QMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1AhzO/Mdd/EPqT02YcaGV+2/rHAcKUBRQQ1/kZkdfRXc1hGW7UbZ4S/xlQyHCJqpg61/p+DwUSTa+kuNnAVA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl1fOWApQSmxKfAWi6TR22dA9oEWQmmIFKFRM/4sSU+51JU9Xj
	kWqhCZ6GjIrjqgo7BjIFU9GzfIqb+71Q2dgy/K3Ars6YpSGtheiUUP+VSqvigmyqy+NyPds0YG7
	6xGQKFg==
X-Google-Smtp-Source: AGHT+IFKeWug9rAoNWt532znqpIGqG7Ud1apMC9xL48ZMgTXDMtnDoVUWtywIYBEaSmh/SWSXS3sAjCWOc4=
X-Received: from pjjj2.prod.google.com ([2002:a17:90a:602:b0:330:72b8:fcc0])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d08:b0:32b:6151:d1b
 with SMTP id 98e67ed59e1d1-33b51105a79mr7357200a91.8.1759971797841; Wed, 08
 Oct 2025 18:03:17 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:05 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-1-jthies@google.com>
Subject: [PATCH v3 0/3] Load cros_ec_ucsi from OF and ACPI definitions
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

v3 changes:
- adds cros-ec-ucsi compatibility string to google,cros-ec-typec.yaml
  instead of defining a new binding.
- updates maintainter list in google,cros-ec-typec.yaml
- cleaned up assignments to udata->ec in cros_ec_ucsi.c
- now using acpi_dev_found() to check for ACPI node in cros_ec_dev.c

v2 changes:
- updated google,cros-ec.yaml to support typec ports defined by
  google,cros-ec-ucsi.yaml. Tested with make dt_binding_check
  and dtbs_check

Jameson Thies (3):
  dt-bindings: chrome: Add cros-ec-ucsi compatibility to typec binding
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++----
 drivers/mfd/cros_ec_dev.c                     | 23 +++++++++++++++----
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 22 ++++++++++++++++--
 3 files changed, 53 insertions(+), 11 deletions(-)


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.710.ga91ca5db03-goog

