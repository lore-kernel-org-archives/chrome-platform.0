Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C997F145B0C
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300129; cv=none; b=YaElCdpX4K+7lovjzbDwYNM0C+nBiDFFL2GM4cdYHE8W6FoX/hRr0DYIgdYKn9+J80fhOAEjNwjfDpFifNOkUanP+hkoc5QA7zc6mVih42QZcqLN0VQ/Le7PRojrGzmgsDtTc9Quv7gk0aCyRdK/nqxXJsGwNpovgtSurn6xNWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300129; c=relaxed/simple;
	bh=q2EhClv7uowqfWc+yJkUHR0IftpzijEAuyD/le/y+tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhNbUb8GV4Rrb5xp3qKK6DdWUQVf8MqnCvC8RXefD1TKYAGlAhvAO4KgHSfUEhAalLzinSz6Oa9gWUO1x8LGY09ZUfOhQkziZTrj/do+uz0XAvM3M+dvsAVv+kjnirQjt7gpxoQNB3Fnf2fmLupzid9GvALYRLtpSPiWU2AU+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SVthWN6k; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SVthWN6k"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6db67400db4so4427177b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727300126; x=1727904926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTn08FN5vLzO9rVd5RQtGmIp0o3LUoCpyHjARrWMfnY=;
        b=SVthWN6kmh9yNNZuD5UHC1IHUyK19bQNVDb6P8c9cAEr6u4TxI23SOy5T69TH54ftq
         oeg7zvbx5A46WvRKGSXRJvJdg8ZDnWBMcSwP9L/KmFYASxm9sZnkY1PVSNCayxpB7n2V
         LlLd6tBi6/UvFeCF34MBHJPOc0RcwogHHV8Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300126; x=1727904926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTn08FN5vLzO9rVd5RQtGmIp0o3LUoCpyHjARrWMfnY=;
        b=fLOn/nnHMLEPMEzQv1TIye9uf0PLgvwMkEsRqLJgXahMWo6JX3eNmfdJi4mOmDDCdH
         bexI8kPvE4Cx9GWiYTsXIGgi4GAkwMxnUQZoY4dVwx261te3MIFzbAwy5zwYPZzUD7qi
         6FNhAU7LHe8pXDJTcQ13WoTHj11esvxYipJT4ZFraiSos8pvjiszrfvpVbkbxNqnIORj
         9GzA6YlGqu8kHmiLabnL1cgKNWaXbk8RlO1WuJzHXQOVaAG7XRZgvBbVQC1Vjc1+LJfW
         OTiwAUafAkSbYSUncsh0t05UqoWL6ujs/C84wWh/Jbib6XfnZCmiDsuO3SyrjcvDJf2z
         keow==
X-Forwarded-Encrypted: i=1; AJvYcCWe3OVK8bjM7Il2jJn2TfM+DDPWS1x6J8RpPTEdzpXRB013Fx2chY7rvWi69rjEM4E+KXh5YR8+ud7PPTvw3s8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPlXulY+Vpmmtk/aufegRMawEMT61YE86bHYTkuMkZARljd2Y5
	iCmPckvAcRj4qqcLcv6Zj6hFYNMG0cPydsnlP56uvreObW1IUCLOwrXBVpk+METIq5JLGuU1jkQ
	TrDFPzoD1EAiznc1HkYuvgnpzLCaCD/JLU4Rh
X-Google-Smtp-Source: AGHT+IHziupVypVEkVK/CbCaXWpRCK8FetXKM/KwR70lVH1JtZYCUnM6U7a9e0A0MI4BpovvwHjM1uW6+KjC3yrr2O0=
X-Received: by 2002:a05:690c:7183:b0:6d4:b774:e503 with SMTP id
 00721157ae682-6e21d9fdd43mr29525877b3.41.1727300126618; Wed, 25 Sep 2024
 14:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
 <vnemjw6uo3sydriabdrzwinbnam2xitrezrw3ztcymi63zakep@2rruplyjzuol>
 <CANFp7mVir-XEuVBd+kbQq0+5Si0CBo8TNxcdNpG6X+PDR-J1Zw@mail.gmail.com> <25dcuu7bli47etvyijpi4winx4t42jwjq5ld2de3vmzkucic5j@h3wejwqyo7p2>
