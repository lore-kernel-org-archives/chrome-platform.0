Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DA335081
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552212; cv=none; b=HbV/5JoxMSKOIo4A9PwYPbItvd/w2v8+NKceTw1VNWfsRTOrbmghhrgY6cUEzxpJFwuPc92nJcAozHe15gK/KaUhKqD4K2SnJGpFRYW3vFn+eycrxh/WsRu8P9qLZBNlJqIQGSdXlDFROyv4y7vKF0ERZqj+qTvlsmzJRmtfq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552212; c=relaxed/simple;
	bh=1nxBbdYt4NyVpUfMMbPHXMdAVynnyeyFD7RDA7bfvEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkX1K4RS5vhFzQvzsjy9zoJ4CMViwOIqQkRGfKj7DxCkqA4yNL0PdN+d4+N9SwrPo59pL53uWeW4gJiLMKpA35JVdF6bnf348nhW54UIucM9+LL2uemDaALlOjnGIJ0WzDqWlCtJUp5aG++VFST0VlKCkogXLm+6gnZGhq8KQM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WnsYoatC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WnsYoatC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49954b88fffso13116765e9.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786552202; x=1787157002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
        b=WnsYoatCNIyBciQOhRfIzVYW6qydM844lRXIuozR3cSnBIs9sHb5HPl844pBxdIFhI
         GnMR9QJjfDdIa2AEb6q02cqfDNnX0onX6jcVnDAuF/xl7S311NdMTMIMb03qtY4Mpmtc
         d4RhAkEp7vB0ySmkQ9paplcmECbCDTK4rIKpX1tqmXoNfzNU4q1Qk8havR2IyLRO1aV4
         1pbWrJTpccD+wJFZVfB7PhElj5TrI08hrFX7dPzyYYrr8Ce/gLHlzpz33/HyXtRul46g
         qhERABqfND67Hlf8HL+QxPFuvBCsvrQhsJ2IxLJR5RuNpMZYA8Za0XPRrUC7sSuzVmqV
         lBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552202; x=1787157002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
        b=dCdp3BnaGqPyEnk6OO1Gwl4Q6IGs7c7i0b8y2lEo7CM7AuYQDu2W+fv9flnp2FpY2m
         SKQg+zj0DWLuxTflKZPFox4+ZadDegrxMjgn9FEx6AhPF16HQ5eCA+MSo7Gx5a21bLaB
         ofDLbV5q2+MkYa3Qv32KMxEEaEseaTTpoH7kgmslGxmdBOtEI86C0BJ2UrtUM7KyLZYz
         Or8M2pjRjTLY9+WuholFb74oSagf3KrYgz6DwLV9CvnlMlVnQuZj78DJE8FRc2Ivj/lf
         TGRFjEVuVNE1aQq2xghAzmLrkrOrmEVjsHtvQ6N/qqy11OZEZJ4U6byV9+K6AGJqaxtZ
         qwRw==
X-Forwarded-Encrypted: i=1; AHgh+RqxidFZMDVKEPj9wvHheKWjGXgPLvDoSOdsfeG9Jg6NfrtR6sPsOIWBiZtEXmAKmvnK6JhL0/TbG9XNHZMH3Uw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy12AZ2adt3yTpdgGKoXRBhAWppoBf9/PdxLYAi5OMhDv6ln+Jc
	XwpiJNfInRn9RZE2swb/rNOc9TydDnTxHEtu/dlQxDovUVwJjVc4qj2ESyfaHdNcmgc=
