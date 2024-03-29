Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D013B789
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743191; cv=none; b=MB11zyZuS7rl9NUNwe+nyZMa27cOF30s6vPPMLHz6jKcl3bV5WlLBhhZr8/PDfEPOUnZRpOIDVp8saZLbz24v6TMh6HJMLi5Zn4mb+2LfC4/XDqJt7XGkPpGT30HtP2YITsOj3oi8uS4Fc9tyL/QqJZJ8PoCpKP7rYU9VyzdcDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743191; c=relaxed/simple;
	bh=64ji9IC1Hu+2024AZaYzeAC+cQygfOXR5dS+40xn8f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlIAXdG+d4ijvYMYhcfsTA9s7xYPpBYlH+bd/XtbGe/aSeOEZAq0BxN+AUIlUzunoCc5kpqsHkR97NI4HTkSgwCjq3HPhNmqKHUPJWf8rwfGbBwY5K7svpVx+2ywE0f8w1cFoP4ryWprnr+OzJTwwTW2OC5dARsckk89qP7zL9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j+06BXwS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j+06BXwS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dee917abd5so136585ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743189; x=1712347989; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8pQk4LJkHg11AbwvSp4Lvo9KElPGlkOzxln5zVz7SwM=;
        b=j+06BXwS1mkg1GxOr21PCW92dFgAwNoy5pNBO3UJan9PXiPaItxlS2BdsiUzkk5bAh
         fN7m+9/E+BwXjSI60EM+yA1K72iiKeFe8WQ9DUMntciK6VqatSZ7h61eDPU7OyxdVcpv
         gCtB2mbksn/5j7RJiqMTO54wyc8LqO44126Qcc4L4ghEG67BpTmz/2giVY2jFuoz64L+
         wsiKVML21qqs0G7cHnnWRHoO1axhhzAOkiwpRWCHfizJz5J9hGRWPA5LXQ04giEPca3w
         zqBEW/GzJTVdi3ENaGU1cvZJprEXEEC0yv5WV2pQsuZ2v9V5o3bIboWqR/H6ZghGEihF
         tARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743189; x=1712347989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pQk4LJkHg11AbwvSp4Lvo9KElPGlkOzxln5zVz7SwM=;
        b=wnCJ+FunPJOP95hy1BJbAFMhIDLxy2jEUz/CaykjC/W3TV3GiQc0melLRtj0ii8ClP
         R5NK0E+7QyqKVTzxQ/2+9By1SUpaghjQmZ0Ay7kP4/tmCGVD7dyU0G55cNAg9+Th2ZDh
         dKXUeEobWbbTfiVDb2d+hoZHI8ChI0ksgbC/yifb6JnrfJOD0IOZFf5CuWp39CegBVmb
         jvVwZCLMSKOHpHaLn9nYCFUWJnZnCIe3KyBgAfbsff2vS2UUSa2oDJDHB1nzBfBXA4on
         58R0Kvd0cLihcJcP9M7HiSQOXDoWx7G0XmhG1nnTHI8i7iOhsAjZYovxKwd19tKf8nDP
         kDUg==
X-Forwarded-Encrypted: i=1; AJvYcCUDE/e39fXC0SXgDkXXrQniTA0hNUCws7tvEyLIYpD8H/Q5YeKyG4xJJWTbF6QpfKIizJDyKJoqwxAqvHd+v959MJPywEiBTLA4vJWd9W+a
X-Gm-Message-State: AOJu0YxZ8EFIQS5qcOBSfrcZFENWuYHXZRbScrcf39RI5QupN+pHJTkj
	KAvcQ3hLsDQW3UAfAAjlkssreOb+ty/A/91t1vfG7+fIMk32x5CgVzJgS8RjXA==
X-Google-Smtp-Source: AGHT+IF3YrRjdbxhw8menJ4HsqoSivAt11cHn+tH44S0xY/wxhoLIxV2iowxVCC8jfBv+JS+UAc1Kg==
X-Received: by 2002:a17:902:ec83:b0:1de:fe62:547d with SMTP id x3-20020a170902ec8300b001defe62547dmr218975plg.17.1711743188363;
        Fri, 29 Mar 2024 13:13:08 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id q24-20020a638c58000000b005dcbb855530sm3311904pgn.76.2024.03.29.13.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:13:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:13:03 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 07/18] platform/chrome: cros_usbpd_notify: provide ID
 table for avoiding fallback match
Message-ID: <Zgcgz1Kb6nhTEkEH@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hVbASdRlgdWHtyR/"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-8-tzungbi@kernel.org>


--hVbASdRlgdWHtyR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:19PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_usbpd_notify.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platfo=
rm/chrome/cros_usbpd_notify.c
> index aacad022f21d..c83f81d86483 100644
> --- a/drivers/platform/chrome/cros_usbpd_notify.c
> +++ b/drivers/platform/chrome/cros_usbpd_notify.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
> @@ -218,12 +219,19 @@ static void cros_usbpd_notify_remove_plat(struct pl=
atform_device *pdev)
>  					   &pdnotify->nb);
>  }
> =20
> +static const struct platform_device_id cros_usbpd_notify_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_notify_id);
> +
>  static struct platform_driver cros_usbpd_notify_plat_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_usbpd_notify_probe_plat,
>  	.remove_new =3D cros_usbpd_notify_remove_plat,
> +	.id_table =3D cros_usbpd_notify_id,
>  };
> =20
>  static int __init cros_usbpd_notify_init(void)
> @@ -258,4 +266,3 @@ module_exit(cros_usbpd_notify_exit);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("ChromeOS power delivery notifier device");
>  MODULE_AUTHOR("Jon Flatley <jflat@chromium.org>");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hVbASdRlgdWHtyR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcgzwAKCRBzbaomhzOw
wmXUAP0e90MoNgVG9am5cylWB+UmMTebF6MYL12zTLUJ1Oy5mwD/bff9LMAGtGCa
3w6bminBlZ7Rydb+ZypKGjWDEsQDwQI=
=Gnst
-----END PGP SIGNATURE-----

--hVbASdRlgdWHtyR/--
