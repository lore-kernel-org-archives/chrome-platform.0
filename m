Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B513B47CB
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782498772; cv=none; b=aJkrrEvYpCJ/ggAYntxTYyYaIVuwF/DInSL8pLg3UbbtZwkwMmfjHlnQjGdYCNPLX2dnu8YsMMkxamAtOOGzbdKlm1y/lGxPWN1hMhGCFSlill818S81ytg+SMhoPW5xz5f9IqDqxgIg/CkSOVkliVL24xy7yd1r98aYRBTtdBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782498772; c=relaxed/simple;
	bh=qWVeFXV/b46sEnDgc7WPG0MAzRYDPZ3XT3mpcYSBxrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMv8vILDZVBTkPn9nsV9iUPi+fbZp7y2WXhG7g5d4uq527MvBH9jX5DRXrYlV5mdujLnjJ93U6EjW/+a57fTBzbtG3icLEMzDT6ECPa/MFtl4ZzNkcQPbnQWI2Bg9og5USAkJPUQD6C/SY3SNRnsF3YIH7yG1gEbtME/qdBkLbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vR3flqSs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vR3flqSs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c9878bbe88so1768725ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 11:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782498770; x=1783103570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5iRXh9pMrYUUv4kaKZyGm378pwkxZvl04HUf2Y2obM=;
        b=vR3flqSs3iMRQY5T9zy7+r8Ys8Wwv7K2sWmhP8R6SaQZrN4z/lL+wO/43VwuKjeR3b
         eT2JeDg++N1sQWZk4dzki+sZfUVowvROMGTp2Zp+qSFX9wVGk4oZYrKLOysfaIlKK8fP
         Os+bte3iXaIiDekwxCLgBHuY2qis/YjItrXLJTWXxNs2CWaXLS5SGGTA1R7IJ6WXe8Od
         TL15E+0QHc3Dhw75s2qFAqxmwVsAUOI0MCIzwmcrW0DDBMLrVRev0nrnXizXkaUbRu4P
         +TqAwWOr09os2Q4rWaGD4cIDHtePM8eqD6HJVqkwISWLnyde7lKVhdugREeGqD09kNQa
         TQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782498770; x=1783103570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5iRXh9pMrYUUv4kaKZyGm378pwkxZvl04HUf2Y2obM=;
        b=Izrnj8GdFJXZ4+kHUvkqNFpQuG84Z1QqcSQhFY2XD1w6GpS6sQfJ93Frp8jFqYcEXy
         qWFxc4HuB0XAB3Dejm5TMbGCyaY12KVoVQOFmYIsU9RzLppkLoueRPFdtrZwYZxqV1sU
         /HYBEyOBQA5hbyDwqxhv2uOjqPyI04lLZOgj39vMOsl0LtkoPX3W3uqhxOn8HjXi92dz
         MJI66NDW0B5qCX47VdlJO2y17yN21aAoDoSxlNRjlPpQ29U4WRXmFoTkDz6o+S0MPkGX
         yWiZTMZvY84+IlcOthkpSGQox7ec5Yc2h5+AuaUpaPDrSgULuNybNIcletPCYWwmVlJa
         zV/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpg93mNIo6BkePoBeGSprJC/m9Iej1Hwc//LuRCbcI75HErF/vkgmHni/Yy/nCt1nZTxvpwCuOkyZNGael4BKE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNOMtR2grjmat46/gfSFB4PHq2gJAKDNKDXUM33JhziotAE8qQ
	FuS+OEDr0IPGBZm/hXBBon1IIb6MMih9N3Ahq6J/Fsw7tY5Yes4I0Tyd8+5qlaI7BQ==
X-Gm-Gg: AfdE7cnoKjlD/m76+PUbjTX/VyAWEG79VcRhJh64iLOJsufAunmLUW1M2cd6EoXxAaj
	unoL68WlYUcWUxoB1UEsjfGwBeub6k9z+kvW2j4pNaggHYjzAEJggpJ2dqfUrk0sah2tTMb2S9U
	G7W9RvNLeMuzbjmvHgyOfym7WHFswvxXGo3R/ErS5wWCWiK6xRGlx/Vr2kZHfY3NbX4TIv2Sr+P
	6DuTX7LflHeQO92705ywm0aUdN/v52n++rdzM/4AiFh6+JB6UseUmH2vEBkmoXt7gUm7MMu7WzY
	Mv7eCzQxW3q+7KzVpj+7+ub/JKdLdfndaFGKw+vQifkkLwlG6bVbafZ/IQNP89/QVg8wzqK60NX
	1mf3RXwfS302UINPjQl0pxGQJyfnRMh5HH1FOo0FAxaI3gNUfuyYSXDIkBeuk+muN30ZgT3ndWo
	8f/NgbeGS2UkODaGF8f6YLVmMt5wGtP8mAIhigRp/Ejhr6q1yw