In-Reply-To: <25dcuu7bli47etvyijpi4winx4t42jwjq5ld2de3vmzkucic5j@h3wejwqyo7p2>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 14:35:14 -0700
Message-ID: <CANFp7mUAeqekz57yOB8oF67wZ9=f9b8decmr-maia0DYVUQ89A@mail.gmail.com>
Subject: Re: [PATCH 8/8] platform/chrome: cros_ec_typec: Disable auto_enter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 2:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 10:39:00AM GMT, Abhishek Pandit-Subedi wrote:
> > On Wed, Sep 25, 2024 at 10:03=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 09:25:09AM GMT, Abhishek Pandit-Subedi wrote:
> > > > Altmodes with cros_ec are either automatically entered by the EC or
> > > > entered by typecd in userspace so we should not auto enter from the
> > > > kernel.
> > >
> > > This makes policy decision for the whole platform. Consider somebody
> > > running normal Linux distro on chromebooks. Can this be configured by
> > > the userspace itself?
> >
> > This is just the default for when the driver registers. You will then
> > find that there is now a sysfs entry for auto_enter that you can
> > control from userspace to allow you to auto-enter the mode on partner
> > attach (which you could probably write a udev rule for).
>
> I think, a usual policy is to handle everything automatically, unless
> userspace configures it in a different way. Otherwise it might be really
> surprising to users, if the kernel expects an action from the
> non-existing userspace agent.



>
> > I still need to send a follow-up for how to handle auto-enter when
> > there are multiple modes available on the partner that are all
> > enabled. This first patch series is mostly about supporting existing
> > use-case for ChromeOS.
>
> Doesn't EC decide that, which AltMode to select?

On ChromeOS systems with only DisplayPort supported, ChromeOS EC
automatically enters DP altmode.

However, systems with Thunderbolt + USB4 have the AP_DRIVEN_MODE
feature enabled which expects the AP to enter/exit modes (due to the
security implication of TBT PCIE tunnels). ChromeOS has a userspace
daemon, typecd (https://chromium.googlesource.com/chromiumos/platform2/+/HE=
AD/typecd),
which handles the mode entry policy for ChromeOS. Currently, it talks
to the EC directly (via ectool) and this patch series is moving this
support to the kernel so we can use sysfs instead.

Currently, if you put a normal Linux distro on a ChromeOS device with
AP_DRIVEN_MODE enabled from the EC, it will not automatically enter
any alternate modes and there's no mechanism to do so via sysfs
either. You will need to either port typecd or compile + deploy ectool
to make the mode requests directly.

>
> > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > ---
> > > >
> > > >  drivers/platform/chrome/cros_ec_typec.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/plat=
form/chrome/cros_ec_typec.c
> > > > index ec13d84d11b8..e06a0f2712ce 100644
> > > > --- a/drivers/platform/chrome/cros_ec_typec.c
> > > > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > > > @@ -294,6 +294,7 @@ static int cros_typec_register_port_altmodes(st=
ruct cros_typec_data *typec,
> > > >       desc.svid =3D USB_TYPEC_DP_SID;
> > > >       desc.mode =3D USB_TYPEC_DP_MODE;
> > > >       desc.vdo =3D DP_PORT_VDO;
> > > > +     desc.no_auto_enter =3D true;
> > > >       amode =3D cros_typec_register_displayport(port, &desc,
> > > >                                               typec->ap_driven_altm=
ode);
> > > >       if (IS_ERR(amode))
> > > > @@ -314,6 +315,7 @@ static int cros_typec_register_port_altmodes(st=
ruct cros_typec_data *typec,
> > > >               memset(&desc, 0, sizeof(desc));
> > > >               desc.svid =3D USB_TYPEC_TBT_SID;
> > > >               desc.mode =3D TYPEC_ANY_MODE;
> > > > +             desc.no_auto_enter =3D true;
> > > >               amode =3D cros_typec_register_thunderbolt(port, &desc=
);
> > > >               if (IS_ERR(amode))
> > > >                       return PTR_ERR(amode);
> > > > --
> > > > 2.46.0.792.g87dc391469-goog
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
