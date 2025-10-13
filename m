Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4930E837
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387658; cv=none; b=nUcMohQWmJEljoIbKookBTI6baaKevNnaELyJ3obd+bsMGPpwGbPrb0H2PHTSk4PIL52iesdLXVxRf1fVjo1UvCMCYtxiqSASCQd//dun0xIXB8uUa5yigYqxO7USt9IlOXs5N58bT9RZ993S1UAbn15Y3VGO0UeIQDiahVwSz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387658; c=relaxed/simple;
	bh=8DcttytX6iOcJih/ka1yRgr3crh9eIzrXQKR3igm7Lg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bXQofRY5KV8kSXgGoOwGuhvho0UJUL1cp2NXKL3GVjm6MXbZX5+ZsWncnS4a84vQnhQQ3FRflJkl6uPUeNIWYcrJ8IhVf8cgO1EBiuSRyF86VWf6vHb5inOZFCPDJm0awEEKMxmQswcWJry2pIHWPDLgfl94c5lH2pzRkaVdrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lBS+Otwl; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lBS+Otwl"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b57c2371182so8765105a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 13:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760387655; x=1760992455; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gzVF6HNpn2hAJ5LJ+570UzK5DdagInVxIleQtzZcUJs=;
        b=lBS+OtwlPXfWeM3W1HVgyEnoj6Y+tNHzFSV7LFy9vnrQ21ltJjs1cu7yVTZRplTYLe
         M6gmnNN9R1K90LMjbppqTpBGQ/g9jIe/uQWNcOjoDSEsSyPMpsx5+W1PmAwL2Zm7ZFJv
         XD8o1YrrAIY69e1ZfKhMVHpBWKc8G2SsJ3ikw868qO69kwe3+hX1CkSQfFRtoLxTCHs/
         zfp+t1o18NJeQUY82oksKU5/H13eeC6weFJYgZISMl/Y5glG++3nT6Mag6+zGyfEpbxs
         8rL85tnuPqrwfhWJIFC87SrQ4j3uzKPZXHKGdtc5FuPHFi5jbA/hSeliAaPcjJgYYGVt
         hASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387655; x=1760992455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzVF6HNpn2hAJ5LJ+570UzK5DdagInVxIleQtzZcUJs=;
        b=AGSzQHXSGw7FMaXqbIBpvDdQEgutW0/KdgI4Cdz+qC39zQJpKkoZF4n0qPbNScYWxv
         P3pXBhaZiekmx0of6nSDU0E9IUkq2m7FMqDYV8kwbBbIsTwCW8YHZDhG84WyGwpnmY2d
         InnUNgSuRW0U+BUv+r6WvQ3X5IJVx8m8OaALX7eL8GYMx0W+4rVHAdS0TiXyROcZtYnV
         pXWPSfppulRCDu5XDajAPGwZUwx+eF3r4Q4v6LDFxwMgksAo8POjLVBOnEjdHKtXuU6u
         tc1/31TYsNAGeisJKvS8+FpEHe+hpVJfshMuifzMZoGno42f2yhVBq0dDGUMqS8b7SOX
         9juQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEnF7xQkUCY76DNIEO/3XVXGHeMGFKvOq78RqKXkpUP+W99ivDoWX/rkNwV5kgAWXGkeqrnP/Tm5DoBqDUKfc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDaKZWq0eprale8nqZvYpFms7FUwD3YM7Gf2UxIfU9mrKNEd02
	EdvtI0cUIL1Gq5+fFNBA/0Fo3pALn72CfL7KDuU6QWALdp5bVbqqhAGWqutThPQAOs+cFKgLHxi
	bSSj6Ag==
X-Google-Smtp-Source: AGHT+IEO0H8VOrl7rO9YgvD5W2tsbiRTiwbuvZNbI49DJaTkZ4i17mjzWbSsXh42QUoIRnQxN/BE4fZCes8=
X-Received: from plblq12.prod.google.com ([2002:a17:903:144c:b0:290:28e2:ce43])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2343:b0:28e:7f50:5d80
 with SMTP id d9443c01a7336-2902721336cmr301182395ad.7.1760387655190; Mon, 13
 Oct 2025 13:34:15 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:33:24 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251013203331.398517-1-jthies@google.com>
Subject: [PATCH v4 0/3] Load cros_ec_ucsi from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org
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

v4 changes:
- added comment in cros_ec_ucsi probe explaining how the parent device
depends on how the driver is loaded
- updated commit message of patch 3/3 clarifying the expected why
cros_ec_ucsi doesn't need to be added as an mfd subdevice when
an OF/ACPI node for cros_ec_ucsi is defined

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

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++---
 drivers/mfd/cros_ec_dev.c                     | 23 ++++++++++++----
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 +++++++++++++++++--
 3 files changed, 57 insertions(+), 11 deletions(-)


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.858.gf9c4a03a3a-goog

