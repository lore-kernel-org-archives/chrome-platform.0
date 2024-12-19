Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5D70820
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571826; cv=none; b=nm0766NGPK2kosOw1YagFRaMWd1OckoxV0D1YM8RzYkIV6U7OEzquA3pfp9Qqj/NnWURu3It/9LDpuMQ1AxyGyZA4UlbPbl90+zzG91QI5o0aBo/pQViKD515eTTj6vywVlKWWw08YhcAQ5IO/98cCP5GzILToI1V9pPyTKs1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571826; c=relaxed/simple;
	bh=p6nOoEYp0S5604xQ7iSGBSC3YT4ztXbChxOK0GMxqtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvyYqHMj8uwPxA5fZAXTo76GilgntohzRJ6Tz/uhznlijgHRLyie201sl+jc1UBoOJsZqwF2xkjxsRNEp32fSLGWHVbWJqMAIcIVYC/5kmMG0YHdVCgKEuDsSl1lRyIIC62krc3rTpAClIN/oQh9197cnZ3XRt+QscJ5IDA0+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V/RSIU7H; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V/RSIU7H"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so182330a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 17:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571824; x=1735176624; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3INdROJe3ktwJeWPfSyY/3heuTKVBEytvmnr8lDFnM=;
        b=V/RSIU7HBO/oFSaE/wZwtQoHlDXSJOsV+3RqlArEYYLQyzmdd2Z+fHePONOgDfHl5C
         j9JEV0T5eaf4dIozFY9iiJoBmP2HAecCtc5AB3o/nDhgifMLwCepkWqqLhkyHCWyXHJ9
         odGjVCYCKeYrGV1ZAdA7nJ0OFTG7whHUT0j0LWGtwtmRkBlRNXL2Z+E4mb7awD8iHtx3
         i/NJNnwQ35XVfATy6RcVdL/aTvKI5KoZkwJFjsMukK51dvHcUyAKOnFgKA6HQaLtyrs4
         MxTPXlQbabI6mTHKjHzn4rMOm1fvLbZMNuTQhRZZH77f8yOjEPnXYq2BihXxNT6u5q0V
         /N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571824; x=1735176624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3INdROJe3ktwJeWPfSyY/3heuTKVBEytvmnr8lDFnM=;
        b=hLiAVcop1G+CXqRZ9il5u9t1F/9h/gnPZ14ruIFy4vXbpnM5HRiKsY3jq6SKyQiU3Z
         kffGTpAM/IEanTpWB6x7rPUJc6+a2EHh27rMhfkrbmVqJnhsRGPWwZFLEkYibg96Vgy7
         3hHu/APyY7OjcpaCDiVGR9X+ZrUdnCN7nqfRcXq5A8XNLGrOzfrLQY2DwPe1gtUhoSQY
         7nQVA4iLia8BQO+N5JJrkZYjMId2N7OcQL61f4+snRPLxsBNBK30rAYJfwXQ+wMC4xCe
         WSh//hZ+yzCrbEOfbLiwx9oycMbQMDpbgxUEn1IfpDeem3xNFwZJ8VmZtOka11+wlUyV
         4sbw==
X-Forwarded-Encrypted: i=1; AJvYcCWlEonJrGa8IZqsH0Wt61aITVSONzsw0NIFyoGK5vN3v9dew2xtOt3CoNFVl7rONzq+bFytfvDo409Vm82uh9g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEojWrKcmaHo+7aHOURKJKwelWUocdaQPNH+V2gYi9YQn4h0HI
	8j+GOW0l9lPF+3w15JscrJ7+5EmcXA1fg1wes5ywEVLEJXYwyVcgUdV/fVO/KA==
X-Gm-Gg: ASbGncvv06qaSTHwPB2xfzMDdfjdupwrvdcSqOsZ9OIdpJdTDQ5QALDcQ8RXDW/fkWM
	IPITqae6TRPjnnNtDYhcI0aJxuiOcguIZQ/xbCHW5pdYzjHrze4h/d5HoCLqozqvA3iuT5VlMAl
	g0jgwULVVeX+CcivTV6Bf4sSVQ/iIQ8meL2Dj3W+fDtglStGTm1Vdv6O8DewQlPCAh2fc1WxmQv
	cht5dIRzzf5UPQeoYdyHiDmY+W0Y+EkEx5/UUrN5YeQPCsOm/qGHvjxBDwSJ9eLWF6RhvlLUBki
	P7WyGoC6bDKdESib
X-Google-Smtp-Source: AGHT+IEYJCxKLU4r/XjygJL6qQfCXVxFX5QGZm3Shr7aqw/EDMLY4faPDbFmN+OkIbu3bZt9d9iqeg==
X-Received: by 2002:a17:90b:1f86:b0:2ee:eb5b:6e06 with SMTP id 98e67ed59e1d1-2f443d7181fmr1894693a91.36.1734571823733;
        Wed, 18 Dec 2024 17:30:23 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c4cc5sm172684a91.12.2024.12.18.17.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:30:22 -0800 (PST)
Date: Thu, 19 Dec 2024 01:30:18 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] platform/chrome: cros_ec_typec: Update partner
 altmode active
Message-ID: <Z2N3Kplgwy8P7STz@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u6VxNHwxbPI9ztRE"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>


--u6VxNHwxbPI9ztRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:46PM -0800, Abhishek Pandit-Subedi wrote:
> Mux configuration is often the final piece of mode entry and can be used
> to determine whether a partner altmode is active. When mux configuration
> is done, use the active port altmode's SVID to set the partner active
> field for all partner alt modes.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Use list_for_each_entry and simplify conditional statement within
>=20
>  drivers/platform/chrome/cros_ec_typec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index ae2f86296954..77f748fc8542 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -619,6 +619,7 @@ static int cros_typec_configure_mux(struct cros_typec=
_data *typec, int port_num,
>  	};
>  	struct ec_params_usb_pd_mux_ack mux_ack;
>  	enum typec_orientation orientation;
> +	struct cros_typec_altmode_node *node;
>  	int ret;
> =20
>  	ret =3D cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> @@ -677,6 +678,14 @@ static int cros_typec_configure_mux(struct cros_type=
c_data *typec, int port_num,
>  			port->mux_flags);
>  	}
> =20
> +	/* Iterate all partner alt-modes and set the active alternate mode. */
> +	list_for_each_entry(node, &port->partner_mode_list, list) {
> +		typec_altmode_update_active(
> +			node->amode,
> +			port->state.alt &&
> +				node->amode->svid =3D=3D port->state.alt->svid);
> +	}
> +
>  mux_ack:
>  	if (!typec->needs_mux_ack)
>  		return ret;
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20

--u6VxNHwxbPI9ztRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N3KgAKCRBzbaomhzOw
wnC2AP9bzmKnl1n7FGD2IxuFSue5HXr+ftqRgv4W6e9ba0LPcAEA3pKlrW133tep
HIPcEzKbrNwxsTxV3ohC4hIhodbuZgk=
=4d93
-----END PGP SIGNATURE-----

--u6VxNHwxbPI9ztRE--
