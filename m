Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CE11E4BE
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571223; cv=none; b=VJM40Nv5IW80UwPz246JXIlrew4hf3WPSE6Yu9qvH93a7jOuFli+urtUqdWFFesu5yjgUUJuL98JNyrYAfDGgFr4M0/W1SZnADOw07L9JwKfrl2GaeWRD77TAgshTD37eV9zNAJjBd9U533D7/uPu1uKbLfMTZq7fB8JcZcddjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571223; c=relaxed/simple;
	bh=pfaUDP+5B9OTCNDaLWVsUVLmL0Rm+brt5WwGklXvwNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CseQEM7r/0eZpIPsrdwGwk/Ini9PspGxgG+06DMPfDUAPKrSm/I98vxDsJ4IHPmD/SjgjwtLL78Ni4RiL99yBm5lUOzicNdMXSZl8f9Bf665frXlaIf5Eysbja/C6jNirFI3Q3jERO/LGWQNnLts59tveSFbTDGXwotdbrsw04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1/jTMVp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1/jTMVp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso177099a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 17:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571221; x=1735176021; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THpkc6ihbzAm4iybMeyYcRNG0ZrzGc6nz8PttKVc4SA=;
        b=v1/jTMVpr0RUN67RCp9iOp75IhteZNja5qGPox7LT/5qx/TocI+sK/TRHujtXZbbFo
         Es9UbhddIt7IHkJNTNwWkTfsM8ZehRvYFgOSFN+zxcLWpa0cKy8xl2yiCmVokCqwOndI
         vTY9B69dsrn2UNMtF0zCklSH/iO3ZWqPouI5Mk0AXfu1+f1KTNPT6eFObVgJZn0UeJUY
         jtwgYwTFo9raiP3pTuBMLaXLnwOr5Dv6Z9P/vyKq2TucKXwMHRvvnEreX/dgMHtthBy5
         Lu4wVM/pBRRDlmPQc0YEUTMYC2PDio4SBJCQf4V2/RKF0XXkWb/YHXtG2krDDVxgxHbj
         PZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571221; x=1735176021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THpkc6ihbzAm4iybMeyYcRNG0ZrzGc6nz8PttKVc4SA=;
        b=nqjqgSLZiH/qXsLT7hqhDVBYJowYJX41VnqQRDY1p0e43QKPPWR3mqf8esUU5ZE0Yr
         Y7HX1H465VI0b1IIa9qdMTmk1AFAjH1/NwCT/y/0x3t+pIOOkj5c/N6v2Df3wXx/iqmL
         kPzTW5M773/aGuqHLKmtzgGjSbbn5ullr0iLzmFmkPOjhxgqxQZWfT9h4PKVe3xxAF/4
         gkCx09LnlIzvzuDcyzY5NBW1CcoL2TQCSY7L8hWDO+8b2KNpdXtpVwXbJnbqj6nU9Uuk
         SQBHY6ya9dGzaz2TXHcIbbD2cdreiD3NznK6WVaRILiyZhIZxQPM6YQfEf6ZB3T+WlJa
         OqTw==
X-Forwarded-Encrypted: i=1; AJvYcCXpySd6mYzm04v0CPpisPN2fNNGL/en4yRopNNJbZACJ0R5xNUjrainvv/Pk7Yop2yNG3dQZ2EpenBUQtTcN74=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9m4u8LQ89tgrbYazARs1w2UvKo3Mv6dA7dAr2Qjm+jkAUhSxu
	3MiGP/yJaxO7YpD6YYYMhu2GoC6DHvnuWP5lRPPgOXvKWCgG1E18Mqa9blmUqw==
X-Gm-Gg: ASbGnct4xICV9S8s6GqmmyeTaQHPZYcI+pq1RtVZQ9VUYrVLarS71YNZSCDVPhkbD+J
	F3gNcBeQZILhXIMN/fD2RG2GnMUHgiQXhGJguZl/CmYIQwz30laOsQGl/LFWKPKmIHHEgsF1OBS
	lx9Gx6ApI5Uj0hQG5lgv2I4dClkP7i41qcZjh7j5x8OpZwgUATjyct1ePgSbV4qPjIbrMOKy1Kf
	QfuoM0gy2TkWuFFXLI5VLtfghHcsmR1C6Em36YrG6u2AgnU/DQCkWEHu9gprGgRXJ3tw4e6XkH4
	Zm35CzBz7iCwhdrW
