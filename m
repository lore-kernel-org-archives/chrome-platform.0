Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5C136A
	for <chrome-platform@lists.linux.dev>; Tue, 12 Sep 2023 01:17:48 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-770ef4d36f2so192349785a.0
        for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694481467; x=1695086267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tnjpp/lycfe/g1+o8xfnP0NivTMeUFx/cpAoWuFE18=;
        b=LLo0eb3+3E5YEKJ/wnu4AhbJfQZYjong0KP/TNJb0dZP51WEMtCjkE4POpsEOU0Wi7
         sTwvhSpcekOkzZG0+TwueID004gvcTq3RfTUOeO5MPNKbBB44+EsAfeVKFuz16wKhswK
         Dy8BiVZ8/qMFFqxHS/o7TKaidZ/L2nwEkmKEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694481467; x=1695086267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tnjpp/lycfe/g1+o8xfnP0NivTMeUFx/cpAoWuFE18=;
        b=bUHSfPtF3ORiFQOBsyMYlZlngXNg861ZVfFQIQOpEu3rTWjQayYFj7OvPVi870MBMO
         6VdpjdQhxgorZMeeeVgd/P+lkAnxD7UpjXlDioVjqkoB53+CoRXrFP8C/oYVEOZiKtJE
         gXvZ02211KFHyxoGqlzjMKnLgiP7fW7EAdI16MpQPnCUGGRx8RJzfIz6gpgOAKrb0fGS
         59rfFueZOOOsyjMiLbdr/uWg513bo+OE1E4fz59pqwOPFB6oReCJfIX4e6RmsvxMnAVB
         0flErcjXs/7TFRbwB4amcTQXtgegLlq2ofngWNs3NCj6Id9O3BySKtwnjKtzD848X9bb
         IpVQ==
X-Gm-Message-State: AOJu0YylAl7yWRBZTfYfXdd4WlyYDWyttU2EKFrZpjVYmFmIB7ct6CG9
	GNHBplutUgcHnNeoX/m5CY6meNJu8+gfx8eCxwuqUA==
X-Google-Smtp-Source: AGHT+IFSwRQiPkaYhhZ0TC5wbeP9A0oiMY6H8ikvZvK9LjdFbRTQGnvpAK1r/FmhosNCsVO0GGDYu3rQZ8+RCXJ9MpE=
X-Received: by 2002:a0c:f508:0:b0:641:8e1a:d23b with SMTP id
 j8-20020a0cf508000000b006418e1ad23bmr11266928qvm.31.1694481467597; Mon, 11
 Sep 2023 18:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912005752.1532888-1-utkarsh.h.patel@intel.com> <20230912005752.1532888-4-utkarsh.h.patel@intel.com>
In-Reply-To: <20230912005752.1532888-4-utkarsh.h.patel@intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 11 Sep 2023 18:17:35 -0700
Message-ID: <CACeCKacmH19niA7gWTZCj89ZmFth0LWvkMYasYwUvVHrmFKCZw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
To: Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	heikki.krogerus@linux.intel.com, chrome-platform@lists.linux.dev, 
	andriy.shevchenko@linux.intel.com, bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Utkarsh,

On Mon, Sep 11, 2023 at 5:58=E2=80=AFPM Utkarsh Patel <utkarsh.h.patel@inte=
l.com> wrote:
>
> Displayport Alternatemode 2.1 requires cable capabilities such as cable
> signalling, cable type, DPAM version which then will be used by mux
> driver for displayport configuration. These capabilities can be derived
> from the Cable VDO.
> Added a helper macro to get the Type C cable speed when provided the
> cable VDO.
>
> Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>

Thank you for addressing the comments. This LGTM; I have one minor suggesti=
on,
but I'll leave it to USB maintainers for the final call on that comment, so=
:

Acked-by: Prashant Malani <pmalani@chromium.org>

