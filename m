Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297A45FBBA
	for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726350667; cv=none; b=Am72FsWtQaOMNjLs/Pg3Vo4cf1a7IdQjGh5mDv5d6d9BH4tuhlEWqriI98f8MwKWXpwJAxAr5idsZ3/15NvDsT8jm6PRHSKWKSoqWGLoyiTppnI6QmSgYNrlVRuzOg9ewV9CTYJWbb5YhiZUkU7Fo4vBXS24jRRVrSiQc1eyyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726350667; c=relaxed/simple;
	bh=oECQKR+o7oR4aWVTxUqVAlb9CGCNswo07bNaGltmOmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsOYWoQNSe6JV0MgB6cIyFO/ZUyqiUitTlAcNJ/V4CVyR5DNPrDMzt2tnr+SbsmklaX1OI7kRBQzl663xfxJIm8/0Fg4RfVkV8JMDZX6qwfXkBFGt3nHsDBLr3aTfCPkikcMFB6pKQD7Z6LSp8ymdNnVXSrqONAaIwTEHsBO9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oOZUYjus; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oOZUYjus"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365928acd0so3651309e87.2
        for <chrome-platform@lists.linux.dev>; Sat, 14 Sep 2024 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726350664; x=1726955464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfmpYUKiZBoYJxaXCZNOzoEowtv+ye5+GIly97iMOVc=;
        b=oOZUYjusW3U1+ZWVHgG6UD3u+QUGkdut1kbo5798UwsFcmscuOWcvXWlDenRt4q4kk
         yJxJVoFKi8buSVRdmZQkdNQenRgtPITnR2FguYNhgq7fFdmCC1s1T7MUy2/6Mv4D+SLx
         n7WJHb+lEqpQEJ+XAH325WNPnrsDm54+bUmpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726350664; x=1726955464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfmpYUKiZBoYJxaXCZNOzoEowtv+ye5+GIly97iMOVc=;
        b=YXaK5Kx7sJM+UHe5e7wtXk9UY20+3HTpNDleqjfoedtzV8/IgDa/PlMFzOtuFBwTqg
         drRKTgxYeZMSQRsxltW/pswaraFUQ4XY5mjR3nlyvLN6rp7X3SqSNu5KS6prfmrDEjDv
         5N1Uu/rc6BX6bcJCM8SF73wsxFPesKjPukricI+Dn9KE+gTVMVaOrzFNTMcC//bfw5oB
         9FbrO+OxgcY2cl2diDjb7Dq72GFDUoB8Y+hkTb1fvZIxVHg+fKIcQTiqVMWvjXK7H124
         KlsARHCbNEgQN+1uiPacoqFIERtvOdtD3sMd6mHaAH57LrSfpV/oMnOwqYRzAf+GbmqA
         doPA==
X-Forwarded-Encrypted: i=1; AJvYcCUAZC6d5CE/Q+pyCNTUHoWNuHhYP7P7Wb+S6xn3iwe4xRtJ88ILr27PH8BdarhRwuITXNC8Cgyu0uj5yN8zRwo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP4ubinzlXhndESFwxHDJm1ncCzDZfqlc+07bGE23TLZTXZh+5
	ZSkoMdBL9th4KVWMvw9iBWXWd57cSXgnyeGZQj+w6KWfDimqEMA8jjsJzFv3qnK9AcdVy1OfWwc
	LmCozWGW7EbxiZ/fShx0+TwiyLUaKSyJ//fU=
X-Google-Smtp-Source: AGHT+IFgSycBRnWfO8N5uMnakNDOmBrL2NCJapreoOOW7tcXkT2z4Ms9//OPjSdwxF5awDRUkJU7rCo715tyOjYkGZI=
X-Received: by 2002:a05:6512:3f0d:b0:52c:88d7:ae31 with SMTP id
 2adb3069b0e04-53678feb54cmr6326788e87.48.1726350663255; Sat, 14 Sep 2024
 14:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-5-ukaszb@chromium.org>
 <ZuGZNyJkIreUhoc0@kuha.fi.intel.com>
In-Reply-To: <ZuGZNyJkIreUhoc0@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sat, 14 Sep 2024 23:50:52 +0200
Message-ID: <CALwA+NZuR3M=rMACWJLch8OMPUQ9W1MBcbjNtOjSrqb-oXBMmw@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] usb: typec: cros_ec_ucsi: Use complete instead of resume
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 3:21=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> On Tue, Sep 10, 2024 at 10:15:23AM +0000, =C5=81ukasz Bartosik wrote:
> > From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > On platforms using cros_ec_lpc, resume is split into .resume_early and
> > .complete. To avoid missing EC events, use .complete to schedule work
> > when resuming.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > index 20e608097fc6..422b3b14028c 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -241,15 +241,18 @@ static int __maybe_unused cros_ucsi_suspend(struc=
t device *dev)
> >       return 0;
> >  }
> >
> > -static int __maybe_unused cros_ucsi_resume(struct device *dev)
> > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> >  {
> >       struct cros_ucsi_data *udata =3D dev_get_drvdata(dev);
> > -
> > -     return ucsi_resume(udata->ucsi);
> > +     ucsi_resume(udata->ucsi);
> >  }
> >
> > -static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
> > -                      cros_ucsi_resume);
> > +static const struct dev_pm_ops cros_ucsi_pm_ops =3D {
> > +#ifdef CONFIG_PM_SLEEP
> > +     .suspend =3D cros_ucsi_suspend,
> > +     .complete =3D cros_ucsi_complete,
> > +#endif
> > +};
> >
> >  static const struct platform_device_id cros_ucsi_id[] =3D {
> >       { KBUILD_MODNAME, 0 },
>
> Please merge this into the previous patch.
>

I will merge it.

Thanks,
Lukasz

> thanks,

>
> --
> heikki
