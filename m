Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB311D5ACE
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300602; cv=none; b=YqDdo2DM1btfaYPfb6oYUoWMXUEqfPO2f3hTu7pl9OMy9B8QLgo9s5HI7w8NsOpbkw5Ds980wFZBon7GSYjfoOf0OMpgwxntWMtFTVwIcl6a9Jjb/Sv/N41fo93bc7bdAwaphnUyEftcze012ksmGCU0fK6xSSkZKM4cIVulXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300602; c=relaxed/simple;
	bh=ufu1bVAo5GvTPqMeSZvyXyLw+NRp32KsM3FWTmCFM/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkiMFC9CZtI/buZnrdDiFJtvlTio1jEUfz0kHvBlyXVnyXT6YP8sgy3ISs3FT1F5h2L4Kno4ob4fHHD60GWtbj8kFQ0B6nIV4bbarahouVfaOLaUdHAlPBocwBHAHiwK4ER2UpGDkoDk2UHFvt5nfeISjW2Y9+uWKW+JcGX/MMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIEI5xsM; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIEI5xsM"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dddca05a60so14846857b3.0
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727300599; x=1727905399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNxWBoGQtrXvoxbTLYp7sPgZb44qwzuaJymtkJKKR3M=;
        b=DIEI5xsMssFgjy/h164jEGBf7GQlV2rX/HQlKs5X2Lb2B93WuZiV1dfmy8O4CoAjDE
         fDS6ldLbIAaz30WyDhOs0B3UGzpjBAty+MOGN1tIEWtwCL8vdBzLnwXMsI9xueeY1WCG
         AzH61JCVtlFPCWYGVTaf74efNAq6u6e8y3S1YdUvSAg2bij1Nv6IaOnrBeiG5Jq2TNF1
         Y6MCmD8erckY+9mzhq/YuLbrc+brEuaMxnxbYYtmaMEdVjTh4Ac+he6BZnIg/LGmH3NC
         WtHEnmncK0CfMqtn1CbxxMd+p0iGIuDzjCLjhUJVeJbzMg1yLkwUt1qVRSA+TlwzML3x
         YBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300599; x=1727905399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNxWBoGQtrXvoxbTLYp7sPgZb44qwzuaJymtkJKKR3M=;
        b=jUnRDwGYjxC3Z1Mq53xHg3U/P62PK3jvdjOW9uMo0t1ds4cppgYPDfMhYQnBiMQmRH
         dodmrgutOKKduXJP9votQBkdntxEVK54bSP8ZJQYzTzfxYgMMh64YkAVwI6vx462EOiu
         LVZDQl6LPn7pS//BbDRLc3ubdNcaEpiua3E9WUQK1mU3M6W9NULD6CjMfJjKQC57B8o0
         XoXpqflJDtlyyPkaIDLqgemXCdF/vp82MbDNZWVuJezyeN8H9DB7kDmg7OQExrfiIuVJ
         gdbWPIZJ5W3TNX4YqUv5/Zw9LmxZblXYfe+V0F7db/AaAL1tK5NNZMK8RNqpRCjZQVWD
         QX0A==
X-Forwarded-Encrypted: i=1; AJvYcCXi8jtCCbq6V92M0Tr0oLW01TqVQYcnv8xyYPTgL8e0jlucvSXVSFA8TK5dMsUTAdUKl2JfvGpAmNGzKEDKkD0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYWcYeuqTfPko2BnEH1FqmVaJm4xjjec+ZCj/4YWE43BjtmjCF
	S37uqABA//V58anXwG5UK8oqr2N2FcomIDDqsCl7SAsIuhxIRky7MrKCA1974mJSkIgY53etbL7
	zHWT7j80sbCsZpVq6roWnfx+201IlTAs6wZwrqg==
X-Google-Smtp-Source: AGHT+IEs3WtMy6I/o0epYdPq0lTljYR0f07/xhhSVqM1QkPWW0L69fzMyRLh7JZWwRgCQttXXsapW+5yOM9YqbOc9C8=
X-Received: by 2002:a05:690c:6482:b0:6e2:5d2:3426 with SMTP id
 00721157ae682-6e22ed8041emr10317177b3.4.1727300599382; Wed, 25 Sep 2024
 14:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
 <vnemjw6uo3sydriabdrzwinbnam2xitrezrw3ztcymi63zakep@2rruplyjzuol>
 <CANFp7mVir-XEuVBd+kbQq0+5Si0CBo8TNxcdNpG6X+PDR-J1Zw@mail.gmail.com>
 <25dcuu7bli47etvyijpi4winx4t42jwjq5ld2de3vmzkucic5j@h3wejwqyo7p2> <CANFp7mUAeqekz57yOB8oF67wZ9=f9b8decmr-maia0DYVUQ89A@mail.gmail.com>
