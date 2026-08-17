Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726B1096F;
	Mon, 17 Aug 2026 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786936305; cv=none; b=eaZJG05ij268VAzwjDof5cPvsFGgA9g7JRt5Y9gy3JReKFq5aBQRC1Xx/SeYseZRSnOZphAw+sbAGZEl6+Eed9LWt1bsYCvIJHeylBrDhCCFzF/9LWqWgCxhobN1m/KKGLXOBO7taHh0OW/2E/IlFgSquZ88zdQfAicwSOzJR+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786936305; c=relaxed/simple;
	bh=zmyjXsPw3+hQM+yfX+DH+VElUzpap5b0US2naPirdaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZN63JUkjvov8chfMr0rWQBCAbQzPqKhNK4YyVyOOWMztGj9ChRB6DeqqlC+Eu8trDA4EczrbnDaZYINnoX9SQe/y6Gh9ZpcGoGgO8j/StpjNfregqWhm+/PNOZ2q4zSWJ+oakFtnTEqoooV2L/5PDyEZ3AnBTOtyOw+FZSw+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtoyfkqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtoyfkqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B71C1F000E9;
	Mon, 17 Aug 2026 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786936304;
	bh=Cw/eHm4sLp51R+U3ov4mbcvrQT6M4ot4ROn1RG71Nbc=;
	h=Date:From:To:Cc:Subject;
	b=ZtoyfkqEBFHYs5C5OgzGLFVuFTIminNE5Y+vdRey9UWykr8kytwRQVdr5xUtxgDgb
	 fHKxg+OYo1Mn+DbbCJitQX/dEl7WstYmMq+qGw622bZIdLbVSBH7xybHnZF5S9GP9k
	 b1/2hwuFtYTYOWVQGMpm2YQsmsHJg6gkKEoc1LDPEPSw7/BNcQCOY9DjI6si+auSVN
	 rZLeG+Gl0ZQyEqYakZmdyBqlXMCs3Jt4xvfEFJUVETRe52GwYiCh5rf1n6Yo4fzJFG
	 K/y37nFQQyI9x/nUu6lfAXwHrt6c+XxzD6p8DvytUel4xJUXh5wJdHFBWBwbfoQYWM
	 KgHvgYTJaF0nQ==
Date: Mon, 17 Aug 2026 03:11:41 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	tzungbi@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] chrome-platform updates for v7.3
Message-ID: <aoJ77ebtbrPbFbD4@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BhW5nztmuieBOePu"
Content-Disposition: inline


--BhW5nztmuieBOePu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull chrome-platform updates for Linux v7.3.

Thanks,
Tzung-Bi
------
The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git t=
ags/chrome-platform-v7.3

for you to fetch changes up to 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c:

  platform/chrome: of_hw_prober: Add delay for hana trackpads (2026-08-13 0=
3:05:17 +0000)

----------------------------------------------------------------
chrome-platform: Updates for v7.3

* New

  - Add post_power_on_delay_ms for Hana in of_hw_prober.

* Improvements

  - Use dumb trackpad prober for Spherion in of_hw_prober.

* Fixes

  - Check bound of firmware-reported data in cros_ec_sensorhub and
    cros_ec_typec.
  - Fix memory overread in cros_ec_sensorhub.
  - Fix resource leak in cros_ec_debugfs.
  - Clamp payload length for LIGHTBAR_CMD_SET_PROGRAM_EX in
    cros_ec_lightbar.

* Cleanups

  - Drop unused platform_device_id driver data.
  - Remove redundant log.

----------------------------------------------------------------
Alexis Savery (1):
      platform/chrome: lightbar: Limit payload to max packet size

Bryam Vargas (1):
      platform/chrome: sensorhub: Bound the EC-reported sensor number

Chen-Yu Tsai (2):
      platform/chrome: of_hw_prober: Use dumb trackpad prober for Spherion
      platform/chrome: of_hw_prober: Add delay for hana trackpads

Hongyan Xu (2):
      platform/chrome: cros_ec_debugfs: Clean up console log on probe failu=
re
      platform/chrome: cros_ec_debugfs: Unregister panic notifier

Maoyi Xie (1):
      platform/chrome: cros_ec_typec: Reject out-of-bounds PD cap count

Pan Chuang (1):
      platform/chrome: cros_ec: Remove redundant dev_err()

Tzung-Bi Shih (2):
      platform/chrome: sensorhub: Fix memory overread in ring handler
      platform/chrome: sensorhub: Fix dropped timestamp events and log spam

Uwe Kleine-K=F6nig (The Capable Hub) (1):
      platform/chrome: Drop unused assignment of platform_device_id driver =
data

 drivers/platform/chrome/chromeos_of_hw_prober.c  |  6 ++---
 drivers/platform/chrome/cros_ec.c                |  5 +----
 drivers/platform/chrome/cros_ec_chardev.c        |  4 ++--
 drivers/platform/chrome/cros_ec_debugfs.c        | 10 ++++++---
 drivers/platform/chrome/cros_ec_lightbar.c       | 11 +++++++---
 drivers/platform/chrome/cros_ec_sensorhub.c      |  4 ++--
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 28 +++++++++++++++++++-=
----
 drivers/platform/chrome/cros_ec_sysfs.c          |  4 ++--
 drivers/platform/chrome/cros_ec_typec.c          |  6 +++++
 drivers/platform/chrome/cros_ec_vbc.c            |  4 ++--
 drivers/platform/chrome/cros_kbd_led_backlight.c |  4 ++--
 drivers/platform/chrome/cros_usbpd_logger.c      |  4 ++--
 drivers/platform/chrome/cros_usbpd_notify.c      |  4 ++--
 drivers/platform/chrome/wilco_ec/core.c          |  4 ++--
 drivers/platform/chrome/wilco_ec/debugfs.c       |  4 ++--
 drivers/platform/chrome/wilco_ec/telemetry.c     |  4 ++--
 16 files changed, 67 insertions(+), 39 deletions(-)

--BhW5nztmuieBOePu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCaoJ77AAKCRArxTEGBto8
9G8MAP9e1z7t/rxDdQtglqkrMPLQ6Wu93QMrETzSBU/xc1vU6wEAmBLu/fM2sr0y
MyOmh92rGdSnJqgOmwMtvAKufe+G4QU=
=T6uz
-----END PGP SIGNATURE-----

--BhW5nztmuieBOePu--
