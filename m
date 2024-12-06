Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5D1714DF
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733523837; cv=none; b=KmXT2hkyGy1qEAXfGnGDeY7i1c0cFC961m6P4NaUL888ALslHhb/uSXDPNpw3H0jDOkjH6ct4lB8r0uFZv16QLtqQNZ03I6rOIhHEA3lKFyhsQHZs2qe7xmmQK2R91+bRJuANyephMQ6dce9QPi5Km0WJGROPfmAurfkmOQsBeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733523837; c=relaxed/simple;
	bh=BFRVP8QJ1jTTOU/kdYZzMKrkU6zcwHmiWnXiKyi48g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhiXU4okZZAM2iRCsb1VS+d0B+V5Sk5cKaTGF7QNBlQzsfhsxS2WnOVPVIxvIMUZ0+R/RdRkA6hq38JNiYWWjZu9gdWesjzHyv3YYEjFSPW1DvehVgcoK9S5fupKyBwoPp9I5DoUA955DhVgoQ3DAyYHC1cK1ydra2FCrrmugqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M3R0K+CR; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M3R0K+CR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ef6a67834fso23919907b3.2
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 14:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733523834; x=1734128634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcxqDoLcfglUDjBpzfzKd7fFBqXuxl27aRp+AD+qiWY=;
        b=M3R0K+CRVXLHdTqN9S4/hrXpsHt7mVJee8LOoJ2nk8t//8txdKSx/orTd99yp9rkJs
         H3wpFWU7MvL57MWfccTUsAyfhNWhyeiXXemRfc/cpp6FfaQ9RV11jrvF0rvyh2D8fHtt
         4dVAtv8jt0Uu2r2m+dpb2mS6bpdOEmM6fiJBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523834; x=1734128634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcxqDoLcfglUDjBpzfzKd7fFBqXuxl27aRp+AD+qiWY=;
        b=qGLH7gX4l3JRdUNoiCjIF0gxmNshfFQeACdjtGueOhwClvVIKt5jlf74/69wyZU3Yg
         wK/7RaTDptoJBct5LbombLVSExg8ErKMKLxoJndtTVg2yCcbPpq4fLoauMGLtSHn6V9y
         KjMmerKP2lycV8SstMZq0deao42gWW9yH5qGw8VwHG0btrkhEt0eFGSB48iQLhHzCku/
         U7YDrh4y6tU1V+L8bcp1xK3jG1GsZ8AMXNdB21GH92nNJ5gxg7nxsjAFog37o5BWUU1Q
         42TCfVsTVJgdyEaPZR/I/z6xvCTOEsXMDEGzECYAztcJaqbLelViAKfqHT+Tk+Z3Q4I2
         qFvw==
X-Forwarded-Encrypted: i=1; AJvYcCWrsJkUPb6O0FNys7zeccXZf96BfPitpDxm9ncJyilcEvOt9ue99D7axVeeGA0WUennQI4C0apMBmk5y4BFijM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX+Nbv7qaKvboNCzhrBcDj4ZbR47klIVVZZGw0oTE5jqGUXuYt
	kl6W4BiayVh3PMiGReh/43P0LKs619TtInEhjqT2Nne1h600QjycwYqZoOZm1pA4sqp6pAC8MWe
	vFgcfDTKZOf/3gpqTbeWTo9meb3Cgfg+MpzbL
X-Gm-Gg: ASbGnctgHMJXXguzdkMeXb8XUBUU3yMEsnl6LRpOhld+kNZ/Q9S3DNCOXW4i+FTmXnq
	MlejaHx7TSahZwvy35HFvM16vh/oFGx4=
X-Google-Smtp-Source: AGHT+IFJZl1X/HsOmHx3MumA2Bu+aPWsN8Qnr8ieKIx6TjqjsWzLdh0pHn0IjB1Z3tjGNQ/j5r6oPDCRf6eJqgPn4RU=
X-Received: by 2002:a05:690c:a86:b0:6ef:a227:c099 with SMTP id
 00721157ae682-6efe3bcf5femr71483887b3.2.1733523834162; Fri, 06 Dec 2024
 14:23:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
 <20241107112955.v3.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
 <zbtwtfywopvuh5b6skzxf53if7s7lxf53x6uxqnenpe3mipsdg@zdk7wfp7mqbg>
 <CANFp7mVDpi_g=9LiDZ1mu+GHwkmLVXf7_MnOewFs-Zvu9gqLUQ@mail.gmail.com> <lxu6yktosg57g4qpjua7kfqcg6x27qbojftozkeuzc2wmpsxjb@mgid32lssihf>
