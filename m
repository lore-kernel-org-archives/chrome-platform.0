Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEA57A
	for <chrome-platform@lists.linux.dev>; Mon,  8 Aug 2022 20:46:29 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31e7ca45091so93482137b3.3
        for <chrome-platform@lists.linux.dev>; Mon, 08 Aug 2022 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SAkuL+CWHr+sskRmhtp6XDeZuSpyfOvCmzjIcqmaRrk=;
        b=m9zyU+7FihaIfSo7sZZ9NL69j11ApNPQutxpG5Rzu4GroHq8Z2YDqCSWFTRtg1ip81
         CXvBy26QgE/9qS3clNK9CTWIgVAl9mzRO/UP55a605M9ufQ2LaThsi53yh4xqdbDTzjE
         W9dM0R0ncYCXh5iLfgDXDrr/t0rKjX3wxRqz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SAkuL+CWHr+sskRmhtp6XDeZuSpyfOvCmzjIcqmaRrk=;
        b=WqpHTkR1cuShlcA80U7VfR2Mx6EphDaQFHrh7ppHviXtcmkBrX8o8aKC2dPkgixgUA
         6BGk5zUXTvTWjPGFlnbA1YCnGYgObCDtW2ANMpMmSgU//Sat19jp3wQhKSPMrf3Meno8
         iuJ/aB1OWcOWTFOhaEB8EOHThSDOwWeXMROczpZDIr7dxR5fM10kV9UFjua0d8bOp80W
         ImcWrzgmrP357qi2392h7QqQnOgoaSxeATc3+sDTPKwiFjbEaPVu+P4Qswpo0iMa/vm9
         wSVccZPj+NBvNIihbev64XRqg8EBNtf3KWBHWhqCbCPtMxu8bevaJ7eg0QDfEmUfN1s2
         MNvQ==
X-Gm-Message-State: ACgBeo3A9HHb8AMXIMARKlBgOScRhIfw2BAsf8d42q+dseuF56u/Hs5x
	jQkkrtFg5g4Rd2ZXx1f35pZ9N5OTrdv8j2xzE3H/uQ==
X-Google-Smtp-Source: AA6agR40BdbM9D8v6/Ot4Mpp45X8WD4wAtwcqrIHFrOTLcbCrcc3x8XRszVP6Dt1hfe0XMdr8tt7D+mLiYVLauvavec=
X-Received: by 2002:a0d:ebc9:0:b0:31f:474a:4264 with SMTP id
 u192-20020a0debc9000000b0031f474a4264mr20203789ywe.269.1659991588919; Mon, 08
 Aug 2022 13:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CO1PR11MB48352BEA7C0C40F42BBB561196639@CO1PR11MB4835.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB48352BEA7C0C40F42BBB561196639@CO1PR11MB4835.namprd11.prod.outlook.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 8 Aug 2022 13:46:18 -0700
Message-ID: <CACeCKadyysNc65ma1_V63gg09tzeoH-qtFbRyaSfKsiS3CKSpQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Adding support for visibility of alt
 modes under their respective 'active' attributes
To: "Khandelwal, Rajat" <rajat.khandelwal@intel.com>
Cc: "bleung@chromium.org" <bleung@chromium.org>, "groeck@chromium.org" <groeck@chromium.org>, 
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rao, Abhijeet" <abhijeet.rao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rajat,

On Mon, Aug 8, 2022 at 11:32 AM Khandelwal, Rajat
<rajat.khandelwal@intel.com> wrote:
>
> Please consider the replied thread for review.
>
> -----Original Message-----
> From: Khandelwal, Rajat <rajat.khandelwal@intel.com>
> Sent: Tuesday, August 9, 2022 3:19 AM
> To: pmalani@chromium.org; bleung@chromium.org; groeck@chromium.org
> Cc: chrome-platform@lists.linux.dev; linux-kernel@vger.kernel.org; Khandelwal, Rajat <rajat.khandelwal@intel.com>; Rao, Abhijeet <abhijeet.rao@intel.com>
> Subject: [PATCH] Adding support for visibility of alt modes under their respective 'active' attributes
>
> In the current implementation of cros-ec-typec driver, 'active'
> attribute of type-C class doesn't reflect the current status of active
> mode. It's hardwired to 'no'. This patch adds the functionality to
> userspace.
> After this patch:
> localhost /sys/bus/typec/devices # cat port2-partner.1/active
> yes
> This was just an example of DP alt mode reflecting it's active status as
> 'yes', not 'no'
> Same goes for TBT alt mode.
>
> Let me know what you think of this as the userspace attribute currently
> has no significance.

