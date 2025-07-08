Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D006226D17
	for <chrome-platform@lists.linux.dev>; Tue,  8 Jul 2025 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961764; cv=none; b=NoEgjvkSIzQnAUECrLKntquzY+oAyEE7Qs0dt62wr4lBa+9cnJzXdt5THEH1Fx15XmjppwxqfBLhDoy+9RolVINUvZG97l+aIDuTR0U1zl9XUUhm/QMXSCh74/AEyxnaF/SAIEQbbzmiROB5+u18i271opSMM7d9M/PMcy3idh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961764; c=relaxed/simple;
	bh=2LmZnjlc1FtcFaQYTclGimNqcpjzvN9TeFU8L3IXCSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfxM1ROrZlTybYCe540rSzD0RN/aXqPCVVd+6ANALA3n+ynMABtX/ocLpThaDCMBWMucE43BeJxdmeQYyQYonJyKV7uPt5bbDZUIM3Y8FBFWgOLoHGf9jn8t/jp8g78e1rlFORegsLPr597KBQdE12bQmrpJ5Ov8y+3ZWSxbLzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHdmVIEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHdmVIEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423D1C4CEED;
	Tue,  8 Jul 2025 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961763;
	bh=2LmZnjlc1FtcFaQYTclGimNqcpjzvN9TeFU8L3IXCSQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MHdmVIEvCaqmkaE8WQUj0RbyIy5gJE8DqvQQXG2md2kQPzSBE11I/A/XVeWcEmdrf
	 2L0YazFFThKy9YhSQN50NM0aIJTl2wbrAVDJuIDI+XONYsb1aslABDc91VTSCtrw8m
	 23drX1wjSOwBLFI/loG203L4GEc5cWJJsvMX2GF0pqDaHV3vC1YlpIWimjymsla700
	 WuSqD3ZGyAUUgYdb/ChXoUOuft/qJQdrVIxJWODGNGVSfuuECPLavOFc387MjwqnEC
	 ZXBnBqX3abNr5YC/lqOuEPiG9NCRQFc/Vu8IgDigKuUTGr3bWIQku+W3MPRYon4bEs
	 RpUwXYkNnVAkQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 0/6] platform/chrome: cros_ec_chardev: Fix a possible UAF
Date: Tue,  8 Jul 2025 08:00:28 +0000
Message-ID: <20250708080034.3425427-1-tzungbi@kernel.org>
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

The 1st patch is a cleanup.

The 2nd patch removes the dependencies of fops to struct cros_ec_dev.  Thus,
it doesn't need to hold a reference to struct cros_ec_dev.

The 3rd patch returns an error when trying to send commands through an
underlying protocol device which either hasn't been registered or has gone.

The 4th patch introduces a new helper cros_ec_device_alloc() for allocating
struct cros_ec_device properly (including to initialize the kref).

The 5th patch lets the fops hold the kref when the file is opening.

The 6th patch starts to manage struct cros_ec_device's lifecycle by the kref.

[1] https://patchwork.kernel.org/project/chrome-platform/patch/20250703113509.2511758-3-tzungbi@kernel.org/

Tzung-Bi Shih (6):
  platform/chrome: cros_ec_chardev: Remove redundant struct field
  platform/chrome: cros_ec_chardev: Decouple fops from struct
    cros_ec_dev
  platform/chrome: Disallow sending commands through unregistered ec_dev
  platform/chrome: Introduce cros_ec_device_alloc()
  platform/chrome: cros_ec_chardev: Hold refcount of struct
    cros_ec_device
  platform/chrome: Manage struct cros_ec_device lifecycle by its
    refcount

 drivers/platform/chrome/cros_ec.c           | 13 +++-
 drivers/platform/chrome/cros_ec_chardev.c   | 74 ++++++++++-----------
 drivers/platform/chrome/cros_ec_i2c.c       |  4 +-
 drivers/platform/chrome/cros_ec_ishtp.c     |  9 ++-
 drivers/platform/chrome/cros_ec_lpc.c       | 11 +--
 drivers/platform/chrome/cros_ec_proto.c     | 53 +++++++++++++++
 drivers/platform/chrome/cros_ec_rpmsg.c     | 20 ++++--
 drivers/platform/chrome/cros_ec_spi.c       | 10 +--
 drivers/platform/chrome/cros_ec_uart.c      | 17 +++--
 include/linux/platform_data/cros_ec_proto.h |  9 +++
 10 files changed, 153 insertions(+), 67 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

