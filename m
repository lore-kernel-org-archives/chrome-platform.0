Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24A022FDF4
	for <chrome-platform@lists.linux.dev>; Thu, 16 Jan 2025 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737068334; cv=none; b=MQyQgr1P5KkU4rpGBrCQO40uw4uhEF5UOLRDFmfsGwF6+v89KimQb1AglMljDCSrz2h8xTBcY8h+Z5NIOoWd5HnvtjQ/Ctdk2xK2S9oJ5W8nRXRFZihahF8YSnwKo90yb/DQuJczzjG626SEFDg074v9T2bRwBLEdk1s+Y5IUX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737068334; c=relaxed/simple;
	bh=g13QriG2HaYgqb0uLffYe8D5Ap9JtELmtfDRmSibjnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kt/0PULZDynNVf6BZoCBd3Q8HSIXSrhMjkv4aWFvNfe3Yb6syoLyhyLUBR6ElDrb4VUnip+myphGaTt6ajktw8YC5PUYbZ6G+ITpC+m66OUd2GDvRAvXjU9r93RDfIWUK1oXxcryopD7Vb5lIQV5PGfD33nv1XDaKV0esCBfims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCHbeNpA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCHbeNpA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso2209548a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 16 Jan 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737068332; x=1737673132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvMp8UJ+AUZmpf/2T1YDxrAGfWL2IguTr0D7rYDEuSg=;
        b=FCHbeNpASrR5CRNhXno8EoLuT40RF1FzaieWQH4O4rpshi0T3d2f9Ni2e7HSH2SXmL
         tZRVNfdv+RsloB2YBQBXCFA8qtZVJpQlHMXQutNXzECuQoD6f2k3i/cbS32TF+3DYZs8
         Vq1D52ElCfs8nteIgHwik+IQifF63lQ2Y/osSqv1Tt4T1UFf7S48+NphwuJyhecFWT/e
         QBwV7XnbUeugiMJyYHY2V4861nOIOdKblg3kc+H4SYiA7KjUlpiABOO+B+lRbcsTEH5R
         G0uhPQX33cuKThP5X/YxxjMTvlXVKI6zLa79omrGddXClk55MmP35lKm90dcPiv+daap
         EvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737068332; x=1737673132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvMp8UJ+AUZmpf/2T1YDxrAGfWL2IguTr0D7rYDEuSg=;
        b=dalYoq7poVhtwGQy02gJgGQ4ewNcuxjrYHzhkyWocp8hEPyRYbxy07/b6VCrCt12XQ
         HEldzW454otsPDuMg3KjNbS91+Bu1av899ObnuwJsui1eO1Q5w/ym3nApVy6rC20Dkxx
         pzZ7EQDWuxbK4nAsNY1tmKhOZIqFYW0+4CWYrA4zpRBFyw1Hc8J0dn7NLLs7gUug0nF6
         lnhw1EC0ETBa2BV4BOS9NDktyhHYOW1Xk0xdFKZqaFQ58Invuhs4SYF7ur3/cTsFTK1S
         UzeUi+fVwuaewZUki+L64QvBr608N+VDpcR530w8NZG9LZBWKkuub62FZ/1ln2AKBJoQ
         fAqg==
X-Forwarded-Encrypted: i=1; AJvYcCXl+pPHI8HonzquDmAb2m+UT1bEBIq8vP4kgWwMGxS9oB6ZPablKtH+TRcmyGw3HiWRXqjX5QB7yfbdMPxmT90=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl9rM3VEMKZZTcldxmNY8YRM7GjRd5MhPlFWsnhd1QwyiFKiPI
	snw4hd6Hg6WftMBoIZpwzHiGf67MmpMOkB/ZyIdeijhq2soJzhMz1f/7Ms4dIe+tdQh+xvB1ZUL
	XuA==
