Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CADA7E9
	for <chrome-platform@lists.linux.dev>; Mon, 20 Feb 2023 01:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC275C433EF;
	Mon, 20 Feb 2023 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676857739;
	bh=kb1UU7unL1acglpBqDm3UU3EWpPhCfV8lkh5RKnetHw=;
	h=Date:From:To:Cc:Subject:From;
	b=QhQvoIH0UXCFYutT2dF5Sun+7S+1/Y9CMRqBxT4/p+l7wVsDZuMhMGD42ceB+5aZt
	 Y6hu2p4GxyDegOr713KFBrYi4E1+xR6bgKdyDwqYWLNIUWMyQrYAqgQZ6FfA1aycCw
	 vhQuXZM9PLucjI0Pkmv2hDmtlAJzgic7LC+frnTs1LoBuSCBXMN+WhgqLXW8xm34Kj
	 pM1NQ3z/ZKpvbvw5zL9/HqdLOBvNS4zNIwGcQk4pK997bW4CyQVOLXlHEUdPc2u9g1
	 1hIip4M9eBvNQE7G5SmplGGUE9PqIntrQqMPL/hfbj98hUanV0ex8r5iA6r0caPiYr
	 8e9gwDXWk9W9Q==
Date: Mon, 20 Feb 2023 09:48:55 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [GIT,PULL] chrome-platform changes for v6.3
Message-ID: <Y/LRh21+yCg0Qh9x@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1XdU4acN/yCh4Lj0"
Content-Disposition: inline


--1XdU4acN/yCh4Lj0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull chrome-platform updates for v6.3.

Thanks,
TzungBi


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.3

for you to fetch changes up to b0d8a67715dae445c065c83a40a581d6563a341f:

  platform/chrome: cros_ec_typec: Fix spelling mistake (2023-02-08 18:21:03 +0000)

----------------------------------------------------------------
chrome platform changes for 6.3

* New drivers

  - Driver cros_ec_uart for ChromeOS EC protocol over UART.
  - Driver cros_typec_vdm for USB PD Vendor Defined Message.

* Improvements

  - Preserve logs as much as possible when EC panic.
  - Shutdown to refrain from potential HW damages when EC panic.

* Fixes

  - Fix DP_PORT_VDO to include DP_CAP_RECEPTACLE.
  - Fix a lockdep false positive.

* Cleanups

  - Use sysfs_emit*() instead of scnprintf().
  - Use asm instead of asm-generic for unaligned.h.

* Misc

  - Rename module name from cros_ec_typec to cros-ec-typec.
  - Minor fixes.

----------------------------------------------------------------
Andy Shevchenko (1):
      platform/chrome: cros_ec_proto: Use asm instead of asm-generic

Bhanu Prakash Maiya (2):
      platform/chrome: cros_ec_uart: Add transport layer
      platform/chrome: cros_ec_uart: Add DT enumeration support

Chen-Yu Tsai (1):
      platform/chrome: cros_ec: Use per-device lockdep key

Colin Ian King (1):
      platform/chrome: cros_ec_typec: Fix spelling mistake

Marek Szyprowski (1):
      platform/chrome: cros_ec: Fix panic notifier registration

Prashant Malani (15):
      Revert "mfd: cros_ec: Add SCP Core-1 as a new CrOS EC MCU"
      platform_chrome: cros_ec: Add Type-C VDM defines
      platform/chrome: cros_ec_typec: Stash port driver info
      platform/chrome: cros_ec_typec: Set port alt mode drvdata
      platform/chrome: cros_ec_typec: Update port DP VDO
      platform/chrome: cros_ec_typec: Move structs to header
      platform/chrome: cros_ec_typec: Alter module name with hyphens
      platform/chrome: cros_ec_typec: Add initial VDM support
      platform/chrome: cros_typec_vdm: Add VDM reply support
      platform/chrome: cros_typec_vdm: Add VDM send support
      platform/chrome: cros_typec_switch: Use fwnode* prop check
      platform/chrome: cros_typec_switch: Check for retimer flag
      platform/chrome: cros_typec_vdm: Fix VDO copy
      platform/chrome: cros_ec: Add VDM attention headers
      platform/chrome: cros_typec_vdm: Add Attention support

Rob Barnes (2):
      platform/chrome: cros_ec: Poll EC log on EC panic
      platform/chrome: cros_ec: Shutdown on EC Panic

Robert Zieba (1):
      platform/chrome: cros_ec_uart: fix race condition

Tom Rix (1):
      platform/chrome: cros_ec_lpc: initialize the buf variable

Tzung-Bi Shih (7):
      platform/chrome: use sysfs_emit_at() instead of scnprintf()
      platform/chrome: fix kernel-doc warnings for panic notifier
      platform/chrome: fix kernel-doc warning for suspend_timeout_ms
      platform/chrome: fix kernel-doc warning for last_resume_result
      platform/chrome: fix kernel-doc warnings for cros_ec_command
      platform/chrome: cros_ec_uart: fix negative type promoted to high
      platform/chrome: cros_ec_proto: remove big stub objects from stack

Victor Ding (1):
      platform/chrome: cros_ec_typec: allow deferred probe of switch handles

ye xingchen (1):
      platform/chrome: use sysfs_emit() instead of scnprintf()

 MAINTAINERS                                    |  10 +-
 drivers/mfd/cros_ec_dev.c                      |   5 -
 drivers/platform/chrome/Kconfig                |  12 +-
 drivers/platform/chrome/Makefile               |   4 +-
 drivers/platform/chrome/cros_ec.c              |  15 +-
 drivers/platform/chrome/cros_ec_debugfs.c      |  25 ++
 drivers/platform/chrome/cros_ec_lightbar.c     |  14 +-
 drivers/platform/chrome/cros_ec_lpc.c          |  12 +-
 drivers/platform/chrome/cros_ec_proto_test.c   |  13 +-
 drivers/platform/chrome/cros_ec_sysfs.c        |  40 ++-
 drivers/platform/chrome/cros_ec_typec.c        | 123 +++------
 drivers/platform/chrome/cros_ec_typec.h        |  85 ++++++
 drivers/platform/chrome/cros_ec_uart.c         | 362 +++++++++++++++++++++++++
 drivers/platform/chrome/cros_typec_switch.c    |  16 +-
 drivers/platform/chrome/cros_typec_vdm.c       | 148 ++++++++++
 drivers/platform/chrome/cros_typec_vdm.h       |  13 +
 drivers/platform/chrome/wilco_ec/sysfs.c       |   3 +-
 include/linux/platform_data/cros_ec_commands.h |  69 ++++-
 include/linux/platform_data/cros_ec_proto.h    |  24 +-
 19 files changed, 846 insertions(+), 147 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_typec.h
 create mode 100644 drivers/platform/chrome/cros_ec_uart.c
 create mode 100644 drivers/platform/chrome/cros_typec_vdm.c
 create mode 100644 drivers/platform/chrome/cros_typec_vdm.h

--1XdU4acN/yCh4Lj0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCY/LRhwAKCRArxTEGBto8
9MbTAP9dKmquzJ0L+lYmEsA0iiYuZtawuVGk1IeJbACpbeC+5QEA6SwK5e7NyDth
fcoJE5naNCuIun55Pn7u8PGPmYacJwo=
=f0vj
-----END PGP SIGNATURE-----

--1XdU4acN/yCh4Lj0--
