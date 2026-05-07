Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9F40DFB4;
	Thu,  7 May 2026 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778122084; cv=none; b=V5zUYSl+xRLvQ5xxiQ9Af2WX5UVh1AGGhmKK2cHcQCTpHoeP/8nD2Q6MoNS4TNC6RwqKJYMJ8b7lIkyMsUCWxAuatBjOAVSNLNbg/vd0U/iy8egBZekmrlUEv+/I2eOVbn1Am5n/fttOLQbJbGdj7thxIMa71xkBrd9pyUVFwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778122084; c=relaxed/simple;
	bh=8EPAW6ErHmoOr8qCZOVJ6qo9djsdclG8ON2NvBldRtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AiI/e6PWe7sB5SKPDOAewFPrnHWUDCXUdFumkwXVthTgpELTHtzD+DAhKwy8AqVxUYyyMrk166STee8fwOMgUbjWEfWqOd404IaOPiT6ziW62OByLrk9Rziue+Bj9kNwH76aYEToZN+Ot7pzK4iRZdfVal1TK1SgZZy/MPJjcK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/wjV19Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/wjV19Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560C8C2BCB0;
	Thu,  7 May 2026 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778122084;
	bh=8EPAW6ErHmoOr8qCZOVJ6qo9djsdclG8ON2NvBldRtw=;
	h=Date:From:To:Cc:Subject:From;
	b=u/wjV19ZArMalW3Vrds1bRLUpGxyGhja9w0+K9VYvsel/IJmTFHn5oVVLSZg8DXc9
	 OJx3vkAwPORGGH6p18eKJ144JXZyaOd2KDeKDF3Up1O2wihO6HYF0hd2CLecGEosxn
	 VRumr2XKwuo4uo8h/bRAzkP9Wg+mF+HRf6Ad1ZD4bzKWIY0tOUwSrgqdvJSCKwEWk/
	 6uErWxMO4eZaycoM0YJclB9Uqjfuu5IDBreKsn1vJxVHCur9quyaCguJ/2Y0Hnj1wJ
	 wWCjSqpKjRCx/2n3sAjMtsEjrihT8y/44c7cKy/V6agCn3XnVWQLsnxkKb0T2c7tkC
	 1z3YfmFpiO91w==
Date: Thu, 7 May 2026 02:48:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform fixes for v7.1-rc3
Message-ID: <afv9YX5moYvK6w63@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/r24mmEiP0JXfmBX"
Content-Disposition: inline


--/r24mmEiP0JXfmBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform fixes for Linux v7.1-rc3.

Thanks,
Tzung-Bi
------

The following changes since commit 168e4b208ca8c2e04de20cc6cb7e2fb035dc1ec8:

  platform/chrome: cros_usbpd_logger: Simplify with devm (2026-03-20 02:57:04 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-fixes-v7.1-rc3

for you to fetch changes up to 525cb7ba6661074c1c5cc3772bccc6afab6791ef:

  platform/chrome: cros_ec_typec: Init mutex in Thunderbolt registration (2026-05-06 02:14:33 +0000)

----------------------------------------------------------------
chrome-platform: Fixes for v7.1-rc3

* Fixes

  - Fix a NULL dereference in cros_ec_typec.

----------------------------------------------------------------
Tzung-Bi Shih (1):
      platform/chrome: cros_ec_typec: Init mutex in Thunderbolt registration

 drivers/platform/chrome/cros_typec_altmode.c | 1 +
 1 file changed, 1 insertion(+)

--/r24mmEiP0JXfmBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCafv9XgAKCRArxTEGBto8
9I4eAQCrhVCudHF9IRZ09krFTabqbqXpURD+fsMLmbfQF0zuXwD/RvLXIqwGUxqw
CsGcUI563Y7U9T6ncWmjSS3bYEwYuws=
=UMuV
-----END PGP SIGNATURE-----

--/r24mmEiP0JXfmBX--
