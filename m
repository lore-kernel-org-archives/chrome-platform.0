Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C102D7D2E
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678509; cv=pass; b=BfBrZ+e32FxsrVANXIxDtTWRhlaV09vRMMkPyu8HzHt7tOw9dVIYSrL+kiLRI1zyYs2h3ueJgy9/0SNssX7eXw+oVKp0daryF5rP/E2ZyalXcIc4kTdPJi8Cz91JYuI4ZAUcehiMQjtzNjFtEGW9qC5LTOnAOQZlA4ZJ1Dq+tNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678509; c=relaxed/simple;
	bh=TqFVyyk6gTWcdPPR/kpD6NILCI0ocp7uuvScmO5LREY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTX2tfoofctoKqnbi2gsM0Zw3a1edykJXlTPgE6TKJWLvYZ8T8p3x3xziRx2ALI/D3InGou40aYd4yxPab+RuZmXp0eAp15PBFG1iZWJlQFu7PGYo+GbXrF2Twr/pQokoUd3xamIOr/h+b9EXtW+RY9gq7kK8hYoPmcVOAZCaN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HZmjjKRA; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HZmjjKRA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0ac29fca1so19563245ad.2
        for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 11:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768678507; cv=none;
        d=google.com; s=arc-20240605;
        b=Yws9zVhviFnlj5rUEITfSAfBi7MYBhVjjBHwFyRbfIwrLJfxU74XNeombQ2WaKWFll
         iZqJhh8R2K49wuuctKTHOqUHZzl9wfvCz1gy7ZHzWJ2w8Hvdak+xAbyN5HEB9KhRprTD
         kP1aMAoI3iOK4dIe1hU0yBAblrd2cdddccoWDGbpwiIIrdRjnOTxN+dsRharS0vz5g7s
         JPGNBinrQSIsTA4SAgFErI/u2NiFLFFEYUz8vyDMTXcoXGThOvTUu2As6+VBE4C0FO0/
         ZaLiqt3SA+8GGWFAX1uHQ7zEg9S6wmCHfgKqPao8a+4Ut5ISF0IxeRUH66lEE95K0trB
         IW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sBJUYern0gP4g1kXsrl0YD7ywgpzAWw+KQJMDqXrH9M=;
        fh=JzAujAAx3B660Vwwddo1YnDNbpCTdXRgzYc+gP7J3O0=;
        b=k8WFQZndh7FgSDb0aB+3ouct7BN1imclj58G5GMC2cIiB5Np17vIn84bwLbo0WX5ZA
         g99u5c+Wxn0M2ihanwg2tVQYdlP7cgHwX9o2xLM1UB7Cled0jmi1SWOrACViKj8h4wOY
         qsjPA4nqnQEqXG1XYDwgg6xUkRGWThtFg1fXh9NrJMlLr/cpkl9R0k9Uo57N5PWWoH68
         OxVXXzzw6qkHbvLtrtCFSiVNxcfSphY+Rq1gelyrtW+0nVgIDhDJAfFm6EDZQa6ZzLNW
         VYR4EWEN+u3mIOKYZ0ZOMc4Y4eAmgQJpB5NVlNEt/u6vdOzz405+iV8lzl++sIYaetHg
         4JiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768678507; x=1769283307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBJUYern0gP4g1kXsrl0YD7ywgpzAWw+KQJMDqXrH9M=;
        b=HZmjjKRASGOhqDJv4Ryl9QAm/5l5/KcUgmDnJMg1ctziD7QV+5w+d4P2rCj7gjyrRr
         Bx2VV3zwB9lgHRzLC8KF9U7FHlJNtBv44HXZ7LIgCVDcOXhKDQJ0PDNRswvbKM+HmnW9
         pdRHu9iGk0qwl7SZBu3wdAxoN9706c/COgZvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678507; x=1769283307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sBJUYern0gP4g1kXsrl0YD7ywgpzAWw+KQJMDqXrH9M=;
        b=AUyzLXFY8/KyPdtG5IEaVjUW6o5XKCdnPjOk16ekBECO3U7kuFuHgRIeMfcry8RcA0
         ra6H1j7oCl9vnrOPy9/filhyYj0JeG5/BbshELBMrref01bbcy/aV5X5ljmFXrLgLvKt
         w4bqh/QEq/Y5+39hH4Gm+RpdmsLppVVu6z7XX/l+4DwRiAYkDRd79PomxrH1D6o5CRkn
         6aWl6P0VBi785uRrSyC3zhP3Crlucvf63CbjkqQKKN9Qun9xhinnL8CUpktI9SMHL6yk
         5mfDGfByi7L5xFRLeQgmJfMGe2Pbs1zcgxPqm+qWstbI9shG1TT7n9IagCJI7HrSbQTf
         NQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCVAZnWqjevtsGHiQAoipsR4OT15CjOwpx0YHQ1d2X38aQ3KDUXXJuXdGAA1sQisSWHDMbPCe4ngcqFKUYv60g8=@lists.linux.dev
