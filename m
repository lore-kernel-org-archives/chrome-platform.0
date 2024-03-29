Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565D5B1EE
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742985; cv=none; b=TKRn8mKq61eqmyE3tSZPcr+BzQIF6VSrnyXfJlKlASJvbefjYX4WVWF/q0VoF9v27HvClhm3t36IUzw2C/WT7cfUJ+RMD65REqP0rnvh1btelQzKvxnhyPRGrRjecTIEkmmtCENPVgzXaIY2eEiz2WTLM0ZymuqEdf3RHJYWgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742985; c=relaxed/simple;
	bh=fpfqkmGXB7n9+0LYANgR7EqyAASwdGxlh3klBzxc6kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RefMsuLrbuAtcdHkUMKU8Sn+uK/c0w6j8d/cbAtCaixhXDrN48ST9bhxyssBsG6ja7S1TYr9a3djebxEXhvgkpqo1glx7RVN+7ew0v4l+v1HwnC3Q+DSFdG1ohuK83fKIE70aOnQhZxDtHwbjQHKXACF0BNGmiCOwhYvnsmMrjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=exfP4Seb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="exfP4Seb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e062f3a47bso165465ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742983; x=1712347783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIFtqdGIQ7mImaUplvEPxDs4CukYRUaTqeFy43qXsgc=;
        b=exfP4SebeIS6cl7GqYx7s9QOR+COPD9F3YdVEzSfGi5Nevdpk8SVtqbaGkwfiQ3/l+
         0q2Wl68RXdrTK8ftvkIQvjLKGNxgcYzwlywRP3NxbF1QpmnWx1VIlZBpdqM7aDTizFqB
         MUwZwa2y1OW2sdwvAZyTc7x4P/wbY6y6B04KW924YbUI36y3alHdGPMdj6GmwcR469vF
         OWRLX/kqEn87MLFdvDxJpaPAEekIBqri/OTXw9yNMh0bWf/wfiU38qDXmuCSdXj5UjTb
         Jat7HsZpuks4Z5X67F9ppjuBFA3FwUC2HcD5jI5TyQ1Hzak9HO8ZWRKMCm5gIPAGLOei
         v4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742983; x=1712347783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIFtqdGIQ7mImaUplvEPxDs4CukYRUaTqeFy43qXsgc=;
        b=ImZfvsTvj/VEeZopF5y+Wje9k5Llga2pMCwlZgV7YkJjXnELcslGBfeedtaKFCvZB9
         8hCrlyxzfnkewy9UOJRzGaOr9JeBLcuEwZWchx/mlb5SoMQ3mxrNDKXZV2W3Ev2291WB
         EXiti7Lq1btdjSrVVQJUFQ2v0IFRFQYcfZfld6WAd/23TSoYCt/2JyVo35bJxDmI/pNB
         9pMIUmo0BeM0tdQNsqBbpcJUPDDDrRZwfjPCC/U1IXWYgO+uQXW8bTGUkqsIHhPnrN4N
         ZtZkeV4Jo6/f71SF4fKxF7UW+cxjhE/oQeNTK9M84nHJCltYN5W9yfaHtEE+tiPszVjN
         BfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NZqyYJfWrARxoDmYm5yBdbMuEbr7xnbKo/TgK6SC+oPz27Rj00YJ8JVMW93KQQpp7/l1+jZnC1vYG+Ihk18V2aoc50xTUA3eM+NJbNqQ
X-Gm-Message-State: AOJu0YzFaPKY/QY/ppuVKJgG3lnq/sip/eyX5M5sQ6b1idzVZT9dKNHa
	f+exJ5n8hwxx9IshlwsiZhC8RF0ctpqn4V/RZandxIxEhfj/1nVoWHBTMjHa7Q==
X-Google-Smtp-Source: AGHT+IGfmsTFT7kIOrTPD/cQ/cey/6SebJ3AuBTnCao11U+z4lOnEeS8bwMb8RWIpAD6J9ZdI7fzCA==
X-Received: by 2002:a17:902:f602:b0:1e0:a7c2:af91 with SMTP id n2-20020a170902f60200b001e0a7c2af91mr228153plg.3.1711742983257;
        Fri, 29 Mar 2024 13:09:43 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id 8-20020a630f48000000b005f0793db2ebsm3301512pgp.74.2024.03.29.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:09:42 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:09:38 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 05/18] power: supply: cros_usbpd: provide ID table for
 avoiding fallback match
Message-ID: <ZgcgAhgjTck9zUn1@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dI4MRy0aqIMAhdXR"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-6-tzungbi@kernel.org>


--dI4MRy0aqIMAhdXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:17PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/power/supply/cros_usbpd-charger.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/su=
pply/cros_usbpd-charger.c
> index b6c96376776a..8008e31c0c09 100644
> --- a/drivers/power/supply/cros_usbpd-charger.c
> +++ b/drivers/power/supply/cros_usbpd-charger.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2014 - 2018 Google, Inc
>   */
> =20
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -711,16 +712,22 @@ static int cros_usbpd_charger_resume(struct device =
*dev)
>  static SIMPLE_DEV_PM_OPS(cros_usbpd_charger_pm_ops, NULL,
>  			 cros_usbpd_charger_resume);
> =20
> +static const struct platform_device_id cros_usbpd_charger_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_charger_id);
> +
>  static struct platform_driver cros_usbpd_charger_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_usbpd_charger_pm_ops,
>  	},
> -	.probe =3D cros_usbpd_charger_probe
> +	.probe =3D cros_usbpd_charger_probe,
> +	.id_table =3D cros_usbpd_charger_id,
>  };
> =20
>  module_platform_driver(cros_usbpd_charger_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("ChromeOS EC USBPD charger");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--dI4MRy0aqIMAhdXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcgAgAKCRBzbaomhzOw
wmt2AP40vMxxAa4zwtZtVrWREJj+MwGszhlzYJPj6BOkLfqX7gD+ORpSENh+ezPN
zlFJlx7H92rph0+UbSNn7CN7k2laIAA=
=eMqN
-----END PGP SIGNATURE-----

--dI4MRy0aqIMAhdXR--
