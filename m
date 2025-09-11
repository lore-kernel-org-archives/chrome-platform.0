Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CBB322DB8
	for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596317; cv=none; b=HXEqk2mz9+UOxrhXGC3RK/MaPGH9LLmu1pppvJtxHSna098K2hEhSexuBLuLe2qBrDcGARRo7MMtMnbYy9KiLjq0UBttngRr1fuCX7hJiZbv+vt9GJUCiOW8a6TBcM7wsaWN7ieuP9jgPryGOdYKZoxtdjt9OEQ6ranh2C2YUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596317; c=relaxed/simple;
	bh=30pB732dvSpD7q9dayDM+pXUhrONIOSAV4FQZ3pY/bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y10Oae8LUsXDezBVYsuVQGPonOEd4HMIM1GlbguHr9krgSDngwGTWyHUEVaievAaPc6rjsaf5cbZ8NV+c1H/BSHKSxUfbpIJmDb2YlZCTQ3sWYGk8Bpx7cgvhzDgAuqORCG1jha9ODOL1YmUKZfRmxu8dD5qArZdRi3/mz6sqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l8WblHbv; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l8WblHbv"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77238a3101fso502340b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757596314; x=1758201114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnSNIIsGL0QJkjBq8jSkEXlDvUKET4SzWDX+G39CnUc=;
        b=l8WblHbv0gm3/AEYY7nQX4y1OfFFmiIt20JrVWzhle/1T7uz/8pKa55VTofj6sw/VI
         YMpBbJp57DD/VLXVWei4UcH8AjgsIXSZUOlzflntfbhQbUYYk4SQkadjFIh7gz6X5VUX
         kzi2FyMHYZZ2mY/Lg+Y1f0Z3JuaHrAiSpNzS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757596314; x=1758201114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnSNIIsGL0QJkjBq8jSkEXlDvUKET4SzWDX+G39CnUc=;
        b=LRtbgaPC/eaDXZ8R/OeG+JNwZz9Cz0RsqXFvTvO4Jo6uzJUg3vkKjl9LSdrLUtKcC6
         YNZyW0NPQE4FfR+7TZ64AsOWA5queX3gx5KTOL9yVOQS6/BQzNGt/WFSWgJmDSi+rMeW
         +CzuUbuAucDeEVbAFtNaSTprssWVX0qIGukGu7xpXOtQQqfdqtfGKNsTq7J4XMx/aSF4
         gOMmeTAcOefkOQmo190D7N8K+ixqXBc5W1XMM64cdqqMEAWXN1bGre4RahHbBORO+oOG
         mOPpfUa87voA3kLldyZNnJFGd/43AvqgcQqd+oMWWQhgko2BIDtt4bqfdTq/T23JzD6R
         QFhw==
X-Forwarded-Encrypted: i=1; AJvYcCVdpIuMSWind2EDTV7ze2LSkqD3MHugrHXMZN05aNaAIfPXHIHKlDMDg4oUpKQmYfrT9kM0KKFbJ5USNOMZQgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVqlXVN7sUzc7OIsoCDQCRBHcUznym1qdNI6Bv7CYCI1AKLIy/
	zyV0Bmj6uMk6CjfVfmHqpzt2AwCyejBb5tAHY+SSs9rCzLDDezCAhHQGLlDV/+iWVCJc8EWs8O2
	T9xZIwKaV2Q6mHwP7DjIKs7syGCZR0oq8IFlZStTD
X-Gm-Gg: ASbGnctH+kyf7XBsNSl95hACQ9IApvyAnVw93AEQp+VMXmflp77h5QK5Cbg4RNY+MRD
	S6nR2CUJ96m0BPObExpdmoANI/NxSUn2r254h13/IvBFkrBVDUd5Q3AIkbZkak3r8vnxikUjKeA
	HwzULwZE3Er+jXfPSgWQ22aJh8q+yfGOMmTxQGxT7twz6awIld8I1uGSTuidYOD3uP2yC5exkPZ
	ge4bAPXZ1ZMz+I9h06I1eaA4Sf3wYbmESm3Lsb9M/8ckQl1EhPdltM=
