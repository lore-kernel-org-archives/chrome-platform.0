Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0404A3B41
	for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 20:17:59 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id v4so3129262pjh.2
        for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8fdGvn4M+qKif8ohyjKSXyA/RbpW9x8RBWKJnNYSucY=;
        b=YBmEKLb8WZHYphC+K2iDkYA6zKHiD7DMWVL+J/gIKZ/RJa8d/1/hoLvVfKcgsk6CT9
         Nh1IY5gbMeC+1Ocnyr7Z3BVzN2mJQYMBiwbhTuo1pnNIdtrMVdwzFQc6GumTa8lv7VNT
         7HoG/P4NHlrsHyZ7fXHwgXGovLg7k+OR9O3Z265Xl2KOJ4Pci/Lz2MWQEzaQkqSrrcKm
         0DNpV8cAs04RtehHlmgW27+c7WbCIccMDcmppfsL4+bmMHK+SBSM1Wc2XbxnjWUo8YWD
         vz7u08VAS+GRLd45oUhiPqdctETWHDUWxCxuinqSEm6Zuwt8n9nuepZUzXG4yc9fq1CS
         6nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8fdGvn4M+qKif8ohyjKSXyA/RbpW9x8RBWKJnNYSucY=;
        b=pZCehc7P/bhGlZNhVshR4FBXXazni/selXHNEih2DrCORfi/cLiL3HA0E0CcPIxk+y
         OvlzQ2Qcqp4hVS4XyvBIOjMQ6/jxW8Xy5ecgXYBTC623DM/T3mRCRyTc8KQT1uHDmX3U
         EzteSJn1ItrwpPP5v63du6oY+IaYmzDahLnXHesHV1KrN50IERO3vaWbMv9+HCgbSDpu
         Hvuby5p3XlLPpUgTN9yRpnzfGF03tMoPYgbQBb4o27bHwaC2XQY+ToGEanxQOG2obkJr
         qStxMHSlAr6wR6oMMM6y2nfByDIuk3fYKNJ87ryt8K5yQWSGi7kKe5H5hNBak7q/Suh8
         aF7A==
X-Gm-Message-State: AOAM5320ri7JYcYRay34r/7bpgVYZU3loedPIjzCj64Pc9aglqpfMbFI
	sslkEjRH0lOtVYWTVzJlb5b2GA==
X-Google-Smtp-Source: ABdhPJyWI2S4BoZ1o1cVrFPV3TLmLhwC+73u2fwlKJR2UYEYfh20Nfwt7ECb9TO1Os/q74qB50siWg==
X-Received: by 2002:a17:902:8bcc:b0:14f:2294:232e with SMTP id r12-20020a1709028bcc00b0014f2294232emr1290467plo.105.1647461879017;
        Wed, 16 Mar 2022 13:17:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f9f3:6833:e666:3a3c])
        by smtp.gmail.com with ESMTPSA id w3-20020a63af03000000b00381309eb407sm3145456pge.68.2022.03.16.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 13:17:57 -0700 (PDT)
Date: Wed, 16 Mar 2022 13:17:51 -0700
From: Benson Leung <bleung@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add chrome-platform@lists.linux.dev to all
 Chrome OS entries
Message-ID: <YjJF71/B8Yb8cirZ@google.com>
References: <20220316184945.452379-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aLHyPutchNLDdjvF"
Content-Disposition: inline
In-Reply-To: <20220316184945.452379-1-linux@roeck-us.net>


--aLHyPutchNLDdjvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Wed, Mar 16, 2022 at 11:49:45AM -0700, Guenter Roeck wrote:
> Add the chrome-platform@lists.linux.dev mailing list to all Chrome OS
> maintainer entries to ensure that people copy the list when submitting
> Chrome OS specific patches. This also helps ensuring that patches are
> available in a patchwork instance.
>=20
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Rajat Jain <rajatja@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I added this back in January.
https://lore.kernel.org/r/20220126222233.2852280-1-bleung@chromium.org

It should already be in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/c=
ommit/?h=3Dfor-next&id=3D664de6a26b7f17eebca896c3e18201b15d5c7b19

Let me know if it didn't show up there for you.

Benson

> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e127c2fb08a7..bc275698e7c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4541,6 +4541,7 @@ F:	drivers/input/touchscreen/chipone_icn8505.c
> =20
>  CHROME HARDWARE PLATFORM SUPPORT
>  M:	Benson Leung <bleung@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/lin=
ux.git
>  F:	drivers/platform/chrome/
> @@ -4549,6 +4550,7 @@ CHROMEOS EC CODEC DRIVER
>  M:	Cheng-Yi Chiang <cychiang@chromium.org>
>  M:	Tzung-Bi Shih <tzungbi@google.com>
>  R:	Guenter Roeck <groeck@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
>  F:	sound/soc/codecs/cros_ec_codec.*
> @@ -4556,6 +4558,7 @@ F:	sound/soc/codecs/cros_ec_codec.*
>  CHROMEOS EC SUBDRIVERS
>  M:	Benson Leung <bleung@chromium.org>
>  R:	Guenter Roeck <groeck@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/power/supply/cros_usbpd-charger.c
>  N:	cros_ec
> @@ -4563,11 +4566,13 @@ N:	cros-ec
> =20
>  CHROMEOS EC USB TYPE-C DRIVER
>  M:	Prashant Malani <pmalani@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/platform/chrome/cros_ec_typec.c
> =20
>  CHROMEOS EC USB PD NOTIFY DRIVER
>  M:	Prashant Malani <pmalani@chromium.org>
> +L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/platform/chrome/cros_usbpd_notify.c
>  F:	include/linux/platform_data/cros_usbpd_notify.h
> --=20
> 2.35.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--aLHyPutchNLDdjvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYjJF7wAKCRBzbaomhzOw
wtgkAP9S/yGcU7xIv0MT/FooOIFGV/bIAtxM52Qk8gPEKwmqiAD9GhLhrrl3FyvU
cyQAoIkidFtI4/ApCfSNxhwYuOxSywo=
=le1O
-----END PGP SIGNATURE-----

--aLHyPutchNLDdjvF--