X-Google-Smtp-Source: AGHT+IH4FCJWtz7gqpQBGgPhLtEeH9EwDliXFEyo69Zj53XkCApoBPgRPQrKE/zWIF1e2wvmeE+JUg==
X-Received: by 2002:a17:90b:5203:b0:2ea:356f:51b4 with SMTP id 98e67ed59e1d1-2f443ce5c0fmr1926268a91.13.1734571220620;
        Wed, 18 Dec 2024 17:20:20 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cdc3sm2052119a91.3.2024.12.18.17.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:20:19 -0800 (PST)
Date: Thu, 19 Dec 2024 01:20:15 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] usb: typec: Add driver for Thunderbolt 3
 Alternate Mode
Message-ID: <Z2N0z5Is-Ab8uiGw@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.2.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O9L3n0nAcYuBhjiV"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.2.I3080b036e8de0b9957c57c1c3059db7149c5e549@changeid>


--O9L3n0nAcYuBhjiV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:43PM -0800, Abhishek Pandit-Subedi wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>=20
> Thunderbolt 3 Alternate Mode entry flow is described in
> USB Type-C Specification Release 2.0.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Add lockdep, missing includes and fix up block comment style.
>=20
> Changes in v4:
> - Large refactor to use cable_altmodes
> - Fixed ordering of cable mode enter/exit (SOP', SOP", then port for
>   enter; reverse order for exit)
> - Other small fixes from v3 feedback
>=20
> Changes in v3:
> - Revert rename of TYPEC_TBT_MODE
> - Remove mode from typec_device_id
>=20
> Changes in v2:
> - Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
> - Pass struct typec_thunderbolt_data to typec_altmode_notify
> - Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
> - Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
> - Change module license to GPL due to checkpatch warning
>=20
> Changes in v1:
> - Delay cable + plug checks so that the module doesn't fail to probe
>   if cable + plug information isn't available by the time the partner
>   altmode is registered.
> - Remove unncessary brace after if (IS_ERR(plug))
>=20
>  drivers/usb/typec/altmodes/Kconfig       |   9 +
>  drivers/usb/typec/altmodes/Makefile      |   2 +
>  drivers/usb/typec/altmodes/thunderbolt.c | 388 +++++++++++++++++++++++
>  include/linux/usb/typec_tbt.h            |   1 +
>  4 files changed, 400 insertions(+)
>  create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c
>=20
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmo=
des/Kconfig
> index 1a6b5e872b0d..7867fa7c405d 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -23,4 +23,13 @@ config TYPEC_NVIDIA_ALTMODE
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called typec_nvidia.
> =20
> +config TYPEC_TBT_ALTMODE
> +	tristate "Thunderbolt3 Alternate Mode driver"
> +	help
> +	  Select this option if you have Thunderbolt3 hardware on your
> +	  system.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called typec_thunderbolt.
> +
>  endmenu
> diff --git a/drivers/usb/typec/altmodes/Makefile b/drivers/usb/typec/altm=
odes/Makefile
> index 45717548b396..508a68351bd2 100644
> --- a/drivers/usb/typec/altmodes/Makefile
> +++ b/drivers/usb/typec/altmodes/Makefile
> @@ -4,3 +4,5 @@ obj-$(CONFIG_TYPEC_DP_ALTMODE)		+=3D typec_displayport.o
>  typec_displayport-y			:=3D displayport.o
>  obj-$(CONFIG_TYPEC_NVIDIA_ALTMODE)	+=3D typec_nvidia.o
>  typec_nvidia-y				:=3D nvidia.o
> +obj-$(CONFIG_TYPEC_TBT_ALTMODE)		+=3D typec_thunderbolt.o
> +typec_thunderbolt-y			:=3D thunderbolt.o
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec=
/altmodes/thunderbolt.c
> new file mode 100644
> index 000000000000..1b475b1d98e7
> --- /dev/null
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USB Typec-C Thunderbolt3 Alternate Mode driver
> + *
> + * Copyright (C) 2019 Intel Corporation
> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> + */
> +
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/workqueue.h>
> +#include <linux/usb/pd_vdo.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_tbt.h>
> +
> +enum tbt_state {
> +	TBT_STATE_IDLE,
> +	TBT_STATE_SOP_P_ENTER,
> +	TBT_STATE_SOP_PP_ENTER,
> +	TBT_STATE_ENTER,
> +	TBT_STATE_EXIT,
> +	TBT_STATE_SOP_PP_EXIT,
> +	TBT_STATE_SOP_P_EXIT
> +};
> +
> +struct tbt_altmode {
> +	enum tbt_state state;
> +	struct typec_cable *cable;
> +	struct typec_altmode *alt;
> +	struct typec_altmode *plug[2];
> +	u32 enter_vdo;
> +
> +	struct work_struct work;
> +	struct mutex lock; /* device lock */
> +};
> +
> +static bool tbt_ready(struct typec_altmode *alt);
> +
> +static int tbt_enter_mode(struct tbt_altmode *tbt)
> +{
> +	struct typec_altmode *plug =3D tbt->plug[TYPEC_PLUG_SOP_P];
> +	u32 vdo;
> +
> +	vdo =3D tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B=
1);
> +	vdo |=3D tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
> +	vdo |=3D TBT_MODE;
> +
> +	if (plug) {
> +		if (typec_cable_is_active(tbt->cable))
> +			vdo |=3D TBT_ENTER_MODE_ACTIVE_CABLE;
> +
> +		vdo |=3D TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
> +		vdo |=3D plug->vdo & TBT_CABLE_ROUNDED;
> +		vdo |=3D plug->vdo & TBT_CABLE_OPTICAL;
> +		vdo |=3D plug->vdo & TBT_CABLE_RETIMER;
> +		vdo |=3D plug->vdo & TBT_CABLE_LINK_TRAINING;
> +	} else {
> +		vdo |=3D TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
> +	}
> +
> +	tbt->enter_vdo =3D vdo;
> +	return typec_altmode_enter(tbt->alt, &vdo);
> +}
> +
> +static void tbt_altmode_work(struct work_struct *work)
> +{
> +	struct tbt_altmode *tbt =3D container_of(work, struct tbt_altmode, work=
);
> +	int ret;
> +
> +	mutex_lock(&tbt->lock);
> +
> +	switch (tbt->state) {
> +	case TBT_STATE_SOP_P_ENTER:
> +		ret =3D typec_cable_altmode_enter(tbt->alt, TYPEC_PLUG_SOP_P, NULL);
> +		if (ret) {
> +			dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->dev,
> +				"failed to enter mode (%d)\n", ret);
> +			goto disable_plugs;
> +		}
> +		break;
> +	case TBT_STATE_SOP_PP_ENTER:
> +		ret =3D typec_cable_altmode_enter(tbt->alt, TYPEC_PLUG_SOP_PP,  NULL);
> +		if (ret) {
> +			dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]->dev,
> +				"failed to enter mode (%d)\n", ret);
> +			goto disable_plugs;
> +		}
> +		break;
> +	case TBT_STATE_ENTER:
> +		ret =3D tbt_enter_mode(tbt);
> +		if (ret)
> +			dev_dbg(&tbt->alt->dev, "failed to enter mode (%d)\n",
> +				ret);
> +		break;
> +	case TBT_STATE_EXIT:
> +		typec_altmode_exit(tbt->alt);
> +		break;
> +	case TBT_STATE_SOP_PP_EXIT:
> +		typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_SOP_PP);
> +		break;
> +	case TBT_STATE_SOP_P_EXIT:
> +		typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_SOP_P);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	tbt->state =3D TBT_STATE_IDLE;
> +
> +	mutex_unlock(&tbt->lock);
> +	return;
> +
> +disable_plugs:
> +	for (int i =3D TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +		if (tbt->plug[i])
> +			typec_altmode_put_plug(tbt->plug[i]);
> +
> +		tbt->plug[i] =3D NULL;
> +	}
> +
> +	tbt->state =3D TBT_STATE_ENTER;
> +	schedule_work(&tbt->work);
> +	mutex_unlock(&tbt->lock);
> +}
> +
> +/*
> + * If SOP' is available, enter that first (which will trigger a VDM resp=
onse
> + * that will enter SOP" if available and then the port). If entering SOP=
' fails,
> + * stop attempting to enter either cable altmode (probably not supported=
) and
> + * directly enter the port altmode.
> + */
> +static int tbt_enter_modes_ordered(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> +	int ret =3D 0;
> +
> +	lockdep_assert_held(&tbt->lock);
> +
> +	if (!tbt_ready(tbt->alt))
> +		return -ENODEV;
> +
> +	if (tbt->plug[TYPEC_PLUG_SOP_P]) {
> +		ret =3D typec_cable_altmode_enter(alt, TYPEC_PLUG_SOP_P, NULL);
> +		if (ret < 0) {
> +			for (int i =3D TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +				if (tbt->plug[i])
> +					typec_altmode_put_plug(tbt->plug[i]);
> +
> +				tbt->plug[i] =3D NULL;
> +			}
> +		} else {
> +			return ret;
> +		}
> +	}
> +
> +	return tbt_enter_mode(tbt);
> +}
> +
> +static int tbt_cable_altmode_vdm(struct typec_altmode *alt,
> +				 enum typec_plug_index sop, const u32 hdr,
> +				 const u32 *vdo, int count)
> +{
> +	struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> +	int cmd_type =3D PD_VDO_CMDT(hdr);
> +	int cmd =3D PD_VDO_CMD(hdr);
> +
> +	mutex_lock(&tbt->lock);
> +
> +	if (tbt->state !=3D TBT_STATE_IDLE) {
> +		mutex_unlock(&tbt->lock);
> +		return -EBUSY;
> +	}
> +
> +	switch (cmd_type) {
> +	case CMDT_RSP_ACK:
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			/*
> +			 * Following the order described in USB Type-C Spec
> +			 * R2.0 Section 6.7.3: SOP', SOP", then port.
> +			 */
> +			if (sop =3D=3D TYPEC_PLUG_SOP_P) {
> +				if (tbt->plug[TYPEC_PLUG_SOP_PP])
> +					tbt->state =3D TBT_STATE_SOP_PP_ENTER;
> +				else
> +					tbt->state =3D TBT_STATE_ENTER;
> +			} else if (sop =3D=3D TYPEC_PLUG_SOP_PP)
> +				tbt->state =3D TBT_STATE_ENTER;
> +
> +			break;
> +		case CMD_EXIT_MODE:
> +			/* Exit in opposite order: Port, SOP", then SOP'. */
> +			if (sop =3D=3D TYPEC_PLUG_SOP_PP)
> +				tbt->state =3D TBT_STATE_SOP_P_EXIT;
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (tbt->state !=3D TBT_STATE_IDLE)
> +		schedule_work(&tbt->work);
> +
> +	mutex_unlock(&tbt->lock);
> +	return 0;
> +}
> +
> +static int tbt_altmode_vdm(struct typec_altmode *alt,
> +			   const u32 hdr, const u32 *vdo, int count)
> +{
> +	struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> +	struct typec_thunderbolt_data data;
> +	int cmd_type =3D PD_VDO_CMDT(hdr);
> +	int cmd =3D PD_VDO_CMD(hdr);
> +
> +	mutex_lock(&tbt->lock);
> +
> +	if (tbt->state !=3D TBT_STATE_IDLE) {
> +		mutex_unlock(&tbt->lock);
> +		return -EBUSY;
> +	}
> +
> +	switch (cmd_type) {
> +	case CMDT_RSP_ACK:
> +		/* Port altmode is last to enter and first to exit. */
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			memset(&data, 0, sizeof(data));
> +
> +			data.device_mode =3D tbt->alt->vdo;
> +			data.enter_vdo =3D tbt->enter_vdo;
> +			if (tbt->plug[TYPEC_PLUG_SOP_P])
> +				data.cable_mode =3D tbt->plug[TYPEC_PLUG_SOP_P]->vdo;
> +
> +			typec_altmode_notify(alt, TYPEC_STATE_MODAL, &data);
> +			break;
> +		case CMD_EXIT_MODE:
> +			if (tbt->plug[TYPEC_PLUG_SOP_PP])
> +				tbt->state =3D TBT_STATE_SOP_PP_EXIT;
> +			else if (tbt->plug[TYPEC_PLUG_SOP_P])
> +				tbt->state =3D TBT_STATE_SOP_P_EXIT;
> +			break;
> +		}
> +		break;
> +	case CMDT_RSP_NAK:
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			dev_warn(&alt->dev, "Enter Mode refused\n");
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (tbt->state !=3D TBT_STATE_IDLE)
> +		schedule_work(&tbt->work);
> +
> +	mutex_unlock(&tbt->lock);
> +
> +	return 0;
> +}
> +
> +static int tbt_altmode_activate(struct typec_altmode *alt, int activate)
> +{
> +	struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> +	int ret;
> +
> +	mutex_lock(&tbt->lock);
> +
> +	if (activate)
> +		ret =3D tbt_enter_modes_ordered(alt);
> +	else
> +		ret =3D typec_altmode_exit(alt);
> +
> +	mutex_unlock(&tbt->lock);
> +
> +	return ret;
> +}
> +
> +static const struct typec_altmode_ops tbt_altmode_ops =3D {
> +	.vdm		=3D tbt_altmode_vdm,
> +	.activate	=3D tbt_altmode_activate
> +};
> +
> +static const struct typec_cable_ops tbt_cable_ops =3D {
> +	.vdm		=3D tbt_cable_altmode_vdm,
> +};
> +
> +static int tbt_altmode_probe(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt;
> +
> +	tbt =3D devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
> +	if (!tbt)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&tbt->work, tbt_altmode_work);
> +	mutex_init(&tbt->lock);
> +	tbt->alt =3D alt;
> +
> +	alt->desc =3D "Thunderbolt3";
> +	typec_altmode_set_drvdata(alt, tbt);
> +	typec_altmode_set_ops(alt, &tbt_altmode_ops);
> +
> +	if (tbt_ready(alt)) {
> +		if (tbt->plug[TYPEC_PLUG_SOP_P])
> +			tbt->state =3D TBT_STATE_SOP_P_ENTER;
> +		else if (tbt->plug[TYPEC_PLUG_SOP_PP])
> +			tbt->state =3D TBT_STATE_SOP_PP_ENTER;
> +		else
> +			tbt->state =3D TBT_STATE_ENTER;
> +		schedule_work(&tbt->work);
> +	}
> +
> +	return 0;
> +}
> +
> +static void tbt_altmode_remove(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> +
> +	for (int i =3D TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +		if (tbt->plug[i])
> +			typec_altmode_put_plug(tbt->plug[i]);
> +	}
> +
> +	if (tbt->cable)
> +		typec_cable_put(tbt->cable);
> +}
> +
> +static bool tbt_ready(struct typec_altmode *alt)
> +{
> +	struct tbt_altmode *tbt =3D typec_altmode_get_drvdata(alt);
> +	struct typec_altmode *plug;
> +
> +	if (tbt->cable)
> +		return true;
> +
> +	/* Thunderbolt 3 requires a cable with eMarker */
> +	tbt->cable =3D typec_cable_get(typec_altmode2port(tbt->alt));
> +	if (!tbt->cable)
> +		return false;
> +
> +	/* We accept systems without SOP' or SOP''. This means the port altmode
> +	 * driver will be responsible for properly ordering entry/exit.
> +	 */
> +	for (int i =3D 0; i < TYPEC_PLUG_SOP_PP + 1; i++) {
> +		plug =3D typec_altmode_get_plug(tbt->alt, i);
> +		if (IS_ERR(plug))
> +			continue;
> +
> +		if (!plug || plug->svid !=3D USB_TYPEC_TBT_SID)
> +			break;
> +
> +		plug->desc =3D "Thunderbolt3";
> +		plug->cable_ops =3D &tbt_cable_ops;
> +		typec_altmode_set_drvdata(plug, tbt);
> +
> +		tbt->plug[i] =3D plug;
> +	}
> +
> +	return true;
> +}
> +
> +static const struct typec_device_id tbt_typec_id[] =3D {
> +	{ USB_TYPEC_TBT_SID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(typec, tbt_typec_id);
> +
> +static struct typec_altmode_driver tbt_altmode_driver =3D {
> +	.id_table =3D tbt_typec_id,
> +	.probe =3D tbt_altmode_probe,
> +	.remove =3D tbt_altmode_remove,
> +	.driver =3D {
> +		.name =3D "typec-thunderbolt",
> +	}
> +};
> +module_typec_altmode_driver(tbt_altmode_driver);
> +
> +MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Thunderbolt3 USB Type-C Alternate Mode");
> diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
> index fa97d7e00f5c..55dcea12082c 100644
> --- a/include/linux/usb/typec_tbt.h
> +++ b/include/linux/usb/typec_tbt.h
> @@ -44,6 +44,7 @@ struct typec_thunderbolt_data {
> =20
>  #define   TBT_GEN3_NON_ROUNDED                 0
>  #define   TBT_GEN3_GEN4_ROUNDED_NON_ROUNDED    1
> +#define TBT_CABLE_ROUNDED		BIT(19)
>  #define TBT_CABLE_OPTICAL		BIT(21)
>  #define TBT_CABLE_RETIMER		BIT(22)
>  #define TBT_CABLE_LINK_TRAINING		BIT(23)
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--O9L3n0nAcYuBhjiV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N0zwAKCRBzbaomhzOw
wq5iAP0bAmcTGqzFKsG4jEcH9viAhtxjtW39HCnp/aRdLKPS1AEA74yCmlVPOuXX
PoiIFYWh9/UcQFEpB4YTiQ23w1skfQk=
=rIYm
-----END PGP SIGNATURE-----

--O9L3n0nAcYuBhjiV--
