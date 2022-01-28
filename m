Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244392CA5
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jan 2022 06:21:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id nn16-20020a17090b38d000b001b56b2bce31so5505131pjb.3
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jan 2022 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=271wWJNHEiR0TyjR6rdEh0lmclJBwJawzmgXlEO7GdQ=;
        b=K/owWhHPPyLJ8e+RTAdifuqw1Lts5+MANTWlvDIYkiTrB5w9F0VIq/dnPYOhla27mU
         m6uuch5zox6BpJu9pJHKPLc7B/fMXAqI5FjxVgZ9I4igwo0gSVjJd7leEQwkYNLvdI/N
         /R9UICyBTEgWmPRts1CX3zp0pDocz7rFzhEpa7F4KcikqsQlT+ilCyw3e8kDFdH8bIKR
         bWY30IiweqWvltlcJqjv+Ab0X6RV651Np9r4CF8WkTJGmM3spNEfFDofpbYFvQDRD5Xz
         XrwTc9fPpfE4KKtPb06YBOKnzGqTFzw/SviZ1rtmWKgjSXxOhYPaHRM9qTYdyOIvZJmm
         noEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=271wWJNHEiR0TyjR6rdEh0lmclJBwJawzmgXlEO7GdQ=;
        b=dgSqUwbAD2JdKwGbfhEK3/ki+JXZLxd3RpQQRWdXam1LryLQzs9J5jtyyIMKTnZ7S7
         HeP0Ik3qNQjnbR1juWxj7hSU9ICmJvc5XldgEoY9O4BW5Uu4rCVPvqI/EnPH1Xly1/jc
         1aSj9zCQzebsKrhHE+bMbNGF/Hsuo2fTBBq/u5ALm5K9odIxXVKyxrO4Kgbf5N9PYf3p
         94IwxeGUzC6KFHkvZP2bG6DPKRLw8e3xQr4EUPFvHX88n1tcJIlj88w8k/wpL4mu9KSo
         /2qPaMtVeY0OymrO0VcjIlQkT+eUJacuUP/2O7XVl/gZhSMwOyiR2odP1z/oWiuOflHP
         9Vlg==
X-Gm-Message-State: AOAM530d+gskEhTGRqiUbr4FX/G5cnvqEFvb7yNyWc0lpOUCcL0Y3bom
	n0KNptNygsvK38vttw9Cv2l49g==
X-Google-Smtp-Source: ABdhPJwM9MkDOQDrYBBBBLkVESeUIF5gas7EuZ7Ruwc+VeNecD0F6v94vSN/m2QiBXG+Asyjr0O5TA==
X-Received: by 2002:a17:902:ea0f:: with SMTP id s15mr6710101plg.118.1643350858994;
        Thu, 27 Jan 2022 22:20:58 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7713:237d:48f3:f690])
        by smtp.gmail.com with ESMTPSA id ha21sm1135807pjb.48.2022.01.27.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 22:20:57 -0800 (PST)
Date: Thu, 27 Jan 2022 22:20:52 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Make try power role
 optional
Message-ID: <YfOLRBGmwGKwCksR@google.com>
References: <20220127191659.3560810-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DXB3UyVkHi0h/pnn"
Content-Disposition: inline
In-Reply-To: <20220127191659.3560810-1-pmalani@chromium.org>


--DXB3UyVkHi0h/pnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prashant,

On Thu, Jan 27, 2022 at 07:16:59PM +0000, Prashant Malani wrote:
> Some boards prefer not to specify a try-power-role. Update the port
> property parsing logic to not error out in case a try-power-role is not
> specified.
>=20
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

This looks good to me.

Heikki, if this usage of TYPEC_NO_PREFERRED_ROLE looks good to you, I can
merge it.

Benson

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 5de0bfb0bc4d..ee12658009e5 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -115,17 +115,18 @@ static int cros_typec_parse_port_props(struct typec=
_capability *cap,
>  		return ret;
>  	cap->data =3D ret;
> =20
> +	/* Try-power-role is optional. */
>  	ret =3D fwnode_property_read_string(fwnode, "try-power-role", &buf);
>  	if (ret) {
> -		dev_err(dev, "try-power-role not found: %d\n", ret);
> -		return ret;
> +		dev_warn(dev, "try-power-role not found: %d\n", ret);
> +		cap->prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> +	} else {
> +		ret =3D typec_find_power_role(buf);
> +		if (ret < 0)
> +			return ret;
> +		cap->prefer_role =3D ret;
>  	}
> =20
> -	ret =3D typec_find_power_role(buf);
> -	if (ret < 0)
> -		return ret;
> -	cap->prefer_role =3D ret;
> -
>  	cap->fwnode =3D fwnode;
> =20
>  	return 0;
> --=20
> 2.35.0.rc0.227.g00780c9af4-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--DXB3UyVkHi0h/pnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYfOLRAAKCRBzbaomhzOw
wr3iAQD/4S0peXsqQPgEW97XtZgI0CWsqWPDzkEiLGb1GzRVRAD/beUy77nVEHUn
TvwKDo2LAlHrBFbVWaThHWLRSIFB1gU=
=+z/0
-----END PGP SIGNATURE-----

--DXB3UyVkHi0h/pnn--
