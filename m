Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ED27FF
	for <chrome-platform@lists.linux.dev>; Mon, 28 Aug 2023 03:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7DDC433C8;
	Mon, 28 Aug 2023 03:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693194892;
	bh=I4YmV7qcsZ4p2m93I3Kyfd9g4tbYlqaM5+Qy3qJvmxk=;
	h=Date:From:To:Cc:Subject:From;
	b=X86L+lapH7AOaRXzMpOrOKV7n4pEZXTFbAT0PpXc+qTzlnHVR558K1c82d3SW5Jqd
	 j2ofC5NVZCYYlU+SEM5uLhlsRfo+BX4hjZ3PIHk0d3R3bavcuNVfjPjN2sqEnPC4PG
	 qR18DdmYAF6n+4HDdhPqs5gV0g8VHWzdFzwTdtFVq48sf6bQftAp+ewYQVGdZS9Eti
	 k2tsbT2um7QrFaBBB1jlsSiYdS5s7XVgwUfRP2AHoEU2/kIbQESzAla2BxqMz6D0Cg
	 7vTRNNOfgOhLBx0gdulmLT1c88fLRUQmmbbFdKok7iKpQ25+hm8wm9j6F8d/rHjy8c
	 wiY+FN+tNKrMg==
Date: Mon, 28 Aug 2023 11:54:48 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: briannorris@chromium.org, jwerner@chromium.org, groeck@chromium.org,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform-firmware changes for v6.6
Message-ID: <ZOwaiFUu3BI+G8JA@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="etghmEIeVlhbiX0m"
Content-Disposition: inline


--etghmEIeVlhbiX0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform-firmware updates for v6.6.

Thanks,
TzungBi

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-firmware-for-v6.6

for you to fetch changes up to 0979e7e3cfd7b479c34dc0f7217beb0c30f8028a:

  MAINTAINERS: Add drivers/firmware/google/ entry (2023-07-25 10:52:37 +0800)

----------------------------------------------------------------
chrome platform firmware changes for 6.6

* Misc

  - Add MAINTAINERS entry for chrome platform firmware.

----------------------------------------------------------------
Brian Norris (1):
      MAINTAINERS: Add drivers/firmware/google/ entry

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

--etghmEIeVlhbiX0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCZOwaiAAKCRArxTEGBto8
9OIfAQC2daNQfPKIEdUjwtM9EtHfIA+Y6OK10Gsv5aJEf/a74AD9FQtOPd2HYCGm
vfMmYSbUXnahTnWv9wzfNXFUr/qHtQg=
=JERv
-----END PGP SIGNATURE-----

--etghmEIeVlhbiX0m--
