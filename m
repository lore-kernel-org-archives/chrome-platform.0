Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD94F3C4562
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669198; cv=none; b=U4nIZhhpUd1bDscmMgokXCE4KTBqFNJ51rkTE2X1QRsXJE2sTnGPxgQZJQsLBAn3wf/VvM5YIE84dZiBaknZmYIPIPM6+YnjwmScfs/i4XBAISWrwAUl74ssTbKUTtKLX4JkVbhSsDMUOR3jWMYKtYP3DaQegkB0FqOKnj+jFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669198; c=relaxed/simple;
	bh=Aa7f+W2lMwTCUw79H7zMC353Lp/aj96Ged0rqE7mDMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqOvj2sKcA4t2xJFUeazrSqGnxX76ZpbH1g9ye8fDc/p29eidFpE1PmvVPOg4oOFkdABDH7+n+NyJTnlwu/PQQfpBzSFmUylECPsYuL7HP3Xifo89X7wtY+nST5nEUlCbSccoosKwcxg8KYb5zPtOwsvIXYD72NglvLaD3NeZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LNGXYrSs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LNGXYrSs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47df440fcd5so309902f8f.3
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669195; x=1784273995; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa7f+W2lMwTCUw79H7zMC353Lp/aj96Ged0rqE7mDMQ=;
        b=LNGXYrSs4WrjSd6etNYjaKz4Z7BEDNPFi9x6jhDRe4nFuGBI7sX+/pPhQ6ivHE3zy5
         ZUKmnDU7EPFs2S4MWLuAJk/03HcWXF5x5Xq+E8XX7Nt9Qoxz2LRkbfHKoXUJfba1X3NY
         4g4b/bvbd/QJIQf7tPPPdIYBJvYWblw7hm97mmhcyr1ihy0OXMikvhoao/xFYxZtULns
         yshpKGfAKN7/ChujF9x6dcZC2yrdSzzHjYP6uCzC5My5GDr7b+84NJWVobdTVxNG7n+e
         ODODmp7oVT0wde/ItefpSH8n0vc1q7Caagqg8TWqkNjjShGvvO0k87j9JoXV2CQAc+d6
         Xdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669195; x=1784273995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa7f+W2lMwTCUw79H7zMC353Lp/aj96Ged0rqE7mDMQ=;
        b=le6ZvHrA0i8siFhD8QHuXjUo30ZeKYyh7XyQu8E1XYwGdfhVU1oTLLdZcbfLWgeOjn
         xx/4EArnVPiUiYjfkiGYAf2WdXGjn8jqN4k6e4DgXbvLavuZAbu6bmX3spPzmx1wih/l
         /Hkjm00MVcp+3XURFUFlQCUewPIyUpbPC5CjUiwcJjucVxWwe75FvpaB1UH8RT2ZPuWC
         rsOMX2e8GlLVWdZfImwyaRjAEoD+QdkTVOcqSjFNzbpofZHONodV/RekE2LRa8Tmjx4j
         sVzc0uO3gTvIhg0MG1FpeGcq7dqSv/OUAAMdj5V+GB5MeFm7w93GS+evBHspn7UsrH5Q
         mMBA==
X-Forwarded-Encrypted: i=1; AHgh+RoiWEUQ+f1uvJTYZkEpc+QqX4GYGb3dQETAUCL5PRy2QmGiFHbKRtcndaz4V00EZRazm86JiFZ9PcXYrslt+ro=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHNF5yeDIAC1lzflUGLLv/iws+vwQIqfJ1kcuCC6PyI78Nz3VQ
	yJjnjxNQVUaG20Qw/1wiliTcGJLvrw5IZEeTEsOx3hUlNtGLLbKW0/KamQMd+cfA+Xg=
X-Gm-Gg: AfdE7cnvsyWv2W3pTqj6KnkSnMwYVaQqG3eaHtBl0A2bUo8ewJTRdK5qny5rofb6gQw
	oGBVCojKIckgC+mcPH5iYL1U9EfHf6BEvFioknSAp0Lm1rWqHnbZatyPo0XfFVkjIF/VqcZu50I
	rLshU1tNYDbPqQCnNjjLW7unQpvfix7nFNx3Zm71xorBj3Yet2/lSaNzDZYfbVpuu8qmxit1ene
	0NarM9a6ORTLmw2VRxS/ZMA3fX8etnKMsAQ1NCW+EPQkPpBM9u4R351h+gati6Zpdnc2TjfJO/A
	Ae7jSQz4OAjfVuVg1Kg+f6XGHkSkTYnf/oWsLpnUiu4LSfvbJ1nOEIJhxAWjZPz8HpM56KB+BkN
	xvUNDAvKtGSMH5+vbUFt0D3sLa6A9IJyt4o1xGdMciDT0IaYz/QB2ui9fQanOc46QnXa7NYEfFi
	TpvH/Z/x7U1Q9l+RZ3BHyOb6rv6hzqUmzTd96hp/MeETZwei/A636rCwmI79SqXY3NSUJJ3MTOS
	aJu
X-Received: by 2002:adf:f387:0:b0:47e:b898:c580 with SMTP id ffacd0b85a97d-47eb898c59fmr2207230f8f.13.1783669195134;
        Fri, 10 Jul 2026 00:39:55 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47ad69519c2sm61859095f8f.37.2026.07.10.00.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:39:54 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:39:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: platform-driver-x86@vger.kernel.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 1/1] platform/x86: Add coreboot CFR firmware attributes
Message-ID: <alChumH9JHyvXVjU@monoceros>
References: <cover.1783601414.git.sean@starlabs.systems>
 <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="636dc2akeeceuafq"
Content-Disposition: inline
In-Reply-To: <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>


--636dc2akeeceuafq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 1/1] platform/x86: Add coreboot CFR firmware attributes
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 01:50:17PM +0100, Sean Rhodes wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--636dc2akeeceuafq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQoccACgkQj4D7WH0S
/k4BgQf+PX3voxOVj1BGZM7OJKeHDJzNgc1Kmju9Y7aRrzLQt91Ps8IrR2n7UMNQ
Ix5x/kRS7hBLbEvFY/aGk/CTQsMefWNFD4ggU5APTW+zSXebT7FWtlvxQXyhdGMR
WxpXgmc1iivUGJBb9N2lhUau1f+DSthIk4U//LNmJdGWX2FDag4pBbeN0cKKF9lg
vua7ymIp+C33JwMS9/tQGLEJYVloKd4odjP/jrSXfQGcoBHMEu/syLEYeg9GswST
NDZwDyGHo8Dn8ZMvyOH4PSMgQX0tEE8fF2P7ROd2ln9R1iJ8twb3y7Nz8qLDgrHn
AINW8D231VcoHexXPZoaqKxg6V1sWw==
=EOvC
-----END PGP SIGNATURE-----

--636dc2akeeceuafq--
