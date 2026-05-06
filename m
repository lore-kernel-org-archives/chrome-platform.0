Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F52D63E8
	for <chrome-platform@lists.linux.dev>; Wed,  6 May 2026 03:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778039146; cv=none; b=eeqUTLUGUniM4BHVc2AiDRUF/NbzvCvKQ3pZmekFqNKqJXZh95pu8xUPi9j4ydQQ8O5bQshNUTv9JUTquzmNE6PTdysz8rc8E3jj6Qh9ETo1+vkJoawK8az4/UtuXzEAsRcaxeSD2JhhDXflnmhp0xw2IKvEVQMPZciib0DLpm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778039146; c=relaxed/simple;
	bh=e7MFWAvOrD6x55/XFyvjUmf1OBviZSxCrWEKFtCHq+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STOMyjWc2jjzVYR6w6zx7KXmMw78e4vGhMgvljlJI9iwH3+VY4k26wZe5N9uMfSodXc11eTiMn0bSBJOglm0eVTiKgoVVtLsQta8hYoNAahcKOkUvQ/JN2dI9cDIo3LGtknBGsXtL4KZ6SATwbUFYXO+WbIEIl2D2bhbKjBVj6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l09R+GFm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l09R+GFm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8354461da74so1556886b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 20:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778039144; x=1778643944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjHOkaHu+NkO38S6EeZoMhD2GWUGazZfx6GKOrIeYZk=;
        b=l09R+GFm5BEQUXqeMPjig3fjUlbxXax7NIViHtFNPdn/J7vaHSd5tYXhvr5FR0lrLd
         Vcbo4bpUwsGv5oOW9AHkeeCiUXENAOMLyI5J+4QBqYUNaiSji3OF/FsJ62sfrCtsHep/
         baLZpd430hFjPKX/VKajs19/ZurbKLWfag9DdG8rGkS1v86M9fLRYH/upBHn4uzUNrRo
         aWThXPnfijQSXcP7nXiOVsKP4IdtaFnM39UHj0CspucGRofwluOjVUkILpXKmm5/Ehh1
         xLvSMxQ0PlfX7SLvjcSPv16VC3+dVxH6YJuM8yH1U/l6VA9zkbukSZk9M46FjLQDPxIL
         +raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778039144; x=1778643944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjHOkaHu+NkO38S6EeZoMhD2GWUGazZfx6GKOrIeYZk=;
        b=nUP7aNqdIkwC9MHMr3mXMHLOv9U/ICotmCQ3+WBo1uzFES3nyUi1Lcy9dN01t5xOHu
         xeex1XC89BWugp2Tr8pYjt4ZHTiGJVt7IMe8/lDqMwiAY/qUxDYKXCR5w02LB3tHbJ7j
         1Y3QSciJR7Q0B1Y7xzXcI/D07yUSeMmtpvcOlNmjBdIBrmBhDE6Bn4v6cL1AzNo+hgo4
         vExIHDuVsSJlCZLNQpwTzr/PhzM5zHVTFshPuPAS7EHkiRZHGWEvFQbeO5+t2zt0gt6L
         O6IFixeu9mbhShY/usawb/mUA5AxZfCWeoffcX1V/xWe3KKm0FIoL2qZ9HjGNbxL7BOk
         CVjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RO2XZZC0TK9bRRR2hNK5w2iJ9k241Cs8rS/HKP6mduX/oq6CWEsTtkHHFtB+EAHjMKToMtBNIftCmJseqUaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKsR/YxC9NQ50T1fDyai87gz0+Gj5L8CeTO77cpnVtAmOmoBUf
	RXCr66VkNSuBli2UV4uEt3/HP/8nlsVXuFHG+eJD4sZ0B1aOA2PBS9tUqg+vrx9epQ==
X-Gm-Gg: AeBDiesCyT12vGGv0IPpCVqyMH1oBb8o5saJxyGty+ZGdNhVpemJhm2EfbCY9XUXReg
	YjKfPWe29F68LUjekMFJjZtUQR5XX6OcmkYJozEbYpzqiYN1+TnqRk18ydGEQVVZPwduQgYWtFv
	8ATu9P4bfv5Gy04aUX/c8g0Rz4TePy5WE2C5mSJ8r8AlvL00HK+zDrwHAjBSHo0o9dKkiE7DCfN
	9/R5figd8bZPXbXqU9lkFUrnyezhg96H26jAkmU5eKIeYhZLPKbEsYTkfAqpQCzmTeQ8aG3wQu5
	QyKbRGKW0aLZzmWIy1YTt5zvV4WlmBIP3plFRkM+pQsDg8YIazTrfJtnrLoPMNsOP34/dVYtz0V
	ZifsBu02pYh1lkJL7WQ08Jyf/Datu6ehl5okNgL86jqLYNYbROODdPpdh/hRxQid7krcd5AyqtS
	tAmbQlrhgEshx0iEvVvd6wGcKB9g3rmmJ3ZMNxNgfLAMKLJYZg5oPzAf8sNL7o6YXZAehaoO5j1
	wHLBw==
