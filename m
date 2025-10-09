Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906092556E
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036959; cv=none; b=KxUodTlPu0gF+HTIdTTjsKBSBYPTK6ympAMh+Lb0GxKhgFDHowwiiH/EAKzb0JLE5ql9D6wa0udWOMc3QgnzwxmFOYy0KpO+SMHd5R0lzbfa2eCdCVzKDLjkdi9+4POVwPUQrpNKdf/4Hd8vOV7YrN4LQBmGwjaD236s+OiVpJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036959; c=relaxed/simple;
	bh=9MqJx0gUQ52TxA2W7Y25VlgDCtAIuV9z6Jv2hVaa4+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubySiZDDPpzWMEQ7fKrKNGbdU8DoVQOzq//ARe4Kx8C2zuYSCLXC76V4Q1ZHmoGWMuLQ1dKwOKDYbRHejq3JbxJDs+b7ByG5/u/V0peOgqJJNIq+2S4b9te8fRl22VQ1+CBl+DdvNN/I0TQrJ+iNB0idhypUwCWKaod5KVP4kSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lT/Wjm5+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lT/Wjm5+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so1728276a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Oct 2025 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760036957; x=1760641757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9f8IRpEk7412bbQluvPNm0ibdpWeLSvfeZRqJSy12s=;
        b=lT/Wjm5+qkbTXgNwPL4nMM4UwMXF4tRqHVOnoPKjzMwiraRYzHDyDDgWXnm28hts5o
         hpWSSzfO9DMS4rXsi9WQNXSH46NCgCaavf7j1SsQgvO7x1AnFVA8d2bJ546w2wzB2eeW
         /dRtmxtFxi5JgibjaB5QykXPLXNzh/+9MoofpBpr15UbmOd+vBCCoBjwGTluxP8UI3Fb
         ghg9PEialh5a5sQta1p/1N0lQehfcSJsqsa/BNG2khQfIMcy1LlxMvXdyk8jYeLL8z04
         1NyeGYb0Z9bYvX45JVyeDb9syCqHoH5wpUKH/wyYxE1aw/FcI1178tT7U2Jc6RUh4W9+
         yj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760036957; x=1760641757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9f8IRpEk7412bbQluvPNm0ibdpWeLSvfeZRqJSy12s=;
        b=M1+4wH8wSn7ohqqOKvaOC/3UmlRJRMyhxQMjuD3QvMJFiINF6Yru8aUf2OZQ6FwWNi
         fX5Sq7n9XuV3Kf491LPXOlhgO6nawfMzRA3t4+zCR+vpeh1m+ozT4edOZ8FcocWTZCas
         QClLXSkBXWCCw+wCKu3/yOuuilqXCA33EpQ+NIsPctvShgyxjks5Goh70pQy/9t4HI+S
         0A9Eb//CchyVHZgJoktha+NceWJoOlhkkMV/tnmIGaej/0cQHkxumW9eq5R9QEBNfS0N
         0/FR+IXs0N5vNYXJhSB3Xx3xmKJb7Mk8NsldnttVesBShMTRa/FS4D+sov4DTG5JQ3Jr
         Ysmw==
X-Forwarded-Encrypted: i=1; AJvYcCWYmhDgcUcS9LI20N+7u0RpuPClTUObJoyHCp6ewqpdepDtl02lhzrBmV8+Sw3M2vcDbsz/V2J1LYHhOQgPIas=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp44cPHFNJRDtL4IwC6PFRIL8/mlmqI9Dhj3HcpdYKd182RKPm
	sbqL0NARERNKrsaTqmKI1RQps8JrCtpi9WHxaXuCgJbU892cM58gOEY6SeNv32PGFQ==