> ---
> Changes in v3:
> - Removed use of variable cable_seepd.
> - Added helper macro of pd_vdo.h in this patch as cros_ec_typec is the us=
er.
>
> Changes in v2:
> - Remvoed feature flag specifice to DP2.1.
> - Remvoed seperate function for DP2.1.
> - Removed use of EC host coammnd to get cable details.
> - TBT cable VDO is used to get cable details.
> - Using VDO_CABLE_SPEED macro to get passive cable speed.
>
>  drivers/platform/chrome/cros_ec_typec.c | 28 +++++++++++++++++++++++++
>  include/linux/usb/pd_vdo.h              |  1 +
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index d0b4d3fc40ed..cca913400b39 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -492,6 +492,8 @@ static int cros_typec_enable_dp(struct cros_typec_dat=
a *typec,
>  {
>         struct cros_typec_port *port =3D typec->ports[port_num];
>         struct typec_displayport_data dp_data;
> +       u32 cable_tbt_vdo;
> +       u32 cable_dp_vdo;
>         int ret;
>
>         if (typec->pd_ctrl_ver < 2) {
> @@ -524,6 +526,32 @@ static int cros_typec_enable_dp(struct cros_typec_da=
ta *typec,
>         port->state.data =3D &dp_data;
>         port->state.mode =3D TYPEC_MODAL_STATE(ffs(pd_ctrl->dp_mode));
>
> +       /* Get cable VDO for cables with DPSID to check DPAM2.1 is suppor=
ted */
> +       cable_dp_vdo =3D cros_typec_get_cable_vdo(port, USB_TYPEC_DP_SID)=
;
> +
> +       /**
> +        * Get cable VDO for thunderbolt cables and cables with DPSID but=
 does not
> +        * support DPAM2.1.
> +        */
> +       cable_tbt_vdo =3D cros_typec_get_cable_vdo(port, USB_TYPEC_TBT_SI=
D);
> +
> +       if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
> +               dp_data.conf |=3D cable_dp_vdo;
> +       } else if (cable_tbt_vdo) {
> +               dp_data.conf |=3D  TBT_CABLE_SPEED(cable_tbt_vdo) << DP_C=
ONF_SIGNALLING_SHIFT;
> +
> +               /* Cable Type */
> +               if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
> +                       dp_data.conf |=3D DP_CONF_CABLE_TYPE_OPTICAL << D=
P_CONF_CABLE_TYPE_SHIFT;
> +               else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
> +                       dp_data.conf |=3D DP_CONF_CABLE_TYPE_RE_TIMER << =
DP_CONF_CABLE_TYPE_SHIFT;
> +               else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
> +                       dp_data.conf |=3D DP_CONF_CABLE_TYPE_RE_DRIVER <<=
 DP_CONF_CABLE_TYPE_SHIFT;
> +       } else if (PD_IDH_PTYPE(port->c_identity.id_header) =3D=3D IDH_PT=
YPE_PCABLE) {
> +               dp_data.conf |=3D VDO_TYPEC_CABLE_SPEED(port->c_identity.=
vdo[0]) <<
> +                               DP_CONF_SIGNALLING_SHIFT;
> +       }
> +
>         ret =3D cros_typec_retimer_set(port->retimer, port->state);
>         if (!ret)
>                 ret =3D typec_mux_set(port->mux, &port->state);
> diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
> index b057250704e8..3a747938cdab 100644
> --- a/include/linux/usb/pd_vdo.h
> +++ b/include/linux/usb/pd_vdo.h
> @@ -376,6 +376,7 @@
>          | ((vbm) & 0x3) << 9 | (sbu) << 8 | (sbut) << 7 | ((cur) & 0x3) =
<< 5   \
>          | (vbt) << 4 | (sopp) << 3 | ((spd) & 0x7))
>
> +#define VDO_TYPEC_CABLE_SPEED(vdo)     ((vdo) & 0x7)

I would suggest putting this header modification in a separate patch;
if for some reason we have to revert
the Chrome part of the change, then we won't rip this part out too
(some other driver down the road may use
the macro and would break if it were to be removed). But I'll leave it
to Heikki to determine whether that is preferred.

Thanks,

-Prashant
