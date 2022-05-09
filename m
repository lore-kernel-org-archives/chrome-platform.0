Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAF47B
	for <chrome-platform@lists.linux.dev>; Mon,  9 May 2022 19:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1DDC385B6;
	Mon,  9 May 2022 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652124625;
	bh=iKkvMkx3TWErRse2gRWZPu0JgulYvhKzrWv+sdCjmE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IK/sF6Kk+Mmg3QyNwrtOTr+pjEeOgaRRiBxd5mGbEgdl6TIZAf74uXf69zcZdpjPR
	 GrOTjJNZbrIWWywvp9xtiipmVmf8owX4J9QeNgeJIl/yLzhhtM6Zyf0zWluQBomnrI
	 quF8JWTpkjY++RxkqYtWb05duVOCRWsaFYhM4NwGmpCfKR4+k7Zc8l/UH7bCUVana5
	 5hVLJeLEvwZt0MIdhVF5ymNCnDF2hO+zm6AVb33UZRzH4GrE5kOpQeYpjdOxUZjrkU
	 0ZazWkkwAakuyprfGxn1YaocXBqzTUMI+FIbo4ksqLuCPd4quQeR1k5mufnJA5oWNg
	 9505VHnOXvXUA==
Date: Mon, 9 May 2022 20:30:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	codrin.ciubotariu@microchip.com, lars@metafoo.de,
	cychiang@chromium.org, tzungbi@google.com, bleung@chromium.org,
	matthias.bgg@gmail.com, oder_chiou@realtek.com,
	steven.eckhoff.opensource@gmail.com, srinivas.kandagatla@linaro.org,
	alexandre.belloni@bootlin.com, kuninori.morimoto.gx@renesas.com,
	jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <Ynlryv8fgKiHYXUt@sirena.org.uk>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sFYP38gXZ2zPTepc"
Content-Disposition: inline
In-Reply-To: <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
X-Cookie: Boycott meat -- suck your thumb.


--sFYP38gXZ2zPTepc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 09:22:42PM +0200, Kirill Marinushkin wrote:
> On 5/9/22 10:37 AM, Charles Keepax wrote:

> > This sounds like an error on the CPU side of the DAI link rather
> > than the CODEC side of the DAI link. The formats that will be
> > supported on the link are the union of the CPU and CODEC supported
> > formats, ie. a format must be supported on both for the DAI to
> > support it.

> Yes, agree, both sides of the DAI link should provide only endianness they
> support.

> This works currently, but, from my understending, it will break, after we
> set `endianness = 1`.

> As soon as we start setting `endianness = 1`, the function
> `convert_endianness_formats()` will extend LE to (LE | BE), right?

> If so, setting `endianness = 1` is the source of an error, right?

If doing this for the CODEC side of the link causes an issue it's just
exposing an existing bug on the CPU side of the link which may already
be affecting other systems - like Charles says the CODEC is expecting a
fixed bit order regardless of the memory layout of the data.

> > The CPU I2S hardware should be sending out the bits in the same
> > order regardless of if the data you feed it is BE or LE, as I2S
> > specifies an ordering for the bits.

> What does the endianness in the driver configure, then?

On the CODEC driver side it is meaningless.  On the CPU side it controls
the in memory layout of the data.

> > If this is not the case then
> > the host I2S controller is claiming to support an endian it does
> > not, and the problem should be fixed on that side by removing the
> > supported endian.

> I think we have a misundersanding of my example.

> In my example, i don't mean, that my CPU part of the DAI link is broken.

> What i tried to demonstrate - is that if i set the unsupported endianness, i
> wouldn't expect that "the CODEC probably can care about the endian", as the
> message in [PATCH 00/38] suggests. I would expect, that i will have no
> sound.

If the CPU side of the link is fine then there should be no problem, we
simply start supporting both endian settings all the way through the
chain, if userspace chooses something that wasn't supported before then
the CPU side driver will look at what's being configured and set up the
hardware appropriately.

--sFYP38gXZ2zPTepc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5a8kACgkQJNaLcl1U
h9D6Pgf9H2WDFXnhOVxdcfuLzbr5M39VEldhVxs3V67Fh3LEY2eoRJS3zHp1Gu8C
T6Cw+l4akBqpSfcKuvq6qQpuyC3XeNHQvjLAKeNvAdB2uqx6YgsxZS2RkXA6a8/e
eU9u8oxZk2PKCaE2egLuOT+JqSfn9qASLhhC0hesETMlYyoAIVFNlW4vGbOlWMDh
/ex/ytCjP2A1sHScIuCKNJlDItoSJfztx03QHuoVK5iBzrAtc86hrsvr8nVOz8tj
jvNOR8n0N3xc8+KvLGXUD9hfKkXGGPTMz8ijZFo2tYyy12ITuoxQKtRJrxcC6CcS
C7NCPO8SrHd1mWVHeMjz5jQYTmnGhQ==
=3nBv
-----END PGP SIGNATURE-----

--sFYP38gXZ2zPTepc--
