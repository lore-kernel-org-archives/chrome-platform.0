Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA3328031C
	for <chrome-platform@lists.linux.dev>; Tue, 22 Jul 2025 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753208613; cv=none; b=W9nO4RpZ6kqZd9p7g8Aboz/RrgncLVhS/ESv46qVtPxzAcr5Eg95sNga+pKhfMRzFLKOkogfhQnU5Iwg71UpFb7RlAnw2SWI0tFF25+tAOK03xLACjVcvvvaIXJAA4bLHfBClSygHvvcl997DqnHSaQnWtHfXlDRFlZpvjkM2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753208613; c=relaxed/simple;
	bh=qAi5yfWh+jYmjX0bdG5CXGf8W5oEyS26pkxeGUjFk4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hprxc+ep7TIEvxBo8cRk6ygv61s6wQykDFnFVPnNdGbMyTdCyz7TOTDp5bbqOc4D8qxJs6EsCzaCyN4rxGc/Y83nfwWQv/iMDi09jnBXYyzwg1B7Chq4hPRUJfensZVRO9s0Lk88vU5TSoP4HYlX8B7d7zSqzyYBstaOfHO5DMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCLPm3MS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCLPm3MS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349f096605so67036195ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 22 Jul 2025 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753208611; x=1753813411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQGCd5lV64hx5eIJ73TZCqmMkIPGhtau8Q2iyjlhZ0g=;
        b=JCLPm3MS00QHBvFBi9raYhVYC1ZqoHAszjYhE3WqtsIcpyHnLKh494ixlf6GeBSknl
         htrh+IXSE+A2FWcnWRw0tvkm7TRyDHiORt34745zfQr8bX3nf2+DPLT1Wdc/rAvCPElp
         0Isw1FO4Bp0JxaEdWmvtocP2WVnHdiksZWzOkWfRcOMnyOYrufFGs+VhRHRlzuoJuF9E
         j0r8ThnvzyhhhFDVARUAn2lZhaI3gMtfWGkD25uEF3W7xL0FIhZWKKaF4XLUWqXmGjml
         Zeut+qdoSv92DFo+RjlTa2W9u1dB5vPAMJ7yJkG6JcLVmaOvC1rRqabt8s4U8bo248MA
         wW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753208611; x=1753813411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQGCd5lV64hx5eIJ73TZCqmMkIPGhtau8Q2iyjlhZ0g=;
        b=eIP1Yi5Cn9yeIIwryunnlc8gjG3PZhHx5TWmJOLEYmUnYAujzoVRD8Xmq7FxAGK1aW
         9REa6HQ1tgfvTrJFzmUkAzbsmCrZdNcXHV1pyqyRG6LJiU3YZNH3GXlr0QjEsqMxEr2r
         b+AETmUWBG61/ZjwBRaZ3MI2AjoTMZggnKizLKdNZcfF/cS7UeMyhmXn43vFl7tuciev
         ED4xbPkffmxK3wxtWgrATxkpJgUO4vGPRB5rtFt0qwG9BufpVy8AwvEmMLowo11LH/Fh
         4FgBOTd01tB4mUWiBXhN/RGCqMxDkO/kwADoUXKGS2nNo7dz3/Ffse62yGUw4A6v3aEC
         7X3w==
X-Forwarded-Encrypted: i=1; AJvYcCVltAh7FLrAGC1PU871nnt3KhlrPcBpOoEylc3R/hVcYpEDTgXlOSAJUf9rora3WWKqqEKcUv5rcG3RWpsXOHc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDr7+adiVwr7ionMtdMibX9xogLhVFj4vpBZUj74Qwhhb6s2k2
	o0fU4xK86lLWHD+xlOr3iEnIjLM2XFpnUvJfmx76iX6Rg4jbxZPCDtaW7H/HBXVe5A==
X-Gm-Gg: ASbGncsS9rg0wfI6ekRXcKa7u7wvZ+pT+Kq6qgRhirTWRGS16xW3qQaX2Gp843CRoVI
	jjmy47fPSnMBEC2BNzF5RQt9rKKldy+18Ve892qR5wfeK8DfNwLbPktIh3UJt/QXSoXrohExzHG
	D9pCaiwn4s9hqMTp7tiM8kd6pBvsdAaQHsdgDesOZZhDKYGXFE0gF53wyiEkf6A9iFxf3EhzY5y
	e+cDaNhLcMBF6Wksk+sgmQBAHGUd6kHhbUQZSkiE3g/Xm+uueFw844m4PBTal6V7yBuhh6CCyS8
	v1p7dIzAL6iytPqj9I66oyDfdKuoZBwsQAO/cMM4O5aT7SXE6R0JjCVNvlLr6bSPFA2/7CS5gk5
	hn/bWeds1uLU3nmWLBCLR3FTdfZGk5BYbyQKqecs06b2vsiZmulVfmOVH2gph
X-Google-Smtp-Source: AGHT+IFv+X1tAQgAzc2B+P5hgL4CrcnzpzJG4wwZRBwLYWZA/u97/VEXl88uvgewWbqKkThljwosqA==
X-Received: by 2002:a17:902:e884:b0:235:129a:175f with SMTP id d9443c01a7336-23e2573647bmr353330175ad.34.1753208610639;
        Tue, 22 Jul 2025 11:23:30 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d397esm80620895ad.147.2025.07.22.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 11:23:29 -0700 (PDT)
Date: Tue, 22 Jul 2025 18:23:25 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec: Unregister notifier in
 cros_ec_unregister()
Message-ID: <aH_XHRbzx-sLcS7X@google.com>
References: <20250722120513.234031-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/RhPvZ8/ehv5ls0I"
Content-Disposition: inline
In-Reply-To: <20250722120513.234031-1-tzungbi@kernel.org>


--/RhPvZ8/ehv5ls0I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 12:05:13PM +0000, Tzung-Bi Shih wrote:
> The blocking notifier is registered in cros_ec_register(); however, it
> isn't unregistered in cros_ec_unregister().
>=20
> Fix it.
>=20
> Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version=
 if EC transitions between RO/RW")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> This is separated from a series (https://lore.kernel.org/chrome-platform/=
20250721044456.2736300-3-tzungbi@kernel.org/).
>=20
> While I'm still figuring out/testing the series, it'd be better to send t=
he
> fix earlier (to catch up the upcoming merge window for example).
>=20
>  drivers/platform/chrome/cros_ec.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/=
cros_ec.c
> index 110771a8645e..fd58781a2fb7 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -318,6 +318,9 @@ EXPORT_SYMBOL(cros_ec_register);
>   */
>  void cros_ec_unregister(struct cros_ec_device *ec_dev)
>  {
> +	if (ec_dev->mkbp_event_supported)
> +		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
> +						   &ec_dev->notifier_ready);
>  	platform_device_unregister(ec_dev->pd);
>  	platform_device_unregister(ec_dev->ec);
>  	mutex_destroy(&ec_dev->lock);
> --=20
> 2.50.0.727.gbf7dc18ff4-goog
>=20

--/RhPvZ8/ehv5ls0I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaH/XHQAKCRBzbaomhzOw
whuDAP9ayj8DW8AnAHr6chusHbOf7mtbHDO3mhmwfEveXmFSuAEA1ldJLMnzH3GL
GFEiGO8hMC9IHlpcxa7bM9WOmwF3cQ0=
=u4Ay
-----END PGP SIGNATURE-----

--/RhPvZ8/ehv5ls0I--
