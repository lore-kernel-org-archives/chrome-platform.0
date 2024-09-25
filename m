Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFC12E71
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727285956; cv=none; b=ttoVBoN4LixFs4522kHdpN4VRLl1ocNXtJU7p24s0EQnht39Eq640lkFaNNfs3SkrtAkXOWydZadrniwu0cK/iN4ktzsY07lCl4nMa9OnYLHfofS1EpUWr5hAoruLiBWukdF9AbCRXYIQB1MBd8t/yiba4PmYdq/TeFyIalXyHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727285956; c=relaxed/simple;
	bh=qC+4OzBfHeWAAVnO/kJPIzzGDGo9CNwAPxoUhEvQU+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asuBkOwrCSMUHw4xsNFMHVjoYoyo75LGzu80Ax2Ve2JfcRnMynxzkEb6/a3Ap7MmYLbk2ONo6+jB13qzMvJ6BKXNqEFecx4lApsrrIluTeOv+ZgNls5udNc9MlPsFjui0DIjw/yn4rBCcqZk1/0gafmhvYikNT/tA66kS4qi1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ie0BIl8f; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ie0BIl8f"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso94840276.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727285953; x=1727890753; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpxLBhJ2QVf2x8ikOfUcvCWU80ZCC2HwFED15yLhiFc=;
        b=Ie0BIl8fyHpZyvpfoABgf4sjNgPo4ZlPEUzEoFBRswj3bzOFR/fChj9PqFa2dlSKtS
         f/Wm/ETHNZmn31rl3ymoo85sRgSCBDaS6woNxdu8huveLeKXOcLRlj5TlCS6NAaUQwr6
         1ZdRtZhZuc5vD7TaaF4D2kMgEzMxavPIBaRPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285953; x=1727890753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpxLBhJ2QVf2x8ikOfUcvCWU80ZCC2HwFED15yLhiFc=;
        b=ZscQMppEG1fWBQgzma8i8RoGgg7Z+RdUcB54E1+wjYNmygn/6H/NwEza4T3ensZ00a
         hionNaGefDfooF5BTuMhP3xKGAWd4wxKuj1ybQhD5z+ew7ITlh13Wljm1/c0f+REZbaJ
         a21jqwLRft8RKEk520cDynvnSn1j3FCRwNKLD2cMVLWKey1KiD93zqptV6ZiojwL5kbz
         vWeCLnjv36jj4Bk9kJYJ0CtiT2E+hSySxZxoo0qWzZ4LPXQlEAxlvz11Rl49XCeE1DN8
         5bcYpSEBCSkD0gNnNs1ibJUmHsY1eD81LhUWkt3rfQq76JpI/fmUgdt3eN7YCe8P5wKQ
         D9mw==
X-Forwarded-Encrypted: i=1; AJvYcCVNf5OZN9Gca/g18A+3nFHB9D2ZUG7SmSsgBFEyx/DUOVjVXhONqgNkFVV4dCsFEC3JI+THIGwxQ3V0X5fKQY8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+JKOO00r1Qgg8iY9mPOS+pwO2tjcpXTnVb7WSHesjJh6Cgdn4
	5N9JUoZ1JHSOTy7+IW/ENZPNq10dluBWFY7r3TB000klXNS+GG8ENTCrb1IMX3b2yKLkaavSYGW
	mcQuI8tX3IFrqsQeNFma5C24mzxGEV59o4i+bQIwxEfiJYc+6ww==
X-Google-Smtp-Source: AGHT+IHoeJYE0kiOXCjFqm5HHKKO5W0RciwhvO8ebo0vvHQt0VZEPxHt/5a9GU1rRQXEcwBldVQ+HbLXzK5kZcEDDEw=
X-Received: by 2002:a05:690c:4289:b0:6e2:1a41:ebe5 with SMTP id
 00721157ae682-6e21d9f2ec5mr23687327b3.41.1727285953595; Wed, 25 Sep 2024
 10:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid> <vnemjw6uo3sydriabdrzwinbnam2xitrezrw3ztcymi63zakep@2rruplyjzuol>
In-Reply-To: <vnemjw6uo3sydriabdrzwinbnam2xitrezrw3ztcymi63zakep@2rruplyjzuol>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 10:39:00 -0700
Message-ID: <CANFp7mVir-XEuVBd+kbQq0+5Si0CBo8TNxcdNpG6X+PDR-J1Zw@mail.gmail.com>
Subject: Re: [PATCH 8/8] platform/chrome: cros_ec_typec: Disable auto_enter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:03=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:25:09AM GMT, Abhishek Pandit-Subedi wrote:
> > Altmodes with cros_ec are either automatically entered by the EC or
> > entered by typecd in userspace so we should not auto enter from the
> > kernel.
>
> This makes policy decision for the whole platform. Consider somebody
> running normal Linux distro on chromebooks. Can this be configured by
> the userspace itself?

This is just the default for when the driver registers. You will then
find that there is now a sysfs entry for auto_enter that you can
control from userspace to allow you to auto-enter the mode on partner
attach (which you could probably write a udev rule for).

I still need to send a follow-up for how to handle auto-enter when
there are multiple modes available on the partner that are all
enabled. This first patch series is mostly about supporting existing
use-case for ChromeOS.


>
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> >  drivers/platform/chrome/cros_ec_typec.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index ec13d84d11b8..e06a0f2712ce 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -294,6 +294,7 @@ static int cros_typec_register_port_altmodes(struct=
 cros_typec_data *typec,
> >       desc.svid =3D USB_TYPEC_DP_SID;
> >       desc.mode =3D USB_TYPEC_DP_MODE;
> >       desc.vdo =3D DP_PORT_VDO;
> > +     desc.no_auto_enter =3D true;
> >       amode =3D cros_typec_register_displayport(port, &desc,
> >                                               typec->ap_driven_altmode)=
;
> >       if (IS_ERR(amode))
> > @@ -314,6 +315,7 @@ static int cros_typec_register_port_altmodes(struct=
 cros_typec_data *typec,
> >               memset(&desc, 0, sizeof(desc));
> >               desc.svid =3D USB_TYPEC_TBT_SID;
> >               desc.mode =3D TYPEC_ANY_MODE;
> > +             desc.no_auto_enter =3D true;
> >               amode =3D cros_typec_register_thunderbolt(port, &desc);
> >               if (IS_ERR(amode))
> >                       return PTR_ERR(amode);
> > --
> > 2.46.0.792.g87dc391469-goog
> >
>
> --
> With best wishes
> Dmitry
