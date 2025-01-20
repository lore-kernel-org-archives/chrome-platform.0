Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8885944E;
	Mon, 20 Jan 2025 01:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737338138; cv=none; b=YFPCDAfJuZtlAbJ/k7FnI8hh6ywtrWBb2Ln+W2vqwDtkfXTOCRaNx8ly4wyq7/SJRFyk6OAZ1BW6dD5RoO7KG4DN5qIqiEyQD9F2q2AEIURVQ3qyAE0JbSSqw+pFNbPhwvLRKPofYyrWMsC2E4HhagrZCxM1puKIJ94i/lH4U2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737338138; c=relaxed/simple;
	bh=cJQXgr/iNImCTAOYj4wbyxbOq7dvYSdATOEzNyMsbUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLD+47zYyAMNTWCpakyCYEldfxbYJgRoACJYFC27dcv4qF+zSzIeT4s0N1hSgV5q0i4i7vRsKYFynmnMusRjSugCK4RCQLdD0+sRfNzbVWkvH+71lZDwc/mgjObAiMQ+pjcssehTi/px2UHAjtsEY6LOYrA0tdRBt3vay3m7HRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl1uGADF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl1uGADF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E611FC4CED6;
	Mon, 20 Jan 2025 01:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737338138;
	bh=cJQXgr/iNImCTAOYj4wbyxbOq7dvYSdATOEzNyMsbUc=;
	h=Date:From:To:Cc:Subject:From;
	b=Cl1uGADF2dt9yYTs1OrG6oAFCfan6CKpWpi7UxVPKFQyp0wUmMNn1UqxTHHmwhMhh
	 5Iy+VsnwC5nT4uGgPMYiozcVgWRs6HJtrpjBlQ/FYDfW/QlXKjrzZtZdJgYECRhBQg
	 JezAAS2kkoDlxDCgp17knKpNkfmliY9dz39UGzDJyJGmzwcNN1Pgyirz3oFmMZOdLL
	 9ce2oOKWZ/I7U47HCmgBfZRuBNu1av9Jps8/iw0ZMBMiUJy+u+sKB0VRsw8quRxAD/
	 TjKfcz2w12Vu62OQWOL+IycicByqsXk6oQqtjquLFZl/WXnnfPc9G2PE+ZZxS26vno
	 KJFJs5l+SgxTQ==
Date: Mon, 20 Jan 2025 01:55:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform updates for v6.14
Message-ID: <Z42tFgmKC5PJkCQm@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BfLh+NyYmSrb8aGi"
Content-Disposition: inline


--BfLh+NyYmSrb8aGi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull chrome-platform updates for v6.14.

Thanks,
Tzung-Bi


The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git t=
ags/chrome-platform-v6.14

for you to fetch changes up to fccebbdde2067e359f01382a72c31ed2af7acbac:

  platform/chrome: cros_ec_lpc: Handle EC without CRS section (2025-01-15 0=
1:28:50 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v6.14

* New

  - Support new EC if the memory region information comes from the CRS
    ACPI resource descriptor in cros_ec_lpc.

* Improvements

  - Make sure EC is in RW before probing.
  - Only check events on MKBP notifies to reduce the number of query
    commands in cros_ec_lpc.

* Cleanups

  - Remove unused code and DT bindings for cros-kbd-led-backlight.
  - Constify 'struct bin_attribute' in cros_ec_vbc.
  - Use str_enabled_disabled() in cros_usbpd_logger.

----------------------------------------------------------------
Dawid Niedzwiecki (2):
      platform/chrome: cros_ec: jump to RW before probing
      platform/chrome: cros_ec_proto: remove unnecessary retries

Gwendal Grignou (4):
      platform/chrome: Update ChromeOS EC command tracing
      platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec private st=
ructure
      platform/chrome: cros_ec_lpc: Support direct EC register memory access
      platform/chrome: cros_ec_lpc: Handle EC without CRS section

Rob Barnes (1):
      platform/chrome: cros_ec_lpc: Only check for events on MKBP notifies

Thomas Wei=DFschuh (1):
      platform/chrome: cros_ec_vbc: Constify 'struct bin_attribute'

Thorsten Blum (1):
      platform/chrome: cros_usbpd_logger: Use str_enabled_disabled() helper

Tzung-Bi Shih (3):
      platform/chrome: cros_kbd_led_backlight: remove unneeded if-statement
      platform/chrome: cros_kbd_led_backlight: Remove OF match
      dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight

 .../chrome/google,cros-kbd-led-backlight.yaml      |  36 ----
 .../devicetree/bindings/mfd/google,cros-ec.yaml    |   3 -
 drivers/platform/chrome/cros_ec.c                  |   5 +
 drivers/platform/chrome/cros_ec_i2c.c              |   3 +-
 drivers/platform/chrome/cros_ec_ishtp.c            |   2 +-
 drivers/platform/chrome/cros_ec_lpc.c              | 203 ++++++++++++++---=
----
 drivers/platform/chrome/cros_ec_proto.c            |  69 ++++++-
 drivers/platform/chrome/cros_ec_rpmsg.c            |   2 +-
 drivers/platform/chrome/cros_ec_spi.c              |   2 +-
 drivers/platform/chrome/cros_ec_trace.c            |  10 +
 drivers/platform/chrome/cros_ec_uart.c             |   2 +-
 drivers/platform/chrome/cros_ec_vbc.c              |  10 +-
 drivers/platform/chrome/cros_kbd_led_backlight.c   |  79 ++------
 drivers/platform/chrome/cros_usbpd_logger.c        |   5 +-
 include/linux/platform_data/cros_ec_proto.h        |   7 +
 15 files changed, 251 insertions(+), 187 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kb=
d-led-backlight.yaml

--BfLh+NyYmSrb8aGi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCZ42tFgAKCRArxTEGBto8
9MjwAQCEmXy+TmuiXsYSed20MPObv7MUPV5JG6yoJsn5i0k8DgEArupoxsmzGrSz
jwfLfNmKdwdZR0fcAAsYFMtpOPMWtA4=
=gHzf
-----END PGP SIGNATURE-----

--BfLh+NyYmSrb8aGi--
