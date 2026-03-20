Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E73603D1;
	Fri, 20 Mar 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027808; cv=none; b=mAb+yvslEFSK6wDgZxr4rUPr8xtme7x2FPuTiL37AK1I15yb9lkpxj8UDHOwsXC0Fy6lMgyI8xzVbHS4FHtXYb/+0eZkXjekhDCEnW8dR3Ba1G7OGdfyAIIOdoxqlnr7YdD8GvDi8qjhAX+4PEuLMwk+JaCqG7Y/nx7EGkubYQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027808; c=relaxed/simple;
	bh=2ko2yr8EREI41gY4DKOmiWwlSx8gmD/iM6LkQEBVH6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRhObaILgyEKqy5hRNADLTMGnOBV3fgVfx/01F3x5zU3xZo+SU9hFucq7s8h9dJaAc3YuT7qd2s4fqrD8hdWa0o4C+po4GibxZ+lA3JQP7ajwt8m7mMIfNAybR6XA/JX/jb6vVbEV9yaktA+UMM84XyxoHATBPnHBfhruhElIe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5Hyus7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5Hyus7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EACC4CEF7;
	Fri, 20 Mar 2026 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027808;
	bh=2ko2yr8EREI41gY4DKOmiWwlSx8gmD/iM6LkQEBVH6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5Hyus7h1OdUrxx0x+UUtqbrgN8lkDQ8LWN/V+z41wiTXKEsaXd7szrUnj4RYzONF
	 XxCMegAu/K2xz3l/nMnJybtiTDZ0biEz8APXwMTzCqfrnsOzeehBUHkObXJTBybTUD
	 dsKA7G9uRscvqvNbT5smjEAGGaClM1ur80JyMLNTsz4GnM8efceBHXuuMHsCKqNKLa
	 cdc2xdC6fZUoJ99TnwFIzhVvdl2U6BACfVQKJQQBdhQk9BEkJlB55OpmgZmq7AbgMp
	 KLOpEeTbDgfbrKAuUoGyuW6g6ss7P696/kEpt8kWunU9dUMvrs5n/XYpIyToa5MHzB
	 OfpikkvrDSZkg==
Date: Fri, 20 Mar 2026 17:30:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/2] regulator: dt-bindings: cros-ec: Add regulator supply
Message-ID: <20260320-shrubbery-nimbly-17e3bacf4ad6@spud>
References: <20260320083135.2455444-1-wenst@chromium.org>
 <20260320083135.2455444-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nkY5dg21V/AsYkAX"
Content-Disposition: inline
In-Reply-To: <20260320083135.2455444-2-wenst@chromium.org>


--nkY5dg21V/AsYkAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 04:31:32PM +0800, Chen-Yu Tsai wrote:
> Even a regulator remotely controlled by the EC will have a power supply
> input.
>=20
> Add a property to describe the power supply input.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nkY5dg21V/AsYkAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2EGwAKCRB4tDGHoIJi
0t/+AQCAYxcTf4VwNykpGFfXOFK8EdQ2eUwyX9fEG0agtHSxwQD+MHHOSLzzbZVU
ea5hroG7LS9S0Zp8Gm8G7Kd95VkBEQE=
=Y7MT
-----END PGP SIGNATURE-----

--nkY5dg21V/AsYkAX--
