Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1FF2B9B5
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743490; cv=none; b=B+MNmRqhor2JT79ptwrRxwPikV+5tIxsXsUWlCsXC08dWDSpHSz2vBdrTcKrmOdsfQI+xGyGA4uulNddE1i37ZEPu8fnJOKk17KJphdrr/5BJFzTk7feQ4Oy+Yn/zPOnbynY3fTNE+V0Ygmf1WR1CsdZLOX8TsbBoT2h1El1yYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743490; c=relaxed/simple;
	bh=3WbLA9Tayyx5l7XBtxYtcQu/1RXvOvT4WZKieEDaOzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b88Ru/RVKiFNfcTHNlYz3Qz4r/d+RVuX6zwnCSYO02xSLxLQcDWGSwoNl4Mr3toFyUXNHWeuvzwYnNzsouKSWA0khjaNN+4v/usLhe1ubqWoxrRfH2fizHv0rH/QILSzwk3YdMredvIspYJf9aOi6V04hxZbsTGesiQhWYfnjy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bDVcknMn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bDVcknMn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1deddb82b43so171095ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743488; x=1712348288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg6m+O36BVgBKp2BfarjLDVsnWA4tAwgiFOnj36SdA0=;
        b=bDVcknMnhmwYQq4dQymnCD7/A12Hpd/ZmqZpmMXqk+N4ho+icl+tFZvQH149sp2Biy
         UifatlkBVcKqG7pZ7NeXFDpabgKEeZWP//kD7h/1bpZMT7Md4PkpL6H5SAJAC+KjIYbO
         Zrvee5j95foTtsxR8qxSEW7jtbniGp5CdBtBKuayFkobeqQhkSwLJdRwNqtJzDkYbCbr
         CZfqooXs8YBpFemYmwLbLFeXYS0xka+ESjfmZL5hBoZgDzrw/x2nF4k0ynjZw1jhEYLv
         CT4fBHmKe9zNibl/mmdzuPozfcdQHIRMkJ+deOMU97mJB6ZnYrlyplH7icAQokOmxcIq
         Ebow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743488; x=1712348288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg6m+O36BVgBKp2BfarjLDVsnWA4tAwgiFOnj36SdA0=;
        b=KeErT6mm1F/70WkDeIL+dlsIFYJwF33IfhYhU2ddvpREWeVVGTuI0vl2CGpvHaLKuI
         adV21uOV4iL1L5HP8rXx3bIolYtRtDdiGrnWV/gdpWsbzgrizIWUGCWN6/q8RAiA0/r/
         l9pd3ZX7pYHoQ0SElRkru0BVfm75hy0UhwoR868dBMvx4ukFFj1sAZxOObMLWSlFV3uT
         H7W8yz6jixikPfpCAT4Y0nbrJAwlWUoAjGPU61b/Y2nkqGs9L8ClOy1BDQT+e5KOMURc
         kramcOoaZOliewu/fPVwZAglYef0ByMmCLDB2xs09pbRaFGUQH5ONzd64mPgOCfBZkyT
         JGqw==
X-Forwarded-Encrypted: i=1; AJvYcCX4dF+wuAmA2XJod2i/AdedSTgGgmFZaV3I2XAGQh6nUD5AxoNOkJsaogJTvdbPK7DvVfXdvU/C17KpYlouWx05oWhA4HtyIvSI9y1oacW5
X-Gm-Message-State: AOJu0YzHIl6VkbDHHDeAqcZAWjiFiJKD0D+zm+hFwsG/9k5Ev2MofNRL
	ExETlQviRCvFFJrxbWgN/qKbT2UYEi7IlC0hk4icScj34LlCKxk2JNUyJ/6otw==
X-Google-Smtp-Source: AGHT+IEMrr6gtaQSq3svrIypR7Gvc5mKqMuHZj3C6jkaJI+vd2LfrkRr6mbcX6hbmqCHo2nHi/KWcg==
X-Received: by 2002:a17:902:eccb:b0:1e0:a494:4bb7 with SMTP id a11-20020a170902eccb00b001e0a4944bb7mr286932plh.2.1711743488041;
        Fri, 29 Mar 2024 13:18:08 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902ec8300b001e035cecd27sm3828903plg.129.2024.03.29.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:18:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:18:03 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 12/18] platform/chrome: cros_ec_lightbar: provide ID
 table for avoiding fallback match
Message-ID: <Zgch-zclVLSqTFVZ@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-13-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jGJ4Z6TsBTQg0SOc"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-13-tzungbi@kernel.org>


--jGJ4Z6TsBTQg0SOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:24PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_lightbar.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platfor=
m/chrome/cros_ec_lightbar.c
> index 6677cc6c4984..1e69f61115a4 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -9,6 +9,7 @@
>  #include <linux/fs.h>
>  #include <linux/kobject.h>
>  #include <linux/kstrtox.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -594,6 +595,12 @@ static int __maybe_unused cros_ec_lightbar_suspend(s=
truct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_ec_lightbar_pm_ops,
>  			 cros_ec_lightbar_suspend, cros_ec_lightbar_resume);
> =20
> +static const struct platform_device_id cros_ec_lightbar_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_lightbar_id);
> +
>  static struct platform_driver cros_ec_lightbar_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -602,10 +609,10 @@ static struct platform_driver cros_ec_lightbar_driv=
er =3D {
>  	},
>  	.probe =3D cros_ec_lightbar_probe,
>  	.remove_new =3D cros_ec_lightbar_remove,
> +	.id_table =3D cros_ec_lightbar_id,
>  };
> =20
>  module_platform_driver(cros_ec_lightbar_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the Chromebook Pixel's lightbar to userspace"=
);
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--jGJ4Z6TsBTQg0SOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgch+wAKCRBzbaomhzOw
wuzjAQCy/MjVt+YNcK751CMXj2j/EU6HWv9x0qhgCLWvuXJxDQEA3SMl8hSQYrBf
8OGD/VWV78xkaXLmP8YciNQoF+pNowI=
=u+MD
-----END PGP SIGNATURE-----

--jGJ4Z6TsBTQg0SOc--
