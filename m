Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4742EEE9B
	for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782325396; cv=none; b=GladpxSPdMN4CnDa8J/sn9O9n92zwD3Y2CYH9tHkkwcVPxf0gBbC7IUkdJmYPy9pUTu/5/YqGDyerQ6cCxSpEBgjGuYskK2y3hhn8hN0tNtOoH2qIg22hHSAKDsYHFEgWX8PqfOvMmS56+Uq4nmdrP8hoUlhc7f1b+/IDFchkh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782325396; c=relaxed/simple;
	bh=olJbLXW9rdMWRDoBt02V9oWhVMo3L7gEB6nkPiadIMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6DKCZi5ievj0zA2x4PvzYXELbI+Lhvz02C/P2um8tyu9jqx84gLi3+h7XnJOghD71zRcfJT/UKuc0m03gD3cK4vxzwGlNAMp8M6onO2uTmbRu3UJzhA+l/aAZfuoGaEIDLegWiNv8FmP7u1fZiUobI/JJq+Yd7QRmK3qz+15u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HzD5Dpq4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HzD5Dpq4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37da8b5540bso963902a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782325394; x=1782930194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NXjiJLfwfjaephsJ9Vb7pj+da+K3cSvnSmlpT/LBY60=;
        b=HzD5Dpq4OgYqowWC52brm5IQ5kII/94U4PjNkxHMB/qk1nHyuq0Bf5Of/q4S2w40Li
         OKsdXm3cxA70CxVsCZ+vLzC6yRZ6Xs0GKekZoY7k0IFQfnXk8A/Icz6fbOO3kJ52tLfc
         XmBXY7OAMv6t+995rK2c7uMtqXZkRoh53U3uk3/XY2krktEjQaPU+2Kyo18tK/xqDwOJ
         v++hgGIJAA24iE5gIDIT5VuQv8py3aLtnCG2LRUAweUlWall90hlJrbCcVd5OQXPRxxf
         T8fRhkz6DjyGjkhK0zRrYH8rs7e+eVpe9qWhf3R/jvnnMWSt/a0OYO7i/JcjN4IKkVX4
         4Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782325394; x=1782930194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXjiJLfwfjaephsJ9Vb7pj+da+K3cSvnSmlpT/LBY60=;
        b=hLfe6nxdmrZb6/wRQKZ0qkwPfhnpQUOFWqF1I2s6zJ+CRocO9yWx3P7irPyz8SzJOj
         PMPgLUvd6haFJD3liNyx5CZGjUBa3YdXunQtTpJcwIhkXRpcPi+ZiWCI6+aUDRjU9cpI
         jYjnIBNKke5gYuClSLpsudG1nt3N25NA5+irSnAsSCE21ThEOI8DcGbdrOiWNGEj+MJV
         Zr9TLPKdqCHKdERVf4UHW80pn62cToBeaYmQfFMJKU1Z/hXDmu9cPJlbvvBRPXI9yA8q
         0MBRcFUkOVP5gRdaZ7HmHi2hTczp/7qcwcHrki6F5FLh6PyGNh89xc6gMJq4MMRenXk1
         NDMg==
X-Forwarded-Encrypted: i=1; AHgh+RrmrpxBiQyBs9paPhnzHHfyxdIX+RyoD2dhHnFRhAanos5md1ahpunf2dc9p6Sh0PTSV6NCV/FEtEUCAy2y60k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFQDKmdcVbJk9XBlLq/NUK6FLkJ+RIYNK3ia9VmupPXpdmE7mE
	nz//IhmoHXDsVzkxAv9LeEF0G0Gt4LPqBvqCzwTTy3JNj4k6qb6A2HBxjkrtrKJPQw==
