Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2D10F1
	for <chrome-platform@lists.linux.dev>; Wed, 11 Dec 2024 00:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733875730; cv=none; b=IKTM7wnuEiCKnI1mVgyFc8TiX9Ofo2MByaHMr6GhMxMDGJeUJIhd7aqYBTMKhZINKG1qftVr8oVmDzKY6gQKetevKhFa1OSJ2Cv2RZEKJZrLSKssTHT0hn3bK0KQsBx/OVL0uIg4yTvG16D+k0AhsD0yPhOqqq0fzK4vckfjziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733875730; c=relaxed/simple;
	bh=ygJB9lByFuI4OE5ggxZziKAI9HhvAlHHWo/+PZZGPsw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq8Qt3aN0Wkh4SWWfu0x4IxDwRxVcBSB6Jssx7wKi7rKg+bJx259ggVAhjOMSP1kSrCC2kbqJoD0xyrXgIFnUeRKavs0cOejPoLP2z7diHbkcDZE0BwYXldemTyoSkzTRopvbfJCoFfHwFmFZyG7Em+4xjJYsTi8V9Us6xh+dsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y/ARxYTl; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y/ARxYTl"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4677230a9ccso20814671cf.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 16:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733875727; x=1734480527; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InR1oI0aD+sPto4GQzNqXe18JFI0oG3qcs+AISuN/sY=;
        b=Y/ARxYTl7go4RRgAJJH39HTCu+Bz+H40Yem/w2dHoVlf0TJ57+1NgbWGLmKH4slFiZ
         4UCr8HnackUJ8unL7ghlkzHVsrRUGcG2hfOzg22aueFamXe6DOKiiOHx85rwIpG8d4Ly
         xuOIpyKZFZUTnz/O6GZh6Xk+Z1EHQAWZeupdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733875727; x=1734480527;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InR1oI0aD+sPto4GQzNqXe18JFI0oG3qcs+AISuN/sY=;
        b=oyiJHZvd857qUoQoHHGBvZfMJce7YeJ+azgA7C56gf0RBJW5PfMoUOaba/3nFMix0D
         yYpPjdfZC76UoHbAcRgkSHkbm9qGpu4LGHFE24hx2Tua+O+Xkl0/oZv53LWZxQ7rV6zL
         tXTQcth8k8uiFntNc05U2xJTFR6g3FUEWoA3Pr+kwNYXJSBPQ6Zz2G3Z9gcSxJNLjSuE
         o6WsnKc8W2iXBhJxJT8SwnbCvW/7AyunALywL6bfQ2w7a8oNgp+vYfAwSg96X629FXoT
         EFUUGp8FVbuP25zDt4hMYCAtChLSXcitEuw40R/eld7/VmEw383FNyeJIpzOqSYD2BPI
         wUjA==
X-Forwarded-Encrypted: i=1; AJvYcCWacB2zW1a0VUGMO+wG10a/k4ijN++bKWWy2sdkLND++suQQqHhdfD32tC5IC+YwCZr0kpq0XdwcjeNNLtgKRU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT2ZGZ6z0b0+ZAOOajWMEYEXOi+5sCzYJItoxYpBkHbU3rnsBX
	gani9+kPZXrSIEB2QIMEqTzMJ3hWA/uA+Q2/xDLC6Gvq0RlboV+Eben/prr1bYdOo3p15DtuGwQ
	QToRMpUEzDTBVptA0xARffwWc+zzB5OFuhQV4
X-Gm-Gg: ASbGncvjRzpCPF9ncaFjD3R8qcGsgoLMO/bAJzxzvIZxJVd/IYtCTtoXQLxIvF66dNf
	wH7c6rK8Am5+VknYt9o/7z6DU7n0DMd0ik7uAoQILmcYJiEmHdQEgDpQPY7dL2dg=
X-Google-Smtp-Source: AGHT+IFWkOjv1mYJIaAxfQCOqZy5Pz1YiEIn47/fn9NT2M8g5tgWs9SW51OBu9aOn7+LCL2dJhg8YVt8sCdgezMgaPU=
X-Received: by 2002:ac8:5947:0:b0:467:6092:8414 with SMTP id
 d75a77b69052e-467891befcfmr21798581cf.0.1733875726913; Tue, 10 Dec 2024
 16:08:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Dec 2024 16:08:46 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org> <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 10 Dec 2024 16:08:46 -0800