X-Received: by 2002:a17:903:90d:b0:2c1:41f8:7ef5 with SMTP id d9443c01a7336-2c7c3ff85b9mr138052725ad.22.1782498769659;
        Fri, 26 Jun 2026 11:32:49 -0700 (PDT)
Received: from google.com (211.37.230.35.bc.googleusercontent.com. [35.230.37.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64cfdcbsm43503655ad.62.2026.06.26.11.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:32:46 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:32:43 +0000
From: Benson Leung <bleung@google.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: reject out-of-bounds
 PD cap count
Message-ID: <aj7Fy83HFkIBS53N@google.com>
References: <20260625130056.3378097-1-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W5LVQOzyA6UIaTVT"
Content-Disposition: inline
In-Reply-To: <20260625130056.3378097-1-maoyixie.tju@gmail.com>


--W5LVQOzyA6UIaTVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 09:00:56PM +0800, Maoyi Xie wrote:
> cros_typec_register_partner_pdos() copies the partner PDOs from the EC
> TYPEC_STATUS response into the fixed caps_desc.pdo[PDO_MAX_OBJECTS] array.
>=20
> 	memcpy(caps_desc.pdo, resp->source_cap_pdos,
> 	       sizeof(u32) * resp->source_cap_count);
> 	...
> 	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
> 	       sizeof(u32) * resp->sink_cap_count);
>=20
> PDO_MAX_OBJECTS is 7. source_cap_count and sink_cap_count are u8 fields
> from the EC. The only check is that they are not both zero. If either is
> larger than 7, the memcpy writes past the end of the array on the stack.
> A count of 255 overflows it by about 1 KB. The EC source arrays are only
> seven entries wide. A larger count reads past them too.
>=20
> The ChromeOS EC firmware caps these counts today, so a compliant setup
> does not hit this. The kernel should still validate these values rather
> than trust them.
>=20
> Validate the counts in cros_typec_register_partner_pdos() next to the
> memcpy. Skip the PDO registration if either count is above PDO_MAX_OBJECT=
S.
> The rest of cros_typec_handle_status() still runs so events are handled
> and cleared.
>=20
> Fixes: 348a2e8c93d3 ("platform/chrome: cros_ec_typec: Register partner PD=
Os")
> Suggested-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Suggested-by: Andrei Kuchynski <akuchynski@chromium.org>
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> v2: Move the check into cros_typec_register_partner_pdos() next to the
>     memcpy it guards. v1 put it at the top of cros_typec_handle_status()
>     and returned early. That skipped the rest of the status handling and
>     left events uncleared.
>=20
> v1: https://lore.kernel.org/r/178229037114.3009621.14045345257767446805@m=
aoyixie.com
>=20
>  drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index c0806c562bb9..50a68819ceb7 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1119,6 +1119,12 @@ static void cros_typec_register_partner_pdos(struc=
t cros_typec_data *typec,
>  	if (!resp->source_cap_count && !resp->sink_cap_count)
>  		return;
>=20
> +	if (resp->source_cap_count > PDO_MAX_OBJECTS ||
> +	    resp->sink_cap_count > PDO_MAX_OBJECTS) {
> +		dev_warn(typec->dev, "Invalid PDO count from EC, port: %d\n", port_num=
);
> +		return;
> +	}
> +
>  	port->partner_pd =3D typec_partner_usb_power_delivery_register(port->pa=
rtner, &desc);
>  	if (IS_ERR(port->partner_pd)) {
>  		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n=
", port_num);

--W5LVQOzyA6UIaTVT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaj7FywAKCRBzbaomhzOw
ws7cAQC5ndIkEaBQ8kq3zFUNXs4fuP/TD4ObikCfE/4G3cHKdgEAnLxUUYmXJdIJ
DuAaMN/x5U5zQMc6DtqaGcckaUmAYgA=
=z7p8
-----END PGP SIGNATURE-----

--W5LVQOzyA6UIaTVT--