X-Gm-Gg: AfdE7cm3njAp1Tnt+Yb1hMFPw0CcXbMMMYdXVyt+tNMB25BI6y5xgdKsI8QRSqEbaCm
	KkdVhqPNsCY2Gxz7p2drh6z0w0tiLIljqXsDWMY/1QWDJXirHmftXqq3/3auocKdUhYXnZWvQCU
	NHi8rNGxFlVyXRaKt5w49xpirB5piaUEIdUeXRZy3hMBBnksCBgcjS3W9Qckz04qItPqwsspbE6
	d9r7+llfuKdmGuaZjVDqSsr8Eg4YMTuSrLvGrRKQaSyDgavj8wuY3IzYKCoC52jHh0d9fV2g+63
	ARsaLIqlig8H/BcZoCnJneJyfrlR3Hofwvdbg5kqhrKvj/NRaYJKw5BoDUay+A10d0dDh+xcvII
	Bk6Vj+rwCoXMXw2restQ2b1+OBrQ1iO0eN0iKMvC629mM9sRhReNOPDHLwqjbhAQPhp+ALjLnIw
	A9x/wZB9aFRDVC4D88cPoIhOSVr2CPkAmpAyk5tMuamdD7n7PuToML3G9fCwc=
X-Received: by 2002:a17:903:2309:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c7e158ff2fmr45803835ad.34.1782325393193;
        Wed, 24 Jun 2026 11:23:13 -0700 (PDT)
Received: from google.com (211.37.230.35.bc.googleusercontent.com. [35.230.37.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae5ecfsm3689025ad.21.2026.06.24.11.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:23:12 -0700 (PDT)
Date: Wed, 24 Jun 2026 18:23:09 +0000
From: Benson Leung <bleung@google.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: reject out-of-bounds PD
 cap count
Message-ID: <ajwgjQQsuj1AYJXz@google.com>
References: <178229037114.3009621.14045345257767446805@maoyixie.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2yuEi8rDjEs2iff2"
Content-Disposition: inline
In-Reply-To: <178229037114.3009621.14045345257767446805@maoyixie.com>


--2yuEi8rDjEs2iff2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 04:39:31PM +0800, Maoyi Xie wrote:
> cros_typec_register_partner_pdos() copies the partner PDOs from the EC
> TYPEC_STATUS response into the fixed caps_desc.pdo[PDO_MAX_OBJECTS] array.
>=20
> 	memcpy(caps_desc.pdo, resp->source_cap_pdos,
> 	       sizeof(u32) * resp->source_cap_count);
> 	...
> 	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
> 	       sizeof(u32) * resp->sink_cap_count);
>=20
> PDO_MAX_OBJECTS is 7. source_cap_count and sink_cap_count are u8 fields
> from the EC, and the only check is that they are not both zero. If either
> is larger than 7, the memcpy writes past the end of the array on the stac=
k.
> A count of 255 overflows it by about 1 KB.
>=20
> The ChromeOS EC firmware caps these counts today, so a compliant setup
> does not hit this. The kernel should still validate the values from the EC
> rather than trust them.
>=20
> Validate the counts in cros_typec_handle_status() right after the
> EC_CMD_TYPEC_STATUS command returns, and return early if either one is
> above PDO_MAX_OBJECTS.
>=20
> Fixes: 348a2e8c93d3 ("platform/chrome: cros_ec_typec: Register partner PD=
Os")
> Suggested-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index c0806c562bb9..3ae9b35b7d85 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1158,6 +1158,12 @@ static void cros_typec_handle_status(struct cros_t=
ypec_data *typec, int port_num
>  		return;
>  	}
> =20
> +	if (resp.source_cap_count > PDO_MAX_OBJECTS ||
> +	    resp.sink_cap_count > PDO_MAX_OBJECTS) {
> +		dev_warn(typec->dev, "Invalid PDO count from EC, port: %d\n", port_num=
);
> +		return;
> +	}
> +
>  	/* If we got a hard reset, unregister everything and return. */
>  	if (resp.events & PD_STATUS_EVENT_HARD_RESET) {
>  		cros_typec_remove_partner(typec, port_num);

--2yuEi8rDjEs2iff2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCajwgjQAKCRBzbaomhzOw
wnSOAQCIz50X5Z2KAhe2lj+ABVsQLpGk+n/TQ5cfeXgp+BL3VAD/Q/QWL3dA9VBd
wxxcndjXxwJvLRdVBmW/cZcJyNKK9Qo=
=gyKn
-----END PGP SIGNATURE-----

--2yuEi8rDjEs2iff2--
