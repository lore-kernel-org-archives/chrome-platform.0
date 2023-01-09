Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55A8C09
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 19:50:05 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q9so6639293pgq.5
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2EKrwVFpkYeUxt+yK8hwgNyaMusFSUqZWurKYu7lzs=;
        b=Xwg4+BhliHmY+EmXfABlK7iIomln4tsTHWLI82ElidrfNp+Ymuak/TYbc9vnMsNquI
         d3sv9d9hyqWUkTlmkY320Pxu0s1hiH1W185ZhKFlgFA+zyCHqFKg+UutPEx/iK5UVFgb
         28vs3xuqoqEjJy/8Tn/bjgubrnJWIHlf6e9C9G7UotYCcWeWMDExTULYCmJiwfBHIxdR
         QtBCNpY2+3JMmShWEk+wrtDHVOx/OgoypokfaoPniydoRQOATe8AgXU2ztgE9idtgXUt
         n4nXtoP47O8W08hlJcYneYJSiYnWywLTxIZLdu1zkp+HtBQddDlUq0A/mvaFjif4jmY6
         BZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2EKrwVFpkYeUxt+yK8hwgNyaMusFSUqZWurKYu7lzs=;
        b=hw9BEdm6sz3DdsFRkudePbmbUGI6gvXZKglKfT+yo//G5rRI4NFyPNWpISEMFgQK5u
         8LrpeznsA9EdAeMBKwNuEUa1KL+43fTP2ytGHbd/671zlu2Tz5oyqPMUfGNhZacGah3W
         wonsJZskxAlqjWTZXYRBf4rv8ku2jrECMRbw1QhPatJJrgnMHOVFGIlI2LXgKxX2HBB7
         M5EaiJQ97q1aeBkXb2ZtBbORusFeuolGj1HeDSTwDkqiIEFCgpiMPd7ZLDbO0K34gud+
         jITY6b2nqzFJisAeRuiefxfGBmDAJ9FyKEO/eyjehC1S5ybrwWSDXQRBDTWLL7/6peRi
         DeFw==
X-Gm-Message-State: AFqh2koWoxgrq0gaVL1iyt1qseNv1B3ryo++IE+t7aIblIcjGFnqHni9
	NRyONVB8rPysjkGdLSqGOKEXaA==
X-Google-Smtp-Source: AMrXdXswT/ylCqM4KrlgZxV7dnFxMgEXHm61rUhCX9gJbSD5b0gA7enVB9YU343mld8i3jDGpUAuHQ==
X-Received: by 2002:aa7:973c:0:b0:574:8995:c0d0 with SMTP id k28-20020aa7973c000000b005748995c0d0mr748492pfg.1.1673293804762;
        Mon, 09 Jan 2023 11:50:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3529:30e5:d581:6e80])
        by smtp.gmail.com with ESMTPSA id p189-20020a625bc6000000b00580cc63dce8sm4358773pfb.77.2023.01.09.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:50:03 -0800 (PST)
Date: Mon, 9 Jan 2023 11:49:58 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	heikki.krogerus@linux.intel.com, Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee.jones@linaro.org>, Lee Jones <lee@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH 08/10] platform/chrome: cros_ec_typec: Add initial VDM
 support
Message-ID: <Y7xv5v9ZZkUgkDlv@google.com>
References: <20221228004648.793339-1-pmalani@chromium.org>
 <20221228004648.793339-9-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OTz9JgZkwRlQmWBo"
Content-Disposition: inline
In-Reply-To: <20221228004648.793339-9-pmalani@chromium.org>