X-Google-Smtp-Source: AGHT+IHR54Uv5sXhW+5shf/e3Iiyri5rkGm2hFV6EnjQ5+AlLih9aJbCpQzAuzZp0og02D4GvJMm+sWCl2kESSa5I8I=
X-Received: by 2002:a05:6a20:3d86:b0:246:2c:114 with SMTP id
 adf61e73a8af0-25344eb93afmr26429539637.47.1757596314440; Thu, 11 Sep 2025
 06:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-5-akuchynski@chromium.org> <2025091029-snarl-decimal-aea2@gregkh>
 <CAMMMRMdOiGQdmgQ7COa1Nf9Rh9BQLD79TJ77VW4ejadx_bNyeg@mail.gmail.com>
 <2025091117-herring-crazy-d13c@gregkh> <CAMMMRMck=YzbN6g8-4qUx=YX+=S4HgKqHaYoUuQ0CsJUYd9GOw@mail.gmail.com>
 <2025091106-absinthe-wired-46e1@gregkh>
In-Reply-To: <2025091106-absinthe-wired-46e1@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 11 Sep 2025 15:11:42 +0200
X-Gm-Features: Ac12FXwDdn8PkIV1mAEGV9zdRk_SAvSLLC0n5M-9uhIiVaVM3a1PTUDPbf_ZL3A
Message-ID: <CAMMMRMdT9SV-o1+JitQ6iopd4kyn3KcWsfB7-_4FoXKeDMZbqQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] usb: typec: Implement alternate mode priority handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 12:41=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 11, 2025 at 10:46:52AM +0200, Andrei Kuchynski wrote:
> > On Thu, Sep 11, 2025 at 7:07=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Sep 10, 2025 at 07:35:42PM +0000, Andrei Kuchynski wrote:
> > > > On Wed, Sep 10, 2025 at 1:31=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Sep 05, 2025 at 02:22:05PM +0000, Andrei Kuchynski wrote:
> > > > > > This patch introduces APIs to manage the priority of USB Type-C=
 alternate
