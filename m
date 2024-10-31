Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F51CC888
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730413427; cv=none; b=rBLAY69dLbjxIbMqzynrAlQkt3QVHEN0dXXBW0ajX32NeAwv2kGWWPtnSXBYzG1fpZYAA8mGkPnpShYaLgQ/z7YZe3Vgusyhag0BMNoVL2c7Ap962wtBMeYuBV/UKV79QfZHpMmrHzvFp+KHhIDfoGpTPTR9adPedEOUjNIp9JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730413427; c=relaxed/simple;
	bh=XH97K11P7osuUmkltZnhQl0XqXteVSQbUcEKJEKKYbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoC39C+Nqb20Ns8FPTCLSCAXe2nvk0+XM1Qo9Lif9EqRjZCMQe/04S07Z+ziMoEES5Bqv91C4OnHL3EnJCl3/nw7DnAtYiTXtr3i7Wn41GGe3pkqNDn4znKaZOy2y939/LWtsLJS8JKvbmMU8pnKMvAukNcVhRf929RrvvXKv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MVAxvFso; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MVAxvFso"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3c3da5bcdso13374367b3.2
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730413420; x=1731018220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prB5IY1Vfsk5SbEErAY3Ww3Hgi+xB1f5jTbRgo8s4x0=;
        b=MVAxvFsokh0RDOhDiE2AXHTBKRnoZUjQ0d+c36Rx2pNFE9L3eg9JFvj/jy/LYvZn7i
         UzF8NynCk7xN92zWyvuTx8sfTPJqR64tOAeTYMMvk9j3zSLKI9ZG4FBpyGIVLIobxhJt
         TgCD8/C6pyjuiruEsM24oMd3SPtlWD5lNLAF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730413420; x=1731018220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prB5IY1Vfsk5SbEErAY3Ww3Hgi+xB1f5jTbRgo8s4x0=;
        b=Ant22jQmqUJ8JZolqDd/UAeY+c0XJ7UNTfkwl/64BLRIRxR9s+wka8MisFsOcHINag
         2Bf4xkh9QYHS0fpcCkM04wz4MLVEIrJhbj5b6VAAx5t1GTv/lLh7rpxsbWEpGEYhYSWE
         gVxOtywffFyixhc0Q07vZ52EnFJ6p9KAMISffnuR5AhSCioGZFKihRl8vZXH4ZELeW3c
         zdTOhvWsf1MIQoGe6T7iDdTb2vuu5DvYPKZHO0LraO/pTMMGB/Ji9jkTrKdQVWe6Svjg
         otz+BU3S4MVQIcQnh+JMwTPuwo8MvIQvz/9eCtayXXJPUmAUviWlRYpxovpb1hEdeRYn
         ZieQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/SHROCFOeHqkRI2pA7AAQhQj7qHiMn1VTHvRr4pOKzvhNmJv93V7btdnWpQfhqf4MkdDJJoqjMpRmCcyEGKI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ACZcO8OLqQvak48eDtsNE3iCKb7LoLWMh9w6dMgZZWlY9Ws7
	ghaYELJc+z0vA8/4jI10xYrCOD2FPpXbqmCkX8HyDajRH3fSAMeHbWniPUkp4Fcp1fTQdhYQ/Pb
	KitUp1tld4RyL/hVnm5dqYpP5n1/89qhBfcI3
X-Google-Smtp-Source: AGHT+IFQE05IwbhlZmIVRdcnYuVqZP6zlu+Bz3HsHKxJsoGEix85db9eLzB9lup8cpSeIiZu6hDgNlIBepiG1RwkZCg=
X-Received: by 2002:a05:690c:1e:b0:6e7:e76e:5852 with SMTP id
 00721157ae682-6ea3b96aaa6mr125251557b3.32.1730413419832; Thu, 31 Oct 2024
 15:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
 <20241030142833.v2.6.Ic61ced3cdfb5d6776435356061f12307da719829@changeid> <a5emtussqri2jxhchhh4rz5i54lpjij5jxcuuilnkdu2n7tdpo@g2l4xiqrxxzs>