--OTz9JgZkwRlQmWBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 12:45:11AM +0000, Prashant Malani wrote:
> Add ops to support USB PD VDM (Vendor Defined Message) from the port
> driver. This enables the port driver to interface with alternate mode
> drivers and communicate with connected peripherals.
>=20
> The initial support just contains an implementation of the Enter
> Mode command.
>=20
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  MAINTAINERS                              |  1 +
>  drivers/platform/chrome/Makefile         |  2 +-
>  drivers/platform/chrome/cros_ec_typec.c  |  3 ++
>  drivers/platform/chrome/cros_typec_vdm.c | 43 ++++++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_vdm.h | 10 ++++++
>  5 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/chrome/cros_typec_vdm.c
>  create mode 100644 drivers/platform/chrome/cros_typec_vdm.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8219b646ab50..cfccbbbb083f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5000,6 +5000,7 @@ L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/platform/chrome/cros_ec_typec.*
>  F:	drivers/platform/chrome/cros_typec_switch.c
> +F:	drivers/platform/chrome/cros_typec_vdm.*
> =20
>  CHROMEOS EC USB PD NOTIFY DRIVER
>  M:	Prashant Malani <pmalani@chromium.org>
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/M=
akefile
> index fd29fa74ba33..dae0ed3c8656 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -16,7 +16,7 @@ obj-$(CONFIG_CROS_TYPEC_SWITCH)		+=3D cros_typec_switch=
=2Eo
>  obj-$(CONFIG_CROS_EC_RPMSG)		+=3D cros_ec_rpmsg.o
>  obj-$(CONFIG_CROS_EC_SPI)		+=3D cros_ec_spi.o
>  cros_ec_lpcs-objs			:=3D cros_ec_lpc.o cros_ec_lpc_mec.o
> -cros-ec-typec-objs			:=3D cros_ec_typec.o
> +cros-ec-typec-objs			:=3D cros_ec_typec.o cros_typec_vdm.o
>  obj-$(CONFIG_CROS_EC_TYPEC)		+=3D cros-ec-typec.o
>  obj-$(CONFIG_CROS_EC_LPC)		+=3D cros_ec_lpcs.o
>  obj-$(CONFIG_CROS_EC_PROTO)		+=3D cros_ec_proto.o cros_ec_trace.o
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index a4eff590ca56..1e28d56b094d 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -17,6 +17,7 @@
>  #include <linux/usb/typec_tbt.h>
> =20
>  #include "cros_ec_typec.h"
> +#include "cros_typec_vdm.h"
> =20
>  #define DRV_NAME "cros-ec-typec"
> =20
> @@ -272,6 +273,7 @@ static int cros_typec_register_port_altmodes(struct c=
ros_typec_data *typec,
>  		return PTR_ERR(amode);
>  	port->port_altmode[CROS_EC_ALTMODE_DP] =3D amode;
>  	typec_altmode_set_drvdata(amode, port);
> +	amode->ops =3D &port_amode_ops;
> =20
>  	/*
>  	 * Register TBT compatibility alt mode. The EC will not enter the mode
> @@ -286,6 +288,7 @@ static int cros_typec_register_port_altmodes(struct c=
ros_typec_data *typec,
>  		return PTR_ERR(amode);
>  	port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
>  	typec_altmode_set_drvdata(amode, port);
> +	amode->ops =3D &port_amode_ops;
> =20
>  	port->state.alt =3D NULL;
>  	port->state.mode =3D TYPEC_STATE_USB;
> diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/=
chrome/cros_typec_vdm.c
> new file mode 100644
> index 000000000000..df0102ca3a18
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_vdm.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * USB Power Delivery Vendor Defined Message (VDM) support code.
> + *
> + * Copyright 2023 Google LLC
> + * Author: Prashant Malani <pmalani@chromium.org>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/usb/pd_vdo.h>
> +
> +#include "cros_ec_typec.h"
> +#include "cros_typec_vdm.h"
> +
> +static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 =
*vdo)
> +{
> +	struct cros_typec_port *port =3D typec_altmode_get_drvdata(amode);
> +	struct ec_params_typec_control req =3D {
> +		.port =3D port->port_num,
> +		.command =3D TYPEC_CONTROL_COMMAND_SEND_VDM_REQ,
> +	};
> +	struct typec_vdm_req vdm_req =3D {};
> +	u32 hdr;
> +
> +	hdr =3D VDO(amode->svid, 1, SVDM_VER_2_0, CMD_ENTER_MODE);
> +	hdr |=3D VDO_OPOS(amode->mode);
> +
> +	vdm_req.vdm_data[0] =3D hdr;
> +	vdm_req.vdm_data_objects =3D 1;
> +	vdm_req.partner_type =3D TYPEC_PARTNER_SOP;
> +	req.vdm_req_params =3D vdm_req;
> +
> +	dev_dbg(port->typec_data->dev, "Sending EnterMode VDM, hdr: %x, port: %=
d\n",
> +		hdr, port->port_num);
> +
> +	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
> +			   sizeof(req), NULL, 0);
> +}
> +
> +struct typec_altmode_ops port_amode_ops =3D {
> +	.enter =3D cros_typec_port_amode_enter,
> +};
> diff --git a/drivers/platform/chrome/cros_typec_vdm.h b/drivers/platform/=
chrome/cros_typec_vdm.h
> new file mode 100644
> index 000000000000..7e282d168a98
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_vdm.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __CROS_TYPEC_VDM__
> +#define __CROS_TYPEC_VDM__
> +
> +#include <linux/usb/typec_altmode.h>
> +
> +extern struct typec_altmode_ops port_amode_ops;
> +
> +#endif /*  __CROS_TYPEC_VDM__ */
> --=20
> 2.39.0.314.g84b9a713c41-goog
>=20
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--OTz9JgZkwRlQmWBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY7xv5gAKCRBzbaomhzOw
wuvqAQCIURSBTF5sahWAz+vrcjir8rlBdulgHhZ3tTwJH6LgwAEAo6RC+xjx9umL
CqZ84J+cgxzcH2/kZmg5wCVDF9FB4Qk=
=lH0/
-----END PGP SIGNATURE-----

--OTz9JgZkwRlQmWBo--
