Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936681096F;
	Mon, 17 Aug 2026 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786936385; cv=none; b=OLEZRF4cOwyEcBP06aPkFvHz8s7O53IKtdCLi1UH2B0wS6Dog6duUiYz6JmTZfz0wIEw0NqAHEGV3rOiUlgiljelLReruLyaP+vFZFrDbMfmDSW1E2OXEszFtrzPt/FQI2SytHr+X7enBn0WBeWNKqtICVSLXLQpv3iQdELHVi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786936385; c=relaxed/simple;
	bh=KJvQ+25eOhStQ/AA1ARXAPGEzR6sUGyRAf7P5biLpTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FS2AxLbFDQvs7CU3ItXDMMk3PckELwfV26/BC4Q++CYJmcBCrK/FK3CD0NfOfuQt3wK+KnePOA8bjxK8mccYgRSIWpaKyQ7BGHfWLPGARS1j8UCItLHtmrWR21NUD9fmxzAuT9j9BkZxPl8QjJ4lW1DwcdxjfCgOgeRiIOfFiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJRZ8bCb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJRZ8bCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0721F000E9;
	Mon, 17 Aug 2026 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786936384;
	bh=Cdh611CWEzjkGPtXKMT1sIy0NpXV/EKCqhOg6iEOEmk=;
	h=Date:From:To:Cc:Subject;
	b=BJRZ8bCbP4zu+I9ykPEl1+YlyQ6l7q92kI0fHEbC0O6CrpH31K7827eslCnncyNoJ
	 Zw85xzEWvIcrPMvgJi2cMd/VSOvTIPg3Oi1sh5JDQQhu8O1Nac6SIMjRny4WdcYvLk
	 neL6Nc6jp0vJYc++HPjN/1YPPK5Hn5KDEnEFtK9zshTV8vXUniqEFqSOUCN/6dMH+7
	 2Lxi/D+FSjWtYg6SZlW4h9ax591qqLkJibDfSzXMbRQcYdxRlaNVYzA4t9OzcRpWOs
	 3RQYIMYFhGp7O5D/+75aSp6ezOnVOIdhqcvpW4Nchq6hX2V5prXnnjwlLYtHIogNNx
	 1mDOrP/VmrIvg==
Date: Mon, 17 Aug 2026 03:13:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform-firmware updates for v7.3
Message-ID: <aoJ8Pbv35-mKIHun@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yp8glnCHBqdprklm"
Content-Disposition: inline


--yp8glnCHBqdprklm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform-firmware updates for Linux v7.3.

Thanks,
Tzung-Bi
------
The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.3

for you to fetch changes up to a58a57a1076f8c5dae0327e3710899478c3be901:

  firmware: coreboot: Validate table bounds (2026-08-03 03:00:21 +0000)

----------------------------------------------------------------
chrome-platform-firmware: Updates for v7.3

* Fixes

  - Don't map no-map memory regions for CBMEM entries.
  - Check bound of coreboot table entries.

* Cleanups

  - Fix typo in docs.

----------------------------------------------------------------
Laxman Acharya Padhya (1):
      firmware: coreboot: Validate table bounds

Manuel Ebner (1):
      docs: ABI: testing: Fix typo

Yidi Lin (1):
      firmware: coreboot: Skip no-map CBMEM entries

 Documentation/ABI/testing/sysfs-firmware-gsmi |  2 +-
 drivers/firmware/google/coreboot_table.c      | 43 ++++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 8 deletions(-)

--yp8glnCHBqdprklm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCaoJ8PAAKCRArxTEGBto8
9ALyAQCcLcMCY28A19Wo2x4xeqTZCdKCpizNPPcXJDd3GyUaXwEAuJE0xhL6LYOA
d9CynGhJzxCEUgyKOqULUd1DV/GBngk=
=xCXu
-----END PGP SIGNATURE-----

--yp8glnCHBqdprklm--
