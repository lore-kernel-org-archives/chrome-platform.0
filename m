Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7841C72
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571475; cv=none; b=uO9REGk06Sd5WZzWImhWTBiHrzW74owfMQRGQUBdxu7A39FVfC8wsu1Ycuw9xn8xqLpO3tF4WC75tL2Z+jPo96cEKvSYG3LsoM/vV0w59XOsj0dk11opIAproEeEe0GQku2J+SedcJfUXK6SHYy3SlQyovCPFlMsWRa8fZyPlps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571475; c=relaxed/simple;
	bh=OudgbSikughOw5dIyo7PTJmkitrq37OtKzhTk8CzY7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smP/LovTSjj5f4Y6WADOh89QhOns+nCTkY7zPdZdM8sDXMf7ruGbwC74axUrfH+GRHdMy+ocLAkBzrehytqUWvSGt9svl//jkVy3XrLqKd/iXFoclDwHRn/SC+246YQNM6jF9Vz+4Ts/8Aa4DIWMTyQUI3I4cn3ZRT1JsYRra6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NVjCI18W; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVjCI18W"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216401de828so2501435ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 17:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571473; x=1735176273; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QzoWB9uKmqzEITnep0Kte2yC094FBZkHjSVIcpLE68o=;
        b=NVjCI18WTMuieGSWISkCML3/gkLywWgOZ1Zvyk5sEnbZZfN5RUHRDZ42gBZEMd0FvS
         rOwMG3cBo2pBHGhHc7ShzqQp+kZZAbfqwMcwomWzJRzDVVQKEiP+fbjrSReeL4zyvFcr
         pz84rTDb2a1iZ4lwRwDv8/nlCuvUTLpEzqv6BMHhY2C/SGNpD+epxmdrs1Pfo02aJc1G
         /RqbT6iFz7ln2vGm/SYMn5EsqAP20zvwNvcF7d5GOs53GIBXTqaZAe41sBAec6OhumMT
         6j4wvZcUH7QpYZ93rqy4C8teJxE2boVDYxtP0NM++6ccejFijtAzi1o0Zrz9EOdSucBn
         Vu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571473; x=1735176273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzoWB9uKmqzEITnep0Kte2yC094FBZkHjSVIcpLE68o=;
        b=v4BIHFiCNi0gnlazfw9WPV1I7DF/8LfNsYQNan66KGipYpWAYTAtJ+j/FudHyXeUya
         6RJaqGPoaUVmVkfFNoVRQ73fpl9OKe//f/zUg/tmeK+xpWE3t75V1YRNJx+JVrTcZnZ5
         +hQQhd9QhAMaC10wInvp41I9wT89tvKrmmXwFnHR/icH8AMxhJwcMEsdcbBNhLxwbdZm
         biW6H9qw66Xevjd24vnI27T1pA46QmoqQN/mJD31NtMo2OseoFJbT7kfr3U9tywOymfH
         JmuOdthtB9n7UGkVex3tyhucRafQZa8Of1oA957F+BtyrUGWFSnnwgvHjLCf9EfzwPBg
         ewQw==
X-Forwarded-Encrypted: i=1; AJvYcCUHVTQv2mP0AIN1pB5L+VhqkYVc0N7P3tGvYIdYZVFTQMmRu0PMMcOKoztnwyrFSHmtMKOGxOBk/TSFmGKv2lg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2MoiFmQEdd1xztCvWUTYtf5eQNX97mNCWuaqG5D0yxd94od3v
	0b2PhD1TwS15RiMPbueQcBf+mZlJDgX3MTGi7eJapHVT8b4ufXOz5RdqENNshg==
X-Gm-Gg: ASbGncumm0jQGj2moUfm4J06iNzLkwOvBZRDNwzLsJhlLQYmoAvKs/7TTZd3ITdq/9O
	sVfqrtvo20UAHIAfvSI+Vj3O8Q61vlst5Nx4L/zeDNXYae4QPk1hm9FMeAJsv8yt5ebOFAC6tI7
	KhZ7ukhIYDEF6cJ2bCeD6FCDRM+XRCuS7AoynFL4RNPsapUzyOi1go1h8abYDEr6q1oPkn9/9gp
	HRyfOJ072jjWgH63FbjJts7AXRtJYHRPexdUI2znNE3aCDwiytlN0jX3ORpzRMjtxMwfmfpbVpY
	pESOEcYlauSwX+0O
X-Google-Smtp-Source: AGHT+IGnPR1XF1O8ztshv+NnnMvpSQktuAIwES7k5tAbAhO5cgkLOeRX6lcm3rVoCEz239PXsbcVBw==
X-Received: by 2002:a17:902:d48e:b0:215:3849:9275 with SMTP id d9443c01a7336-219d99014damr19985905ad.49.1734571472985;
        Wed, 18 Dec 2024 17:24:32 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde42sm1634185ad.169.2024.12.18.17.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:24:31 -0800 (PST)
Date: Thu, 19 Dec 2024 01:24:27 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/8] usb: typec: Only use SVID for matching altmodes
Message-ID: <Z2N1y6GWDzDt5MUT@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aLLMXR7XCDUUdaWP"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>


