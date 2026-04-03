Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489335C1A1
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256352; cv=none; b=TsC+6CiMM7MBFVbhglwT1cVCTzrTXJESy3AlVFVT8emFcJES/Ytvt2w1n35bJeq2G+MoLN1raK/+JycJD9tkn1NKM/VKUzJovHZ6QioxFkusGxFK0szIX5vmbwyWQFaIiGqGHck6yqucXPO0z2o+OaJctvD/6Mu3tY6/aAmCTbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256352; c=relaxed/simple;
	bh=wSlnrD2kv3P7QYG/VjRh77QodoZ+LICLXAucIhnlE/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfR26FWQStFTb9O1yt/OGOD+5dnGkuBPS5y1XmTuyq8rbUImcmT1lZ1mbkZx6fRBXdzyRzJurpLhlLsoXGyMexCunUFNEYX9HddIyr4Qg9KmFnUKIyFHa+HCiVq61t3Eub0/M9Y93rzsiYE3+C8GgcVF5HbBDSPAj2Tki8rM2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SXn5DI/y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SXn5DI/y"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82735a41920so768808b3a.2
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775256350; x=1775861150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVU9vvv3WwItsMU3YyQVteUJY4jTF8nIAOzbKoR/H80=;
        b=SXn5DI/ycdQ3mtrWwXQ7QZvKsCwORrwoUvGbVf4xGt6Bm0fzM1xkXPQYllPTko1RSq
         RiEbD7JEr6s9mrv4uTijTaV9rFXwsfZncO+AWEIKQLSbSOOOgAlxicCfJB5MXH9DNgzL
         opi296dQ/36JBqL2V0WLOfiHstIOJ2xeXfAPJxZJCacXHpG2PDOCeAx0ZWvx4PvojVfS
         0VGGMgEl+eemvwyuSh1r+0dzVDXgJAmFmMUojcY/cABmHcK684h4oARscXuDrtrjBD3F
         K9R7oql+sRChpOTJerlFXegmws/4dpDpRRsGPDszV91qFQNehtnjLZ8x9uzmaWEOj94I
         jaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256350; x=1775861150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVU9vvv3WwItsMU3YyQVteUJY4jTF8nIAOzbKoR/H80=;
        b=hugKtqY3UxKXSrpg7drN2ncv3JUUxaEwE+tXs4YciA4mxWX8PMpVl77n0ia2X5Q1Xy
         xL82u7TLuPRuoqcAOgiUAQCuTFJXurBZ6o+9hZprsFVlU7+vnLGRH++VNoX6hHw18qyP
         fByA2QZdNP0ev13BOh60ReXzAKA68S/+QB7Onkn/nd2MhD39BTsN6+VOKPS7xoDNWckv
         cKSQrpvBqQHl5iaf0TijDw/6UOutDhvG/jSVlwYtn/7eDZNDarsUSL5erzd0KoI7ExCN
         YC1xYiF9oZFsrEAh3Kyk6FQf9AB3lPOtUnGEvmbdBSILpRo/M7iszBjDQ9EQrQIihKAY
         lEjA==
X-Forwarded-Encrypted: i=1; AJvYcCUtg9Drm+0H6BOVcIfqFzlsgOcH7D4BQsz6bmbt8O/I5rog0nWEds/T8wmPH+ja7pPOoQWgNo1iTMxW3hlICZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlzPIdcOaij4SUCuqSZ9kYYx3u9zeyO4YpMf81PKZcTdMM7BjQ
	yvQrqCWKEKJDJg4HeT/Ge2+es4fCNazzmIPd/eKyGHmfJUQaPzcgPWFvrN+QvesoTA==
X-Gm-Gg: AeBDiet6dZwPwvdcn6kySPsEBBVZy+rX609zGeAp7lSDt3EiECEm6eciXgPd4djolWq
	vO9MPo4eWmD6iPE5S4337AoXQdeeo4MLWPRBCciUoTUe0z0u6qr9RJY8HfxAFFKK2pD7nHMPoGK
	nlf/+c5Pzj2M6jecHbv8PJAO/Oh0LfL4sTEJY8GB67PjzhsgRAQf1ODWkJa5MSAryTk4mwoAJ7i
	Pf+Q5/JxgEfRFdno1o4RsOLk6H+TY+/ksiJYb89JfQBBCFjIv3y1IsVYcxTt51nV1Gk83I+m/A2
	+1ZYH4E7kID7SkrA42d3CLrNHF4J8bvGXJzKMqrA6fjxQAoYAWhssITxPQslC1mpcDatEH2CNAF
	5GUyGKAa3cL3AaDqwo0/oUvnGm8DYaT384Y249qaZu2kTVEPcWEqbwvg83Bv8u4loOqKWFXdkER
	4Aqx/rM5FtZvbeOqL9WSIWrymSm6HNu34AX7XGXPPZHXvhOBspZImscyTe
X-Received: by 2002:a05:6a00:2393:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82d0da98e9amr4233727b3a.13.1775256349293;
        Fri, 03 Apr 2026 15:45:49 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca75dfsm6785331b3a.60.2026.04.03.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:45:48 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:45:45 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abhishekpandit@chromium.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
Message-ID: <adBDGVToA4wSUUGV@google.com>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jztD/bANTVs+KmqZ"
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-2-jthies@google.com>


--jztD/bANTVs+KmqZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 10:33:26PM +0000, Jameson Thies wrote:
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
> 2.53.0.1213.gd9a14994de-goog
>=20

--jztD/bANTVs+KmqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCadBDGQAKCRBzbaomhzOw
wnQEAQDeE//xnq+IhVlSfGC0hc1ZyoqA+HBIw3N1qF61jTIvRQD+JHkGa1XhuFXF
01WwG0Rcho+Je8H6Omm0n/driIMIpwM=
=vw5y
-----END PGP SIGNATURE-----

--jztD/bANTVs+KmqZ--
