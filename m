Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3334FF5D
	for <chrome-platform@lists.linux.dev>; Thu,  6 Nov 2025 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450099; cv=none; b=nFIRv2+Qi4sYB/X5Ar5YHAbGIB5tRrgp6E/XR2ql8EpAjEQu6HvP8c5cEkGdaguptf07Gq6fhJnWnXzvK7y4k72OV2sI+p47keuyOkbQQjy2xpZ47t4gMNWqvxsEi3BhRPbNN5gAZO62ZY5JxhE9VrmWxEeZkmph6O5ekxLh3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450099; c=relaxed/simple;
	bh=oYf852XmPSnTsJPv2ICqCZVY+o8aM4NGtu/MMcDrPWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuzsyWyzd63VxrRXQheaAOhO49amZoBq0aMj/hPY1ILZS7rkBZ/R33agkRisFB1KmmGt+z1HjFfpj8f60yVaYjNMlQM3YeOPFpyq6IgCzbEAAgwDBaLuAY/jo0Yqep17hNWHuQiXXars1a4NecRVcVZOC7ENbckBgwSwBJpSM4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WxZRqIam; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WxZRqIam"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29555b384acso12199375ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 06 Nov 2025 09:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762450097; x=1763054897; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLBofMqKN3VaS7h4xsO2CKhBBssknoWp+VFnYQ+9NIQ=;
        b=WxZRqIamrfF2y7R1+P7rslM9mXV7214Exov78eI+GiEbskXYo7nA4KcAh7vkxbEWth
         BS50nBOZM/oCv0Hvpr0mcpII2R0bMkzbWgPGy53dVUm5FrdV5KBNDovEFt4FCgEizl3J
         tASUa/5BgZ3r925wdhkciJOti8GUYAe1XcRT0WbqHH5isBz3Wav6TZjxivjT8hkT2l6l
         924FU3QNJ7m//f91FrFjp2jfDFOqtDjslCjc/73MoXB1VIZbFt10ReZJ4uh4Jsz6UFJR
         o/U97oJM3VWFCrvUCgxg+rFLppbtkQR5GdU9WT7N13fLsAD8r6fHneGADjaA7OuCsgRp
         lVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762450097; x=1763054897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLBofMqKN3VaS7h4xsO2CKhBBssknoWp+VFnYQ+9NIQ=;
        b=UFFif0zkAbb25hPbPAPFejIhQIpiSkwgcY8JtyGJSMRi4MGuKJRInELsjwzp1hBnfp
         NdJ+4lktEKvFFKU+tEBjS16l29lEErM9jC7k9/c63OS34o/lCdfJJTGSdrSCNYKvF1NX
         mOZQhuwIx6eqOeGrLFwD/khZkEQS0Hokw7UCEtPvkjF/mrh4GuNMgiKrJPalw12KXwNw
         ctzzDaWm334e/FNfN60mOrmFaxTL+voiDFXfOMUO/r8S7/zviKXLsHs/XOrTuTYQIQeX
         6zdTPyh52UjxlHRrCMkPJYwMwhc8WbXFnQwfAnSuMY3QPM96WWWO6lL6Vx+gG3yhmWdr
         9inA==
X-Forwarded-Encrypted: i=1; AJvYcCX8SGw36Qer7qsADDjJnYxp4vbx99uiaNd0ZJ6gvasKDgYm0+sdyefXoay9TyyLj0KJaQiMVvdVek+rvMUi+Wg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNkw/0Ham02hyN5KLdu//BAKEr7jlUTFDgLjLLuyqAhVHc9lbn
	itcrJ6GLO99TzR+M3x6h99iXQjbGDyuXBGAPBpgUadd8iH0s5ywKJETo0YyXb/r0Nw==
X-Gm-Gg: ASbGncsRtbwUq/PlZrnkQKsYSjq2YlqYrd1t+qmJ00bOqTZRMm2vyn12cBT0LUqKbEW
	jnVF6KjgMtd7gPRG7wCDdzYcxv1lDccSdzhNVYxUUTU9+ercUFF14aJj2Drb/ZHr4N5tG2Rg7TS
	Urv6D0z1Rb1pGOE0R/iIIKZhjNXQZeboiaUqjh38vPj0VwYfaprAmav3pWK/zjtS0tN1HRxwzsB
	46mAYWzVtEMt6fjfq0t9v9QVTxuYGppw6QMiaAbwpLDqK/MKVIhGr7YaNdsmdgxY5XB7mOkSltb
	+mB6pDAQDqa88FfFnid8AeYI9dV5DLXDpY9BYqQsnlGwJTS1nVYsgduIabgIKHinIjHqWcGrvpZ
	um3L1q4v5KpODB5Fn7cZWWV97y1a09kaKCdC/ckWjhiXCXZy0sWV32Qtwnok+dTZDlMKoe0zGSH
	As8SjZdd+EQOU7m52nzFrdOQmp82vl5ElZfMUwK7yVNv4+
X-Google-Smtp-Source: AGHT+IHBNC1jf6r38TkeQ/oHkizcoaleYcZliP5t+OWlYI2kyXAfaGDt97VYWBSTlcQmGkWVXUqktg==
X-Received: by 2002:a17:903:174e:b0:295:82b4:216a with SMTP id d9443c01a7336-297c049df28mr2482025ad.55.1762450096884;
        Thu, 06 Nov 2025 09:28:16 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968298sm35077625ad.6.2025.11.06.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:28:15 -0800 (PST)
Date: Thu, 6 Nov 2025 17:28:11 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org,
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
Message-ID: <aQzaq2ord0gK-gaL@google.com>
References: <20251013203331.398517-1-jthies@google.com>
 <20251013203331.398517-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XuiAe52XEjP5vh9N"
Content-Disposition: inline
In-Reply-To: <20251013203331.398517-2-jthies@google.com>


--XuiAe52XEjP5vh9N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Mon, Oct 13, 2025 at 08:33:25PM +0000, Jameson Thies wrote:
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
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

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
> 2.51.0.858.gf9c4a03a3a-goog
>=20

--XuiAe52XEjP5vh9N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaQzaqwAKCRBzbaomhzOw
wp2+AP9SJFEYIzmMX7wReFg8A8bTfAW9puN4rGeQqHGMqCl16gD9H9LsKtJexPSJ
wJa/rxDyLKo1A8lNbYjk+JggefOqAQU=
=Gu40
-----END PGP SIGNATURE-----

--XuiAe52XEjP5vh9N--
