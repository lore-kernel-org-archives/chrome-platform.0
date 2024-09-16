Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDC77117;
	Mon, 16 Sep 2024 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726487438; cv=none; b=VhJUZcdKDx6YU01NeAvkObfrSmJPr93QbYEj0RinWTR1NrPBegrI78xCVrSdxDxq8EG/K4M2gvRDRYeAfw2KlTrlhObgzBfynjMe8MGFSGfpJPy66yunCKfXcCpjhpjI09xsLl/lINcUH7qBqtUtn0DXjQnVq1ZG2Msiceq4epU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726487438; c=relaxed/simple;
	bh=H1qf3ZNlPdzZM/AEWd1T8MHQpZW8B9iHpHlyuvzKMVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PW3aZoKYN46veeSzbteeRMH1PtHMG1UW6O43IfcP8dQ6ssoRm8whuOLZ0BSgedcaghb1X+qSFSpqIbcz49nEIBa2x0YhazuPTqHCreGWWisT/NZSFPAgz9Yfd8gSXbmtVfn2hJI8sF42OaZ0sl3QAiYDcmX5nuRS6kHolkJ+EyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Et0lIsZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Et0lIsZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7B8C4CEC4;
	Mon, 16 Sep 2024 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726487437;
	bh=H1qf3ZNlPdzZM/AEWd1T8MHQpZW8B9iHpHlyuvzKMVc=;
	h=Date:From:To:Cc:Subject:From;
	b=Et0lIsZTsaukAm35hqE6iU6ZuKqlY4cGdM2oCwynqdIBu57NNGP5D6Mr3Maz83OJm
	 eANnCvvfaN0t1/mwhjt7SAzjkli2y0Jw2cenb4+5JutfjC/zc+0eimxMSONP0jcAT2
	 OrcyiQDmUWGLgSRrHNz++kKpPQrAawE/Ph9e0Iph2WkxY+iSptLgtFfvscBqxTdiWW
	 fXgX3jkMxOPI0+aAajSj+T7IH8wk9TziM69Y0R1TQR8ZnLWi0Yq16IESskv5m16+sw
	 RvitFJpo5ZfIP9GuYqlNHSYzuSR+xV0/izjKwXR/RoMKR+lABCWwxuiH/HBOcBmezm
	 GaNznnGC3MMEA==
Date: Mon, 16 Sep 2024 11:50:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: tzungbi@kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform changes for v6.12
Message-ID: <ZugbipY0rOAd-y4D@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I1sVqA+P9SxrzZQb"
Content-Disposition: inline


--I1sVqA+P9SxrzZQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform changes for v6.12.

Thanks,
TzungBi
------

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-for-6.12

for you to fetch changes up to d1b35e6d34e9b46fbf98444dd7aa114c032e9ac0:

  platform/chrome: chromeos_laptop: Use kmemdup_array (2024-08-23 21:48:43 +0800)

----------------------------------------------------------------
chrome platform changes for 6.12

* Improvements

  - Adjust DMI match table for Framework Laptop for improving
    maintainabilities for both legacy and new models.

  - Add .remove driver callback for cros_ec_typec for allowing the
    driver to be rebound.

  - Use kmemdup_array() for taking care possible overflows.

----------------------------------------------------------------
Dustin L. Howett (1):
      platform/chrome: cros_ec_lpc: switch primary DMI data for Framework Laptop

Thadeu Lima de Souza Cascardo (1):
      platform/chrome: cros_ec_typec: add remove driver hook

Yu Jiaoliang (1):
      platform/chrome: chromeos_laptop: Use kmemdup_array

 drivers/platform/chrome/chromeos_laptop.c |  7 +++---
 drivers/platform/chrome/cros_ec_lpc.c     | 36 +++++++++++++++++++++++--------
 drivers/platform/chrome/cros_ec_typec.c   | 10 +++++++++
 3 files changed, 40 insertions(+), 13 deletions(-)

--I1sVqA+P9SxrzZQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCZugbigAKCRArxTEGBto8
9JbqAP4gSmeGYr+Wpp/WDYLezcR8Ag9Yg2oA6EDvttljrACQVwEA8KDshHAl52lt
VpLGWmcf5q8+WZ7M3t8GBRmvY1LGigI=
=E9hl
-----END PGP SIGNATURE-----

--I1sVqA+P9SxrzZQb--
