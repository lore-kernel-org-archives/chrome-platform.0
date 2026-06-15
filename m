Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139DF175A97;
	Mon, 15 Jun 2026 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493372; cv=none; b=bYC2Km+DsFpcDOdyMyo24qWXYr789MM12UMNweikrh89ObXNyHeOXQIoyOcl7iXgeCpwdhpXJ4Sllzl0tR8NWRxxI7f4qJxjAOQQzRmRKvRnRWujZXxdMh9aHn/hA2zUCenMWsUgcTnNO2cGbuyC0qmF9NIuwpSWsIwk7CeHx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493372; c=relaxed/simple;
	bh=ApIjV+1QW6j9FJsoG9JvJ7XiOt/o7IGiYjjc0Izx8GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VsQKvJi9XuPrsJV3zSG224y7QulKbRh8obYvNEIYHfYO2ueSl9yRlqSSIf7xzNE5n8T1wPUra6e5leqtuRcMGgLxZWpjdMYnn3vzgwqf/ggrPNPRAVwSgTxSlwFhp+xTiIlW1Tc427CegyRmY0rCwPPJgtN/Hp+q+/MzmFIQnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRJYQXmg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRJYQXmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24761F000E9;
	Mon, 15 Jun 2026 03:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781493370;
	bh=qj6kL+Y5j43uUoqZPHaczIFfyHC6VZoa6PTH+jFUTmE=;
	h=Date:From:To:Cc:Subject;
	b=jRJYQXmgKRsHWAUTvtPuzP7ZBwbR9Nd49F5WXkhd8SWte8ysCRd5ExykQayz3iFkI
	 VQD0Qnx+H/a0I/PufRMJExBHHS69hrbE1X5YxrsB7LprZhfzDnLabia0OR5+xL110M
	 vmEwkEPnMi1jDEJKBiRHcuiAqIF24DahfZSXtVPvrQTRS+vuIUoRYpMTj/Eauztie0
	 mqXKVlc8ZAK1twEat+PDPfvNxhVMqyC3bHzSrzE0hVmZZbLwHxamBhbOvfXGkY06km
	 hkXXcL1KI4mvDJUDlFUAZHgoMd/ILl8tpL5VkjD2zaat57eqYEj7R/naTE3ISEVjLr
	 co/rR/XTsjHOg==
Date: Mon, 15 Jun 2026 03:16:07 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform updates for v7.2
Message-ID: <ai9ud-vLUe2pj9M2@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/L2SVxQ7IjN3l+bi"
Content-Disposition: inline


--/L2SVxQ7IjN3l+bi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull chrome-platform updates for Linux v7.2.

Thanks,
Tzung-Bi
------

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git t=
ags/chrome-platform-v7.2

for you to fetch changes up to 883f968dcbb08a155101e3a943557530d4ac0463:

  platform/chrome: Prevent build for big-endian systems (2026-06-02 03:14:1=
0 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v7.2

* Improvements

  - Use named initializers for struct i2c_device_id.

* Fixes

  - Fix a probe race between cros_ec_sensorhub and cros_ec_sysfs.
  - Check for the presence of ACPI_COMPANION() for drivers converted
    from acpi_driver to platform_driver to avoid issues where
    device_match_driver_override() might forcibly match the driver to
    the device.
  - Fix a possible UAF in cros_ec_chardev.
  - Prevent build for big-endian systems as CHROME_PLATFORMS drivers are
    only running and testing under little-endian systems.

* Cleanups

  - Drop some redundant bits in cros_kbd_led_backlight and Kconfig.

----------------------------------------------------------------
Rafael J. Wysocki (3):
      platform/chrome: chromeos_privacy_screen: Check ACPI_COMPANION()
      platform/chrome: chromeos_tbmc: Check ACPI_COMPANION()
      platform/chrome: wilco_ec: event: Check ACPI_COMPANION()

Thomas Wei=DFschuh (5):
      platform/chrome: cros_kbd_led_backlight: Drop max_brightness from dri=
ver data
      platform/chrome: cros_kbd_led_backlight: Pass keyboard_led as paramet=
er
      platform/chrome: cros_kbd_led_backlight: Drop CONFIG_MFD_CROS_EC_DEV =
ifdeffery
      platform/chrome: Remove superfluous dependencies from CROS_EC
      platform/chrome: Prevent build for big-endian systems

Tzung-Bi Shih (5):
      platform/chrome: Resolve kb_wake_angle visibility race
      platform/chrome: cros_ec_chardev: Introduce chardev_data
      platform/chrome: cros_ec_chardev: Move data to chardev_pdata
      platform/chrome: cros_ec_chardev: Add event relayer
      platform/chrome: cros_ec_chardev: Introduce rwsem for protecting ec_d=
ev

Uwe Kleine-K=F6nig (The Capable Hub) (1):
      platform/chrome: Use named initializers for struct i2c_device_id

 drivers/platform/chrome/Kconfig                   |   2 +-
 drivers/platform/chrome/chromeos_privacy_screen.c |   3 +
 drivers/platform/chrome/chromeos_tbmc.c           |   6 +-
 drivers/platform/chrome/cros_ec_chardev.c         | 146 +++++++++++++++++-=
----
 drivers/platform/chrome/cros_ec_i2c.c             |   2 +-
 drivers/platform/chrome/cros_ec_sensorhub.c       |   6 +-
 drivers/platform/chrome/cros_ec_sysfs.c           |   5 +-
 drivers/platform/chrome/cros_hps_i2c.c            |   2 +-
 drivers/platform/chrome/cros_kbd_led_backlight.c  |  28 ++---
 drivers/platform/chrome/wilco_ec/event.c          |   8 +-
 include/linux/platform_data/cros_ec_proto.h       |   2 +
 11 files changed, 150 insertions(+), 60 deletions(-)

--/L2SVxQ7IjN3l+bi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCai9udwAKCRArxTEGBto8
9CBqAQDRewVMm80Q3LM926rHHeyCcbCpZQIT7PtGHgfEkv+dAQEAnloDUM+eJd1T
PClAUyfTgejQu2ScVyAqIM0trk3lDAQ=
=nNYz
-----END PGP SIGNATURE-----

--/L2SVxQ7IjN3l+bi--
