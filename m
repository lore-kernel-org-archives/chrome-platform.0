Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921978F59
	for <chrome-platform@lists.linux.dev>; Tue,  7 Oct 2025 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759865037; cv=none; b=cxNFpkXpewjEKjQbVKUVUpeLkkw6kwIjuOErwAmcEP4/hPm15BAPRa4JY8yZ5NfTD57FptRx9wg1OP7/kxHBKCnuIsN9dLV9YPcSdST2xur7xLrkUbP9chwAtsF1jcJnt1vWCIJT5w13j0x9/p5Wd7K+LWu9tF65FRBv82LAciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759865037; c=relaxed/simple;
	bh=Xw87XgCbg1sAtPDYd2NoXiEutjwEoopTGJYzoXJp+RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRZDdLcpRD6+X+laElvhYBO212vcw5fXBZk50hkSP8/qFiLFsHlQqyLNlnsOTdp+oAwDm9e+SzuTrvgdXScZ9sd2u0Vv8mjufh3yCx43tFsPxXFvPiXm9LCPOti9oFjNijfxycI3MsjAWumLAc9u3me56j1ADTTFDcTHBsl8q80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xVTafjGK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xVTafjGK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-782023ca359so6235255b3a.2
        for <chrome-platform@lists.linux.dev>; Tue, 07 Oct 2025 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759865034; x=1760469834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eT1nwRDKVbKeF8BXec5ppEFdy9ETGubsSZiyxLMw9JI=;
        b=xVTafjGK/DD3fjE0O8SdgWCdj85huWVrx+9cA5pNhOUKxnybW4fhQlEHbHedtSW+P0
         c/V4VAkl+0H7ziZ2FMYIIqOUL739vi6oOFslwttF2HElK6oN99eMXi7MNSdeqthhJI+j
         zfzkZ00Pyud0Hx7U3Y4C3eDDYoE+jIukh7o4yqBMMNFRX7WZ1UtsALdEPyUsgWstMaAO
         NC4wSzdz73PqJ5YoNCzIH23aQiXKhqkBzsYX1JakRwveyK+/J29teCFl3wN5pw+rB6Qa
         4eV7kGU7/Uc7VNFzbdLK5aSk2GYfXwkZH1Oii4UN5I5LLAFF9KFJiPx2k+Rev4T3uZzZ
         pRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759865034; x=1760469834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT1nwRDKVbKeF8BXec5ppEFdy9ETGubsSZiyxLMw9JI=;
        b=q3ZsD3xcJp2nrXlni3llxJd8Q/wpepRS9nogi5CMb2p48ZU66blYz6CDW+OZl/7klR
         eDrs2OQxfMFwxR9GLKytyznMJEvFGQAaEzfWX87yf3IP52w20/IqtiE/hUl7bv9Rtsjk
         OCJrQMvk22zyYvSetzKZ3tw2AoDj5f3jFIpxNzisuxi7mEO2suJh5SKgyBw4J8hbttoj
         GlN1kXdAlYH5+nv9Et76UAov3E7DUFaNLB0Sgu7r4dfAQeXytwd/X5vDV0+iqajR0LhR
         xJWEz7BHIYtutsHFp3/JLvHngiP1fQa6ly40NyfCLzbrwXWQVcjjFvs0cJG2ZHkHAbP5
         LuDA==
X-Forwarded-Encrypted: i=1; AJvYcCXcaUIZ9p3cX/reFxdkG+WnF/SLl1EzLq/KwBDvYG+1MbQl2/AOA83U6AHBJ0+GqHuPNmHoQrKUt3jsTrDJjXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEclcJX8jOTZ6KHrJkiJ7cif58fiwJVcpTXLJcnRrdTNmzgW0q
	WT9qfiIGWg0ANQAZUUkzYZ29YuPK2/hzm/1JkUA7JpUKZ2gdPAAen2n/3+ZHpsKZOQ==
