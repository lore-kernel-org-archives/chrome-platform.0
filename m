Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E953BB
	for <chrome-platform@lists.linux.dev>; Mon,  6 Feb 2023 19:56:09 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id o187so15893330ybg.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Feb 2023 11:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yLMstZQHkXJe//HFhYU7Zy8Xlrx7byL1tOxOLctVl4s=;
        b=aBJsRQhntuN/2TdlJueDGBEfnmLSC2B0sfJLRlD1zkotym8Tqh3/7B86FTTtbGJBgm
         xOOGNeoQBgsJ+WNeEJ3lJdgLTtWpLVvpSltjo5DgNUPVmelOwqyngK+RitYLsZZn1FV2
         ACd9gaOVxfMEYW+Z3N7JmjCYRb+ddUn4RN250=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLMstZQHkXJe//HFhYU7Zy8Xlrx7byL1tOxOLctVl4s=;
        b=c6HrQZ8OwBezBUlTNh79U1EVatuLZKnJIrLyv8ndXUlKUKaZomEAmKCI8YDw+wUn6t
         zcDXtKoyZP+R0bVE4U3fxyXvD/cQCd3MgmNe3dCoNA4T73rrwG6gkZLPHL4IWVpM209E
         Uu8vf84RJ7VXy1BHm3DEn/6t3DXkMgKla7eUw1QOB7j0LwphsDoU65BUJO49cPFOYJru
         4XPUlTkOVW8FYZpMAAcQ6L8uaCRyOq9DjKl4t723zszOroxEZmJvY1UTXH327O0ZAaiT
         H4SQ8iv9Grm4uh7YYRcLaAQwZwujvP3O0ja78wy+4eAfXeJCqQ15WsJ2m3mVV8VCY31z
         iqTw==
X-Gm-Message-State: AO0yUKWOkRV9SiVwEQQRX468SM5S9UlBz1FvlL7+FZ8R0ceQzFAl3wN8
	YB0PhBBtp4qXwvU19yR6B3RifpFGRug1zzGkNOU8DQ==
X-Google-Smtp-Source: AK7set8HKJ7J6EprwhWlIjoypiaQ1a06IDT3nY9Mq/P6X9r1HbjELYnAC6RRiS3AaoatwabMI4S9y73OEs7Gwb+ynPs=
X-Received: by 2002:a25:43:0:b0:864:9aee:7b7e with SMTP id 64-20020a250043000000b008649aee7b7emr91952yba.244.1675713368611;
 Mon, 06 Feb 2023 11:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230207073610.3290391-1-rajat.khandelwal@linux.intel.com>
In-Reply-To: <20230207073610.3290391-1-rajat.khandelwal@linux.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 6 Feb 2023 11:55:57 -0800
Message-ID: <CACeCKad1suBNrpPOtKnHaLZmLEpgV4ExA53ermqv50viSSnLdA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Avoid fetching the type-C parameters again
To: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rajat.khandelwal@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Rajat,

Please use the right header in the commit message. There are plenty of
examples in the git log.

On Sun, Feb 5, 2023 at 11:34 PM Rajat Khandelwal
<rajat.khandelwal@linux.intel.com> wrote:
>
> The struct 'cros_typec_port' incorporates three type-C parameters,
> 'ori_sw', 'retimer', and 'mux'.
> These parameters in the struct 'typec_port' are being already
> configured when 'typec_register_port' is being called.
>
> The bigger picture - 'typec_register_port' can return an error and
> the type-C parameters could go unconfigured. However, the callback
> will return EPROBE_DEFER and the driver will again be getting probed
> trying to configure them again.
> However, currently, they are again tried to get fetched for the
> 'cros_typec_port' struct, which sometimes could result in an error
> and these parameters could go unconfigured (no provision of deferring
> the probe in this case, so we are left with unconfigured parameters).

This is by design. If the switch handles cannot be obtained for any reason
other that -EPROBE_DEFER, we will not re-attempt to acquire them, and
should continue driver probe and carry on with limited functionality.

If there is a sporadic error other than -EPROBE_DEFER, that points to a
deeper issue in firmware which should be investigated.

>
> Hence, assign the parameters to the corresponding ones in the struct
> 'typec_port' after they are fetched in 'typec_register_port'.
>
> Signed-off-by: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 58 ++++++++++---------------
>  1 file changed, 22 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 001b0de95a46..0265c0d38bd6 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -24,6 +24,8 @@
>  #include <linux/usb/typec_tbt.h>
>  #include <linux/usb/role.h>
>
> +#include "../../usb/typec/class.h"

That is a local header. We cannot use it outside of drivers/usb/typec/

> +
>  #define DRV_NAME "cros-ec-typec"
>
>  #define DP_PORT_VDO    (DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
> @@ -141,47 +143,17 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
>         return 0;
>  }
>
> -static int cros_typec_get_switch_handles(struct cros_typec_port *port,
> -                                        struct fwnode_handle *fwnode,
> -                                        struct device *dev)
> +static int cros_typec_get_role_switch_handle(struct cros_typec_port *port,
> +                                            struct fwnode_handle *fwnode,
> +                                            struct device *dev)
>  {
> -       port->mux = fwnode_typec_mux_get(fwnode, NULL);
> -       if (IS_ERR(port->mux)) {
> -               dev_dbg(dev, "Mux handle not found.\n");
> -               goto mux_err;
> -       }
> -
> -       port->retimer = fwnode_typec_retimer_get(fwnode);
> -       if (IS_ERR(port->retimer)) {
> -               dev_dbg(dev, "Retimer handle not found.\n");
> -               goto retimer_sw_err;
> -       }
> -
> -       port->ori_sw = fwnode_typec_switch_get(fwnode);
> -       if (IS_ERR(port->ori_sw)) {
> -               dev_dbg(dev, "Orientation switch handle not found.\n");
> -               goto ori_sw_err;
> -       }
> -
>         port->role_sw = fwnode_usb_role_switch_get(fwnode);
>         if (IS_ERR(port->role_sw)) {
>                 dev_dbg(dev, "USB role switch handle not found.\n");
> -               goto role_sw_err;
> +               return -ENODEV;
>         }
>
>         return 0;
> -
> -role_sw_err:
> -       typec_switch_put(port->ori_sw);
> -       port->ori_sw = NULL;
> -ori_sw_err:
> -       typec_retimer_put(port->retimer);
> -       port->retimer = NULL;
> -retimer_sw_err:
> -       typec_mux_put(port->mux);
> -       port->mux = NULL;
> -mux_err:
> -       return -ENODEV;
>  }
>
>  static int cros_typec_add_partner(struct cros_typec_data *typec, int port_num,
> @@ -363,6 +335,18 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>         return 0;
>  }
>
> +static void cros_typec_copy_port_params(struct cros_typec_port *cros_port)
> +{
> +       struct typec_port *port = cros_port->port;
> +
> +       if (IS_ERR_OR_NULL(port))
> +               return;
> +
> +       cros_port->mux = port->mux;
> +       cros_port->retimer = port->retimer;
> +       cros_port->ori_sw = port->sw;
> +}

Sorry, but this is not the right approach. These handles are
ref-counted. We intentionally
take extra references to these using the provided API. Please don't
use raw references like this.

Also, if the fwnode_*_get() functions are failing, why are we to
assume that they worked for the
Type-C class code (that code uses the same functions) [1] ?

This approach is not right.

BR,

-Prashant


[1] https://elixir.bootlin.com/linux/v6.2-rc7/source/drivers/usb/typec/class.c#L2317
