Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625807E
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 11:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18821C433D6;
	Tue,  1 Nov 2022 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667303909;
	bh=2Di0o9eOI9Mn2hU+mwwF5YBD19MmCmKUNhuE9xUnNN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACcS5FYVqWJcArEAlTBNY5VnhlqTx7zzuUwJMwnhWPEGhANk0/w4FPfr8goVsVj/h
	 EpCUYfTxZ0Sxsd7/8nny74VArBSibp3KcOESkrjbWHCP1mmr7z75G9mokQjqns1fGn
	 TSwYdEXNFgtK5p9RjrvtjCMYyiGc2hoS/NmVsMgUaUDEXBzGWx4i/g2pgF5fcmMKw5
	 01c1Ch6drH89zgswXSMHNzcyzMSut4LiD7y7x+lXZmiQGQUlY8O9uapmoY4RjaoQ+3
	 872SN1cvYkyWIfK7aPH7KRQcx6W+ksZtqf2pFEqZiYZizLapOlzbEaLCno0y89PaTI
	 BS6smL9+IfVPg==
Date: Tue, 1 Nov 2022 11:58:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: kernelci-results@groups.io, "kernelci.org bot" <bot@kernelci.org>,
	kernel-build-reports@lists.linaro.org,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org,
	tzungbi@google.com
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions
 (v6.1-rc1-5-g27b86a65cd16)
Message-ID: <Y2EJ39FAnnKOzDHi@sirena.org.uk>
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
 <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
 <Y2BAGBVik+VvLTwF@sirena.org.uk>
 <Y2BKg6gefPQ9BUAc@google.com>
 <Y2BRxJ/qrl9cjWbK@sirena.org.uk>
 <Y2BcAFf77/JMQxYR@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fnV8IZIEdOmR8MlD"
Content-Disposition: inline
In-Reply-To: <Y2BcAFf77/JMQxYR@google.com>
X-Cookie: Do not write below this line.


--fnV8IZIEdOmR8MlD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 31, 2022 at 04:36:32PM -0700, Brian Norris wrote:
> On Mon, Oct 31, 2022 at 10:52:52PM +0000, Mark Brown wrote:
> > On Mon, Oct 31, 2022 at 03:21:55PM -0700, Brian Norris wrote:

> > The KernelCI repo just says what testsuites to invoke and how, it's not
> > got the actual testsuites.  Those X didn't probe failures come from
> > bootrr:

> >    https://github.com/andersson/bootrr

> > forked to:

> >    https://github.com/kernelci/bootrr

> > (which could use some upstreaming...) with the specific errors for

> Neither of those looks particularly active. If I patch stuff, is it
> better to send PRs to the 'andersson' one or the 'kernelci' one?

The kernelci one is the one that gets deployed in kernelci so probably
there in the short term - all the Chromebooks are there, I'm not sure
how many got upstreamed at all.

> > Yes, that was what I'd determined too - the reorganisation of the DT
> > looked legit, I can't remember what it was exactly.  I suspect it may
> > have boiled down to adding some missing default disables, or removing an
> > erroious enable for the board.

> Ah, based off your pointers, I see the test was looking for what used to
> be the i2s2 alias. But then I recall we stopped using that i2s instance:

> https://git.kernel.org/linus/b5fbaf7d779f5f02b7f75b080e7707222573be2a
> arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output

> I forgot that folks did that downstream long ago but never bothered
> finishing upstreaming that until I got to it this year...
> ...but still, it's kinda sad that we've bothered to set up all this "CI"
> and then nobody paid any attention :( I only noticed because I recently
> subscribed to chrome-platform@lists.linux.dev.

Ah, that's the one.  I think I'd flagged it as the test looking wrong
but nobody picked it up.

> "assert_device_present cros-ec-sensors-accel0-probed cros-ec-sensors cros-ec-accel.11.*"

> ? Really, ".11"? That sounds like we're trying to test kernel
> implementation details, asynchronous probe race conditions, Makefile /
> linker ordering, and similar -- not anything that we actually expect to
> remain stable across kernel versions :(

> I'm not sure there's a great stable way to refer to such devices, so
> maybe it'd be better to write this as "count the number of devices"
> instead? Or I think this particular driver supports an "id" sysfs
> attribute, which refers to a stable underlying firmware ID. But that'd
> involve even more device-specific logic.

It looks to me like the intent of the test is to find the device with
the highest number and get a count that way but ICBW.

> I don't think I even care *why* the ID changed; that ID is far from a
> stable thing, if I'm reading it correctly. At least most of the others
> refer to hardware addresses, which are a little more reasonable to rely
> on (even if the device naming still isn't a stable guarantee).

Yeah.  My understanding is that the intent with bootrr is to be a smoke
test which flags up if drivers aren't getting instantiated, taking a
basic login test further forwards so it'll notice more devices.  Like
you say it's a bit of a fragile mechanism though.

--fnV8IZIEdOmR8MlD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNhCd8ACgkQJNaLcl1U
h9CrBgf/VjPkbCo4/JtTqXLr+HDcwrnRY/r4jLQXQ0fNHtwmePVAV1B+B9sLVPS3
qX5i9/pN81rDwCGa22lbLWRsR3O1qbZWduGuoCC7OA8hkTpcBxgmRuFnrx5CDKZX
EGT0bkfboKPi9DtWe2W6idyyMcsx07QgecjOdYI8RfjepmjYf0mHPNM5/DFxqx+I
a3XOyLp2yRiCjGygRUu12yrCnifVzN+QD7CiUkSDAebgy05rsbqHOuE1mmv2zHhn
mrB+fs8b1+P+mMCzYWAJM6sddppCeLPg6tH/ZGM6uVm8bUAUSBLmrNlPeyeuPN53
1c05MlRBfzTRTzOr2SW4U2UVaHsVOQ==
=lB8P
-----END PGP SIGNATURE-----

--fnV8IZIEdOmR8MlD--