In-Reply-To: <a5emtussqri2jxhchhh4rz5i54lpjij5jxcuuilnkdu2n7tdpo@g2l4xiqrxxzs>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 31 Oct 2024 15:23:27 -0700
Message-ID: <CANFp7mVjSjj5fWBqTc8CTNdHatBN4s-0zj7uhgpo5raOiQN2RA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] platform/chrome: cros_ec_typec: Thunderbolt support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev, jthies@google.com, 
	akuchynski@google.com, pmalani@chromium.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 11:51=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Oct 30, 2024 at 02:28:37PM -0700, Abhishek Pandit-Subedi wrote:
> > Add support for entering and exiting Thunderbolt alt-mode using AP
> > driven alt-mode.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Refactored thunderbolt support into cros_typec_altmode.c
> >
> >  drivers/platform/chrome/cros_ec_typec.c      | 29 ++++---
> >  drivers/platform/chrome/cros_typec_altmode.c | 85 ++++++++++++++++++++
> >  drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
> >  3 files changed, 116 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index 7997e7136c4c..3e043b1c1cc8 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -304,21 +304,26 @@ static int cros_typec_register_port_altmodes(stru=
ct cros_typec_data *typec,
> >       typec_altmode_set_drvdata(amode, port);
> >       amode->ops =3D &port_amode_ops;
> >  #endif
> > -
> >       /*
> >        * Register TBT compatibility alt mode. The EC will not enter the=
 mode
> > -      * if it doesn't support it, so it's safe to register it uncondit=
ionally
> > -      * here for now.
> > +      * if it doesn't support it and it will not enter automatically b=
y
> > +      * design so we can use the |ap_driven_altmode| feature to check =
if we
> > +      * should register it.
> >        */
> > -     memset(&desc, 0, sizeof(desc));
> > -     desc.svid =3D USB_TYPEC_TBT_SID;
> > -     desc.mode =3D TYPEC_ANY_MODE;
> > -     amode =3D typec_port_register_altmode(port->port, &desc);
> > -     if (IS_ERR(amode))
> > -             return PTR_ERR(amode);
> > -     port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> > -     typec_altmode_set_drvdata(amode, port);
> > -     amode->ops =3D &port_amode_ops;
> > +     if (typec->ap_driven_altmode) {
> > +             memset(&desc, 0, sizeof(desc));
> > +             desc.svid =3D USB_TYPEC_TBT_SID;
> > +             desc.mode =3D TYPEC_ANY_MODE;
> > +             amode =3D cros_typec_register_thunderbolt(port, &desc);
> > +             if (IS_ERR(amode))
> > +                     return PTR_ERR(amode);
> > +             port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> > +
> > +#if !IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> > +             typec_altmode_set_drvdata(amode, port);
> > +             amode->ops =3D &port_amode_ops;
> > +#endif
>
> Why? Usually having the code block under an #if is a frowned upon
> practice.

There are some CrosEC implementations that provide full VDM access for
mode entry and this code was previously added to support that. I'm
looking into whether this was fully deployed -- if not, I will remove
this #if block entirely in my next patch series.

Will do the same for displayport above.

>
> > +     }
> >
> >       port->state.alt =3D NULL;
> >       port->state.mode =3D TYPEC_STATE_USB;
>
> [...]
>
> > diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/pla=
tform/chrome/cros_typec_altmode.h
> > index c6f8fb02c99c..c71568314e3f 100644
> > --- a/drivers/platform/chrome/cros_typec_altmode.h
> > +++ b/drivers/platform/chrome/cros_typec_altmode.h
> > @@ -31,4 +31,18 @@ static inline int cros_typec_displayport_status_upda=
te(struct typec_altmode *alt
> >       return 0;
> >  }
> >  #endif
> > +
> > +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> > +struct typec_altmode *
> > +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> > +                             struct typec_altmode_desc *desc);
> > +#else
> > +struct typec_altmode *
>
> static inline struct ...
> LGTM otherwise

I ran allmodconfig and x86_64_defconfig but forgot to run allmodconfig
- these features :( -- argh... I'll add this to my testing steps.

>
> > +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> > +                             struct typec_altmode_desc *desc)
> > +{
> > +     return typec_port_register_altmode(port->port, desc);
> > +}
> > +#endif
> > +
> >  #endif /* __CROS_TYPEC_ALTMODE_H__ */
> > --
> > 2.47.0.163.g1226f6d8fa-goog
> >
>
> --
> With best wishes
> Dmitry