X-Gm-Gg: AR+sD11mgPkgFDdREPLYnXveJ/BJY5hbD8U9i3g4nQYFlTeieMzZ9XywdPR4dawq0ds
	wX/9ON1vuiId+GMnod8H2akGc4cOrrLH2qQCDmoZQYCV1iz3hUhufM49t4iDIdhTJmDx5JZU4Pn
	42v5wPNh5YZeXzNPtn3yOV4S1HYzYgxhHXGkszKrUXb0Z3BJN7PKJW7RGV/+rCgHSxtYI31I1I5
	0JdJmCBzYiUUDTiWoA0Q93qot6dV0KuKBdrBJRdy7H/vO5MBcoOwJE3yl+7EcATIvb9NGaeQe5K
	33Ey6g7vHpLNRYNUC3vQa+rCXRFym3A/XVTZmfBTrJ7uU/S6or19fqwC200eh05YrcEDQBz6Wss
	itKZ+XagCNKuWOAXLmyl58L28yyjgajrUMIR/vAWQfFQAX4rJump7P25l+Lfag8aBD3KtTFu8DQ
	gj7W9EAwB+H16lXj022lZk+JbqJqZTgweuUDIbybnHFkkE8kjgPRa+cn8O4HSCTr9LlktiLeF0t
	GK4Yzo9RF+lSlrz1OnTuNcRXceUZhfoMrfTeQvhSj0WF7D19j0=
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr92430045e9.18.1786552202335;
        Wed, 12 Aug 2026 09:30:02 -0700 (PDT)
Received: from localhost (p200300f65f017104d14d09407ec2ee4e.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d14d:940:7ec2:ee4e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981aba3e3sm4063945e9.0.2026.08.12.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:30:01 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:30:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "M, Krishnamoorthi" <krishnamoorthi.m@amd.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	broonie@kernel.org, linux-spi@vger.kernel.org, akshata.mukundshetty@amd.com, 
	bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	corbet@lwn.net, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
Message-ID: <anye28kId4k8pxBv@monoceros>
References: <20260804115259.4065638-1-krishnamoorthi.m@amd.com>
 <20260804115259.4065638-2-krishnamoorthi.m@amd.com>
 <anSGjRK8spayFnKw@monoceros>
 <0f7469b8-8275-4061-b336-97cbce41ff82@amd.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2paxlrpjxbcfpa7x"
Content-Disposition: inline
In-Reply-To: <0f7469b8-8275-4061-b336-97cbce41ff82@amd.com>


--2paxlrpjxbcfpa7x
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
MIME-Version: 1.0

Hello,

On Wed, Aug 12, 2026 at 06:20:29PM +0530, M, Krishnamoorthi wrote:
> On 8/6/2026 7:01 PM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Aug 04, 2026 at 05:22:56PM +0530, Krishnamoorthi M wrote:
> > > [...]
> > > +const struct bus_type espi_bus_type =3D {
> > > +	.name	=3D "espi",
> > > +	.match	=3D espi_bus_match,
> > > +	.uevent	=3D espi_bus_uevent,
> > > +	.probe	=3D espi_bus_probe,
> > > +	.remove	=3D espi_bus_remove,
> > > +};
> > > +EXPORT_SYMBOL_GPL(espi_bus_type);
> >=20
> > Do you really need this exported?
>=20
> Yes, it is required. Controller and slave drivers built as modules refere=
nce
> espi_bus_type directly when registering devices. Without the export they
> fail to link.

I would have expected that

	drv->driver.bus =3D &espi_bus_type;

in __espi_register_driver() is enough for drivers to not have to use
that symbol directly?

Best regards
Uwe

--2paxlrpjxbcfpa7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8n4YACgkQj4D7WH0S
/k4Ymwf+OtbJNAPe3Ou/27KwbxJa7KENRUomWmPpgocqBVTa4ITzi7yNWHl4gAqS
n5Xc9dI8tHJ49x6eepGWEp56WN4iknHSvv4VfsYY1q3IiP0BA7wHPGNtXoWIHOAa
4o7paa8rCqvUEEnsWHx6t7NgF4d9H3ByZLukSoHjbEaMGXR8k4sAoIZl6OP1zHLL
sDcIp43PhG5JIYLJA+zNDa/GcsWt7GAOI61w0iEk642G+3Sp4LU4Aeml8sLnCZwv
z5mEpWndwlZQ5q6u+eQBlADmahJtNTb4U9cwNydL7sdyQFKIWhpQEIlpaBbpzcKH
rwtLLuNJ9v2D8mdQKMK2Yod5Qp7vCg==
=HyN7
-----END PGP SIGNATURE-----

--2paxlrpjxbcfpa7x--
