Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6196AD4B;
	Wed, 25 Dec 2024 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735094447; cv=none; b=MJIUItX4hh3S4zgU2eii6k3ivbA2bwsmL//pD9icQOn8w87MovGbf4PelD90ctRn0XaxINTDUnKMWWlE5FmBcVmdfsg8ZTzCMRyPJsbYr70ByIb6KV71FiRd+mcQ+ocFDqd0sOIYiYMiEddCDsRIkRiaBi5kniMwJaU6hQoPUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735094447; c=relaxed/simple;
	bh=Z7mFVKKRTAydm/tADPT5ar6T4gYFMEUvMEEt3sg2ITM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoeiQVrxOZz2zkNb25W6oKHMrUhrjZCDgZf6J+BX8QDoowdwffE0XOG3XfOPKYbj+j7j3lNtXJmnvEDtO2kl8Z+W2D4yXZUKp9CVc5kE1DpaPNrJO4Iqo+bjSr4VBZ27Ib/Dmzk6Xs4BmtfN2Y/L8dKr8BGXFGpc0qrlHaFx7XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMCNqVR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMCNqVR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939EBC4CED0;
	Wed, 25 Dec 2024 02:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735094446;
	bh=Z7mFVKKRTAydm/tADPT5ar6T4gYFMEUvMEEt3sg2ITM=;
	h=Date:From:To:Cc:Subject:From;
	b=PMCNqVR7E4VeQfXx4y85ZS1BvqJMFVmajHxOxXqSllmiurkxOsoMKRpPIb7jz+XX9
	 EX+uhQkFGvkDcvQUMv2UNb3nZzuUx/KW0cdRWrOurLLsj0zNKDY8qBVlvvZKPhhhzC
	 P7g8c7o8shk++cBLy7YvWta/IkFa0zt6MYlRHU37V89t7gr1l3tPKR3rqeSqxcsd3d
	 e+tuqQB7fXPpTvmRqT3XkqpK43jJa/23084nhfJq7AV8g8NbCSdr371b2J/4n7VYKP
	 RaKUVBFRLSxy0DFUvCQzdnTjRXuOjUqKQoY+mz2Zr7s3j/J1DHDMuwYCGp5/3HbUvG
	 HS4I/GG1TkpPQ==
Date: Wed, 25 Dec 2024 02:40:43 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: tzungbi@kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org
Subject: [GIT PULL] chrome-platform fixes for v6.13-rc5
Message-ID: <Z2twq2LlnCfYQPAc@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Xxe2bfK/gCTWSgc"
Content-Disposition: inline


--6Xxe2bfK/gCTWSgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ea45f3f46734a47bdbcfb31f41748484219d2ea6:

  platform/chrome: Switch back to struct platform_driver::remove() (2024-10-28 08:48:34 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-for-6.13-rc5

for you to fetch changes up to dcd59d0d7d51b2a4b768fc132b0d74a97dfd6d6a:

  platform/chrome: cros_ec_lpc: fix product identity for early Framework Laptops (2024-12-25 01:47:35 +0000)

----------------------------------------------------------------
chrome platform changes for 6.13-rc5

* Fixes

  - Fix wrong product names for early Framework Laptops.

----------------------------------------------------------------
Dustin L. Howett (1):
      platform/chrome: cros_ec_lpc: fix product identity for early Framework Laptops

 drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--6Xxe2bfK/gCTWSgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCZ2twqAAKCRArxTEGBto8
9Gk1AQDnpzidYSFWtBVB423iTyffYnclfvPMScFEyP+XUYHLYQEAgY0IxXnuGCD7
F8K4oBTAXfG6hnzaskIhrUhLRMty9go=
=Z+Zc
-----END PGP SIGNATURE-----

--6Xxe2bfK/gCTWSgc--
