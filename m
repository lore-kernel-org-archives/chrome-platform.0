Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835A2033E
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742945; cv=none; b=SQhuIifH97Pmc/RBcaqJMsGgg+g1t8vY3FKtgjmiMA0i11sFRPulG8ISCq0eWPY4PVuaVhU2Vaq6SLGNZRREL80bFFtxyJ8dr03zc4LvPIlAB0jdKK1Tbvt8IjY/jIXytE5VCZUuGk3ob990hL/d72cOqg1XSHp/H8UvqPus/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742945; c=relaxed/simple;
	bh=kq4W84OOdXe0SAH1kwi4zfWhegD8EvP3wUxvTk2hYHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsPc5v6WI0d4b4iWeoaj0gEaFFHIe6GiIkF9WmaetS/OIG9gd8yXKWZ/icslX1Vh4OSZEewp/YfJGHDwQWQ0Wj6dtuHiPen2AU6hjEjQ8CB6fhsTa0jyCf3lNNAKfZMScMWP+AoEiT8tuOS+Wzfjp8VHa87lwCSaCNgAEe/0GQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YfpESn2T; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YfpESn2T"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e062f3a47bso165265ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742943; x=1712347743; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X51BRpaIR1rgIkHIXzIm1Zr/UOpT/8fzPdwE34KNRpU=;
        b=YfpESn2TlNz+yJLjySL3GYNzoEjDrGu+wtsa5Yx/AF3Ng2b4oJ/fx/Fa0g+0LZ1g0t
         Ls73qtTDUjKWuCk9CtaCooDcvrmBWJmIl7Rq7GhyD+AcxKHnmd0Ja8a0EFgJjkMHByyB
         /PxnN1aE6BK80WMKCQmflBesHi9JLeHkEiTNvjH+8vD/LhB4QgmrIVTawEKHOfsRfhbK
         97RwF5I9jH1J76JWPV45WTzmMXKd3Wx1dQyr1f3GTxe5kestKgEaJRf9xW2GcCKfGu+L
         PdYEVqaYNwZFJRVgEt+Fi/qYXP+3JpcqOGCYLFkqXpDWalwl7QKw69qpMCTk32mKkBdl
         mbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742943; x=1712347743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X51BRpaIR1rgIkHIXzIm1Zr/UOpT/8fzPdwE34KNRpU=;
        b=mBNQJ7tHk0T3SvRmncSAzV4lpP0gTDJCGdT5Ged3TMI6Zw/ezWsaBv8+tjflfj+cqh
         P50qvSyfaG01sC5yaSH1cmStJa2z53Cwi/k9QKtIQqHusi5Q7Dy0veZW+BiLvKCTAYN6
         iCjFwJxmdUgKnqbZZDp6IUgaX8dSfZysTZG2I00e6TNOLh1reBXK9DXhTUzn6HAUcSyB
         /RjeI98YjoNNcGpJil1qHQmboyYbYACi/vWZxj/sgWIBnRw0CWmYRfYKBPTPgSJ9Xq9v
         3qfPfCD3tyQv6BjZBq/w/HL1p7t00vYuNDT4vNSUsrTs8vvcDOjj8nocniEZ4QSmHwQr
         fbSw==
X-Forwarded-Encrypted: i=1; AJvYcCWYPIuRgpXuZ/YqelWkaKII+vZWknLfCKV1E7BtL3+7Ft4ewE4715RqedBjqzTYJIZEoCTpfM2FQC7lrgKMdgDtvHQ7e8zUPSOyN5wslT/5
X-Gm-Message-State: AOJu0YzfrW5Fz1A5ErKELBWVrn2Cj76Gh2CRayKhrpbHqcSMSyTNgNqG
	jvGfdk1ugSpXxCfp8BzCxaYrwrf82Pae9RNPS28634hbRztYY7aNfH8Y3yN3Kw==
X-Google-Smtp-Source: AGHT+IEVROVN2L7PJvbq/CNuGxVo6y8aWUouVMsGMh1RaHF1r6lXWYFexksw0vPDy+coj2+ze5VoPQ==
X-Received: by 2002:a17:902:fc44:b0:1e0:d205:2d80 with SMTP id me4-20020a170902fc4400b001e0d2052d80mr271499plb.22.1711742942350;
        Fri, 29 Mar 2024 13:09:02 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id g22-20020a170902d5d600b001dba98889a3sm3837003plh.71.2024.03.29.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:09:01 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:08:57 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 04/18] platform/chrome: cros_ec_sensorhub: provide ID
 table for avoiding fallback match
Message-ID: <Zgcf2UAbEaPHdfRR@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5eYOnsgA3ze6A0qN"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-5-tzungbi@kernel.org>


--5eYOnsgA3ze6A0qN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:16PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_sensorhub.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platfo=
rm/chrome/cros_ec_sensorhub.c
> index 31fb8bdaad5a..50cdae67fa32 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub.c
> @@ -8,6 +8,7 @@
> =20
>  #include <linux/init.h>
>  #include <linux/device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -247,17 +248,23 @@ static SIMPLE_DEV_PM_OPS(cros_ec_sensorhub_pm_ops,
>  		cros_ec_sensorhub_suspend,
>  		cros_ec_sensorhub_resume);
> =20
> +static const struct platform_device_id cros_ec_sensorhub_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_sensorhub_id);
> +
>  static struct platform_driver cros_ec_sensorhub_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_ec_sensorhub_pm_ops,
>  	},
>  	.probe =3D cros_ec_sensorhub_probe,
> +	.id_table =3D cros_ec_sensorhub_id,
>  };
> =20
>  module_platform_driver(cros_ec_sensorhub_driver);
> =20
> -MODULE_ALIAS("platform:" DRV_NAME);
>  MODULE_AUTHOR("Gwendal Grignou <gwendal@chromium.org>");
>  MODULE_DESCRIPTION("ChromeOS EC MEMS Sensor Hub Driver");
>  MODULE_LICENSE("GPL");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--5eYOnsgA3ze6A0qN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcf2QAKCRBzbaomhzOw
wpTIAP9SicLM3XbjTEPorbtG3rbMhaOnePPKH5yjXBIFP7/qXwEAuss+4GxuEWd7
nS0Spbtmg8usgOxp39oCbGQ+ouuUiQs=
=oAeE
-----END PGP SIGNATURE-----

--5eYOnsgA3ze6A0qN--
