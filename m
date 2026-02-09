Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF351258ED4;
	Mon,  9 Feb 2026 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770607387; cv=none; b=XbTM6HhU+s1xWhvF+MCCr5oaJCCkHVZqS93rjccdvHlcR4PVp7E5QSlloqmKBusiwLfIq+NSIsJy/C0DLm+4ehteGOhBjgDmCa/xyQ5E3jSVAMyZPFli/iFCn1FDn8ot4RTZ9Qhu/JoLbyuUCh8oHlc+Hl5V1mw9Jhyufelz8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770607387; c=relaxed/simple;
	bh=EfevS98Ef9DwY6MrqCjR9AJO5gd5SWh5hWbjO8su6tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNKF7n8cGY94PFXA+bEP6WuZ0OSrd5E/QJ/fmizeqwuvV/NvLbAvsPz0YzpSn/EiyCxkDHaxb+gJSwkp8rQiiy7h56sLS5F7ScKOG5293QLQ241gW4Pi09TfWC7212aNVDMozJnNtLK9ZtwEMJIO3SzZ8kpdMbVbJGSq5r1vGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqBwDuiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqBwDuiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A579C4CEF7;
	Mon,  9 Feb 2026 03:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770607387;
	bh=EfevS98Ef9DwY6MrqCjR9AJO5gd5SWh5hWbjO8su6tA=;
	h=Date:From:To:Cc:Subject:From;
	b=VqBwDuiX9Ctqpm+UBKBfKFuB+/e015i+UI4/il5ms4yFDpwrK0HoqwfaLiTjLbVwL
	 VZxb51yJyIS7/JYcNCG7Z61mDMUnk2VWp+Ou5vvMprrCKme19gMG3FlGIH46M3TPjF
	 SI8oAmjMN/VDzgcMWLEf28z82Mlemu5S7UYGdbPhn8r3Fu+Norc+JET5CSWLKdpyRi
	 nphHo0gRl/1Rlq0/hG6x6uLa+P4GhR6o+G7FU2iIkxpD66l2T26ZuOqFwdnigLELbA
	 XhNOW2n+bbK3hOehhJ2KO5ypqATQopcO+2XKnpmdlHywWdvT+HS0UC16uPtAAGQitb
	 5Lpu90O9nKRlQ==
Date: Mon, 9 Feb 2026 03:23:04 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform updates for v7.0
Message-ID: <aYlTGG_NABjz3a-K@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohwgSHJKeAeYIatP"
Content-Disposition: inline


--ohwgSHJKeAeYIatP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform updates for Linux v7.0.

Thanks,
Tzung-Bi
------

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.0

for you to fetch changes up to 520e345dfdab89aed4a0ad98d5ec35086661a11a:

  platform/chrome: lightbar: Use flexible array member (2026-02-04 04:38:13 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v7.0

* New

  (cros_ec_lightbar)
  - Report the number of exposed LED segments via sysfs.
  - Support large sequence of program to be transmitted.

* Fixes

  - Don't touch fwnode_handle::dev which is a private field.
  - Fix wrong assignment for response size in cros_ec_lightbar.

* Cleanups

  - Use acpi_get_local_u64_address() helper.

----------------------------------------------------------------
Andy Shevchenko (2):
      platform/chrome: cros_typec_switch: Don't touch struct fwnode_handle::dev
      platform/chrome: cros_typec_switch: Use acpi_get_local_u64_address()

Gwendal Grignou (4):
      platform/chrome: lightbar: Report number of segments
      platform/chrome: lightbar: Add support for large sequence
      platform/chrome: lightbar: Fix lightbar_program_ex alignment
      platform/chrome: lightbar: Use flexible array member

Tzung-Bi Shih (1):
      platform/chrome: cros_ec_lightbar: Fix response size initialization

 drivers/platform/chrome/cros_ec_lightbar.c     | 133 +++++++++++++++++++------
 drivers/platform/chrome/cros_typec_switch.c    |  19 +---
 include/linux/platform_data/cros_ec_commands.h |  24 +++++
 3 files changed, 134 insertions(+), 42 deletions(-)

--ohwgSHJKeAeYIatP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCaYlTFwAKCRArxTEGBto8
9OCBAQCYiQKNGYWt8Vzd6ajlIJq6gLe7XgNqPWJRFjMCDzpimwEAo/lRUsd3KvRq
FJYlgg1DqpHn4hbQQpdyNZoMLlN8YAU=
=fhP7
-----END PGP SIGNATURE-----

--ohwgSHJKeAeYIatP--