X-Gm-Gg: ASbGnctl/mc643ieoLySZKBkM23qCq+ou3e1DGEFUxZ/5VLja0N05EysOpe0B3HaAxE
	cnYADclHg3cSk0wEXVm6Az0qoC10UagdQRpW7eq3Dh5CBRYdvjro27wFRRkxeqPD2UEDtCzJGGK
	YdRp2OoZvigGrkJ91Zi/vwZAofyZ1fMVdAqicTp2fdYxpfsX1r062nWnlXAf04APK8lRj48EU+v
	0em5iEkgIaPWuNaefJVkB5oSNkXWE7nJM9+gPf0gDPV6unZtzKPuA5gi0TY/0uD3q8qMCGlg2qA
	qAMFmHYikJDVPiKEsq8VtPnt7eeonb3r22+HpHNRNkmio1xgI7qLE2ymNNkKD6ON8YG+OChik8H
	pjTeQrW0UciXuJ3/X+r2lfNKpqhlX+/TUORSuTjLPfWcOThqPjKn4/6Sma6zvGz3FvMFg0hW0rs
	lA0LiVh3QvdYHBmmCFgCFrm0VfqD+93HA=
X-Google-Smtp-Source: AGHT+IGSwGW88WMOLbHemUBllZFvuVlpdJOj4FF3pHUy4SuNXB8acXcCYQBlHBqvvbgzLZJwVZQjDQ==
X-Received: by 2002:a05:6a21:33a9:b0:2c9:1323:f800 with SMTP id adf61e73a8af0-32da80db36cmr695432637.9.1759865033911;
        Tue, 07 Oct 2025 12:23:53 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205336csm16623586b3a.45.2025.10.07.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:23:52 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:23:49 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
Message-ID: <aOVoxQY3sLgkzJgD@google.com>
References: <20251001193346.1724998-1-jthies@google.com>
 <20251001193346.1724998-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bael24djLhppaNDA"
Content-Disposition: inline
In-Reply-To: <20251001193346.1724998-2-jthies@google.com>


--Bael24djLhppaNDA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 07:33:41PM +0000, Jameson Thies wrote:
> Chrome OS devices with PDCs allow the host to read port status and
> control port behavior with UCSI commands sent to the embedded controller
> (EC). Add documentation for cros-ec-ucsi node which loads the Chrome OS
> UCSI driver.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
>  .../bindings/mfd/google,cros-ec.yaml          |  4 +-
>  2 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-=
ec-ucsi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi=
=2Eyaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
> new file mode 100644
> index 000000000000..2121776e3ff0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/chrome/google,cros-ec-ucsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chrome OS EC(Embedded Controller) UCSI driver.
> +
> +maintainers:
> +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +  - Andrei Kuchynski <akuchynski@chromium.org>
> +  - Benson Leung <bleung@chromium.org>
> +  - Jameson Thies <jthies@google.com>
> +  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
> +
> +description:
> +  Chrome OS devices with PDC-based USB-C ports expose a UCSI interface
> +  from the Embedded Controller (EC) which allows the host to request
> +  port state and control limited port behavior (DR/PR swap). This node
> +  allows the host UCSI driver to send and receive UCSI commands to a
> +  Chrome OS EC. The node for this device should be under a cros-ec node
> +  like google,cros-ec-spi.
> +
> +properties:
> +  compatible:
> +    const: google,cros-ec-ucsi
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^connector@[0-9a-f]+$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      cros_ec: ec@0 {
> +        compatible =3D "google,cros-ec-spi";
> +        reg =3D <0>;
> +        interrupts =3D <35 0>;
> +
> +        typec {
> +          compatible =3D "google,cros-ec-ucsi";
> +
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          connector@0 {
> +            compatible =3D "usb-c-connector";
> +            reg =3D <0>;
> +            power-role =3D "dual";
> +            data-role =3D "dual";
> +            try-power-role =3D "source";
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/=
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index 50f457090066..646bc81c526f 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -99,7 +99,9 @@ properties:
>    gpio-controller: true
> =20
>    typec:
> -    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
> +    oneOf:
> +      - $ref: /schemas/chrome/google,cros-ec-typec.yaml#
> +      - $ref: /schemas/chrome/google,cros-ec-ucsi.yaml#
> =20
>    ec-pwm:
>      $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--Bael24djLhppaNDA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOVowgAKCRBzbaomhzOw
wghaAP4ptO8He+nJ7m200fytazpueLrS9kKxn3i2rwNFghRDdgD+K5AL8DYGEsTY
DAUJA4flfi9ks9FmXLEf5hEQyUN98w4=
=nNDB
-----END PGP SIGNATURE-----

--Bael24djLhppaNDA--