X-Gm-Gg: ASbGncuDAeCYk3Os+Z3UzHLNND4KASiZojHUGG9SToOPIUSivU7fQdbM6uEp9sieY20
	wWQSz9Hifzy2uq/x+v8iHtjg+ACXWZOb0+pVqxUTjWW966eP5AFLtEJvUg7OPmkEWDBWD1ZdR2X
	gUFvf2TVxFzWiefZ4YVXCeu59nvN5aMiveDIWJMFLLIhQ13ZF4gw2uog+qQmhbVeFDod7sVcDUG
	5xMhUhZ0QbA5fUoU2QuSe6sy9pUC1QVdYJoqpMA75y69EIxVdgvTYG9DB9HdxKsH9C2c/038nbM
	boYo1ogr58vknU/Pb2ab4N9xKjAGTuE7KIN2/Lgu20qh7gK1mvozL8dUC9b/8uR4hPO1k+2Jcvk
	h7pGvR0kcZ1PR1LtEJdBwecGodoIwYHAknNrKFTMePdvlDOXkdMFsfYLXkevN8RHrSgzFKFO6jk
	Vk3ldnrzQhLZWmBVdil9pc
X-Google-Smtp-Source: AGHT+IFiiy8pdKItHau7Vu35qTjP3kxvgOkUtJD04Wd4W2kcZYRbMdfuRPhFg5zprKgeTIznJzWWOA==
X-Received: by 2002:a17:90b:4c06:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-33b5138e51amr12457527a91.29.1760036956315;
        Thu, 09 Oct 2025 12:09:16 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b6262de8bsm313096a91.5.2025.10.09.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:09:14 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:09:10 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
Message-ID: <aOgIVjMXHWkyzV-N@google.com>
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0e5tzWU7Zc/f40iO"
Content-Disposition: inline
In-Reply-To: <20251009010312.2203812-2-jthies@google.com>


--0e5tzWU7Zc/f40iO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 01:03:06AM +0000, Jameson Thies wrote:
> Chrome OS devices with discrete power delivery controllers (PDCs) allow
> the host to read port status and control port behavior through a USB
> Type-C Connector System Software (UCSI) interface with the embedded
> controller (EC). This uses a separate interface driver than other
> Chrome OS devices with a Type-C port manager in the EC FW. Those use
> a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
> compatibility string to the existing cros-ec-typec binding.
>=20
> Additionally, update maintainer list to reflect cros-ec-ucsi and
> cros-ec-typec driver maintainers.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-type=
c.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 9f9816fbecbc..fd1a459879bd 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C =
port driver.
> =20
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Prashant Malani <pmalani@chromium.org>
> +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +  - Andrei Kuchynski <akuchynski@chromium.org>
> +  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
> +  - Jameson Thies <jthies@google.com>
> =20
>  description:
>    Chrome OS devices have an Embedded Controller(EC) which has access to
>    Type C port state. This node is intended to allow the host to read and
> -  control the Type C ports. The node for this device should be under a
> -  cros-ec node like google,cros-ec-spi.
> +  control the Type C ports. This binding is compatible with both the
> +  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
> +  supports the host command interface used by the Chrome OS EC with a
> +  built-in Type-C port manager and external Type-C Port Controller
> +  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
> +  System Software (UCSI) interface used by the Chrome OS EC when the
> +  platform has a separate power delivery controller (PDC). The node for
> +  this device should be under a cros-ec node like google,cros-ec-spi.
> =20
>  properties:
>    compatible:
> -    const: google,cros-ec-typec
> +    enum:
> +      - google,cros-ec-typec
> +      - google,cros-ec-ucsi
> =20
>    '#address-cells':
>      const: 1
> --=20
> 2.51.0.710.ga91ca5db03-goog
>=20

--0e5tzWU7Zc/f40iO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOgIVgAKCRBzbaomhzOw
wpeAAQDiXMiRuPeOqgOPTPEP4cX+Ib+zQo2hcnRSBWZWrG1kDwD9EKi/tbH16fVU
aPsEzu+VVH/RPO5y7lciksg04qVVhgU=
=xh+u
-----END PGP SIGNATURE-----

--0e5tzWU7Zc/f40iO--
