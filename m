Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A793E5A14
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750100; cv=none; b=Rl0RKy9fM9BSe1NNUY87sk7HbYIa3W5jlMwfv+j3TKSCpNXVnhLCP4Ukbu6aKRvouya58LK6bvrnbhxb05Q0+Zj7qJfsUtIjPbTIlHL8e139azpv8XeiyXw8XDEv+TM05+vePMpCrQ+k8dTX+r83jFP2CF3vkLNYadGrfYK/ds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750100; c=relaxed/simple;
	bh=nvXbeJmDIU6VX+uQehb959GxVZ7GiMgRRjwsNvBx/MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzLi/+s7AIb6B98pN8ujS4TR9lEsk82BNuuOBf3k4VPfgJ5aQ6XQqCiP5p6j1QbNpASBwtQfoWn1FjiMvYta9ecgCphudL4v7k2NcYm+3+JDDrsjG8re8/d83d4oFYk7Hj9Hywr59ctFV2qgrhD6pdm4QJviRjKS/Be3fmyx42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iwU5SgJ4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iwU5SgJ4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so72363245ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784750098; x=1785354898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZI2RuaKFEpTRvCs4T5yOqNKGFZdvgovBoWvvY7Lfws=;
        b=iwU5SgJ4wL+ffAsOUV+ikMSG+u9SnPG/EcKSiR1XuWi4wrttcyMDZknQMuxfZS5Y7S
         d9fN9F8Ai4z63sywQOZ/6+JTSeh//r3gxeMfr9B4Ig8vOhklZS56qs1jNx7w1ilDfzhU
         gvTeNWjUwjHazDaaQSAdNZY3gQIJDKAcNz0sdW3Cqij/H57BjwgHuSLcB1iaG7e2zw5u
         WFIqxTSEyYs0L4kopcOoqekTWBVsVJSw+Y/JBPmkIuwPf51asKWllUjs+6/FGuiYEBQP
         BDol4wRrhxe9SFmx1vf0yErhWANJaBqkvKDJ40bSPC1o9EkIhD011coKI+mIgmKqJKkg
         uxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750098; x=1785354898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZI2RuaKFEpTRvCs4T5yOqNKGFZdvgovBoWvvY7Lfws=;
        b=Jn2BzlOxRkWLzK+w4jflwEcDpXZMhumfdj8GRLYAzV73U99L6thB5LK2KLykabWQ0c
         kS5SOLm/FMKuoDO/Jv294dT27bZJ1asRh6zm4BKe8Bn32L50NWJUahr6SH898l7x2zlC
         9dJcC5btlsl98RG+FRdTN8h40bg49veOHj53yL4oHZ5XidkN08sPHFVs2qqFd+S2WN3U
         BZc2bkDh9imFCd+tQMEZuR3Kluv3vNQiR11wziHt/r4zQIBNeJeyozVGfA5i1SBF/vyE
         fyiUwgPp55ieTU5goz+DHDN5fZao/F+Dj1rlQOpb0fPxwSRLvj15fh2gBId2+sgFqkl+
         9KuA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2nBnO6dCh2EVGHO9QP9duucN/F7tq1HOMyyNxwmvq5/JfmiOUnjEjcbZWG6p7OsBzC9r+JsD2+nKcOhQtm/s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6dWTIfyTj5bzDePGk+CvEecUUJUiIG0zb4JE2MMj27kMAVlwX
	vR3lUWUeRReYauRWjcBnwYFs5Xw6Dg30sBu2n80odmf2ltwZkENrA9wAuP1sPUVdSw==
