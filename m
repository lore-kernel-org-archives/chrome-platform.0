Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A441C69;
	Mon, 20 Jan 2025 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737338215; cv=none; b=ehxDtWRxwvaSdfZiDZtOpZ68AvzxpB7Oi3GNkAMCOStXUhRSMCoSzGpN7BigGW7BSRNl/Aw1p4ysrhW91D/sOrtNueBmBXC9wUKFbYEaUhK2iM6BEteAaC/smhdxnto9q8DkwajiU1JHY2fMDtvwnnW2InlkmF4+DQpGQKXJCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737338215; c=relaxed/simple;
	bh=SxHfnqTP7dQujC5b4a990KHTSj861FdIumuF1+o2hu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRqeNWgdpEl8Kp0/Mxb70MlHWfs5Xi4VLeqzSBc8vzzKqngdZeIwuDmbBlqy/BiiYKECUTqEjpqf21rYh7GxknZKCCZtBAOfIMraw3wDaa4cqkQHR5w7PhTiRtU8+giYOSCthu+C6Um3DRNlN1Xno2AZPWdob7zKsOpN33kc/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYJXbB5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYJXbB5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0EFC4CED6;
	Mon, 20 Jan 2025 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737338214;
	bh=SxHfnqTP7dQujC5b4a990KHTSj861FdIumuF1+o2hu8=;
	h=Date:From:To:Cc:Subject:From;
	b=NYJXbB5IznglW+BzNkPzXpFpiRNzN/3ZxNXGImjOmVgNJB27PNvuG8Hdn1Qn1Q9yc
	 VXc4qD0/0QjqDCbcRbIYx2/zGIU8HgN5TR6CxUqsdxPWgY3vBtDtLdQXFD8c/nZl6A
	 bwRTOqZPG5+9V2WKz/9+kVzHy7WMKbH9RVoetEYTd85MFgzkcGqDH9ZL2CeXwTvUPQ
	 MTiXOymTGYB7HByF/KJdRSUgTOQzq0TZ0F4tlzQ9+ZMMhoGPoy/sx44ZC1RFx1Qiby
	 CrUb4qpeh1vWVQLr2TuqLtdkTT3z9fgzlmYqChGrhgGEl7oEOblY/FTJTM4QtmcjEd
	 S0U7vVgVrAFAg==
Date: Mon, 20 Jan 2025 01:56:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform-firmware updates for v6.14
Message-ID: <Z42tY9rGfqes47SM@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJ7hDq/8yOaCF7rV"
Content-Disposition: inline


--IJ7hDq/8yOaCF7rV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull chrome-platform-firmware updates for v6.14.

Thanks,
Tzung-Bi


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git t=
ags/chrome-platform-firmware-v6.14

for you to fetch changes up to 7543d5702c2cfe0e8e8bc8bf4fe8cd44f08d6d39:

  firmware: google: vpd: Use const 'struct bin_attribute' callback (2024-12=
-17 03:59:31 +0000)

----------------------------------------------------------------
chrome-platform-firmware: Updates for v6.14

* Cleanups

  - Constify 'struct bin_attribute'.

----------------------------------------------------------------
Thomas Wei=DFschuh (4):
      firmware: google: cbmem: Constify 'struct bin_attribute'
      firmware: google: gsmi: Constify 'struct bin_attribute'
      firmware: google: memconsole: Use const 'struct bin_attribute' callba=
ck
      firmware: google: vpd: Use const 'struct bin_attribute' callback

 drivers/firmware/google/cbmem.c      | 10 +++++-----
 drivers/firmware/google/gsmi.c       |  6 +++---
 drivers/firmware/google/memconsole.c |  4 ++--
 drivers/firmware/google/vpd.c        |  8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

--IJ7hDq/8yOaCF7rV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCZ42tYgAKCRArxTEGBto8
9B1DAQD3QVuxrcFwjE+zWRiu3HqnDMKpl3vuE8Y6ZT4mvMeyLAD/W/MWpBelzGqU
7uEvUpOqupCPvY42p6xCBKZAXA766wI=
=K1wL
-----END PGP SIGNATURE-----

--IJ7hDq/8yOaCF7rV--