For this reason alone (there is no real userspace use for this
attribute), I don't think this patch
is required. We're in the process of adding support for kernel
alternate mode drivers; that
will ensure this property is updated correctly.

Let's not add temporary solutions which we then have to carry for
years (if it can be avoided).

>
> Signed-off-by: Rajat Khandelwal <rajat.khandelwal@intel.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 52 ++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 7cb2e35c4ded..0de221ea22db 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -32,6 +32,12 @@ enum {
>         CROS_EC_ALTMODE_MAX,
>  };
>
> +/* Supported alt modes and their SVIDs */
> +enum {
> +       CROS_EC_ALTMODE_DP_SVID = 0xff01,
> +       CROS_EC_ALTMODE_TBT_SVID = 0x8087,
> +};
> +
>  /* Container for altmode pointer nodes. */
>  struct cros_typec_altmode_node {
>         struct typec_altmode *amode;
> @@ -514,25 +520,14 @@ static int cros_typec_enable_usb4(struct cros_typec_data *typec,
>  }
>
>  static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> -                               struct ec_response_usb_pd_control_v2 *pd_ctrl)
> +                               struct ec_response_usb_pd_control_v2 *pd_ctrl,
> +                               struct ec_response_usb_pd_mux_info resp)
>  {
>         struct cros_typec_port *port = typec->ports[port_num];
> -       struct ec_response_usb_pd_mux_info resp;
> -       struct ec_params_usb_pd_mux_info req = {
> -               .port = port_num,
> -       };
>         struct ec_params_usb_pd_mux_ack mux_ack;
>         enum typec_orientation orientation;
>         int ret;
>
> -       ret = cros_ec_command(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> -                             &req, sizeof(req), &resp, sizeof(resp));
> -       if (ret < 0) {
> -               dev_warn(typec->dev, "Failed to get mux info for port: %d, err = %d\n",
> -                        port_num, ret);
> -               return ret;
> -       }
> -

We shouldn't be using MUX_INFO command outside of the configure_mux() command,
or for anything other than configuration of muxes.

>         /* No change needs to be made, let's exit early. */
>         if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
>                 return 0;
> @@ -945,8 +940,14 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
>
>  static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
>  {
> +       struct cros_typec_port *port = typec->ports[port_num];
>         struct ec_params_usb_pd_control req;
> +       struct ec_params_usb_pd_mux_info req_pd_mux = {
> +               .port = port_num,
> +       };
>         struct ec_response_usb_pd_control_v2 resp;
> +       struct ec_response_usb_pd_mux_info pd_mux;
> +       struct cros_typec_altmode_node *node, *n;
>         int ret;
>
>         if (port_num < 0 || port_num >= typec->num_ports) {
> @@ -966,8 +967,16 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
>         if (ret < 0)
>                 return ret;
>
> +       ret = cros_ec_command(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> +                             &req_pd_mux, sizeof(req_pd_mux), &pd_mux, sizeof(pd_mux));
> +       if (ret < 0) {
> +               dev_warn(typec->dev, "Failed to get mux info for port: %d, err = %d\n",
> +                        port_num, ret);
> +               return ret;
> +       }
> +
>         /* Update the switches if they exist, according to requested state */
> -       ret = cros_typec_configure_mux(typec, port_num, &resp);
> +       ret = cros_typec_configure_mux(typec, port_num, &resp, pd_mux);
>         if (ret)
>                 dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
>
> @@ -986,6 +995,21 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
>         if (typec->typec_cmd_supported)
>                 cros_typec_handle_status(typec, port_num);
>
> +       list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {
> +               if (node->amode->svid == CROS_EC_ALTMODE_DP_SVID &&
> +               !(pd_mux.flags & USB_PD_MUX_DP_ENABLED))
> +                       typec_altmode_update_active(node->amode, false);
> +               else if (node->amode->svid == CROS_EC_ALTMODE_TBT_SVID &&
> +               !(pd_mux.flags & USB_PD_MUX_TBT_COMPAT_ENABLED))
> +                       typec_altmode_update_active(node->amode, false);
> +               else if (node->amode->svid == CROS_EC_ALTMODE_DP_SVID &&
> +               (pd_mux.flags & USB_PD_MUX_DP_ENABLED))
> +                       typec_altmode_update_active(node->amode, true);
> +               else if (node->amode->svid == CROS_EC_ALTMODE_TBT_SVID &&
> +               (pd_mux.flags & USB_PD_MUX_TBT_COMPAT_ENABLED))
> +                       typec_altmode_update_active(node->amode, true);
> +       }
> +
>         return 0;
>  }
>
> --
> 2.17.1
>