In-Reply-To: <CANFp7mUAeqekz57yOB8oF67wZ9=f9b8decmr-maia0DYVUQ89A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Sep 2024 23:43:08 +0200
Message-ID: <CAA8EJpqiF_0bgYT8boFa4UPJWcxgw89mmfbdMVKeAP-xnFOP4g@mail.gmail.com>
Subject: Re: [PATCH 8/8] platform/chrome: cros_ec_typec: Disable auto_enter
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Sept 2024 at 23:35, Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> On Wed, Sep 25, 2024 at 2:24=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 10:39:00AM GMT, Abhishek Pandit-Subedi wrote:
> > > On Wed, Sep 25, 2024 at 10:03=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Wed, Sep 25, 2024 at 09:25:09AM GMT, Abhishek Pandit-Subedi wrot=
e:
> > > > > Altmodes with cros_ec are either automatically entered by the EC =
or
> > > > > entered by typecd in userspace so we should not auto enter from t=
he
> > > > > kernel.
> > > >
> > > > This makes policy decision for the whole platform. Consider somebod=
y
> > > > running normal Linux distro on chromebooks. Can this be configured =
by
> > > > the userspace itself?
> > >
> > > This is just the default for when the driver registers. You will then
> > > find that there is now a sysfs entry for auto_enter that you can
> > > control from userspace to allow you to auto-enter the mode on partner
> > > attach (which you could probably write a udev rule for).
> >
> > I think, a usual policy is to handle everything automatically, unless
> > userspace configures it in a different way. Otherwise it might be reall=
y
> > surprising to users, if the kernel expects an action from the
> > non-existing userspace agent.
>
>
>
> >
> > > I still need to send a follow-up for how to handle auto-enter when
> > > there are multiple modes available on the partner that are all
> > > enabled. This first patch series is mostly about supporting existing
> > > use-case for ChromeOS.
> >
> > Doesn't EC decide that, which AltMode to select?
>
> On ChromeOS systems with only DisplayPort supported, ChromeOS EC
> automatically enters DP altmode.
>
> However, systems with Thunderbolt + USB4 have the AP_DRIVEN_MODE
> feature enabled which expects the AP to enter/exit modes (due to the
> security implication of TBT PCIE tunnels). ChromeOS has a userspace
> daemon, typecd (https://chromium.googlesource.com/chromiumos/platform2/+/=
HEAD/typecd),
> which handles the mode entry policy for ChromeOS. Currently, it talks
> to the EC directly (via ectool) and this patch series is moving this
> support to the kernel so we can use sysfs instead.
>
> Currently, if you put a normal Linux distro on a ChromeOS device with
> AP_DRIVEN_MODE enabled from the EC, it will not automatically enter
> any alternate modes and there's no mechanism to do so via sysfs
> either. You will need to either port typecd or compile + deploy ectool
> to make the mode requests directly.

Well, I'd say that without a proper sysfs interface the feature is
incomplete. At the very least it must be documented in the commit
messages, so that anybody who tries to get this up and running can
find necessary userspace bits (and then can implement necessary driver
support).

Also consider extending bolt, a usual ThunderBolt daemon used on
Linux, to support new sysfs attributes.

>
> >
> > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.or=
g>
> > > > > ---
> > > > >
> > > > >  drivers/platform/chrome/cros_ec_typec.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/pl=
atform/chrome/cros_ec_typec.c
> > > > > index ec13d84d11b8..e06a0f2712ce 100644
> > > > > --- a/drivers/platform/chrome/cros_ec_typec.c
> > > > > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > > > > @@ -294,6 +294,7 @@ static int cros_typec_register_port_altmodes(=
struct cros_typec_data *typec,
> > > > >       desc.svid =3D USB_TYPEC_DP_SID;
> > > > >       desc.mode =3D USB_TYPEC_DP_MODE;
> > > > >       desc.vdo =3D DP_PORT_VDO;
> > > > > +     desc.no_auto_enter =3D true;
> > > > >       amode =3D cros_typec_register_displayport(port, &desc,
> > > > >                                               typec->ap_driven_al=
tmode);
> > > > >       if (IS_ERR(amode))
> > > > > @@ -314,6 +315,7 @@ static int cros_typec_register_port_altmodes(=
struct cros_typec_data *typec,
> > > > >               memset(&desc, 0, sizeof(desc));
> > > > >               desc.svid =3D USB_TYPEC_TBT_SID;
> > > > >               desc.mode =3D TYPEC_ANY_MODE;
> > > > > +             desc.no_auto_enter =3D true;
> > > > >               amode =3D cros_typec_register_thunderbolt(port, &de=
sc);
> > > > >               if (IS_ERR(amode))
> > > > >                       return PTR_ERR(amode);
> > > > > --
> > > > > 2.46.0.792.g87dc391469-goog
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
