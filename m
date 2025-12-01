Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A707081F;
	Mon,  1 Dec 2025 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764561139; cv=none; b=iXm5ZjfvyqNI0rjJZfB6fUTyUkY2foGGnOArzXJez7VnrEFSWmsh0Lnmn5rC879L0WH/6rhhqQ8DfGKFNU8k/YT3E/UAFYreWyuUwPSYh5hbXfUIdi6y7m1mJmkBUvRv74YBhlGscliYGrH2BnwGYrYegPwnMAua7C+f54KSIwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764561139; c=relaxed/simple;
	bh=ik/lLRSfGgp6gyGVzdeByjLy9lmx1+xaD23pXamajO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+hmT3x0mBwHmZUQsn7PmXDV/GW3HOVuokmF2FPUmCmjqbP1MZlW7bHOQCvjiNsd93yt7AbnSllINM3FK0RTVN0xrlp8OZoHP1nupevnV4N1TzhQ27wrwcGFWh+Z3ZuiPLJGislA6u0Qyh1b44XUSQ4ksnQRGXDMbrPe6xMRICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lweMcubI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lweMcubI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7066C4CEF1;
	Mon,  1 Dec 2025 03:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764561138;
	bh=ik/lLRSfGgp6gyGVzdeByjLy9lmx1+xaD23pXamajO8=;
	h=Date:From:To:Cc:Subject:From;
	b=lweMcubIwcFEAO6WWK3T4a69ELqJsl4CmRtZXURT54Sl93tcvi9dS5aXoOMDL2wCb
	 YootXQl3QgrxZ1uc91fsgnwf6gY5ydfxH4fmiD6e6ecLI0PUwki44my/0ba/5dGxoN
	 LLESRwWO9rZjh7DXo7g/Ousw3bZ7xCCpg82Ovs0S7IlWklUJ2XVKXDXD6zFnZxit1F
	 9Gl9lsZuIxGbp3sfJPVXffbHiOaSKcjiXtZgCWPBT3k39ma3of3Yzv5U4G29GHO/Kp
	 JuTZT7HRwA2gkImMxwlQMJ+tWBSUsp/ZzHwHvqHDbYyPWLnH3zSi3PSLExhRjk25TY
	 cw7oi6PSLm3ag==
Date: Mon, 1 Dec 2025 03:52:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform updates for v6.19
Message-ID: <aS0Q71JuMYM56FZ0@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OIzbyosl+c2SibJn"
Content-Disposition: inline


--OIzbyosl+c2SibJn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform updates for Linux v6.19.

Thanks,
Tzung-Bi
------

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.19

for you to fetch changes up to 52075d2c7595cfd6c1ce211a9cd138a9b067c448:

  platform/chrome: sensorhub: Support devices without FIFO_INT_ENABLE (2025-11-14 02:57:32 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v6.19

* Improvements

  - Support legacy probe behavior in cros_ec_lightbar and
    cros_ec_sensorhub.

* Fixes

  - Don't fall back to legacy probe behavior if it isn't a legacy device
    in cros_usbpd_notify.
  - Fix an UAF after unbinding driver in cros_ec_ishtp.

----------------------------------------------------------------
Brady Norander (1):
      platform/chrome: cros_ec_lightbar: Check if ec supports suspend commands

Diogo Ivo (1):
      platform/chrome: sensorhub: Support devices without FIFO_INT_ENABLE

Jameson Thies (1):
      platform/chrome: cros_usbpd_notify: defer probe when parent EC driver isn't ready

Tzung-Bi Shih (1):
      platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver

 drivers/platform/chrome/cros_ec_ishtp.c          |  1 +
 drivers/platform/chrome/cros_ec_lightbar.c       | 16 ++++++++++++----
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 11 +++++++++++
 drivers/platform/chrome/cros_usbpd_notify.c      | 17 +++++++++++++++--
 4 files changed, 39 insertions(+), 6 deletions(-)

--OIzbyosl+c2SibJn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCaS0Q7wAKCRArxTEGBto8
9B9oAP9kLLZaf+b4LIWLeoZxVJV0D5xusiMWS+jEHL+xAaVmlAEAnAg9YhtO3TYs
S2G7585ZDOpCVVoNK52nKSQPhDXjtgw=
=c9kL
-----END PGP SIGNATURE-----

--OIzbyosl+c2SibJn--
