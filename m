Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897045948
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073120; cv=none; b=ty9Ms4PFMmwYtCUEx46undRrZE1MvPiE1idhFmLAwKNG3Ie1RpU2r4yjgj4AMb3A5pyIxd0V47+mCGX3gFHJtWMWJcAboKEgrT0vKichD4dvAfp9hAoE2Ykl7KLB80bgQ+/63ebCQqybUL5xy0D1TuMkiduP42RES8K2+9Dvm+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073120; c=relaxed/simple;
	bh=GQbDsygTb/9UgZ2Exo+pqKsRDDQS4dPW2+vlhvnH0pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkmpxO6YkEIDWui0o73CFt4tnYhL8zhS9yLbB4h37qYWCdS/qvFaboiR0r51UL2eJUZQi/2c8dYviDKIOHZ1XbcUml5q+XkyxMABSko7jnoDAZTcgW/eJcaHnOB0YeoCLdYvZ3ol4rXLuPc84tKrzZa9Jc6zpx0Ft/1nqKDsESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTDPJiYh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTDPJiYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E10C4CEF4;
	Mon, 21 Jul 2025 04:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073119;
	bh=GQbDsygTb/9UgZ2Exo+pqKsRDDQS4dPW2+vlhvnH0pw=;
	h=From:To:Cc:Subject:Date:From;
	b=uTDPJiYhFwblyg2jUKoHI8qyJqJVg47W+A5+3s1oRCCIJGEJe3SMkUAjbBkA0ghK3
	 Ld4nmECTgssNWxOAKo/u5MvzRKUrAg2fFyVnBG7yD3ry3XxqqBrnmZTdi7SlowItl/
	 n5rkhqgj1s2FgFe0zdBRDVQN2hJg/deeC6uGSVdE+yNafucwZrsBBuJgKIqGIid+8l
	 AR43HS3Sz5Uhwwrmdw2ICJvfxa+HETgoIjtOMzt0aHJ38JtrjcAkkOpvM0icTmljBT
	 iHA1ixZ5mzzHwaRKDRPhEgPeledy2wTGxyVV3kcLcBebKevGd1sr1yEm/pjDy6vfCL
	 TsUP5IlE0YwWg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 0/8] platform/chrome: cros_ec_chardev: Fix a possible UAF
Date: Mon, 21 Jul 2025 04:44:48 +0000
Message-ID: <20250721044456.2736300-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up series of [1].  It tries to fix a possible UAF in the
fops of cros_ec_chardev after the underlying protocol device has gone by
using kref in struct cros_ec_device.

The 1st and 2nd patches are clean-ups.

The 3rd patch removes the dependencies of fops to struct cros_ec_dev.  Thus,
it doesn't need to hold a reference to struct cros_ec_dev.

The 4th patch returns an error when trying to send commands through an
underlying protocol device which either hasn't been registered or has gone.

The 5th patch introduces a new helper cros_ec_device_alloc() for allocating
struct cros_ec_device properly (including to initialize the kref).

The 6th patch moves initialization of common utilities of struct cros_ec_device
to cros_ec_device_alloc() instead of staying in cros_ec_register() as the
object is still valid after unregistered.

The 7th patch lets the fops hold the kref when the file is opening.

The 8th patch starts to manage struct cros_ec_device's lifecycle by the kref.

[1] https://patchwork.kernel.org/project/chrome-platform/patch/20250703113509.2511758-3-tzungbi@kernel.org/

Changes from v2 (https://patchwork.kernel.org/project/chrome-platform/cover/20250708080034.3425427-1-tzungbi@kernel.org/):
- The 2nd and 6th patches of the series are new.

Tzung-Bi Shih (8):
  platform/chrome: cros_ec_chardev: Remove redundant struct field
  platform/chrome: cros_ec: Unregister notifier in cros_ec_unregister()
  platform/chrome: cros_ec_chardev: Decouple fops from struct
    cros_ec_dev
  platform/chrome: Disallow sending commands through unregistered ec_dev
  platform/chrome: Introduce cros_ec_device_alloc()
  platform/chrome: Don't initialize common utilities when registering
  platform/chrome: cros_ec_chardev: Hold refcount of struct
    cros_ec_device
  platform/chrome: Manage struct cros_ec_device lifecycle by its
    refcount

 drivers/platform/chrome/cros_ec.c           | 25 +++----
 drivers/platform/chrome/cros_ec_chardev.c   | 74 ++++++++++-----------
 drivers/platform/chrome/cros_ec_i2c.c       |  4 +-
 drivers/platform/chrome/cros_ec_ishtp.c     |  9 ++-
 drivers/platform/chrome/cros_ec_lpc.c       | 11 +--
 drivers/platform/chrome/cros_ec_proto.c     | 72 ++++++++++++++++++++
 drivers/platform/chrome/cros_ec_rpmsg.c     | 20 ++++--
 drivers/platform/chrome/cros_ec_spi.c       | 10 +--
 drivers/platform/chrome/cros_ec_uart.c      | 17 +++--
 include/linux/platform_data/cros_ec_proto.h | 10 +++
 10 files changed, 175 insertions(+), 77 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

