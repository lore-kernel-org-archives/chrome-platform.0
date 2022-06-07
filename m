Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F728FB
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 15:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386CBC34114;
	Tue,  7 Jun 2022 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654615919;
	bh=QtPDEZX/lUfNyNYpzZuzDGKK7QYK9lQFJFWIUzzL46Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz1ddRm8iFdRXLn63GZu1ddshUSiTpxMayzVNrE29pXwYA6xHXt2as8MWdrTi65td
	 DloXlUv4VDQPa9NRZhm/0SK5f2YnJP1W+wr9cxRyWsIa5qVaP4BTE2rVhh8W7mwMGo
	 K67SNesIvMVyGPP2YgRbFCwusuN1CAEfkMfHeBXrwGzZNFKVAQCj3dxchRGuqzIA53
	 M+6WblmWyy01eHEaw5wvWqYchWLXlqujYXiYgDSMCqo9l6gbZxUEbI8bQ54tf4XPVZ
	 BmA/Tkkjl2WKfd9ZE/y/Y8mOnqMwY2WFUkoDZapmAgwLYz/ujsvplD/K2TLYWuwN/n
	 hwE4QSpypk56g==
Date: Tue, 7 Jun 2022 16:31:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, bleung@chromium.org,
	Stephen Boyd <swboyd@chromium.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH 1/3] regulator: cros-ec: Use common cros_ec_command()
Message-ID: <Yp9vadmTaNw3YCk4@sirena.org.uk>
References: <20220606201825.763788-1-pmalani@chromium.org>
 <20220606201825.763788-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iS67pudl3y0J6t1x"
Content-Disposition: inline
In-Reply-To: <20220606201825.763788-2-pmalani@chromium.org>
X-Cookie: Where's SANDY DUNCAN?


--iS67pudl3y0J6t1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 06, 2022 at 08:18:01PM +0000, Prashant Malani wrote:
> Reduce code duplication by using the common cros_ec_command() function
> instead of the locally defined variant.

Acked-by: Mark Brown <broonie@kernel.org>

--iS67pudl3y0J6t1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKfb2kACgkQJNaLcl1U
h9AQPQf/Uu+gE9kC6MRHTBinks+o8ic/dH/a5B8gt3pikQzakcC39YMx1/e2mXtI
rkOUD/bKMEOvWFDSs9U/91kf1cBFwpsET/yII6b3xIpdAz77TsdAfIIRWRbnuKf9
Y0/JtU9Zh7Li6gwPjiT6fzCDcFJ+v/QlpnWzuLfNVNQ5tCbAxOOIoh2DvqR8KnKy
mmJKuo8uueBLmos4auWEjbSq3VHceFnMzqDoXeja5Ttkl6B0iEHkY6NrboTS3XTb
FVJcyi4iD1sRYCf2wopwpkYzLcgDMghu9HaRAUOM73kORH/SDUa23c6jk9SQBKIf
RgEUErtk/VKy5NfC6yGW8kZWg2J5WA==
=cPRA
-----END PGP SIGNATURE-----

--iS67pudl3y0J6t1x--
