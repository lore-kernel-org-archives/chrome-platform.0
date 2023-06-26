Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E57EC5
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jun 2023 05:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F247CC433C0;
	Mon, 26 Jun 2023 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687759070;
	bh=fE+oEgKMU5/b6WdHkLPE6jmxrV6m1rqT0ujhbJyilkc=;
	h=Date:From:To:Cc:Subject:From;
	b=SaTUTDp1xU2XSs4KtgpaL9Z8eMtp6PVF4u5AtAzNt9O2X8m9LoHzapBLokghuthzh
	 XZsxzKlRHYSYIe9d34QhoUJ8qc49jpr4ZMxtk8YV+e00wRJDtZuVDXBWxAbw7R4o5o
	 nBgKsI+g9eeB4v02QMxY0K2qJ+9SjwJ4mCizkSNBHG0ODoTfXro+tXFvMtaRFmPKh7
	 FUl3jpc14CjymjnQuS1Ji8FWbCEblvBeWKjGM9KZcjQgRxTI4btBMpbMVG/gFnif/c
	 aMwAm1paFwkdevPOx0OLa2AbjQ7aWeKTv3freR7ezSRF3bPN7n/Fq+f1o9S1zQMmFw
	 Iqyt+qxazHctg==
Date: Mon, 26 Jun 2023 13:57:46 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform changes for v6.5
Message-ID: <ZJko2ipBSy8eM/+2@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NzEMEGZtFlnXQpS0"
Content-Disposition: inline


--NzEMEGZtFlnXQpS0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git=
 tags/tag-chrome-platform-for-v6.5

for you to fetch changes up to 2b8cc5858a07ab75ce98cae720e263e1c1b0d1d9:

  platform/chrome: cros_ec_spi: Use %*ph for printing hexdump of a small bu=
ffer (2023-06-13 12:28:36 +0800)

----------------------------------------------------------------
chrome platform changes for 6.5

* Improvements

  - Support Pin Assignment D in getting mux state.
  - Emit an uevent when EC panics so that userland programs get chance
    to capture EC coredumps (LPC interface only).
  - Send EC_CMD_HOST_SLEEP_EVENT to EC at the very beginning/end of
    system suspend/resume so that EC can watch the duration more
    accurately (LPC interface only).

* Misc

  - Switch back from I2C .probe_new() to .probe().
  - Use %*ph for printing hexdump of small buffers.

----------------------------------------------------------------
Andy Shevchenko (1):
      platform/chrome: cros_ec_spi: Use %*ph for printing hexdump of a smal=
l buffer

Prashant Malani (1):
      platform/chrome: cros_typec_switch: Add Pin D support

Rob Barnes (1):
      platform/chrome: cros_ec: Report EC panic as uevent

Tim Van Patten (1):
      platform/chrome: cros_ec_lpc: Move host command to prepare/complete

Uwe Kleine-K=F6nig (1):
      platform/chrome: Switch i2c drivers back to use .probe()

 drivers/platform/chrome/cros_ec_i2c.c       |  2 +-
 drivers/platform/chrome/cros_ec_lpc.c       | 15 ++++++++++-----
 drivers/platform/chrome/cros_ec_spi.c       |  8 +-------
 drivers/platform/chrome/cros_hps_i2c.c      |  2 +-
 drivers/platform/chrome/cros_typec_switch.c | 11 ++++++++---
 5 files changed, 21 insertions(+), 17 deletions(-)

--NzEMEGZtFlnXQpS0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCZJko2AAKCRArxTEGBto8
9DpmAP4km134DcEB/GDAm5yEGU0oia0U0YhsYOlkHyLF5tjrIQEAvhL8P1qVxwNV
E83HUbH0Dq+gi4vioatji7cU5D5+fAM=
=XqxV
-----END PGP SIGNATURE-----

--NzEMEGZtFlnXQpS0--