Message-ID: <CAE-0n513GoDKW7mA_rjCLsgZZFq=CEb5S8WLYr2rskq8fJW9LA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] platform/chrome: cros_ec_typec: Displayport support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	tzungbi@kernel.org
Cc: akuchynski@google.com, pmalani@chromium.org, jthies@google.com, 
	dmitry.baryshkov@linaro.org, badhri@google.com, rdbabiera@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:16)
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index e3eabe5e42ac..0f3bc335f583 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -18,6 +18,7 @@
>
>  #include "cros_ec_typec.h"
>  #include "cros_typec_vdm.h"
> +#include "cros_typec_altmode.h"
>
>  #define DRV_NAME "cros-ec-typec"
>
> @@ -290,15 +291,15 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>         struct typec_altmode *amode;
>
>         /* All PD capable CrOS devices are assumed to support DP altmode. */
> +       memset(&desc, 0, sizeof(desc));
>         desc.svid = USB_TYPEC_DP_SID;
>         desc.mode = USB_TYPEC_DP_MODE;
>         desc.vdo = DP_PORT_VDO;
> -       amode = typec_port_register_altmode(port->port, &desc);
> +       amode = cros_typec_register_displayport(port, &desc,
> +                                               typec->ap_driven_altmode);
>         if (IS_ERR(amode))
>                 return PTR_ERR(amode);
>         port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
> -       typec_altmode_set_drvdata(amode, port);
> -       amode->ops = &port_amode_ops;
>
>         /*
>          * Register TBT compatibility alt mode. The EC will not enter the mode
> @@ -575,6 +576,10 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
>         if (!ret)
>                 ret = typec_mux_set(port->mux, &port->state);
>
> +       if (!ret)
> +               cros_typec_displayport_status_update(port->state.alt,

Should we forward the return value from here?

> +                                                    port->state.data);
> +
>         return ret;
>  }
>
> @@ -1254,6 +1259,8 @@ static int cros_typec_probe(struct platform_device *pdev)
>
>         typec->typec_cmd_supported = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_CMD);
>         typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
> +       typec->ap_driven_altmode = cros_ec_check_features(
> +               ec_dev, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
>
>         ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_PORTS, NULL, 0,
>                           &resp, sizeof(resp));
> diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
> index deda180a646f..9fd5342bb0ad 100644
> --- a/drivers/platform/chrome/cros_ec_typec.h
> +++ b/drivers/platform/chrome/cros_ec_typec.h
> @@ -39,6 +39,7 @@ struct cros_typec_data {
>         struct work_struct port_work;
>         bool typec_cmd_supported;
>         bool needs_mux_ack;
> +       bool ap_driven_altmode;

Do we need to stash this? Can we cros_ec_check_features() in
cros_typec_init_ports() and pass the bool to
cros_typec_register_port_altmodes() instead to save a struct member?

>  };
>
>  /* Per port data. */
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> new file mode 100644
> index 000000000000..bb7c7ad2ff6e
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Alt-mode implementation on ChromeOS EC.
> + *
> + * Copyright 2024 Google LLC
> + * Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> + */
> +#include "cros_ec_typec.h"
> +
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/pd_vdo.h>

Please include workqueue.h, mutex.h, etc. for things used in this file.

> +
> +#include "cros_typec_altmode.h"
> +
> +struct cros_typec_altmode_data {
> +       struct work_struct work;
> +       struct cros_typec_port *port;
> +       struct typec_altmode *alt;
> +       bool ap_mode_entry;

The UCSI driver (drivers/usb/typec/ucsi/displayport.c) calls this
'override', can it be named the same thing? I also see that the UCSI
driver has two bools, 'override' and 'initialized', which seems to be to
support a DP_CMD_CONFIGURE that will respond with an ACK and then the
next DP_CMD_CONFIGURE will call ucsi_altmode_update_active() to set the
altmode as active. Maybe the same method can be followed here so that on
older chromebooks where EC is in control of mode entry we can emulate
entering the mode?

> +
> +       struct mutex lock;
> +       u32 header;
> +       u32 *vdo_data;
> +       u8 vdo_size;
> +
> +       u16 sid;
> +       u8 mode;
> +};
> +
> +struct cros_typec_dp_data {
> +       struct cros_typec_altmode_data adata;
> +       struct typec_displayport_data data;
> +       bool configured;
> +       bool pending_status_update;
> +};
> +
> +static void cros_typec_altmode_work(struct work_struct *work)
> +{
> +       struct cros_typec_altmode_data *data =
> +               container_of(work, struct cros_typec_altmode_data, work);
> +
> +       mutex_lock(&data->lock);
> +
> +       if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> +                             data->vdo_size))
> +               dev_err(&data->alt->dev, "VDM 0x%x failed", data->header);