> > > > > > modes. These APIs allow for setting and retrieving a priority n=
umber for
> > > > > > each mode. If a new priority value conflicts with an existing m=
ode's
> > > > > > priority, the priorities of the conflicting mode and all subseq=
uent modes
> > > > > > are automatically incremented to ensure uniqueness.
> > > > > >
> > > > > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > > > > ---
> > > > > >  drivers/usb/typec/Makefile         |  2 +-
> > > > > >  drivers/usb/typec/mode_selection.c | 38 ++++++++++++++++++++++=
++++++++
> > > > > >  drivers/usb/typec/mode_selection.h |  6 +++++
> > > > > >  include/linux/usb/typec_altmode.h  |  1 +
> > > > > >  4 files changed, 46 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > > > > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > > > > >
> > > > > > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Mak=
efile
> > > > > > index 7a368fea61bc..8a6a1c663eb6 100644
> > > > > > --- a/drivers/usb/typec/Makefile
> > > > > > +++ b/drivers/usb/typec/Makefile
> > > > > > @@ -1,6 +1,6 @@
> > > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > >  obj-$(CONFIG_TYPEC)          +=3D typec.o
> > > > > > -typec-y                              :=3D class.o mux.o bus.o =
pd.o retimer.o
> > > > > > +typec-y                              :=3D class.o mux.o bus.o =
pd.o retimer.o mode_selection.o
> > > > > >  typec-$(CONFIG_ACPI)         +=3D port-mapper.o
> > > > > >  obj-$(CONFIG_TYPEC)          +=3D altmodes/
> > > > > >  obj-$(CONFIG_TYPEC_TCPM)     +=3D tcpm/
> > > > > > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/t=
ypec/mode_selection.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..2179bf25f5d4
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/usb/typec/mode_selection.c
> > > > > > @@ -0,0 +1,38 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * Copyright 2025 Google LLC.
> > > > > > + */
> > > > > > +
> > > > > > +#include "mode_selection.h"
> > > > > > +#include "class.h"
> > > > > > +#include "bus.h"
> > > > > > +
> > > > > > +static int increment_duplicated_priority(struct device *dev, v=
oid *data)
> > > > > > +{
> > > > > > +     struct typec_altmode **alt_target =3D (struct typec_altmo=
de **)data;
> > > > > > +
> > > > > > +     if (is_typec_altmode(dev)) {
> > > > > > +             struct typec_altmode *alt =3D to_typec_altmode(de=
v);
> > > > > > +
> > > > > > +             if (alt !=3D *alt_target && alt->priority =3D=3D =
(*alt_target)->priority) {
> > > > > > +                     alt->priority++;
> > > > > > +                     *alt_target =3D alt;
> > > > > > +                     return 1;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +void typec_mode_set_priority(struct typec_altmode *alt,
> > > > > > +             const unsigned int priority)
> > > > > > +{
> > > > > > +     struct typec_port *port =3D to_typec_port(alt->dev.parent=
);
> > > > > > +     int res =3D 1;
> > > > > > +
> > > > > > +     alt->priority =3D priority;
> > > > > > +
> > > > > > +     while (res)
> > > > > > +             res =3D device_for_each_child(&port->dev, &alt,
> > > > > > +                             increment_duplicated_priority);
> > > > > > +}
> > > > > > diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/t=
ypec/mode_selection.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..cbf5a37e6404
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/usb/typec/mode_selection.h
> > > > > > @@ -0,0 +1,6 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > > +
> > > > > > +#include <linux/usb/typec_altmode.h>
> > > > > > +
> > > > > > +void typec_mode_set_priority(struct typec_altmode *alt,
> > > > > > +             const unsigned int priority);
> > > > > > diff --git a/include/linux/usb/typec_altmode.h b/include/linux/=
usb/typec_altmode.h
> > > > > > index b3c0866ea70f..571c6e00b54f 100644
> > > > > > --- a/include/linux/usb/typec_altmode.h
> > > > > > +++ b/include/linux/usb/typec_altmode.h
> > > > > > @@ -28,6 +28,7 @@ struct typec_altmode {
> > > > > >       int                             mode;
> > > > > >       u32                             vdo;
> > > > > >       unsigned int                    active:1;
> > > > > > +     unsigned int                    priority;
> > > > >
> > > > > What is the range of this?  And this value is only incremented, n=
ever
> > > > > decremented?
> > > > >
> > > >
> > > > The range extends from 0 to UINT_MAX. The value is only incremented=
.
> > > > The only exception is that If the user sets UINT_MAX for two altern=
ate
> > > > modes in turn, the priority of the first mode becomes 0. This does =
not
> > > > break the algorithm, and the user can check all priorities via
> > > > =E2=80=98priority=E2=80=99 attributes.
> > >
> > > Why not use u32 to define a sane range?  Or u8?  How many different
> > > priorities will actually be used in the real world?
> > >
> >
> > The priority can be u32 or u8, but not bool. I use unsigned int as the
> > precise bit count is not important here.
>
> But the range is, that needs to be documented.
>

The priority range will be documented in the ABI

> > Three different priorities are enough for DisplayPort, Thunderbolt,
> > USB4, at least for now. The algorithm is designed to accommodate any
> > number of modes, as it does not rely on predefined MAX_ALTMODE or
> > MAX_PRIORITY values.
>
> Great, then let's use u8 for now.
>

I will change the priority type from unsigned int to u8.

> > > And what happens when it wraps?
> > >
> >
> > If a user sets all priorities (either 2 or 3) to UINT_MAX, the
> > resulting mode sequence will not be as expected due to overflow.
>
> That sounds like a bug :(
>

I will add a check to the function and return -EOVERFLOW if the input
causes the priority values to wrap.

Greg, thank you for the review!

Andrei
