Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F83C5DD4
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669347; cv=none; b=QNubxojqDYGfwVJCbDHJ3EKHb193aJKHTP0o5LfvOx7xnImch/5hNr7ozOiRfnhTqUZW6Y1g57yPF+8kV8UhfNPi2tv53kyH+ewadKuNWpO5XhgSWXxKpKNtyEL8KdHI0mTTqQc6LB2smF0Thw1zrLu4dJz/6yk06B0Ell+Yk0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669347; c=relaxed/simple;
	bh=PNx+7lHV68d843Y5/+sK2JBzg9dRL2pzRtxGkZKEOS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz/DHVYs6uk/S0GZ+D16mJYqpEFj5k8bicmK6hYfX2jUNHwRLFbnK9+9o62+AKTh26jsEJLJUhvuhU6TKJOyXczCBMhvtBiWGbpXPVHsI3/KBdjAAHFT3mNeRPuWepXtk7RPm709lPZMuia/5Hxmc5dnjDAj3taZS7IPmUdTZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QpJGEDmt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QpJGEDmt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b779003fso2496435e9.3
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 00:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669345; x=1784274145; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PNx+7lHV68d843Y5/+sK2JBzg9dRL2pzRtxGkZKEOS8=;
        b=QpJGEDmt36Y/TxslrmoE6bXShb9s691Z4fw1HGZJ/F130A0D3xUUz61Ch34Pj0idg4
         1bkOnbh2a/9BgdvzxrAOoRT1GjQzAxGgfCn9TZePh06YKjVSexjwZ0TA9MJj4dPqWCP4
         cAVDETlOPt67EjbOKdQZ3ftf2syRlmF3Vh/kYxDvMam2EIpgOvdZhLhjBVliFGP06ReN
         F++++HyxlNjTDyXbsrloLscy8TrHWaOpNfsY9ZeUIMVnZgWrhR02MavFNUNWqDXoQ2U2
         5W8lMcyuZ11MgI4KVUacakZiX8SSF1++DSEjVp6r5QwuVE9K4argSNtTz5T59LCWv1Lb
         5vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669345; x=1784274145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNx+7lHV68d843Y5/+sK2JBzg9dRL2pzRtxGkZKEOS8=;
        b=OpJ/Fz1OIWyLVvGnkHidEvmO6lhdeSMDiBgjtAaPjPWJ6CVj49Ep6HMVhGx1aY5b6G
         Z/jWtwY2w5Ay9UDYDqQNcQ1NWr/L+G6u/Xa7Vf3Jm3Llg5L2O8Z+/+Kc4+MvbBhXZSf0
         1VISW2j2xFLdX3Ea7xGizym4qVJfN0vJS35Dg0g0/6kzQP9htKm8KniiNN2se0m0fb2E
         nBmrIZqOXOkVQXBQoA7q18d6Ss/KT6qjrrkz3vEV4PnEdBv4pT9DAHNcKta5/QcpINwL
         C6Ruf9nYPXB7Uh7S21TQ2Qxd29GAMooERXQf3l83LMKg3MT9zVVnNs2DEvy2Nr36RyqT
         8o4g==
X-Forwarded-Encrypted: i=1; AHgh+RpUTVHrI7EwaeYF0Xf4SQ2IyvMBiS5GZJ/ZcIj89BbK/BIPsPe4sr/6s5ABF/Dp0dmDGPOtZlBUacRdB4t422w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwocmGv+EwBAnqfdn2j435kwCWIPrQihLCvWYqsh6XY7bk1Kdl3
	DVb8IKb1UFCd1IPCckNyr/q39Xs/cmk2NasDPGT3LIh6phsVOYdHoF/rz+ANotNLzRE=
X-Gm-Gg: AfdE7cmnIJHMSId+WQk3RHxQY4ge9MYTSPIq/jaHgK6zEFHCVfvwfKcDJ2QSBy8cFPC
	Um0p/E8dQMaxoXisxelpsnZJUFhf4Df8j8sHGi/Aisc+7076j9qOKWRMyDyV16ulhBAzuWdbcX5
	+oU2Ht10o0Z0vIYAgcQu00ul/Ai4vn2jcKZZEnAfmbVxM91ykmhSOpqOMBga5MFUe6P7zBNBSNe
	YJjUZEZeGQFRUmORkAq9dWAi8I+SaC4LCUHub5ymPMdK7oSVeMUDJiekk35laREMHzjLOCmIMUk
	yJ6VUqupCRn4SWVh4HnghVk+8XodHfiolOB+Cv6r39FkbgnHUvJKDBjgSL5c4NpuIJJKSmipjm5
	dTWkl+OWYvlBWI+v6Ptgn5IgvUc3C68kcRBKjiyx8FOqoqCXQ8RlflFGj8r/WcVZ0kYnuMLoc2i
	Y1/lQYQiTtaQUtM/IbWOhdxBVkkHkFfhyAN86ky5NlUP4PPhuddeJ+YEq3LL4Pyg2RWwsW4J+1p
	qBn
X-Received: by 2002:a05:600c:19d0:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493e68aed4dmr89123555e9.4.1783669344235;
        Fri, 10 Jul 2026 00:42:24 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6d5055sm116795385e9.5.2026.07.10.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:42:23 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:42:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, Kees Cook <kees@kernel.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <alCiUSL-fd6SWOYr@monoceros>
References: <cover.1783663929.git.sean@starlabs.systems>
 <b12a36d80e48972fb06b25add0acbe39879f05ca.1783663929.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxqrjw36ykfsjfpj"
Content-Disposition: inline
In-Reply-To: <b12a36d80e48972fb06b25add0acbe39879f05ca.1783663929.git.sean@starlabs.systems>


--bxqrjw36ykfsjfpj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
MIME-Version: 1.0

On Fri, Jul 10, 2026 at 07:12:46AM +0100, Sean Rhodes wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--bxqrjw36ykfsjfpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQolwACgkQj4D7WH0S
/k64kwf+L5t1vitcPdLcsV50bKYh1DhQc9fdgSuIYKy5CNHJqp+w5M8mIikO4k2m
C46FJ55QyKeOc0ziUm5SFqMGtL8Rgrbkk/QQ6lks0pQzVqoqj+nTIMOQFgPDVYlt
2tPZOAl3eQm8Os/U+Ab9lVd0Ykz//klmoWYSam+IAaERiqKO5ZNSgj6dKFg5XJYC
zcRIOg78dn/hAzujZa0dwDmTaG87IT7qI2YPXZyWKSBE/FUmrkr8Ac5wW3J+GdfD
v+0FrK4IlDu2yJPo1/eYYq7K5mFnlsh2U5czOPR/Tsb+WfXqlWre9ZNn/na5XItv
fR7JQtx3zIeGqXXpHO5Vxwffj5ajdA==
=E9cL
-----END PGP SIGNATURE-----

--bxqrjw36ykfsjfpj--
