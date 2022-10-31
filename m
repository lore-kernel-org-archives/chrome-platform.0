Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CD28F76
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 22:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C08CC433C1;
	Mon, 31 Oct 2022 22:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667256778;
	bh=CTon1CO/NwBczLzxFFOlX9axf/LMTn/elCtotrbSYJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVvRa7yftPRV27cA4iOj0BYRYEedGLZlEmVT1ejVk0PAGDPJdIsxLW6VlKh25fvAO
	 3GEbtAL5O05N7OElHGCvZ7e2LWmFAWZ0XfzhjN29HBa3N2TMQt3I8u6nO5wHV5uuwn
	 HD+V+82NeKiXjhtebTnAty4majYZjqmZghn+w/P+C1dG7dEvSr2o33ENBXObrvQkth
	 GER1P2zuVQD+JWnYJOm9hQPUK4vxgRWwtCjBgLTdruYoRK/ImEhPT/UROnXBMFzFIr
	 EBesgfdaStcyMJaWmm4bNcSV8+Yg/PhKGauyKprz+cJ03icVymXsdRM0FHhJy1pZyV
	 W5kNO2321AQEw==
Date: Mon, 31 Oct 2022 22:52:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: kernelci-results@groups.io, "kernelci.org bot" <bot@kernelci.org>,
	kernel-build-reports@lists.linaro.org,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org,
	tzungbi@google.com
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions
 (v6.1-rc1-5-g27b86a65cd16)
Message-ID: <Y2BRxJ/qrl9cjWbK@sirena.org.uk>
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
 <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
 <Y2BAGBVik+VvLTwF@sirena.org.uk>
 <Y2BKg6gefPQ9BUAc@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ob8qCyf8Hys2Q4Ch"
Content-Disposition: inline
In-Reply-To: <Y2BKg6gefPQ9BUAc@google.com>
X-Cookie: Are you still an ALCOHOLIC?


--Ob8qCyf8Hys2Q4Ch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 31, 2022 at 03:21:55PM -0700, Brian Norris wrote:
> On Mon, Oct 31, 2022 at 09:37:28PM +0000, Mark Brown wrote:
> > On Mon, Oct 31, 2022 at 10:40:25AM -0700, Brian Norris wrote:

> > The baseline tests are just making sure that the system comes up to a
> > shell.  The driver loaded tests are checking that particular devices
> > have a driver bound to them.

> For one specific example: I'm looking at rockchip-i2s1-probed, which
> fails here:

> https://storage.kernelci.org/chrome-platform/for-kernelci/v6.1-rc1-5-g27b86a65cd16/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html

Not the exact same job but a LAVA defintion for that one can be seen at

   https://lava.collabora.dev/scheduler/job/7797321/definition

> I can't find a single mention of "i2s1" or "probed" in the kernelci
> repo, so I must be missing something. Is there some external config
> file in another repo? Or else the test configs are autogenerating cases
> on the fly based on parsing...the device tree?

The KernelCI repo just says what testsuites to invoke and how, it's not
got the actual testsuites.  Those X didn't probe failures come from
bootrr:

   https://github.com/andersson/bootrr

forked to:

   https://github.com/kernelci/bootrr

(which could use some upstreaming...) with the specific errors for
gru-kevin coming from:

   https://github.com/kernelci/bootrr/blob/main/boards/google%2Ckevin

which ends up in our rootfss.

Those failures in particular come from some reorganisation of the DT for
the Rockchip devices a while back which regularly gets bisected by our
bisect bot, I did report it or something very similar as looking like a
false positive but nobody followed up.  I see there's some version
dependent checks for the acclerators which may not be working properly
any more I guess but nothing for the I2S.

> Anyway, I don't know how or why that ever passed, because AFAICT, RK3399
> Chromebooks should only have a single I2S block enabled, and they're
> passing the 'rockchip-i2s0-probed' case. So it feels like I need to be
> disabling some test case.

Yes, that was what I'd determined too - the reorganisation of the DT
looked legit, I can't remember what it was exactly.  I suspect it may
have boiled down to adding some missing default disables, or removing an
erroious enable for the board.

> Somewhat similar story for cros-ec-sensors-accel{0,1}-probed, although I
> believe the sensor driver is still working for me; I also see no
> cros-ec-sensors errors in the KernelCI logs. So I wonder what exactly
> the test is looking for (e.g., maybe the device name changed?).

IIRC there were some of these that were a device name change.

--Ob8qCyf8Hys2Q4Ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNgUcMACgkQJNaLcl1U
h9BoCwf8C5kUJxeMKUi+d82NAjsT5G03FaCO4Hx+bkYghWbbRasy+LWz81jINyeg
6XuLkrJbx15DNcIiPQApmhI42MGI1ntA7NfNIQPnxom/JWhrZUmSe6OvtSGH/oY4
BLOD8orBCA0NClZz/sIV1q4DZRsjggLfZN9I4cpugZoWtkIYReM6BuD48BBVIFHm
CpJDCBmmqQaKaCZbrmwjTC+G/18CKUUCuo3+ribFPleTGY1Tu0aYQRy7XPuTJ1dU
yjoDFZhvKxJFGq8DAvgh56Zjdy6a7MC87P75TxsG5pWH3pV+sZsBO9FfYAD43uWP
RVB+P3urN2j8G7zb18sqyikEh4M2rg==
=7h7K
-----END PGP SIGNATURE-----

--Ob8qCyf8Hys2Q4Ch--
