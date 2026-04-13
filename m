Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F30837CD29;
	Mon, 13 Apr 2026 04:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776055301; cv=none; b=AfzVjvFNcXLTPYXIxiw11NdBgwVH9a47hAnp7ZiUf1kkRYxDmyEQJ439dVF9MV9QHADRuGOgkV+BzqW+FGPT9X8hGZ+hDwJxuf0nxz499DhhZPtb0Fhena7WOMJxdFqHaiaHEQA9/11MDaH5fl/kSPE6Wh+egRHQIA8Bl8Byaaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776055301; c=relaxed/simple;
	bh=0Zb7wIflNXX+ehzh3RATsxalZkXD8FcTgAvMCJY/H3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iG+z4y9FEH/NSEQsCgnSk8njniIXaKGILmNL3FfNII5nkvmRP050w8/Fxg/i1sRrnPkT8qWVxL7Mqdghpbf4rbOuoId8dj17RpmAyvv9x0CGmlD2jVLr4M6Inp0b5HriegbbDkDBkOgzYMj9uH0BLDvi/cY4w9KzKF+MR5zVMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIwtPjmF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIwtPjmF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91C3C2BCB0;
	Mon, 13 Apr 2026 04:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776055300;
	bh=0Zb7wIflNXX+ehzh3RATsxalZkXD8FcTgAvMCJY/H3s=;
	h=Date:From:To:Cc:Subject:From;
	b=kIwtPjmFwh5VmL2Bpg3Ocw+PB3u011iliFIrh6C7NJt2fVKDi1vXbZ8Suv6l5clg9
	 tPQqBUwtuoMgN4UWwwjFMQ3IFCnj3/XgIGliJRcLU86TbUrqZp1HP4Qrmej8958T17
	 90IPMJKBpHCmxBy3NZYS0MSF4hodOWRrQaNFYfH8joPoPIBEtNb/cj5YreW2/5P1IA
	 OzleS7/eeY6y7NPwYmCVspanwt1Cb4KfsmWkvbvHUSDCEpQinSO1m0RWe6pCg7NHeV
	 9irhdoE9bsWjMfU+Dbew+wq+r82tRFphK+WO92eYsUlrscXHBnj2p7kJSIUzrefLLa
	 hX5yg5I79yGzQ==
Date: Mon, 13 Apr 2026 04:41:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform updates for v7.1
Message-ID: <adx0Aa1nOikgC521@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UUhGxiX99aiFqqbR"
Content-Disposition: inline


--UUhGxiX99aiFqqbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform updates for Linux v7.1.

Thanks,
Tzung-Bi
------

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.1

for you to fetch changes up to 168e4b208ca8c2e04de20cc6cb7e2fb035dc1ec8:

  platform/chrome: cros_usbpd_logger: Simplify with devm (2026-03-20 02:57:04 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v7.1

* Improvements

  - Reduce transmission size by dropping unnecessary data in
    cros_ec_lightbar.
  - Convert chromeos_privacy_screen, chromeos_tbmc, and wilco_ec/event
    from ACPI drivers to platform drivers.

* Fixes

  - Drop wakeup source on remove() in chromeos_tbmc.

* Cleanups

  - Simplify workqueue usage with devm in cros_usbpd_logger.

----------------------------------------------------------------
Gwendal Grignou (1):
      platform/chrome: lightbar: Optimize command size

Krzysztof Kozlowski (2):
      workqueue: devres: Add device-managed allocate workqueue
      platform/chrome: cros_usbpd_logger: Simplify with devm

Rafael J. Wysocki (6):
      platform/chrome: Convert ChromeOS privacy-screen driver to platform
      platform/chrome: chromeos_tbmc: Drop wakeup source on remove
      platform/chrome: chromeos_tbmc: Register ACPI notify handler
      platform/chrome: chromeos_tbmc: Convert to a platform driver
      platform/chrome: wilco_ec: event: Register ACPI notify handler
      platform/chrome: wilco_ec: event: Convert to a platform driver

Tzung-Bi Shih (1):
      Merge remote-tracking branch 'wq/for-7.1-devm-alloc-wq'

 Documentation/driver-api/driver-model/devres.rst  |  4 ++
 drivers/platform/chrome/chromeos_privacy_screen.c | 41 ++++++-------
 drivers/platform/chrome/chromeos_tbmc.c           | 55 +++++++++++------
 drivers/platform/chrome/cros_ec_lightbar.c        |  3 +
 drivers/platform/chrome/cros_usbpd_logger.c       | 18 +++---
 drivers/platform/chrome/wilco_ec/event.c          | 73 +++++++++++++----------
 include/linux/workqueue.h                         | 22 +++++++
 kernel/workqueue.c                                | 28 +++++++++
 8 files changed, 161 insertions(+), 83 deletions(-)

--UUhGxiX99aiFqqbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCadxz/wAKCRArxTEGBto8
9P3tAP9ubTg1fSFOEnaLEp65DKipEzAWYQj86Hm+Cbw9VTc9/AEAsiyH+HVeaMF+
kH4rpbj7lB7LTZBFbEsOo73hpMx6DgY=
=8/pm
-----END PGP SIGNATURE-----

--UUhGxiX99aiFqqbR--
