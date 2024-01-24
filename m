Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909D17BA0
	for <chrome-platform@lists.linux.dev>; Wed, 24 Jan 2024 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706085855; cv=none; b=Ye41Y9FSDTUH/UK8uiPI0LEZaq/5azjbTGX7vrGL6Vyxyi0BzC9hpDUvxo+ACjdAa0giaOgnLkkFC/SnLlW6qx23mOV1bVlUCvs4STJYHgJ3yi2WwlV9ZTBSNoef/m7oRd7zpthDnJlZZvAvFy6lioc5J44choXD/u/K6ZUnqts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706085855; c=relaxed/simple;
	bh=s322rBPQa6bzA8+HCuSotTAk6gztBJc/8RjaCxcQ81o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7O0rKgGme3C+mXUBGipJ2dESD9Fn/ja17dYkJjCLVEIMc1Z8UzfUIph/0mH+XgGH4dcovbD6uvtMY9IlcPcmBZBLKxm4e959U8u1IsIbI0FS9C6H0Vjw1kH7fCdSRy37vMmoYw4bqfg7IkJHCQL4C8Y8Zy0TNRRx24PXJD037Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSYrU-0007b7-9M; Wed, 24 Jan 2024 09:43:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSYrR-00211Y-V7; Wed, 24 Jan 2024 09:43:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSYrR-006zr9-2i;
	Wed, 24 Jan 2024 09:43:53 +0100
Date: Wed, 24 Jan 2024 09:43:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Alexander Shiyan <shc_work@mail.ru>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Bjorn Andersson <andersson@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Douglas Anderson <dianders@chromium.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	kernel@pengutronix.de, Benson Leung <bleung@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/5] pwm: Some improvements around .of_xlate()
Message-ID: <66laypnixxg6pvl6keu3zwyzppw4iwbvz2g32euoypymiwqcmv@2pohr23hceg7>
References: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qevj6uqvskaa6zqk"
Content-Disposition: inline
In-Reply-To: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev


--qevj6uqvskaa6zqk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 09, 2024 at 10:34:30PM +0100, Uwe Kleine-K=F6nig wrote:
> the first patch is a fix for an out-of-bounds access and so should
> probably go in quickly. The other changes are merge window material.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (5):
>   pwm: Fix out-of-bounds access in of_pwm_single_xlate()
>   pwm: Drop useless member .of_pwm_n_cells of struct pwm_chip
>   pwm: Let the of_xlate callbacks accept references without period
>   pwm: clps711x: Drop custom .of_xlate() callback
>   pwm: Drop duplicate check against chip->npwm in
>     of_pwm_xlate_with_flags()
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/pwm/core.c                    | 45 +++++++--------------------
>  drivers/pwm/pwm-clps711x.c            | 11 -------
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  4 +--
>  include/linux/pwm.h                   |  2 --
>  6 files changed, 13 insertions(+), 51 deletions(-)

The first patch is already contained in v6.8-rc1, I applied the
remaining 4 patches to my repo at

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qevj6uqvskaa6zqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWwzcgACgkQj4D7WH0S
/k6o0Qf/djY3orpg33cVxhojPEMtT+5dcT6rmUISLQymmg8t8lQqt4D+oSPu8m6i
OV6XRXMgJSKWE5TaJzPWPxQp36cKBKPmFZXoZzQD09l58GdUCTFo/3tQtUd0UJfu
BhmcfecJH+o3G8JTDqy849FCfn/fsDtbkAPjmPMJHR+aZ/H5bP3pj8O3xLRk3Qu/
bH5P/VxDTvPTBJO8Z5DfcZzU4P0p4Ah24HDorvMyV3cxzIHrmLVsrCRmkigpnASq
9yq5F5NDraP/Xta9KhFG3Vtl+69M7DfzvtFIFvZ6CXdqkDCVqf5dy6/Gv/a6Z7Vs
9ppJ7q/IyMgYZ0gaEHgOOArCw7FILA==
=xzTn
-----END PGP SIGNATURE-----

--qevj6uqvskaa6zqk--
