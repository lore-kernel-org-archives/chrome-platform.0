Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C628F52
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 21:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18E0C433D6;
	Mon, 31 Oct 2022 21:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667252253;
	bh=2oTtoPM5ybfuQEC+FI8os9tbMcp5WQW+LuBtPSEqr+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nq0f60sntEYkmR8nOmsiMYyNiOSzUNrT4lkG3mJkT+QIApbHSAkCngRdbWbPYMC2X
	 +Qg7LbitUp4Dr6LdQRChI5j8KRAcp8TGNTjoZ4e1+2ljGlr0nssOP6K/fJejcJLne6
	 9Tf4Wf5UfwmJmY8BO1mIS30qU9eIaT1EDqDYUwhsJsYi6qPY/iNUorrzj0ZoLMz2Dd
	 c1nRzOl4RMO8iu4HOP3jhAHnoO9CAvZRq1eR+ziXSgag9+ShU1KaxXtfbH7IgUQ/k0
	 YhlkSnnzwJyjXMtkKPdp/Y2r086mc8MDjqGFBdh6FdaBYFLuQyXoTRxfnWoZHfm+WJ
	 bSiUASlObU4wg==
Date: Mon, 31 Oct 2022 21:37:28 +0000
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, briannorris@chromium.org
Cc: "kernelci.org bot" <bot@kernelci.org>,
	kernel-build-reports@lists.linaro.org,
	chrome-platform@lists.linux.dev, eballetbo@gmail.com,
	bleung@chromium.org, groeck@chromium.org, pmalani@chromium.org
Subject: Re: chrome-platform/for-kernelci baseline: 98 runs, 5 regressions
 (v6.1-rc1-5-g27b86a65cd16)
Message-ID: <Y2BAGBVik+VvLTwF@sirena.org.uk>
References: <635f6274.170a0220.79b7b.5d1a@mx.google.com>
 <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="190h0wjhrXlaSHhN"
Content-Disposition: inline
In-Reply-To: <CA+ASDXPHbdh=_s4qiZbCQz0_VbFuh_gKvsq=mWFZ5QY-QUPKAA@mail.gmail.com>
X-Cookie: Are you still an ALCOHOLIC?


--190h0wjhrXlaSHhN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 31, 2022 at 10:40:25AM -0700, Brian Norris wrote:
> On Sun, Oct 30, 2022 at 10:51 PM kernelci.org bot <bot@kernelci.org> wrote:
> >
> > chrome-platform/for-kernelci baseline: 98 runs, 5 regressions (v6.1-rc1-5-g27b86a65cd16)

> Does anybody look at these? It's a bit weird to see "5 regressions",
> and then to look back on the last few weeks (probably months) and see
> the same errors...

Nobody seems to care about a lot of the Chromebook stuff AFAICT.

> >   Details:  https://kernelci.org/test/job/chrome-platform/branch/for-kernelci/kernel/v6.1-rc1-5-g27b86a65cd16/plan/baseline/

> Where can I find the test cases? (i.e., what's determining a "failure"
> for one of these?)

The first place to go is the details link above, though it's a bit less
clear for the non-baseline tests you should at least be able to see
what's going on on the console which will often help with finding the
testsuite, or the error messages printed are descriptive as to what
they were looking for specifically.  The kernelci-core repo contains all
the stuff to map from a test name inot running something (often with
external assistance) but there's lots of templating in the way.

> As a small guess, I see that we're missing some common configs, like:

> CONFIG_PHY_ROCKCHIP_DP

> This sometimes means that the display subsystem (and therefore audio
> subsystem that relies on DP for one of its components) is not going to
> fully set itself up properly. Usually things can still sort of work,
> but I don't really know what the tests are looking for.

The baseline tests are just making sure that the system comes up to a
shell.  The driver loaded tests are checking that particular devices
have a driver bound to them.

--190h0wjhrXlaSHhN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNgQBcACgkQJNaLcl1U
h9CK3Af+JA/cZP/dhRvWw5xld/AEYIzydxCTIueywyyZPu2267jcley+XZ64PRZV
le0X/0ilov6tOevEKlCczPd3yPXvEC+xLx+e2oCavrmSI+/ar1dCFrDKUcU8Q1/W
2qKqZjijP/i+N4ewbG7D96u2+0VSjIAGTbtzgAO0PLel9RCckVwNIDMz2MBGQkcj
5sVDI29gETFIJu2kGW+8IFuIb8NAjuRDpMcxhI3zrh5Osksp5/qrPZ7K/dbgfWAq
9H+CTGq44RHBO1zLF8hkpI5qj3AI1SFLKeWrWyKE/g2/xrf2Sp2+KxuAk85Yok32
as45n5IPNwOs0mSwuGYTJ+eBYoKexQ==
=YBk0
-----END PGP SIGNATURE-----

--190h0wjhrXlaSHhN--
