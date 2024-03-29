Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7A13BAD4
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743763; cv=none; b=tkPDLOuGUzoOmb7hlO3qFxNmakCNSw+1qx/58RFyQiAvwucObW9By+WHQrfKdKt9SHN+7pQ1sRF4vUka5blpPc2cECzA8CCbM1M0D2wpE2xbQi+G2NxrmZ0mmkGjlw6AbIVU1jXeQWNBWP+lZemXwykjJhta3HADLs/cLLPnP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743763; c=relaxed/simple;
	bh=1a7H4deItoljS/5AtMP1VUdtT5vWBuPjw7iY/Poti1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI1ln7ead0hlBYgfjSZMc269P5izGBNpjkB9BOipXV2h8tszU+8OTE3psqrWmjGhqo4AlvZz0AtruY8WitxIyiixEtHasbxY+rYOLlM5WbhfbpKusT8XZ1KS93V+ID3M0GvkA1BRVQ9llqcpQIsAQo2WU++CJIvnXJ8KyiAvOLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QWQeKtz8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QWQeKtz8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1deddb82b43so171705ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743761; x=1712348561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtwy1hYH4AJsXrTmyCziUfu7DWwf+fXv0EHGWB5SJck=;
        b=QWQeKtz8s7FuFPWcYWbGkyI5HaSk7fO8n5ta5vyxgwFONs2QOUGKDyQZXeqVUX3adr
         uzZFtjky5BDHSuy9WhDm6pH3LSe6ovpZ0zWcNvu6KY1icje0jsL+h8HbgqyCzwT7VQch
         25TFZzrmhUPBnhicSt+gB414a8IyysGuRZh7bB2bdEG0883JWdmqsoW3hwR9Jvl2lvLL
         yhmlNXFu1c1RSAch5jqnDOR4Q274SHQqTOEROrCZBxvtgqCG5v4O6K2YOdEeoRbMDU2E
         FVpgDUdK/QQS9gBa9q+Ya5l/UXRYC/IRftJSk9HcXViyOiWl1YQz6B+D2jSB29NzfiUW
         M+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743761; x=1712348561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtwy1hYH4AJsXrTmyCziUfu7DWwf+fXv0EHGWB5SJck=;
        b=aSDKrQ2WxJlJtzVElT9ye6EVQHbWP7VXRHqV0F3uvsTEAoyON8wZnNmQErTgAArCze
         CHF+/Z7wRdKUZIJUbsLvtfEzEDO0Wvo3wWdbtRuLdVxKdfml09SPieRFWEQvwrLtOD2O
         41vupncAhnNdiZY1s1NALKbo7ESTfVZS3cNucsX3lgkC1fTk8G7nNm3R2TAcz4J63J3A
         g0KurJXSwLw7gzETqE1u+lisaiOHtq6tk9SHqT/dmFFpDz832cle78fFc9hkTvg6WdaQ
         LzZVc8Oa9flvx05Hnzs5bwEVcBt/HkxFmviJX4NXtiXXKiUYdNiRXpcvATRPd+Hqgw7N
         sEww==
X-Forwarded-Encrypted: i=1; AJvYcCWmzHKZzT17TetpRGvUMwkdsehmX/eOFCKqAbBiv2mJpI8FVhY5sR9gr+CMKoY3W6yp13LMKbv4TPBRYjrozjDCYbuAiVhxJhzvK548h5Zs
X-Gm-Message-State: AOJu0YyuJCcE1yWyDZ5e459ZXNUHBb2QxM6hpA6jcoTR63OsHGpn7qZg
	pscnbbUmx4qj8c81TNYptW5G16Oal7up+c0GBPlQQM3LFOHPeht77t/T3sj7nQ==
X-Google-Smtp-Source: AGHT+IF0527Z4k8BmlkJrlCMYyPnjLhI2IhTTtX+58mg7dle3uGDGV4TV4IhwgzTIrPEMO3NEvmKlQ==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr228342plg.7.1711743760796;
        Fri, 29 Mar 2024 13:22:40 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id p26-20020a62ab1a000000b006e56e5c09absm3521153pff.14.2024.03.29.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:22:39 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:22:36 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 17/18] platform/chrome: wilco_ec: event: remove redundant
 MODULE_ALIAS
Message-ID: <ZgcjDKH3WaeC7Vom@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-18-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a4JdWraQe9JHs8ym"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-18-tzungbi@kernel.org>


--a4JdWraQe9JHs8ym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:29PM +0800, Tzung-Bi Shih wrote:
> There is no platform driver in the file.  Remove the redundant
> MODULE_ALIAS().
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/event.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/=
chrome/wilco_ec/event.c
> index 13291fb4214e..49043c644572 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -575,4 +575,3 @@ module_exit(event_module_exit);
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_DESCRIPTION("Wilco EC ACPI event driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--a4JdWraQe9JHs8ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcjDAAKCRBzbaomhzOw
wt/XAP43r511JFB/1luZprEYf8Izl6M/QKNK8dwgCrJ00WgdZQD7BuHi8LFHQAi7
vbhOYIDycQKS8iOS6G+fwXDzbTp5Rg8=
=VODF
-----END PGP SIGNATURE-----

--a4JdWraQe9JHs8ym--
