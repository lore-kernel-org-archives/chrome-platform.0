Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FB358D30
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723640; cv=none; b=NbhrT5B76H9USCIW4Yn5UYqn13Fs0GnWK0YCyXmYawstgdjomTL1yrrlVP4/Qjrt1Q5yAxV2ioQB9C3B3+OfvAi+BLtQrTrAYPIfaCTboxLuvbX8mdDzOAtT7vsx2eSnTWkKu7Inh91bVU2km+a27x/NCe9dYf4egHHbfNmc4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723640; c=relaxed/simple;
	bh=oLByWGhMmtlgQrCsAJkw5zSyaU3rGCFxQdBZznTJe1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnbWGO7K6q1RcMZuQn2iLA/Gyd2JBWNy5d4slxqgS8OdXcEgpuq1wKzidVgjFDaohSuaNNYGznF5LFw1fB25V/yggw4zCr5WRq38ywgpssbCKMAYPuZDGPYVgL8w4cZr+vFqZzqJcMTvMD6fQ3OqTOEmGilTStl0UkUdIvQN+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pyHaOL8t; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pyHaOL8t"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7f651586be1so51762b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 10:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767723637; x=1768328437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nal+3dw5fP97GxbQVBy3+yEoJhPzTcTc56UQ322E1m0=;
        b=pyHaOL8tb0ApuLA7i2d9Be2KItRXl3wXAI1N8RVsu3GXuyG8qFTBKJCWfMQxV0LdFv
         J+6cGoHSvvL6rsWJpu28PNS8VWImZfTWNBxsmihU0snxGeyXcchvSv2f0Tg6jtpt9QXc
         fWa6exNuzjZ3tt7KOrz4UeJBiXTHibygeLpcqiLjtwsNrSS3OqT+dBe5BQ1bca+/sbuD
         BivSe0yHJ45SrRHFTdcpQkIZa23VN2VImPEsPNOkmqAAr9/k4Pu0UI+r2kCfCBg/MbmU
         TaeWNfceNdjrR3epROFoLyfvJIIszs1jpH239bTr0NJHV71nnlz+8rxYK4QDTt6O4YjY
         NSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723637; x=1768328437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nal+3dw5fP97GxbQVBy3+yEoJhPzTcTc56UQ322E1m0=;
        b=YsMQtfxq2HDGBzFNTDx0poZtW4SeOA/dJCZKGA7tOiQrVQSQRoh1xG5QLDA/GbS2tm
         SyJW2SMUicflw2c3RtviS+KDvZGumS3Cs4z8laCp9Fv7SGKTM464v3MlCLBsQxgGPce1
         hcZH7fYUB6WV+OgGCRcQc7UjrbLAXfoBIwyJmU93CdsxiRAdzBxbPtFM7l3g06AbutwO
         CaTABxah1KT2sJCm9+Pk6im6tj8wvZ+K42n5g5d9POteG76wMFOLcRnwx4AFQun+EIcy
         RDBTSyo/O44wBO60b467yKIw1L+DbA+iisRngQFWZz4kPUbiLebYXv8WJ9GEJJlFrSM4
         YSdw==
X-Forwarded-Encrypted: i=1; AJvYcCUrGpJsrygWD2q4ixrlLJrnzVpc0jLFWv4TjBGunJTurVBQZGhfSH33WAT+4XkIgtS2TJVuESe6OJaG+IgIt5w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtehOOYbAdZN2GbQYp8c9lsVW2ZCvqnT1xhj6y+8O3FR40JV/7
	HeagX7SQS2rg/AD8AG2zSm0UZLrXF8Qo/L+OjfUg21x+pA8dw40iDZs0tnWpygT6YQ==
X-Gm-Gg: AY/fxX5E38YT8kFDxRzR+AXJIJQpMw4flhqZ7Y1IWbB+OC6P+Jb80Lr92epzR6+Eyqg
	YnvTHzpcI6IjL0PileL5i91y7pCblbz4Yu7xQzPyLPzdCgA4pGwVtzmrF8NfLexxhJB8ObRP4Bb
	9GmBd2wR4FOJEv9zCfoOu90d+oNbF5sJNZcDGzg+RcQ5/SASnDuo2SVj2zKdwwUn7ska0qHZ7nk
	HTA5Di37LN76gi3oIFEj5HdDv+mr2nkaI9kknwvF79P7u+NML5bvkvBcNJRbDyYaJdzZ/2brBXi
	bpoEAJ4CwSXmkHRPr4DatDiMjIZRUNKQk4IJ9DTMVxhyOEwCKWJHrplJ6gLOM2s48VZrQo3RlYm
	rpVxRDar/u61Je8NE8dm4UPFGAb7ue7y2N3ICarvaBc4hdo/xR3F8qthEB0bLZwW6yoYNyxs8I8
	43uMKQbDbuzU+/a0Cli5p0TDgrzS26nbwzNqDdMRxQ+Q37KHc=
X-Google-Smtp-Source: AGHT+IHyiezq7NO6P7x1v6a5YBj6fT5NMMsYRIDC1EFIWEwc4hQKCw1xy+mxsH0VmR1NKivkha+gQg==
X-Received: by 2002:a05:6a00:330d:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-81b7627355fmr101158b3a.1.1767723637146;
        Tue, 06 Jan 2026 10:20:37 -0800 (PST)
Received: from google.com (228.88.145.34.bc.googleusercontent.com. [34.145.88.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm2780880b3a.16.2026.01.06.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:20:35 -0800 (PST)
Date: Tue, 6 Jan 2026 18:20:32 +0000
From: Benson Leung <bleung@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	chrome-platform@lists.linux.dev,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: drop an unused Kconfig symbol
Message-ID: <aV1ScKQ32hoOQB1G@google.com>
References: <20251228190604.2484082-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrW8ToQA95dUcYcA"
Content-Disposition: inline
In-Reply-To: <20251228190604.2484082-1-rdunlap@infradead.org>


--lrW8ToQA95dUcYcA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 11:06:03AM -0800, Randy Dunlap wrote:
> EXTCON_TCSS_CROS_EC isn't used anywhere else in the kernel tree,
> so drop it from this Kconfig file.
>=20
> (unless it should be EXTCON_USBC_CROS_EC ?)

I concur with abhishekpandit@chromium.org. It looks like this was a typo at
first, but removing the depends should be fine.

>=20
> Fixes: f1a2241778d9 ("usb: typec: ucsi: Implement ChromeOS UCSI driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
>=20
>  drivers/usb/typec/ucsi/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>=20
> --- linux-next-20251219.orig/drivers/usb/typec/ucsi/Kconfig
> +++ linux-next-20251219/drivers/usb/typec/ucsi/Kconfig
> @@ -73,7 +73,6 @@ config CROS_EC_UCSI
>  	tristate "UCSI Driver for ChromeOS EC"
>  	depends on MFD_CROS_EC_DEV
>  	depends on CROS_USBPD_NOTIFY
> -	depends on !EXTCON_TCSS_CROS_EC
>  	default MFD_CROS_EC_DEV
>  	help
>  	  This driver enables UCSI support for a ChromeOS EC. The EC is
>=20

--lrW8ToQA95dUcYcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaV1ScAAKCRBzbaomhzOw
wtQmAQCkXPYyBFkYXYeaYCCX0Rara5KgsEYng6pNWk9X7E7P7QEA5cDZHhYIJIS7
MHum8EySQPaVN9zafNjVTFRVVfVLsQg=
=3tHD
-----END PGP SIGNATURE-----

--lrW8ToQA95dUcYcA--
