Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6ADF58
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571916; cv=none; b=e4s4dYEaF8qQZgzkHB/eQgnWCFED90QkyttdhoB6MXFhr0SeAFYD/mwvtnP2/tHtVbkfD7MS4oH+muKn/JqPdHsQfoBoqo2f56yQaOT3d9dBNAF2h8z8d8EXc5Mt/+EJoi3ZXMZ8GErljbTWlisIuXUqfYnt6KP8PnuJnVEq61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571916; c=relaxed/simple;
	bh=bUvONEZA3OLVoEyo4UdyQ4yLetDCZDuZ3+gIErX1dq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INXwyBMrUVt7D7WX7FprzURPuYmoZBH3Mf36FBW0YXQHckgCmrBbYbCaIwR7Ni1NPYNe2Y3ujKFkDijpmPe/qOg2Gp979/wJynIYrTez0mxYxL3dePlBEnX4B4rnFWAE0/TcBpSuYtXFnYDAo1tLLBX2x8ZvgepaIO0Nzh2B2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V+XwMAqk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V+XwMAqk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2162c0f6a39so13083015ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571913; x=1735176713; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdwE90uht9jBwxmpYSg7VZGKoIqGtArfw5Ct4ZZ+J6A=;
        b=V+XwMAqkxz/qMk1EfKTZEc9L9sXGKwb31PhFtHu/KDl44flHZOTtGagzbX/KQp1VqW
         4+pxxk/KjwJMD68Vw1Iwd1dd+9VOQqQXAoQCPx6BAX/J5yPn993aPXK1gnIvf0N7Eudd
         NDMonUBe42BzDJ7vptxQwOGeSf13sxm9SqPwShR/eQxRtqL3Xumk0t7q/M+WGfwwFALH
         buO20S8jdKays6LjWXMi64NKbs8LQnI1iJ9Pp8wDTQZgu28KAs+iRk/1Tvcswvc71vT0
         UBObElOR8RCB7KErKdDoSNIODFki625h7g9tSPDkpu2cFpZC1bhGI40xuveB4vfcbzBR
         i7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571913; x=1735176713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdwE90uht9jBwxmpYSg7VZGKoIqGtArfw5Ct4ZZ+J6A=;
        b=vo5nGE3hmRsN5cpS3tB/Vgq/oqxVaRu6rr0wk8HHjIiUqGcz6iQwoq+9zSJBtuU0mx
         5FfBLvxdMLM4NiJRabtOcuxcV7lnBR1H4JWTha7mVEG5dcqHxXrpEMKj14n6WMcU6bXU
         mPzD7j20+K9erj/lTJO+5BVSBo5p8/TCiQBuKXkU3PHuT3XsW/dPlOChaa7oJZIPVhor
         X+UdYN23glqabzfRmhmCZm4iPIoFkcBQtyh0NHtJEeNo/wIHDyHYDhjoRGr7x3iShWGT
         HkJYEHDaLyCU3mY5nCy7CN6jGB5koL06p3l/QgZWv54TJI2yisVJMcxjgIbEs94Zvxvf
         9lig==
X-Forwarded-Encrypted: i=1; AJvYcCWEnAClSVtnMwTH4saBUQfeeclZfG3HY7sS7XXCI/M3WnQ9Zk+3FNGscrCk/PfSgyaDu2jpmRSPk75ogk48o5s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1SD5q1NK1DktqyVeharlKs02O59HBqpAP9t1YLQDgP/tcZVjm
	NzrIciiUzZOFRs/kYhlPPKBuJi+VYgOReMw5o6qXzY40wPYWAF9Hpm6IHvNS8A==
X-Gm-Gg: ASbGncv1/EX3K7FGWG4ttPfX/SIA2t7Fvc2BMKvdZEsRyGcR+Dvsn8FO/KTdOmVwL8u
	/ghua8QN2vHEVoDj2pxxUzY75E4SpjLUgM1a2UBKbGMdTJ1td43yAsW8GaE34kUd2ZLfb6TPBuY
	UffcDrroDyqYnx2ZOOJtaDtDqmZ2Np+vq75eTb4P49katA30D0MP6rvlXoIhUMKmyuKx+mfkzKQ
	Q/ry9wlsQYt56vpaUhtFwcK9eKuOrwSmCLYzzv0mBvD9J1TEP/MjwkmvXEgN5G4xfInZ9SeFiaj
	VDHjLC5Tkga703Kk
