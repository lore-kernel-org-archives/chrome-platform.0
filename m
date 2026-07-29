Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886F35F60F
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 23:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785369254; cv=none; b=g+0z7gZiuwPkAbRIQUnSK0636bUlDS9Qj2lQ6a8xd5nKtDyFvTeSYa2ow2swzr4ufRK6Pt+MJZ1U94BjfLvIdGuabeS1lJeFhQQxaHJ23Z7UQCzH5ZWRDJDLonOwvhay+PJNghDe8O73RqNJTAT6devyG9kL9FRNwVF1NEW0YgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785369254; c=relaxed/simple;
	bh=fw0j0tnte3sBEEveM5XCkyRP/rIVS1ZqUfoNq6PzuCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtBpvej1JyVhn4IrrIVTF8RN9CGzh8WrjRfp7vEH2VVQWkum0IjVDPiT7PfuTN/nNlkgxw2lVuMzZqKk/LWU24mbIRPQAcDZS2y/uy8CwC32VbsnCVDF+Z6xI55Jh3gxK48GOmE3kZr8a1PVDs/kTuOpvjH/Ro3+7YoHHBRyzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PdeHWBEV; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PdeHWBEV"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84867f07d63so1867812b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 16:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785369252; x=1785974052; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxQSCJZhlnG76ARAr2s8rtNFo91pNytzsNNIEzDadIA=;
        b=PdeHWBEVVcqF2/+gnVMT6GWM/rnXPAEfehnNXCmGAUVD1Q/VVeYA5ofxAdwkXGOxNA
         y2xPdgv+ZZJe41EqTeu2nSTTzpHRuMFsOOSTtam7tlfyieb546OfUdZ3/xMedMHGTNf8
         z5VvuiRQMXLJwGVJu202K/mtesILsVd5xCdVjtF9i7xK1aidz8eU0VpM0t46UDcsAYFP
         ypZjloA9XA+vgfehAIxbt+rrQSwhPQtW9ebqXfZCS5cOVgXtf47lxoduyXryae5CniNM
         m5VF9gtKrKvL0owvdHhBk0bTn3hQzspBIRENtsyjQqluv3OewBm4d0K2NXB1ixhNq/AL
         wEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785369252; x=1785974052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxQSCJZhlnG76ARAr2s8rtNFo91pNytzsNNIEzDadIA=;
        b=eUBTYbGijovfkdfftos6b+rX5BWQ9y2X7GE/IzTV7R0V327LG14/etoxbht8C4/GEU
         Kdt7hxHTxGNdiOhljx5xUAQqO+IW4XiwgwRPkMQf12ZsXenEdanUom0SJdFhHsrKPxS/
         YJzVmW4NrZ4I9O3Jhf7Fq6lQhY+QWbwp9++iPbswChPfwy9WRyb2cGMbU+JrMAhB+0cr
         rEe6P3TxFx+sh/VOwadqV8lffwe6DVgL5o3GcsKVN56moMCOt8LVxkH3LVAk7PSPjTbt
         lWpMlBhBDCSy+gQ1aRrtmWkjshqv91aOBCP+WWqWTuKzOwvd+Ar8p+yknqSgNXREe40o
         7DTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR5U/ElIfu4ulE8jI/F6apO980PJiLIE3ntTn82C5Rhd6TJ9rEc7hC4IVtGH4iq1if6dI91pLgQ3wsmWEgE8w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlZmeH65eZP+f/fTEnUE2UU/6XWM3F+nobNN7uUqEiHo8310Pr
	e+KrxMd1Z4HiWw2r18gpLpNoCvHSNmMLtGAeAEH0uNToIn6wY1YcftXr9KdP4/txvOf1CwI8ZRj
	wuX0ksg==