These printks need newlines.

               dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);

> +
> +       data->header = 0;
> +       data->vdo_data = NULL;
> +       data->vdo_size = 0;
> +
> +       mutex_unlock(&data->lock);
> +}
> +
> +static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
> +{
> +       struct cros_typec_altmode_data *data = typec_altmode_get_drvdata(alt);
> +       struct ec_params_typec_control req = {
> +               .port = data->port->port_num,
> +               .command = TYPEC_CONTROL_COMMAND_ENTER_MODE,
> +       };
> +       int svdm_version;
> +       int ret;
> +
> +       if (!data->ap_mode_entry) {
> +               dev_warn(&alt->dev,
> +                        "EC does not support AP driven mode entry\n");

Like this one.

> +               return -EOPNOTSUPP;
> +       }
> +
> +       if (data->sid == USB_TYPEC_DP_SID)
> +               req.mode_to_enter = CROS_EC_ALTMODE_DP;
> +       else
> +               return -EOPNOTSUPP;
> +
> +       ret = cros_ec_cmd(data->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,

Do we plan to delete drivers/platform/chrome/cros_typec_vdm.c file at
some point? I ask because 'port_amode_ops' becomes unused after this
series.

> +                         &req, sizeof(req), NULL, 0);
> +       if (ret < 0)
> +               return ret;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
> +       mutex_lock(&data->lock);
> +
> +       data->header = VDO(data->sid, 1, svdm_version, CMD_ENTER_MODE);
> +       data->header |= VDO_OPOS(data->mode);
> +       data->header |= VDO_CMDT(CMDT_RSP_ACK);
> +       data->vdo_data = NULL;
> +       data->vdo_size = 1;
> +       schedule_work(&data->work);
> +
> +       mutex_unlock(&data->lock);
> +       return ret;
> +}
> +
> +static int cros_typec_altmode_exit(struct typec_altmode *alt)
> +{
> +       struct cros_typec_altmode_data *data = typec_altmode_get_drvdata(alt);
> +       struct ec_params_typec_control req = {
> +               .port = data->port->port_num,
> +               .command = TYPEC_CONTROL_COMMAND_EXIT_MODES,
> +       };
> +       int svdm_version;
> +       int ret;
> +
> +       if (!data->ap_mode_entry) {
> +               dev_warn(&alt->dev,
> +                        "EC does not support AP driven mode exit\n");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       ret = cros_ec_cmd(data->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
> +                         &req, sizeof(req), NULL, 0);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
> +       mutex_lock(&data->lock);
> +
> +       data->header = VDO(data->sid, 1, svdm_version, CMD_EXIT_MODE);
> +       data->header |= VDO_OPOS(data->mode);
> +       data->header |= VDO_CMDT(CMDT_RSP_ACK);
> +       data->vdo_data = NULL;
> +       data->vdo_size = 1;
> +       schedule_work(&data->work);
> +
> +       mutex_unlock(&data->lock);
> +       return ret;
> +}
> +
> +static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
> +                                     const u32 *data, int count)
> +{
> +       struct cros_typec_dp_data *dp_data = typec_altmode_get_drvdata(alt);
> +       struct cros_typec_altmode_data *adata = &dp_data->adata;
> +
> +
> +       int cmd_type = PD_VDO_CMDT(header);
> +       int cmd = PD_VDO_CMD(header);
> +       int svdm_version;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
> +       mutex_lock(&adata->lock);
> +
> +       switch (cmd_type) {
> +       case CMDT_INIT:
> +               if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +                       typec_partner_set_svdm_version(adata->port->partner,
> +                                                      PD_VDO_SVDM_VER(header));
> +                       svdm_version = PD_VDO_SVDM_VER(header);
> +               }
> +
> +               adata->header = VDO(adata->sid, 1, svdm_version, cmd);
> +               adata->header |= VDO_OPOS(adata->mode);
> +
> +               /*
> +                * DP_CMD_CONFIGURE: We can't actually do anything with the
> +                * provided VDO yet so just send back an ACK.
> +                *
> +                * DP_CMD_STATUS_UPDATE: We wait for Mux changes to send
> +                * DPStatus Acks.
> +                */
> +               switch (cmd) {
> +               case DP_CMD_CONFIGURE:
> +                       dp_data->data.conf = *data;
> +                       adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +                       dp_data->configured = true;
> +                       schedule_work(&adata->work);
> +                       break;
> +               case DP_CMD_STATUS_UPDATE:
> +                       dp_data->pending_status_update = true;
> +                       break;
> +               default:
> +                       adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +                       schedule_work(&adata->work);
> +                       break;
> +               }
> +
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       mutex_unlock(&adata->lock);
> +       return 0;
> +}
> +
> +static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
> +                                     const u32 *data, int count)
> +{
> +       struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
> +
> +       if (!adata->ap_mode_entry)
> +               return -EOPNOTSUPP;
> +
> +       if (adata->sid == USB_TYPEC_DP_SID)
> +               return cros_typec_displayport_vdm(alt, header, data, count);
> +
> +       return -EINVAL;
> +}
> +
> +static const struct typec_altmode_ops cros_typec_altmode_ops = {
> +       .enter = cros_typec_altmode_enter,
> +       .exit = cros_typec_altmode_exit,
> +       .vdm = cros_typec_altmode_vdm,
> +};
> +
> +#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
> +int cros_typec_displayport_status_update(struct typec_altmode *altmode,
> +                                        struct typec_displayport_data *data)
> +{
> +       struct cros_typec_dp_data *dp_data =
> +               typec_altmode_get_drvdata(altmode);
> +       struct cros_typec_altmode_data *adata = &dp_data->adata;
> +
> +       if (!dp_data->pending_status_update) {
> +               dev_dbg(&altmode->dev,
> +                       "Got DPStatus without a pending request");
> +               return 0;
> +       }
> +
> +       if (dp_data->configured && dp_data->data.conf != data->conf)
> +               dev_dbg(&altmode->dev,
> +                       "DP Conf doesn't match. Requested 0x%04x, Actual 0x%04x",
> +                       dp_data->data.conf, data->conf);
> +
> +       mutex_lock(&adata->lock);
> +
> +       dp_data->data = *data;
> +       dp_data->pending_status_update = false;
> +       adata->header |= VDO_CMDT(CMDT_RSP_ACK);
> +       adata->vdo_data = &dp_data->data.status;
> +       adata->vdo_size = 2;
> +       schedule_work(&adata->work);
> +
> +       mutex_unlock(&adata->lock);
> +
> +       return 0;
> +}
> +
> +struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +                               struct typec_altmode_desc *desc,
> +                               bool ap_mode_entry)
> +{
> +       struct typec_altmode *alt;
> +       struct cros_typec_altmode_data *data;

Can you name it 'adata' consistently? That makes it easy to search for
'adata' in this file and know it's always talking about a struct
cros_typec_altmode_data type of data.

> +
> +       alt = typec_port_register_altmode(port->port, desc);
> +       if (IS_ERR(alt))
> +               return alt;
> +
> +       data = devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data) {
> +               typec_unregister_altmode(alt);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       INIT_WORK(&data->work, cros_typec_altmode_work);
> +       mutex_init(&data->lock);
> +       data->alt = alt;
> +       data->port = port;
> +       data->ap_mode_entry = ap_mode_entry;
> +       data->sid = desc->svid;
> +       data->mode = desc->mode;
> +
> +       typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> +       typec_altmode_set_drvdata(alt, data);
> +
> +       return alt;
> +}
> +#endif
> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
> new file mode 100644
> index 000000000000..c6f8fb02c99c
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __CROS_TYPEC_ALTMODE_H__
> +#define __CROS_TYPEC_ALTMODE_H__

#include <linux/kconfig.h> for IS_ENABLED()
#include <linux/usb/typec.h> for typec_port_register_altmode()

> +
> +struct cros_typec_port;
> +struct typec_altmode;
> +struct typec_altmode_desc;
> +struct typec_displayport_data;
> +
> +#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +                               struct typec_altmode_desc *desc,
> +                               bool ap_mode_entry);
> +
> +int cros_typec_displayport_status_update(struct typec_altmode *altmode,
> +                                        struct typec_displayport_data *data);
> +#else
> +static inline struct typec_altmode *
> +cros_typec_register_displayport(struct cros_typec_port *port,
> +                               struct typec_altmode_desc *desc,
> +                               bool ap_mode_entry)
> +{
> +       return typec_port_register_altmode(port->port, desc);
> +}