--aLLMXR7XCDUUdaWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:42PM -0800, Abhishek Pandit-Subedi wrote:
> Mode in struct typec_altmode is used to indicate the index of the
> altmode on a port, partner or plug. It is used in enter mode VDMs but
> doesn't make much sense for matching against altmode drivers or for
> matching partner to port altmodes.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Rebase with module_alias_printf
>=20
> Changes in v3:
> - Removed mode from altmode device ids
> - Updated modalias for typecd bus to remove mode
> - Re-ordered to start of series
>=20
> Changes in v2:
> - Update altmode_match to ignore mode entirely
> - Also apply the same behavior to typec_match
>=20
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  drivers/usb/typec/altmodes/nvidia.c      | 2 +-
>  drivers/usb/typec/bus.c                  | 6 ++----
>  drivers/usb/typec/class.c                | 4 ++--
>  scripts/mod/devicetable-offsets.c        | 1 -
>  scripts/mod/file2alias.c                 | 9 ++-------
>  6 files changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 2f03190a9873..3245e03d59e6 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  EXPORT_SYMBOL_GPL(dp_altmode_remove);
> =20
>  static const struct typec_device_id dp_typec_id[] =3D {
> -	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
> +	{ USB_TYPEC_DP_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, dp_typec_id);
> diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altm=
odes/nvidia.c
> index fe70b36f078f..2b77d931e494 100644
> --- a/drivers/usb/typec/altmodes/nvidia.c
> +++ b/drivers/usb/typec/altmodes/nvidia.c
> @@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode =
*alt)
>  }
> =20
>  static const struct typec_device_id nvidia_typec_id[] =3D {
> -	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
> +	{ USB_TYPEC_NVIDIA_VLINK_SID },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index aa879253d3b8..ae90688d23e4 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const stru=
ct device_driver *driver)
>  	const struct typec_device_id *id;
> =20
>  	for (id =3D drv->id_table; id->svid; id++)
> -		if (id->svid =3D=3D altmode->svid &&
> -		    (id->mode =3D=3D TYPEC_ANY_MODE || id->mode =3D=3D altmode->mode))
> +		if (id->svid =3D=3D altmode->svid)
>  			return 1;
>  	return 0;
>  }
> @@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, str=
uct kobj_uevent_env *env)
>  	if (add_uevent_var(env, "MODE=3D%u", altmode->mode))
>  		return -ENOMEM;
> =20
> -	return add_uevent_var(env, "MODALIAS=3Dtypec:id%04Xm%02X",
> -			      altmode->svid, altmode->mode);
> +	return add_uevent_var(env, "MODALIAS=3Dtypec:id%04X", altmode->svid);
>  }
> =20
>  static int typec_altmode_create_links(struct altmode *alt)
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 4b3047e055a3..febe453b96be 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *=
data)
>  	if (!is_typec_altmode(dev))
>  		return 0;
> =20
> -	return ((adev->svid =3D=3D id->svid) && (adev->mode =3D=3D id->mode));
> +	return (adev->svid =3D=3D id->svid);
>  }
> =20
>  static void typec_altmode_set_partner(struct altmode *altmode)
>  {
>  	struct typec_altmode *adev =3D &altmode->adev;
> -	struct typec_device_id id =3D { adev->svid, adev->mode, };
> +	struct typec_device_id id =3D { adev->svid };
>  	struct typec_port *port =3D typec_altmode2port(adev);
>  	struct altmode *partner;
>  	struct device *dev;
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index 9c7b404defbd..d3d00e85edf7 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -237,7 +237,6 @@ int main(void)
> =20
>  	DEVID(typec_device_id);
>  	DEVID_FIELD(typec_device_id, svid);
> -	DEVID_FIELD(typec_device_id, mode);
> =20
>  	DEVID(tee_client_device_id);
>  	DEVID_FIELD(tee_client_device_id, uuid);
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 5b5745f00eb3..7049c31062c6 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1221,17 +1221,12 @@ static void do_tbsvc_entry(struct module *mod, vo=
id *symval)
>  	module_alias_printf(mod, true, "tbsvc:%s", alias);
>  }
> =20
> -/* Looks like: typec:idNmN */
> +/* Looks like: typec:idN */
>  static void do_typec_entry(struct module *mod, void *symval)
>  {
> -	char alias[256] =3D {};
> -
>  	DEF_FIELD(symval, typec_device_id, svid);
> -	DEF_FIELD(symval, typec_device_id, mode);
> -
> -	ADD(alias, "m", mode !=3D TYPEC_ANY_MODE, mode);
> =20
> -	module_alias_printf(mod, false, "typec:id%04X%s", svid, alias);
> +	module_alias_printf(mod, false, "typec:id%04X", svid);
>  }
> =20
>  /* Looks like: tee:uuid */
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--aLLMXR7XCDUUdaWP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N1ywAKCRBzbaomhzOw
wuiFAP9X5SOHP1/8ATb5RH/CLmVZCq302+xJAOZdzzJN9uFo2gEAz7ISkoNJF8P3
b/TcgeVnjFyabDPha9Ho3/YKuOUpsQI=
=a5gb
-----END PGP SIGNATURE-----

--aLLMXR7XCDUUdaWP--