X-Gm-Gg: AR+sD10oqnnWGoFdyp3nKHC04luU5nGU/BbEhUCJQIUzocSwKLk83oC/N5phDGegGJd
	/BL2tsjetAIrlRFIS2pbQWtFFh5dugjNYBDDqPRH3Mi3/pbDfz7GGj6j01qDY4yIBI/AbgNbH/N
	BQoNWGWyiETWvsdiEwigBgQLEfnbFVd0rb/C89vR6tL08PAw6BO7Qrh8xkXfhRQdWXO+Hn0hPU9
	pUvQ3oW0/VSEJF/efR9L7DdqM65HJZ4YyLrmhG4vW2cE6CVeuMxCoqcUinMtqjUPmJ3FxsmyF2+
	3heSwNzNqmJoXRnM1tI5/7gKR1AG0qMGGkjm1L6hTRzNgLwmDNJ0Xnvj6HFPam6G5MYjJUxMxfv
	/nWTiMrGSRGJVkfsheDa0voRnsen8tir04+rA5NrJ9M1lq7UaeOeWQTMyOqD7caDC8rRPg97rGh
	03xLuCk0YK1JajZJ1V/FBmOpv2p/YDDugm7b1irwLg0BcYC4vmjuAnY3T367uE5/nU3Nj5iNHGQ
	mkv1J/O3i0kgmV58MbQJg==
X-Received: by 2002:a05:6a00:2e19:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84ebc423eddmr374349b3a.63.1785369251089;
        Wed, 29 Jul 2026 16:54:11 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa4a4sm2009852b3a.29.2026.07.29.16.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:54:09 -0700 (PDT)
Date: Wed, 29 Jul 2026 23:54:06 +0000
From: Benson Leung <bleung@google.com>
To: Alexis Savery <asavery@google.com>
Cc: tzungbi@kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: lightbar: Enforce 8-bit payload limit
Message-ID: <amqSnkfYSGZMJa58@google.com>
References: <20260729221459.1006-1-asavery@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykjrXLfY+xYnztqc"
Content-Disposition: inline
In-Reply-To: <20260729221459.1006-1-asavery@google.com>


--ykjrXLfY+xYnztqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 03:14:58PM -0700, Alexis Savery wrote:
> The LIGHTBAR_CMD_SET_PROGRAM_EX command encapsulates its payload data
> with an 8-bit size field `uint8_t size`. However, the driver currently
> allows the payload chunk to bypass this limit if the EC transport layer
> supports a larger max_request.
>=20
> When this occurs, large payloads (e.g., >255 bytes limit) overflow the
> 8-bit size variable when assigning `param->set_program_ex.size`, causing
> truncation and parse failures in the EC firmware.
>=20
> This change functionally clamps max_size dynamically against the struct
> maximum (255 bytes).
>=20
> Signed-off-by: Alexis Savery <asavery@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_lightbar.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platfor=
m/chrome/cros_ec_lightbar.c
> index 02a6c34e68e6..a8df36260419 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -496,9 +496,16 @@ static ssize_t program_store(struct device *dev, str=
uct device_attribute *attr,
>  			return -EINVAL;
>  		}
>  	} else {
> +		/*
> +		 * The LIGHTBAR_CMD_SET_PROGRAM_EX payload uses a uint8_t size field.
> +		 * Thus, independent of the transport limits, the maximum payload subs=
et
> +		 * that can be transmitted in a single structure is 255 bytes.
> +		 */
> +		const size_t max_struct_payload =3D 255;
>  		extra_bytes =3D offsetof(typeof(*param), set_program_ex) +
>  			sizeof(param->set_program_ex);
> -		max_size =3D ec->ec_dev->max_request - extra_bytes;
> +		max_size =3D min((size_t)(ec->ec_dev->max_request - extra_bytes),
> +			       max_struct_payload);
>  	}
> =20
>  	msg =3D alloc_lightbar_cmd_msg(ec);
> --=20
> 2.55.0.508.g3f0d502094-goog
>=20
>=20

--ykjrXLfY+xYnztqc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCamqSngAKCRBzbaomhzOw
wsg5AP97OVykK/KLwRFKCvGi7yiOgwe2SYRQxxGFXp673N/qPAD+J0AQVAiu7EKA
cSj88KBSu1qe3FvZ9z2WG1c95NoqWAw=
=9zXQ
-----END PGP SIGNATURE-----

--ykjrXLfY+xYnztqc--
