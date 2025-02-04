Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF83207E13
	for <chrome-platform@lists.linux.dev>; Tue,  4 Feb 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679716; cv=none; b=AXwkqlBaDFJyfCoxTlIyCfTim4J0rYtJ2amnB3B27tVcOf/PqP6y2JNS7OYTAGJkTq9ZTIH7vmITmh3L6q/L64wKYuoFBO10L6stIEs3rRyOeugu9K5gfsAWtrt3uzGhxXuAb/va6JaKkay80cu9srXq0zMhh6tMJJQusaSOYxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679716; c=relaxed/simple;
	bh=tcMOhxTSOwD2c6GuVYis4DhDURKjK8Gnt0lKkjG2irI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyRSrnwnbXG+aL1QC2LoP+pGJfaEJ6/KphSZzbUrwq+jl6Pp0kvvKruX82Xe/GvdcjulNi2TOSTtaSlK7DE7KAmnZkKb1zSmwzbuFr8DLmy6HCmU4OK9VKlcwg6RvGVO6lCkrAf3QClESNBsOantCl4mGyKXUjZ5qGHEmvHSl5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZk/u7VA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZk/u7VA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso8525219a91.1
        for <chrome-platform@lists.linux.dev>; Tue, 04 Feb 2025 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738679714; x=1739284514; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KvIihmND6ZFM+bCyzu+q7+jTdhiHhkSYeMCQU4OgoS4=;
        b=NZk/u7VAQSEAVuvAfr0356nQihRIGgt5tkt91d4RQPbHzrsqaDEhGGA0bqUlFowQJQ
         uRtD5J0U+hBDNynFU51ZKyMm6aXJ9z2HhBNsQWQyfom6+sHOjQjHLS8c3VaW5DNkGHCl
         YgKC01nDp9M+TXqelHW1yCXXL/Vqc1exSoZZOmVdtMOsaTWkOtwisMWbBJfL31BiFSel
         7X19zu25UB6i9nrKre+Xulca56+fnmrpJ0pD0fdZ70tWdHeizE4UvmBc/fLlB6DrCN/Q
         /cX7wxVGjDwyut8xMsvQofEkaaowqBr1GfJ+RnYeUs04U8XFWxsvnZe8+9DxAta2kImX
         jE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679714; x=1739284514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvIihmND6ZFM+bCyzu+q7+jTdhiHhkSYeMCQU4OgoS4=;
        b=eZb4XpFIZKIVn4C+8s7rzGBdDyNJxZo6uNlTL/kuWgaoqH4Pq8lJk7p+aMy2evbh84
         Xp8HzFHCO1SItVD4yYCtYstQYBTqFANdth89sHHxkRoG2ONA9m1UfrPI8ElReo53hVqc
         oo3oucTP+CjmHWr7Z7rsn+jqjg/aHvM1ncd2ijrn4/Hr5vUXpHSGaFLHgpZwqVntIQIt
         W6BKuwnJdSJ6+MQu5S969oAA0wYKMxMvtoztxDWRM7wYb/vLlGtBUod9sEoFoPgf5cO3
         xGp/HcMi/6lkXfKVQHdWmamHtwy3YA4ugSQtrCnZTD7tTjmx/37u6kqLMb6hjaHI9PMB
         IK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjluKCDxT0md0h+7JJJq8SFDinNofwvfVqBPVkQA1fpf+KFNtMr9Oj3iMj9iWfBYKt3/uiiIniSrRzTBcdgXw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1v+5yw051LBGe8MmuI34Ku0TmMU2JZexO/evuOfcN6+HffHkP
	jetiVqZdE6aHVjrzQEWWgVALC0rSBXcusFdCwzNKESfJV5ZCjiy41p9lmFHWSFrJ2El97vy2b4+
	Rhg==
X-Gm-Gg: ASbGncuCQVsZgp0IY7QwHA7ZIPXcPAGOrK8GlPd0kXVZMvedH3TvcAtWjtBNN27/JWY
	VCDvMxw+c0YVQAjXgW8GflZ7eSBjkbLsBVWY87XZO6EJF0Rna3uynN0aBnXyutrFuHrxAEquMJy
	a9hfc0uXIpC4jQdytDn6luGir8x5erdpTI9uBDL4lzjx0lvolwgrPhXMrKjYhuP6lP+8WF61TqE
	GnONn538I0vQGwarRez6/PQyjehtDzpPQfA8TaW6IS38PU2c4osA6HfWmvQhZZd/zfNGWPNr0Li
	U1cDl0pYLljKHXnib6Mu9nILyPUkbNql/32CfSFvqmMtCAvn
X-Google-Smtp-Source: AGHT+IEJWJDPw0AlXxZgAMJJlavRK8mWeKF6DfMWbxOueuowlrvDUq0kMxUun0eh+/rRilYepx2+MA==
X-Received: by 2002:a17:90b:2dc7:b0:2f2:e905:d5ff with SMTP id 98e67ed59e1d1-2f9ba227090mr5570647a91.6.1738679714329;
        Tue, 04 Feb 2025 06:35:14 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acac43sm11196238a91.40.2025.02.04.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:35:13 -0800 (PST)
Date: Tue, 4 Feb 2025 14:35:09 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	dmitry.baryshkov@linaro.org, abhishekpandit@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
Message-ID: <Z6IlnW5i93mHVcnj@google.com>
References: <20250204024600.4138776-1-jthies@google.com>
 <20250204024600.4138776-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fguC/8dz6gO27jZW"
Content-Disposition: inline
In-Reply-To: <20250204024600.4138776-2-jthies@google.com>


--fguC/8dz6gO27jZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Tue, Feb 04, 2025 at 02:45:58AM +0000, Jameson Thies wrote:
> Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
> On platforms supporting UCSI, this host event type is sent when the PPM
> initializes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  include/linux/platform_data/cros_ec_commands.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index ecf290a0c98f..1f4e4f2b89bb 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -5046,6 +5046,7 @@ struct ec_response_pd_status {
>  #define PD_EVENT_DATA_SWAP         BIT(3)
>  #define PD_EVENT_TYPEC             BIT(4)
>  #define PD_EVENT_PPM               BIT(5)
> +#define PD_EVENT_INIT              BIT(6)
> =20
>  struct ec_response_host_event_status {
>  	uint32_t status; /* PD MCU host event status */
> --=20
> 2.48.1.362.g079036d154-goog
>=20

--fguC/8dz6gO27jZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ6IlnQAKCRBzbaomhzOw
wnJkAPwJs+MI9qs0ZEsIHDyvzbOyJlqQQ21Ih7QgMF4OxrPkwgD9EfOexfo9o585
fYRoOwK7AawgC6gQob95POoPzMVqGwc=
=QBdL
-----END PGP SIGNATURE-----

--fguC/8dz6gO27jZW--
