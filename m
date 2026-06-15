Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8B7081F;
	Mon, 15 Jun 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493579; cv=none; b=bkxUB1z1eefQzMmHT0k2CCshdUESRqXaCEQmuC8Wn25BgW24Y7YqHx+dj1daG2HmRHgaCjHU0GPlrLsARsxX5HsgriXhMT9mJt/ZD9paIa8ejOce2cDWK3yHOX3P0l+EMGkjuXcdZlqypPOG2sL0SjbNayKy00mW1oBf4K5x0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493579; c=relaxed/simple;
	bh=dvQ8ypd+P9PZOdWhvd9Lwpd71v66qUnyKLrAR/uV6OU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QC7JREmETaPrIFVviargn3gHJU5g3P+NDnFq8d3sKq4vGnCOd2+rrYbmU5hFUR5FK3B4Hdkf6jcNA4sxZL5yjha7AUXDibCWGftzBgG0NY4sqT1yDrqtZ6h/9N9+Af2e2APlGmasW9tadZHrmsBjkdWW0TZGsD29WJIPpYaO+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kyig88cB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kyig88cB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801AD1F000E9;
	Mon, 15 Jun 2026 03:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781493578;
	bh=0IcFvfspPtvv0Fxg0TPuni4CdVdT/SXKl2mtqg2QQuA=;
	h=Date:From:To:Cc:Subject;
	b=Kyig88cBZiRXTY6Xj2RTIHxkd3/vPlBTgT6eJLinyiD1gSvCshYpx4Twl0aEXm5++
	 dyVuqQdjZEReW75Zi40doRMBMZxaxIi03tFRPdtxWJQeJs3UGE3hNyTopFYQ2Ayxis
	 dv+NQP5tdXD6g62jpH43fCMI/omzfZZU07TQLW4/SFPMidh/Y/bVUfRqoZI7rX5MBZ
	 u8BQ+E0COMcilwEr1bUtF9ebNggH7tATYA+WOn/fAooXdhXqOtv1z67q8JMxjVAqxA
	 giac3+KzwFHJK2vq4X2etKq0FU+l/WGJBd6ailiWZ72FWHGhctNg77RoGMJwgF59P/
	 UNcqeRRuniDnQ==
Date: Mon, 15 Jun 2026 03:19:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform-firmware updates for v7.2
Message-ID: <ai9vR1dGoZXL7mMj@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JKtaxlg0AIuGwCi8"
Content-Disposition: inline


--JKtaxlg0AIuGwCi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform-firmware updates for Linux v7.2.

Thanks,
Tzung-Bi
------

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.2

for you to fetch changes up to 86e3bbc716332600e9e087f8a4889f4d9714a99c:

  firmware: google: Skip failing entries instead of aborting populate (2026-05-03 09:40:06 +0800)

----------------------------------------------------------------
chrome-platform-firmware: Updates for v7.2

* Improvements

  - Add bound checks when iterating the coreboot table.
  - Skip failing entries only instead of aborting the whole device
    populate from the coreboot table.

----------------------------------------------------------------
Titouan Ameline de Cadeville (2):
      firmware: google: Add bounds checks in coreboot_table_populate()
      firmware: google: Skip failing entries instead of aborting populate

 drivers/firmware/google/coreboot_table.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--JKtaxlg0AIuGwCi8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCai9vRwAKCRArxTEGBto8
9A6lAP0Qz0SVMM8h09tc3uXQtNdZIGUJNSwfiI6oOuPb6QKiQQEAjJQUHkPV09jp
zjBSzSUyXO2SQGunKr+JJzK8r0IhCwI=
=saMh
-----END PGP SIGNATURE-----

--JKtaxlg0AIuGwCi8--
