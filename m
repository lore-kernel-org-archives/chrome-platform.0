Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727B713A89E
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743283; cv=none; b=ainVxBDfYGoi7icg7lUJZk/EJAgBjKbeRYdn/5qV5+8v/AV9unjrDBjjO6VFy0sizW4l1dB6LXeulcgXh0rQsN3IGjbgYtTnUzpG7gSO2zzgkAFQJzTgIssCGacg9dKIhGhPcahbNSuOiJVcCbI0FNbbfpxXUbkIj6/KXd3kwy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743283; c=relaxed/simple;
	bh=Ue67/aWZBFXHbks1VsfgKBe2xxXryMkq5NnPitT7UFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1BIGN/MwxgZrvxIJyCznzoWgiejXcTXepIVCYbo5flFWOmxwXOhlquKlStsbDLqBzQH/S4fvpObkLcqOdca4hzrjk+7WsYJ67wrox3s4AnqvtquP/sNSaXuxH+dKg/2zJgWy5yeCbLr+6EaZGqLnJhRBN49fvpkeBq5IDfG608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vZ+Can1k; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vZ+Can1k"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e062f3a47bso166265ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743282; x=1712348082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KyKDOpyo0CvUhZvmqAETcwlXYmOLuTf1osPn+ePZivQ=;
        b=vZ+Can1knaIoPVlyGZpDxWY0cHoxkdh2Vy8yA8U5AtvihmXaEmIbbZigJfuEcycomZ
         gmx5FoaKWGCmCetxUyQQA6EE2susZj34dZcsn9ca535lDSkZCGhMpF9/+pja0V9jL2zt
         0+10a6sN53kh3S8RiW1vTPNpsmBYJNdeLu9oH6wDFrn6w5kP0REAXeWup5ahCy4Ount4
         tmepOQMBLP1t6excUYCnVMC6f2QJKrCc674TxrE8zUBFGshV1LzS07TzPsO777geuT9F
         IleTACdtDVlg+cPhu4+OUckcPYkuSsIoMhiHQTR2Q+hj7EuBYCju/3UEQD5expmUM0LA
         v2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743282; x=1712348082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyKDOpyo0CvUhZvmqAETcwlXYmOLuTf1osPn+ePZivQ=;
        b=MtANTO1KW0dTUkt6rpar49GCj0s1B/uHc3JNmCDGxXbzUqmQn/cZBHKjBJJPakA0/V
         c5xkqq51uoNwBs2Gp7d6rQ3P9ToahakoXekiyt+520hgrBGZkVthmfYh52uFebKJqe/t
         FmGfiQnVgf9Y7MVa/bK3BobPVcYuOdTuwroVbJfZjeZxP1Kj6RpE+tHIfki4cniCaRcx
         x9cFPk7rD76hZHCUGDJNG+mL9/g8O+3hn66ltI292LYCFSY+1/q+aaMTBQycLkHpYRgK
         k5IUOQ0dBG3iWRS+kWpWq3PyWtZoTvs2i1NhKWtYC6Tff1zEqmuJ6W05kEs7bNUHtfeH
         ouog==
X-Forwarded-Encrypted: i=1; AJvYcCWrPGj3qJtmH/JDIZZegYYsg4310tmwK0FcQrKBwg6jtPnXghIUahwd3VNEJvDG8NZ3S641E/oQAV3ZVzGAvVV0eebWhBaV7I12G1sQ80T5
X-Gm-Message-State: AOJu0YwVCoj3rXs5RYisAjq8ZIlbjk44n5pWbfD5P1/wGbIS2ysnPCsW
	TPht8syxaqYh2+Ry3PCaUAujpSl287ShRzAxMWGLudhakhtweyS6zpquq6pfKg==
X-Google-Smtp-Source: AGHT+IEs/KL53oMZZ4ceHxkkiQGhFUFfwtYFCC7gcQBKJHFph/5YpTLepHU6Fk1HitA6rVmfl4ITHA==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr226387plg.7.1711743281527;
        Fri, 29 Mar 2024 13:14:41 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902ecc800b001e0eaf9ac5dsm3831012plh.36.2024.03.29.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:14:40 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:14:37 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 09/18] platform/chrome: cros_ec_debugfs: provide ID table
 for avoiding fallback match
Message-ID: <ZgchLZc1jJnPiTLs@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-10-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7y0qWvUl4tzyws91"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-10-tzungbi@kernel.org>


--7y0qWvUl4tzyws91
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:21PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_debugfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform=
/chrome/cros_ec_debugfs.c
> index 6bf6f0e7b597..e1d313246beb 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -7,6 +7,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -564,6 +565,12 @@ static int __maybe_unused cros_ec_debugfs_resume(str=
uct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_ec_debugfs_pm_ops,
>  			 cros_ec_debugfs_suspend, cros_ec_debugfs_resume);
> =20
> +static const struct platform_device_id cros_ec_debugfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_debugfs_id);
> +
>  static struct platform_driver cros_ec_debugfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -572,10 +579,10 @@ static struct platform_driver cros_ec_debugfs_drive=
r =3D {
>  	},
>  	.probe =3D cros_ec_debugfs_probe,
>  	.remove_new =3D cros_ec_debugfs_remove,
> +	.id_table =3D cros_ec_debugfs_id,
>  };
> =20
>  module_platform_driver(cros_ec_debugfs_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Debug logs for ChromeOS EC");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--7y0qWvUl4tzyws91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgchLAAKCRBzbaomhzOw
wtX6AP9vqoC57DVK+nXf0l+z9YktOJhv6yXw/fbq5tXbW6H4lQD+PtEfbvOmSXSb
J9Kw8aSpHvzFt8U3I38LIhsCTGn+KgY=
=FNvA
-----END PGP SIGNATURE-----

--7y0qWvUl4tzyws91--