X-Received: by 2002:a05:6a20:6a09:b0:398:d82c:ae6 with SMTP id adf61e73a8af0-3aa5a936bc4mr1494087637.31.1778039143093;
        Tue, 05 May 2026 20:45:43 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ba1bacsm607897a12.23.2026.05.05.20.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 20:45:41 -0700 (PDT)
Date: Wed, 6 May 2026 03:45:36 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Delay dev_set_drvdata() until probe success
Message-ID: <afq5YKI6epFptp_g@google.com>
References: <20260427131721.1165078-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1JlCb1XYyQceS4y"
Content-Disposition: inline
In-Reply-To: <20260427131721.1165078-1-akuchynski@chromium.org>


--i1JlCb1XYyQceS4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

On Mon, Apr 27, 2026 at 01:17:21PM +0000, Andrei Kuchynski wrote:
> If ec_device_probe() fails, cros_ec_class_release releases memory for the
> cros_ec_dev structure. However, because the drvdata was already set,
> sub-drivers like cros_ec_typec can still retrieve the stale pointer via t=
he
> platform device. This leads to a use-after-free when cros_ec_typec attemp=
ts
> to access &typec->ec->ec->dev on a device that has already been released.
> Move dev_set_drvdata() to ensure that the pointer is only made available
> once all initialization steps have succeeded.
>=20
>  sysfs: cannot create duplicate filename '/class/chromeos/cros_ec'
>  Call trace:
>   sysfs_do_create_link_sd+0x94/0xdc
>   sysfs_create_link+0x30/0x44
>   device_add_class_symlinks+0x90/0x13c
>   device_add+0xf0/0x50c
>   ec_device_probe+0x150/0x4f0
>   platform_probe+0xa0/0xe0
>  ...
>  BUG: KASAN: invalid-access in __memcpy+0x44/0x230
>  Write at addr f5ffff809e2d33ac by task kworker/u32:5/125
>  Pointer tag: [f5], memory tag: [fe]
>  Tainted : [W]=3DWARN, [O]=3DOOT_MODULE
>  Hardware name: Google Navi unprovisioned 0x7FFFFFFF/sku0 board/sku3
>  Workqueue: events_unbound deferred_probe_work_func
>  Call trace:
>   __memcpy+0x44/0x230
>   cros_ec_check_features+0x60/0xcc [cros_ec_proto]
>   cros_typec_probe+0xe8/0x6e0 [cros_ec_typec]
>   platform_probe+0xa0/0xe0
>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c1d152cc5ac ("platform/chrome: cros_ec_dev - utilize new cdev_dev=
ice_add helper function")
> Co-developed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 39430dd44e30c..56fb7cceafc6c 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -195,7 +195,6 @@ static int ec_device_probe(struct platform_device *pd=
ev)
>  	if (!ec)
>  		return retval;
> =20
> -	dev_set_drvdata(dev, ec);
>  	ec->ec_dev =3D dev_get_drvdata(dev->parent);
>  	ec->dev =3D dev;
>  	ec->cmd_offset =3D ec_platform->cmd_offset;
> @@ -237,6 +236,8 @@ static int ec_device_probe(struct platform_device *pd=
ev)
>  	if (retval)
>  		goto failed;
> =20
> +	dev_set_drvdata(dev, ec);
> +
>  	/* check whether this EC is a sensor hub. */
>  	if (cros_ec_get_sensor_count(ec) > 0) {
>  		retval =3D mfd_add_hotplug_devices(ec->dev,
> --=20
> 2.54.0.rc2.544.gc7ae2d5bb8-goog
>=20

--i1JlCb1XYyQceS4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCafq5YAAKCRBzbaomhzOw
ws9gAP4o/Y97BIaEjbh6PIhp9H7uWtUiizV3OOo5ubeMh3h+UAEArrSpYxJLsUf7
ascjppNyslvTH/yfwtUT/0Tw00Qe1AI=
=+yyJ
-----END PGP SIGNATURE-----

--i1JlCb1XYyQceS4y--