X-Google-Smtp-Source: AGHT+IHdAl85Tc0d95lg8SPjbfiPYFq6g+pCNhSIZqOygfLDCYRSb5pvs+f/vaqCov10dRh30Wk19Q==
X-Received: by 2002:a17:902:d589:b0:215:ae61:27ca with SMTP id d9443c01a7336-219da7f855bmr23142535ad.26.1734571912186;
        Wed, 18 Dec 2024 17:31:52 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9705ccsm1782875ad.92.2024.12.18.17.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:31:50 -0800 (PST)
Date: Thu, 19 Dec 2024 01:31:46 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt
 support
Message-ID: <Z2N3ggIJVo9gaOfj@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDy4ikmXkNHiRafN"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>


--dDy4ikmXkNHiRafN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:48PM -0800, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> (no changes since v4)
>=20
> Changes in v4:
> - Update Makefile + Kconfig to use CONFIG_CROS_EC_TYPEC_ALTMODES
> - Add locking in vdm function
>=20
> Changes in v3:
> - Fix usage of TBT sid and mode.
> - Removed unused vdm operations during altmode registration
>=20
> Changes in v2:
> - Refactored thunderbolt support into cros_typec_altmode.c
>=20
>  drivers/platform/chrome/Kconfig              |  1 +
>  drivers/platform/chrome/cros_ec_typec.c      | 23 ++---
>  drivers/platform/chrome/cros_typec_altmode.c | 88 ++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
>  4 files changed, 115 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kc=
onfig
> index 23aa594fbb5b..1b2f2bd09662 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -249,6 +249,7 @@ config CROS_EC_TYPEC
>  	depends on USB_ROLE_SWITCH
>  	default MFD_CROS_EC_DEV
>  	select CROS_EC_TYPEC_ALTMODES if TYPEC_DP_ALTMODE
> +	select CROS_EC_TYPEC_ALTMODES if TYPEC_TBT_ALTMODE
>  	help
>  	  If you say Y here, you get support for accessing Type C connector
>  	  information from the Chrome OS EC.
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 1bcaa7269395..1ac5798d887f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -303,18 +303,19 @@ static int cros_typec_register_port_altmodes(struct=
 cros_typec_data *typec,
> =20
>  	/*
>  	 * Register TBT compatibility alt mode. The EC will not enter the mode
> -	 * if it doesn't support it, so it's safe to register it unconditionally
> -	 * here for now.
> +	 * if it doesn't support it and it will not enter automatically by
> +	 * design so we can use the |ap_driven_altmode| feature to check if we
> +	 * should register it.
>  	 */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid =3D USB_TYPEC_TBT_SID;
> -	desc.mode =3D TYPEC_ANY_MODE;
> -	amode =3D typec_port_register_altmode(port->port, &desc);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> -	typec_altmode_set_drvdata(amode, port);
> -	amode->ops =3D &port_amode_ops;
> +	if (typec->ap_driven_altmode) {
> +		memset(&desc, 0, sizeof(desc));
> +		desc.svid =3D USB_TYPEC_TBT_SID;
> +		desc.mode =3D TBT_MODE;
> +		amode =3D cros_typec_register_thunderbolt(port, &desc);
> +		if (IS_ERR(amode))
> +			return PTR_ERR(amode);
> +		port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> +	}
> =20
>  	port->state.alt =3D NULL;
>  	port->state.mode =3D TYPEC_STATE_USB;
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platf=
orm/chrome/cros_typec_altmode.c
> index 6e736168ccc3..557340b53af0 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -10,6 +10,7 @@
>  #include <linux/mutex.h>
>  #include <linux/workqueue.h>
>  #include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_tbt.h>
>  #include <linux/usb/pd_vdo.h>
> =20
>  #include "cros_typec_altmode.h"
> @@ -72,6 +73,8 @@ static int cros_typec_altmode_enter(struct typec_altmod=
e *alt, u32 *vdo)
> =20
>  	if (adata->sid =3D=3D USB_TYPEC_DP_SID)
>  		req.mode_to_enter =3D CROS_EC_ALTMODE_DP;
> +	else if (adata->sid =3D=3D USB_TYPEC_TBT_SID)
> +		req.mode_to_enter =3D CROS_EC_ALTMODE_TBT;
>  	else
>  		return -EOPNOTSUPP;
> =20
> @@ -196,6 +199,56 @@ static int cros_typec_displayport_vdm(struct typec_a=
ltmode *alt, u32 header,
>  	return 0;
>  }
> =20
> +static int cros_typec_thunderbolt_vdm(struct typec_altmode *alt, u32 hea=
der,
> +				      const u32 *data, int count)
> +{
> +	struct cros_typec_altmode_data *adata =3D typec_altmode_get_drvdata(alt=
);
> +
> +	int cmd_type =3D PD_VDO_CMDT(header);
> +	int cmd =3D PD_VDO_CMD(header);
> +	int svdm_version;
> +
> +	svdm_version =3D typec_altmode_get_svdm_version(alt);
> +	if (svdm_version < 0)
> +		return svdm_version;
> +
> +	mutex_lock(&adata->lock);
> +
> +	switch (cmd_type) {
> +	case CMDT_INIT:
> +		if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +			typec_partner_set_svdm_version(adata->port->partner,
> +						       PD_VDO_SVDM_VER(header));
> +			svdm_version =3D PD_VDO_SVDM_VER(header);
> +		}
> +
> +		adata->header =3D VDO(adata->sid, 1, svdm_version, cmd);
> +		adata->header |=3D VDO_OPOS(adata->mode);
> +
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			/* Don't respond to the enter mode vdm because it
> +			 * triggers mux configuration. This is handled directly
> +			 * by the cros_ec_typec driver so the Thunderbolt driver
> +			 * doesn't need to be involved.
> +			 */
> +			break;
> +		default:
> +			adata->header |=3D VDO_CMDT(CMDT_RSP_ACK);
> +			schedule_work(&adata->work);
> +			break;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mutex_unlock(&adata->lock);
> +	return 0;
> +}
> +
> +
>  static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
>  				      const u32 *data, int count)
>  {
> @@ -207,6 +260,9 @@ static int cros_typec_altmode_vdm(struct typec_altmod=
e *alt, u32 header,
>  	if (adata->sid =3D=3D USB_TYPEC_DP_SID)
>  		return cros_typec_displayport_vdm(alt, header, data, count);
> =20
> +	if (adata->sid =3D=3D USB_TYPEC_TBT_SID)
> +		return cros_typec_thunderbolt_vdm(alt, header, data, count);
> +
>  	return -EINVAL;
>  }
> =20
> @@ -283,3 +339,35 @@ cros_typec_register_displayport(struct cros_typec_po=
rt *port,
>  	return alt;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	struct typec_altmode *alt;
> +	struct cros_typec_altmode_data *adata;
> +
> +	alt =3D typec_port_register_altmode(port->port, desc);
> +	if (IS_ERR(alt))
> +		return alt;
> +
> +	adata =3D devm_kzalloc(&alt->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata) {
> +		typec_unregister_altmode(alt);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	INIT_WORK(&adata->work, cros_typec_altmode_work);
> +	adata->alt =3D alt;
> +	adata->port =3D port;
> +	adata->ap_mode_entry =3D true;
> +	adata->sid =3D desc->svid;
> +	adata->mode =3D desc->mode;
> +
> +	typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> +	typec_altmode_set_drvdata(alt, adata);
> +
> +	return alt;
> +}
> +#endif
> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platf=
orm/chrome/cros_typec_altmode.h
> index ed00ee7a402b..3f2aa95d065a 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.h
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -34,4 +34,18 @@ static inline int cros_typec_displayport_status_update=
(struct typec_altmode *alt
>  	return 0;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc);
> +#else
> +static inline struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	return typec_port_register_altmode(port->port, desc);
> +}
> +#endif
> +
>  #endif /* __CROS_TYPEC_ALTMODE_H__ */
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--dDy4ikmXkNHiRafN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N3ggAKCRBzbaomhzOw
wnz3AQCBaiHbQ/YooZ/o0NvSunjo9KHNeuJX5ALK9nogiFuIRAEAyieuKVMh2I2Y
6XTA7uXsLuYwN0eSiFLncDSJJ685gAg=
=nUp8
-----END PGP SIGNATURE-----

--dDy4ikmXkNHiRafN--