In-Reply-To: <lxu6yktosg57g4qpjua7kfqcg6x27qbojftozkeuzc2wmpsxjb@mgid32lssihf>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 6 Dec 2024 14:23:42 -0800
Message-ID: <CANFp7mWi2WXTSNeEmXcnzxJV=QuKj_=Y+f6Q_gbSj9v4a6Pt4w@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] platform/chrome: cros_ec_typec: Thunderbolt support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev, jthies@google.com, 
	akuchynski@google.com, pmalani@chromium.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 2:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Nov 13, 2024 at 08:01:57PM -0800, Abhishek Pandit-Subedi wrote:
> > On Fri, Nov 8, 2024 at 10:41=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, Nov 07, 2024 at 11:29:59AM -0800, Abhishek Pandit-Subedi wrot=
e:
> > > > Add support for entering and exiting Thunderbolt alt-mode using AP
> > > > driven alt-mode.
> > > >
> > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > > - Fix usage of TBT sid and mode.
> > > > - Removed unused vdm operations during altmode registration
> > > >
> > > > Changes in v2:
> > > > - Refactored thunderbolt support into cros_typec_altmode.c
> > > >
> > > >  drivers/platform/chrome/Makefile             |  3 +
> > > >  drivers/platform/chrome/cros_ec_typec.c      | 23 +++---
> > > >  drivers/platform/chrome/cros_typec_altmode.c | 85 ++++++++++++++++=
++++
> > > >  drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
> > > >  4 files changed, 114 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/ch=
rome/Makefile
> > > > index 2f90d4db8099..b9b1281de063 100644
> > > > --- a/drivers/platform/chrome/Makefile
> > > > +++ b/drivers/platform/chrome/Makefile
> > > > @@ -21,6 +21,9 @@ cros-ec-typec-objs                  :=3D cros_ec_=
typec.o cros_typec_vdm.o
> > > >  ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
> > > >       cros-ec-typec-objs              +=3D cros_typec_altmode.o
> > > >  endif
> > > > +ifneq ($(CONFIG_TYPEC_TBT_ALTMODE),)
> > > > +     cros-ec-typec-objs              +=3D cros_typec_altmode.o
> > > > +endif
> > >
> > > Doesn't this also result in the object file being included twice and
> > > thus in a duplicate symbols declaration?
> >
> > I was trying to figure out how to add this file if either of those
> > config options existed in
> > https://docs.kernel.org/kbuild/makefiles.html#built-in-object-goals-obj=
-y
> > and it says, "Duplicates in the lists are allowed: the first instance
> > will be linked into built-in.a and succeeding instances will be
> > ignored."
> >
> > Is there a preferred way of doing the following in the Makefile:
> >     if (defined(CONFIG_TYPEC_TBT_ALTMODE) ||
> > defined(CONFIG_TYPEC_DP_ALTMODE)) {...}
> >
> > I briefly considered the following and dropped it because it is
> > terrible readability-wise:
> >   ifneq ($(CONFIG_TYPEC_TBT_ALTMODE)$(CONFIG_TYPEC_DP_ALTMODE),)
>
> The usual way would to define new Kconfig symbol:
>
> config CROS_EC_TYPEC_ALTMODES
>         bool # Note, no description here, don't show in menuconfig
>         help
>           Selectable symbol to enable altmodes
>
> config CROS_EC_TYPEC
>         ...
>         select CROS_EC_TYPEC_ALTMODES if CONFIG_TYPEC_DP_ALTMODE
>         select CROS_EC_TYPEC_ALTMODES if CONFIG_TYPEC_TBT_ALTMODE
>         ...
>
> ----
>
> cros-ec-typec-$(CONFIG_CROS_EC_TYPEC_ALTMODES) +=3D cros_typec_altmode.o
>
> >
> > >
> > > >  obj-$(CONFIG_CROS_EC_TYPEC)          +=3D cros-ec-typec.o
> > > >
> > > >  obj-$(CONFIG_CROS_EC_LPC)            +=3D cros_ec_lpcs.o
> > > > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/plat=
form/chrome/cros_ec_typec.c
> > > > index 3a6f5f2717b9..558b618df63c 100644
> > > > --- a/drivers/platform/chrome/cros_ec_typec.c
> > > > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > > > @@ -302,18 +302,19 @@ static int cros_typec_register_port_altmodes(=
struct cros_typec_data *typec,
> > > >
> > > >       /*
> > > >        * Register TBT compatibility alt mode. The EC will not enter=
 the mode
> > > > -      * if it doesn't support it, so it's safe to register it unco=
nditionally
> > > > -      * here for now.
> > > > +      * if it doesn't support it and it will not enter automatical=
ly by
> > > > +      * design so we can use the |ap_driven_altmode| feature to ch=
eck if we
> > > > +      * should register it.
> > > >        */
> > > > -     memset(&desc, 0, sizeof(desc));
> > > > -     desc.svid =3D USB_TYPEC_TBT_SID;
> > > > -     desc.mode =3D TYPEC_ANY_MODE;
> > > > -     amode =3D typec_port_register_altmode(port->port, &desc);
> > > > -     if (IS_ERR(amode))
> > > > -             return PTR_ERR(amode);
> > > > -     port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> > > > -     typec_altmode_set_drvdata(amode, port);
> > > > -     amode->ops =3D &port_amode_ops;
> > > > +     if (typec->ap_driven_altmode) {
> > > > +             memset(&desc, 0, sizeof(desc));
> > > > +             desc.svid =3D USB_TYPEC_TBT_SID;
> > > > +             desc.mode =3D TBT_MODE;
> > > > +             amode =3D cros_typec_register_thunderbolt(port, &desc=
);
> > > > +             if (IS_ERR(amode))
> > > > +                     return PTR_ERR(amode);
> > > > +             port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> > > > +     }
> > > >
> > > >       port->state.alt =3D NULL;
> > > >       port->state.mode =3D TYPEC_STATE_USB;
> > > > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers=
/platform/chrome/cros_typec_altmode.c
> > > > index 3598b8a6ceee..9cf2cef6c277 100644
> > > > --- a/drivers/platform/chrome/cros_typec_altmode.c
> > > > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > > > @@ -8,6 +8,7 @@
> > > >  #include "cros_ec_typec.h"
> > > >
> > > >  #include <linux/usb/typec_dp.h>
> > > > +#include <linux/usb/typec_tbt.h>
> > > >  #include <linux/usb/pd_vdo.h>
> > > >
> > > >  #include "cros_typec_altmode.h"
> > > > @@ -67,6 +68,8 @@ static int cros_typec_altmode_enter(struct typec_=
altmode *alt, u32 *vdo)
> > > >
> > > >       if (data->sid =3D=3D USB_TYPEC_DP_SID)
> > > >               req.mode_to_enter =3D CROS_EC_ALTMODE_DP;
> > > > +     else if (data->sid =3D=3D USB_TYPEC_TBT_SID)
> > > > +             req.mode_to_enter =3D CROS_EC_ALTMODE_TBT;
> > > >       else
> > > >               return -EOPNOTSUPP;
> > > >
> > > > @@ -196,6 +199,53 @@ static int cros_typec_displayport_vdm(struct t=
ypec_altmode *alt, u32 header,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int cros_typec_thunderbolt_vdm(struct typec_altmode *alt, u=
32 header,
> > > > +                                   const u32 *data, int count)
> > > > +{
> > > > +     struct cros_typec_altmode_data *adata =3D typec_altmode_get_d=
rvdata(alt);
> > > > +
> > > > +     int cmd_type =3D PD_VDO_CMDT(header);
> > > > +     int cmd =3D PD_VDO_CMD(header);
> > > > +     int svdm_version;
> > >
> > > I suppose that with the current approach this misses the ap_mode_entr=
y
> > > check. If it gets moved to cros_typec_altmode_vdm(), then it should b=
e
> > > okay.
> >
> > We don't register the thunderbolt port driver if ap_mode_entry is
> > false so it's an unnecessary check.
>
> Why don't you register it? It would allow userspace to understand, what
> is happening, e.g. that the Type-C has switched to the TBT mode.

Cros-EC does not support automatic entry of Thunderbolt/USB4 (i.e. all
firmware that supports TBT/USB4 MUST set ap_mode_entry).

>
> >
> > >
> > > > +
> > > > +     svdm_version =3D typec_altmode_get_svdm_version(alt);
> > > > +     if (svdm_version < 0)
> > > > +             return svdm_version;
> > > > +
> > > > +     switch (cmd_type) {
> > > > +     case CMDT_INIT:
> > > > +             if (PD_VDO_SVDM_VER(header) < svdm_version) {
> > > > +                     typec_partner_set_svdm_version(adata->port->p=
artner,
> > > > +                                                    PD_VDO_SVDM_VE=
R(header));
> > > > +                     svdm_version =3D PD_VDO_SVDM_VER(header);
> > > > +             }
> > > > +
> > > > +             adata->header =3D VDO(adata->sid, 1, svdm_version, cm=
d);
> > > > +             adata->header |=3D VDO_OPOS(adata->mode);
> > > > +
> > > > +             switch (cmd) {
> > > > +             case CMD_ENTER_MODE:
> > > > +                     /* Don't respond to the enter mode vdm becaus=
e it
> > > > +                      * triggers mux configuration. This is handle=
d directly
> > > > +                      * by the cros_ec_typec driver so the Thunder=
bolt driver
> > > > +                      * doesn't need to be involved.
> > > > +                      */
> > > > +                     break;
> > > > +             default:
> > > > +                     adata->header |=3D VDO_CMDT(CMDT_RSP_ACK);
> > > > +                     schedule_work(&adata->work);
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             break;
> > > > +     default:
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +
> > > >  static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 h=
eader,
> > > >                                     const u32 *data, int count)
> > > >  {
> > > > @@ -204,6 +254,9 @@ static int cros_typec_altmode_vdm(struct typec_=
altmode *alt, u32 header,
> > > >       if (adata->sid =3D=3D USB_TYPEC_DP_SID)
> > > >               return cros_typec_displayport_vdm(alt, header, data, =
count);
> > > >
> > > > +     if (adata->sid =3D=3D USB_TYPEC_TBT_SID)
> > > > +             return cros_typec_thunderbolt_vdm(alt, header, data, =
count);
> > > > +
> > > >       return -EINVAL;
> > > >  }
> > > >
> > > > @@ -273,3 +326,35 @@ cros_typec_register_displayport(struct cros_ty=
pec_port *port,
> > > >       return alt;
> > > >  }
> > > >  #endif
> > > > +
> > > > +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> > > > +struct typec_altmode *
> > > > +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> > > > +                             struct typec_altmode_desc *desc)
> > > > +{
> > > > +     struct typec_altmode *alt;
> > > > +     struct cros_typec_altmode_data *data;
> > > > +
> > > > +     alt =3D typec_port_register_altmode(port->port, desc);
> > > > +     if (IS_ERR(alt))
> > > > +             return alt;
> > > > +
> > > > +     data =3D devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> > > > +     if (!data) {
> > > > +             typec_unregister_altmode(alt);
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +     }
> > > > +
> > > > +     INIT_WORK(&data->work, cros_typec_altmode_work);
> > > > +     data->alt =3D alt;
> > > > +     data->port =3D port;
> > > > +     data->ap_mode_entry =3D true;
> > > > +     data->sid =3D desc->svid;
> > > > +     data->mode =3D desc->mode;
> > > > +
> > > > +     typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> > > > +     typec_altmode_set_drvdata(alt, data);
> > > > +
> > > > +     return alt;
> > > > +}
> > > > +#endif
> > > > diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers=
/platform/chrome/cros_typec_altmode.h
> > > > index c6f8fb02c99c..810b553ddcd8 100644
> > > > --- a/drivers/platform/chrome/cros_typec_altmode.h
> > > > +++ b/drivers/platform/chrome/cros_typec_altmode.h
> > > > @@ -31,4 +31,18 @@ static inline int cros_typec_displayport_status_=
update(struct typec_altmode *alt
> > > >       return 0;
> > > >  }
> > > >  #endif
> > > > +
> > > > +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> > > > +struct typec_altmode *
> > > > +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> > > > +                             struct typec_altmode_desc *desc);
> > > > +#else
> > > > +static inline struct typec_altmode *
> > > > +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> > > > +                             struct typec_altmode_desc *desc)
> > > > +{
> > > > +     return typec_port_register_altmode(port->port, desc);
> > > > +}
> > > > +#endif
> > > > +
> > > >  #endif /* __CROS_TYPEC_ALTMODE_H__ */
> > > > --
> > > > 2.47.0.277.g8800431eea-goog
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
