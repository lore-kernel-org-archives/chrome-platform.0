Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556040BE0
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571446; cv=none; b=K63QmNN1pNwk7DI8hyf7zTfGa+9LP05Tv9V6aRU4grffCkffOJ8zk8k3V0xhrn+mRBFt5LAPioNWLFqgaEOuxwWixzMWkHp0avIGHjJl27YbHbq8s8UrOrS1SKTb9hthnptfz37+E1VUEix86jnlEyd3jsAidXWbgdHfhxz664U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571446; c=relaxed/simple;
	bh=C6XyGEl+4JGQUnuKfD9opbycijz+c9g9Y8SrwNryp70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0jACBEFZorkI4YgJnKzp14W7UlLo6AJMEpUTQJpTketbhORmEprp/cveByPN5BOagG4zOfyLm4B5Tk8L7u45XET3uki22Wj+dDuvRq4ASFre6pi/N31PFNSl6oSAFvMXzZlZ3UGY4oOOtvFPTAYzgROJ+VR8riTxL3eudttSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FmtoucQ2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FmtoucQ2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-801c7e6518eso103308a12.2
        for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 17:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571444; x=1735176244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeqA1W7HgN/1BEGMNZZ5O+/9wdsSo7XuIwN5RQ+xvQY=;
        b=FmtoucQ2IKyO8Bi/BXyVKABLCH1R6NLrJKv/rSb20nWt0bU+bQoz+7JUoU4FzqQhOf
         nBtJbm2d+bvnGvxVO8g5Trli7uWAtboDVhMj0YRFSnf4/A5SzCdyik1EY5I2+seOy+MT
         FMEArDPC5hOhjTVZzBF7jAqq9uV3cqbMt6akqQg3hd4HvUE1jpg7LDfVXev/7R1e0NfE
         lsWegZ79Y/aMBp2V6SKXAbVQhC9GenrxSsySZkioG3epC7wifJ6msO4AD/SJr+2ZxBxR
         nK8Qve7ruRvxomRFcSWnMEjo6QBzfBhJHMEaZuw5gsWReSSW8VBQEIUtPxz9f64dYoyI
         fQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571444; x=1735176244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeqA1W7HgN/1BEGMNZZ5O+/9wdsSo7XuIwN5RQ+xvQY=;
        b=CsuRaUe/eJExYVHE5vYBHJcfklKE7ESfw3yK6uSK49Iw7G3iHbfB/Hkb53GGSoys1t
         HRkg/muwkJIybw2WjwQ2pBgzT35wLuCE7G8Y1GGvfsUP/2cYLmrmE5hAnt3dMk4Jq2U9
         zQsDXyNm3GullIEzZA9NAWqxuSqY7kIIzbs+SxZuuIMmYMmgWmY0gIrGg6/wG5tCQPxw
         zfnEoBuNg9asabBuHsH+5Q7Usj3KSRiaoZM/QqMXcO04K0GzcbIxiuRgHB4bjAdEXx8E
         Yub9STKGiis0XZZhjo5rwQxyjZXlfWrQBB6GA97ZO9CW4wiiGa7oQZJY3a/IYiSgY9C2
         2geg==
X-Forwarded-Encrypted: i=1; AJvYcCXNu2zpYOEoru7M4hV919vqm/wYOy7VCp7MSBPdJf+2EVoYVFVBZhNhEJhnTyXMc5nFoDVNUH5i4gTJ5eUJjmI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVRekX4/dRhWR6jiZqrZNUvSLeZnofndcBdF4AEH6Z+Zg0vpsw
	l2i+8KYQVOnOYtl5cSh2+zjm5usbATiM9ndQByLpszVEx9pcMQuNcejguf3zIg==
X-Gm-Gg: ASbGncvkVwtakIhO90IziDYs2YTxwS7rIL41iPAPzK1dh1umvwdmOMpxD/i1YluR7K0
	B/tYvhEp5Xwwr9SCGS1+OZ9zudzwuStIZj6ivUFYsVqyLFjjWJNnsAI/5R/gIkZ0Yg4ysUKYkAV
	IKEcEejV1ZBQDS/5a+teCLhgvY9dWhyxf3r+4Jmih4U+bZ/uUEq7deGcS87zHgrQEwka61N2O7Z
	Sa/S4ADwoGupWDEI1LxrKqo3CBY5qKl45qotqq5jKc5jQ6uJ1KwUUk5btKi6sSn6MGWTrHhCvad
	vIY2XYei3WyayJWq
X-Google-Smtp-Source: AGHT+IGLsnsDna2mnXoogFYmcXNYx7Aw7CMzWVyI52xBFBmbW0omcnochVS+D1fp/HqWS1IUPexG4A==
X-Received: by 2002:a17:90a:c884:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-2f2e938a64fmr6291306a91.28.1734571443962;
        Wed, 18 Dec 2024 17:24:03 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm3149919a91.1.2024.12.18.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:24:02 -0800 (PST)
Date: Thu, 19 Dec 2024 01:23:58 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/8] usb: typec: Make active on port altmode writable
Message-ID: <Z2N1rvl-3g5ditVp@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uitaZZ4HI1y6kP8G"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>


--uitaZZ4HI1y6kP8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:44PM -0800, Abhishek Pandit-Subedi wrote:
> The active property of port altmode should be writable (to prevent or
> allow partner altmodes from entering) and needs to be part of
> typec_altmode_desc so we can initialize the port to an inactive state if
> desired.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Extract port altmode ".active" changes to its own patch
>=20
>  drivers/usb/typec/class.c | 5 +++--
>  include/linux/usb/typec.h | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index febe453b96be..b5e67a57762c 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct k=
object *kobj,
>  	struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj));
> =20
>  	if (attr =3D=3D &dev_attr_active.attr)
> -		if (!adev->ops || !adev->ops->activate)
> +		if (!is_typec_port(adev->dev.parent) &&
> +		    (!adev->ops || !adev->ops->activate))
>  			return 0444;
> =20
>  	return attr->mode;
> @@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
> =20
>  	if (is_port) {
>  		alt->attrs[3] =3D &dev_attr_supported_roles.attr;
> -		alt->adev.active =3D true; /* Enabled by default */
> +		alt->adev.active =3D !desc->inactive; /* Enabled by default */
>  	}
> =20
>  	sprintf(alt->group_name, "mode%d", desc->mode);
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d616b8807000..252af3f77039 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *cabl=
e);
>   * @mode: Index of the Mode
>   * @vdo: VDO returned by Discover Modes USB PD command
>   * @roles: Only for ports. DRP if the mode is available in both roles
> + * @inactive: Only for ports. Make this port inactive (default is active=
).
>   *
>   * Description of an Alternate Mode which a connector, cable plug or par=
tner
>   * supports.
> @@ -150,6 +151,7 @@ struct typec_altmode_desc {
>  	u32			vdo;
>  	/* Only used with ports */
>  	enum typec_port_data	roles;
> +	bool			inactive;
>  };
> =20
>  void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd=
_revision);
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--uitaZZ4HI1y6kP8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N1rgAKCRBzbaomhzOw
woa/AQClwvgkDgjG8nKbR+T6b3aSmlK/AY9NW+YEO8etrtu2CQD/VoPsbnYYRSRD
wfJa2/2WUrHFrKSpbvZi5szLUf5XcAw=
=dvzt
-----END PGP SIGNATURE-----

--uitaZZ4HI1y6kP8G--