X-Gm-Gg: AR+sD10jkcqL5HTJ8IaWtBSRGHcfBKwUw2HGhXjd8zfvEB3rttvq19ZSakF+z3C+NtL
	kn/6OUr1V/lM6Y1hZ2IaRd/CsTDThWrmvH/K0whAl/3o/r45e1m3b43RP7i6b9qmZnFcYKqlgoG
	qm25bd+H7PrmoA65fZ3USwAJ/tSkfnc7g90btvCB+6nc6uykp4gT3p3HD3qKZ7eOHy3vXnMY3FE
	wzjspNRa20VX9coOkjWIBN5rifNxUo/PooeWJ2uPsn8HRKjIjx7P94szSVelV5K5ZnD0nXrHSB2
	NsYUe+rF3QOqcsNoS3Ryye6wvcR3wcf0722TRLOnfaK5lwYY+vTNA9H45xGaj7SDjE/VwIPoisO
	YT1bS6GQJ+Ur0KgqlAy+LsMY3mhj5h4SePG8Lh1uTWbv0efK4fAtqRZGdUYAVMzUuqX7/ijzwdd
	qUntxjxTmz7lLpWKOwevP9x7W7BXZl46vLNvw=
X-Received: by 2002:a17:903:1590:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2cf8dd6e392mr53379335ad.16.1784750097523;
        Wed, 22 Jul 2026 12:54:57 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm20274425ad.20.2026.07.22.12.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:54:56 -0700 (PDT)
Date: Wed, 22 Jul 2026 19:54:53 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: bleung@chromium.org, tzungbi@kernel.org, sre@kernel.org,
	fparent@baylibre.com, chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] power: supply: cros_usbpd: Limit port counts to
 EC_USB_PD_MAX_PORTS
Message-ID: <amEgDZews_De0mH8@google.com>
References: <20260722195059.1420738-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C5XRS+V9CVgowzAx"
Content-Disposition: inline
In-Reply-To: <20260722195059.1420738-1-jthies@google.com>


--C5XRS+V9CVgowzAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 07:50:59PM +0000, Jameson Thies wrote:
> Currently the cros_usbpd-charger driver probe iterates based on raw
> charger port count returned by the embedded controller. The only check
> is against the number of USB PD ports which the embedded controller
> also defines. A malicious embedded controller could return an inaccurate
> port count (up to 255) resulting in an out of bounds write and
> subsequent memory corruption.
>=20
> Update helper functions in cros_usbpd-charger to limit port counts to
> EC_USB_PD_MAX_PORTS.
>=20
> Fixes: 3af15cfacd1e ("power: supply: cros: add support for dedicated port=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/power/supply/cros_usbpd-charger.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/su=
pply/cros_usbpd-charger.c
> index 308e1d4e6dd8..82185ee33fd4 100644
> --- a/drivers/power/supply/cros_usbpd-charger.c
> +++ b/drivers/power/supply/cros_usbpd-charger.c
> @@ -125,6 +125,11 @@ static int cros_usbpd_charger_get_num_ports(struct c=
harger_data *charger)
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (resp.port_count > EC_USB_PD_MAX_PORTS) {
> +		dev_warn(charger->dev, "Charge port count out of bounds\n");
> +		return EC_USB_PD_MAX_PORTS;
> +	}
> +
>  	return resp.port_count;
>  }
> =20
> @@ -138,6 +143,11 @@ static int cros_usbpd_charger_get_usbpd_num_ports(st=
ruct charger_data *charger)
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (resp.num_ports > EC_USB_PD_MAX_PORTS) {
> +		dev_warn(charger->dev, "USB PD port count out of bounds\n");
> +		return EC_USB_PD_MAX_PORTS;
> +	}
> +
>  	return resp.num_ports;
>  }
> =20
>=20
> base-commit: 17376e7311cdec252b61cb1ecec43be61907781b
> --=20
> 2.55.0.229.g6434b31f56-goog
>=20

--C5XRS+V9CVgowzAx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCamEgDQAKCRBzbaomhzOw
wn8cAP9o/UaHtmuO3OGVfyb7gYiej2q0tbRzJ9TCk0NYnVh8lQD+PUX/OYdODfgX
TK8sGHCZq6dp8IoqaZE7JHsKoOZKlgo=
=yVpF
-----END PGP SIGNATURE-----

--C5XRS+V9CVgowzAx--