X-Gm-Message-State: AOJu0YygqZc4N/F5EnfioedFZpW8e5DxarXYtrglusrrW1MpZ6U4kzoM
	7h56GC+KchooF46tBfusVNKHxqSxpYCY0nt/f9BusYNvtR8LGc5skZF4wLxUAwM92VO+GLT3Mr9
	Vp2z5qWGE67YZYXlBZogfl3/fQmuZgZSXAXrjdP+1
X-Gm-Gg: AY/fxX7e9GI8kxxHTcHPDWuhyMEXGA2XZxJfGiqjynBD/W6lToUpuf76WwHcC4BXxny
	I2uA410fDD2LsNzGIsH1E3xep3CBEN1Rg/+XcGe0jFGRT9kW+Cecj1HKz2OB0pSv5leZmACWCJ+
	85jTPVPZQug2E2Vr02osuqUaJmAnFj32v9Czei/yAsHAWNIv/tBxfeEndrNkRFGikDNNpy4cCfu
	OdDzBF8QfDDBwHmLOxiL8kApSUC217tQeBFHcciptEX78Ozs5tPGSBAUYHXMTLa86lN5w==
X-Received: by 2002:a17:903:11c7:b0:2a5:8e98:1b44 with SMTP id
 d9443c01a7336-2a7175a637emr63427135ad.31.1768678506782; Sat, 17 Jan 2026
 11:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-8-akuchynski@chromium.org> <aWkAx-QjfwQGJ6Eb@kuha>
In-Reply-To: <aWkAx-QjfwQGJ6Eb@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Sat, 17 Jan 2026 20:34:54 +0100
X-Gm-Features: AZwV_Qix8YRb3f7h2HG8Ncj6wtivEszSjSskjFE8VN2Lt4Np26OhSDfbOXSzbOM
Message-ID: <CAMMMRMcpuaTpJ3=zO0SafaeRPxTkAEEQrS-mDRKFBTc3yESM6A@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] usb: typec: ucsi: Support mode selection to
 activate altmodes
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 3:59=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Tue, Jan 13, 2026 at 01:05:35PM +0000, Andrei Kuchynski kirjoitti:
> > If the ucsi port driver supports modes selection, it should implement
> > `add_partner_altmodes` and `remove_partner_altmodes` ucsi operations. W=
ith
> > these operations the driver can manage the mode selection process.
> > Once partner altmodes are registered, `add_partner_altmodes` is called =
to
> > start the mode selection. When the partner is unregistered,
> > `remove_partner_altmodes` is supposed to stop any ongoing processes and
> > clean up the resources.
> >
> > `typec_altmode_state_update` informes mode selection about the current =
mode
> > of the Type-C connector.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++++
> >  drivers/usb/typec/ucsi/ucsi.h |  4 ++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index deb210c066cb5..4a6e23b55b10c 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -314,6 +314,7 @@ void ucsi_altmode_update_active(struct ucsi_connect=
or *con)
> >  {
> >       const struct typec_altmode *altmode =3D NULL;
> >       u64 command;
> > +     u16 svid =3D 0;
> >       int ret;
> >       u8 cur;
> >       int i;
> > @@ -335,6 +336,10 @@ void ucsi_altmode_update_active(struct ucsi_connec=
tor *con)
> >       for (i =3D 0; con->partner_altmode[i]; i++)
> >               typec_altmode_update_active(con->partner_altmode[i],
> >                                           con->partner_altmode[i] =3D=
=3D altmode);
> > +
> > +     if (altmode)
> > +             svid =3D altmode->svid;
> > +     typec_altmode_state_update(con->partner, svid, 0);
> >  }
> >
> >  static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid=
)
> > @@ -609,6 +614,8 @@ static int ucsi_register_altmodes(struct ucsi_conne=
ctor *con, u8 recipient)
> >                       desc.vdo =3D alt[j].mid;
> >                       desc.svid =3D alt[j].svid;
> >                       desc.roles =3D TYPEC_PORT_DRD;
> > +                     desc.mode_selection =3D con->ucsi->ops->add_partn=
er_altmodes &&
> > +                                     con->ucsi->cap.features & UCSI_CA=
P_ALT_MODE_OVERRIDE;
>
> Can't you just use that con->typec_cap.no_mode_control flag here?
>

Thanks. It looks much better.

> Maybe also consider squashing that patch 3/8 into this one while at it.
>

I agree. Patch 3/8 was part of a mode priority series. Now there's no
point in leaving a single line of code in a separate patch.

Thank you for your review of the series!
I will send the subsequent series with all the changes.

Andrei