X-Gm-Gg: ASbGncvcCmWQcUClRD+t0fa5PNXZV79uwc1DX48RIkQhZYb2wprQuQsnl613uz8hFxL
	jfwcrAjvMvopEUEGacRYO8JnRqE8jorBxf3gOLpOJf3iTpKTw16stIGSpFtrSFrf4OMR2mGrFWb
	M15688k/EyXkWRUoYpz35kMEJ8r0nzFQN7Qkf1kG9jq5LXojoY4TxwcQFHN9TtoJCyFJTYkjkzd
	bsCGoPo5omIzOA+ogK4CBsBaAyd9eouUPFCzswVCfkIctRVQSPYmvsnjhDFvUW6zPuzuujW649X
	MC8RHwh537nnZw==
X-Google-Smtp-Source: AGHT+IHI0gnCSzyJPMRPrLaAscBds4qE3vC5wbmKSUGCK9b/EKZJbpAOYjrqiqEA0exBtUcdYrt1Uw==
X-Received: by 2002:a17:90b:38ca:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2f782d306dbmr434742a91.22.1737068331992;
        Thu, 16 Jan 2025 14:58:51 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77629bf96sm715296a91.36.2025.01.16.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 14:58:50 -0800 (PST)
Date: Thu, 16 Jan 2025 22:58:46 +0000
From: Benson Leung <bleung@google.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org, Lukasz Majczak <lma@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] watchdog: cros-ec: Add newlines to printks
Message-ID: <Z4mPJmbBXqXkfoX8@google.com>
References: <20250116224605.110870-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pw379ZAJmMFLjC7o"
Content-Disposition: inline
In-Reply-To: <20250116224605.110870-1-swboyd@chromium.org>


--Pw379ZAJmMFLjC7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 02:46:04PM -0800, Stephen Boyd wrote:
> Add newlines to printk messages so that the next record is more easily
> readable.
>=20
> Cc: Lukasz Majczak <lma@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/watchdog/cros_ec_wdt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wd=
t.c
> index ba045e29f9a5..716c23f4388c 100644
> --- a/drivers/watchdog/cros_ec_wdt.c
> +++ b/drivers/watchdog/cros_ec_wdt.c
> @@ -58,7 +58,7 @@ static int cros_ec_wdt_ping(struct watchdog_device *wdd)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_RELOAD;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)\n", ret);
> =20
>  	return ret;
>  }
> @@ -74,7 +74,7 @@ static int cros_ec_wdt_start(struct watchdog_device *wd=
d)
>  	arg.req.reboot_timeout_sec =3D wdd->timeout;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to start watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to start watchdog (%d)\n", ret);
> =20
>  	return ret;
>  }
> @@ -88,7 +88,7 @@ static int cros_ec_wdt_stop(struct watchdog_device *wdd)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_CANCEL;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)\n", ret);
> =20
>  	return ret;
>  }
> @@ -136,7 +136,7 @@ static int cros_ec_wdt_probe(struct platform_device *=
pdev)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_GET_STATUS;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus");
> +		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus\n");
> =20
>  	wdd->parent =3D &pdev->dev;
>  	wdd->info =3D &cros_ec_wdt_ident;
> @@ -150,7 +150,7 @@ static int cros_ec_wdt_probe(struct platform_device *=
pdev)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_CLEAR_STATUS;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus");
> +		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus\n"=
);
> =20
>  	watchdog_stop_on_reboot(wdd);
>  	watchdog_stop_on_unregister(wdd);
>=20
> base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
> --=20
> https://chromeos.dev
>=20

--Pw379ZAJmMFLjC7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ4mPJgAKCRBzbaomhzOw
wm3iAP0Z7Dg/5jcSL4eji0cptrtvNWyhVdS51qVX3Tnlw+bADgEAjjcwFG7aUqYQ
ahmXBLry1zvisbI5crLJC4Jadbo2rwY=
=ppxp
-----END PGP SIGNATURE-----

--Pw379ZAJmMFLjC7o--
