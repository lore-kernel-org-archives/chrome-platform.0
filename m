Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630DC2DF12C
	for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580427; cv=none; b=KS+T5zbOxm+3ZSC6rZJld/aq9S6ZxCjM+wl4Iqq6Rlt1eETmKGThZ9A3oxGv7m72Df8aPorU4Akizfg/8Di8CthlfUXXzzNxoLS22p9jqDjxYEL+5+mo7HcQWZGy8b5X9wIWjUfJD2+MQn162ZV4NJNFJ3WAzZKZpb0kyPqB14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580427; c=relaxed/simple;
	bh=IcS5i236+V+qd3rhw2uqaQklkLGi9KBGcFcbyNvZ7GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNakejTurI+HyFIKxnk+Fd03k3cQ9KcbUjxCDVMeTAOespqS00NyQjWRvFhUGUNpGoD8fM2Qwy4UTGsCJ3855qRB0PPNfKKy22Lvh76ufNeMyDXV/dA97/aLFkuQTnVSsNkdJJtKOXM0IS34p/LdZ20TGIUNfbt8zOKR/SVjtSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UyHPHPPz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UyHPHPPz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3277c603b83so287793a91.2
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757580424; x=1758185224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsjY7A9GDCmyAOfucrbXXA+jrqiO2dnK+IrUMudtu/k=;
        b=UyHPHPPz7f82/fKpyyMGw1gePqJjA+Ld95Fu21MLeJ4AIypi01m3IqN4fNLcTDE8PA
         429bElHcdnPyd+0evNLUPt8xIds70XWDlhs18F/faIDTtDzPgezdaQ37RRvcF1dEMv8n
         Po15O6fN4k9kAyxbLmkyyBOyiGaNjtScrm57M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580424; x=1758185224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsjY7A9GDCmyAOfucrbXXA+jrqiO2dnK+IrUMudtu/k=;
        b=HxIzP9DjdgYMSfFJZ92lnvzZUVSYSDEbZWYKPup3+5Ut3XAtG5GSkh841Z2eQlUAV9
         MdxozGtWyNdSWSxwLn+54YFgy+4CCFOd6lWY30weTshCF/U7YPsQG/j+I3VaoGGtqtIn
         9VOzdr9WywNBWYVTYTg3ntLlb476UEQUhzt3EvUtspEEdjt+QQW+RJbvt1r3g3VbbfDY
         WAMEPOtqycweLuDJEMRlYTf/i7U30smkbzX20BIyLDM/9sCjWo6/cQjmS50RM6XNExZh
         4/mVrmjgwME4gExZHe+Q0tbXMkynI3tX2aJC+cq4Ubf9FPDow3CqWCm1LNEun55ZdGXe
         XUgg==
X-Forwarded-Encrypted: i=1; AJvYcCUlYuOwAV1ypJcb82hy4/4tkWxAMIqP352uSgLnTEX6i6q/SsdKC+mMyoU0AtReci4FTlEmsJlcY0t7aRt8ghU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNTicS9PSpDUxYKXsbNlngp/0brRIyjzFmh43tPvZn5A/Jqv8a
	SN0uou99N5Gqz9RTxR3feYZkwFwcPJkSHnfPY3gZoR0jKaT716LKTMB8rLaPz6icG5ZHtVjZ70O
	0a1VQh9lLuFfqDUBrMNkMjmER3gjP750WmtAo8DR9
X-Gm-Gg: ASbGncs5BqpLJourzlyfz9mPqiV4gXTNMBp0lcuZ3J3rvUyqfEAB39X374RQhVNURe9
	FeZAh2OgtxyP70C5lXejfRY8NIDK62xsjWv+0rCWlyNO7VXpEgORJFHU88LuVMZA7uu1KgYAaMi
	GSYOU/Yhe924oZiKfFNVl4D3XG750taIQRWo/gJJjcLkFwvlx74ep1M7abrqopqRQImPNlVenOS
	nZim6cGdzyNN7v9Riy5S1B2BpgLu2HqyCUfZMjGXsI6
X-Google-Smtp-Source: AGHT+IHFpBTvF6L6V6Iconk8xQf6COdrOMx2GUMFzUMvF3Qw7AyQ0vdMNvWEf8Sx5iob0Qep7qOIfC+A6ZlFnZ1UVJY=
X-Received: by 2002:a17:90b:1d4c:b0:329:f630:6c3 with SMTP id
 98e67ed59e1d1-32d43f608afmr24939658a91.20.1757580424625; Thu, 11 Sep 2025
 01:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-5-akuchynski@chromium.org> <2025091029-snarl-decimal-aea2@gregkh>
 <CAMMMRMdOiGQdmgQ7COa1Nf9Rh9BQLD79TJ77VW4ejadx_bNyeg@mail.gmail.com> <2025091117-herring-crazy-d13c@gregkh>
In-Reply-To: <2025091117-herring-crazy-d13c@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 11 Sep 2025 10:46:52 +0200
X-Gm-Features: Ac12FXznBoyHJo-Wf_2PolqsFRu-cSqJBmu0OZphyIR3w2wkEPbiF29CJkWBwYk
Message-ID: <CAMMMRMck=YzbN6g8-4qUx=YX+=S4HgKqHaYoUuQ0CsJUYd9GOw@mail.gmail.com>
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

On Thu, Sep 11, 2025 at 7:07=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 10, 2025 at 07:35:42PM +0000, Andrei Kuchynski wrote:
> > On Wed, Sep 10, 2025 at 1:31=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 05, 2025 at 02:22:05PM +0000, Andrei Kuchynski wrote:
> > > > This patch introduces APIs to manage the priority of USB Type-C alt=
ernate
> > > > modes. These APIs allow for setting and retrieving a priority numbe=
r for
> > > > each mode. If a new priority value conflicts with an existing mode'=
s
> > > > priority, the priorities of the conflicting mode and all subsequent=
 modes
> > > > are automatically incremented to ensure uniqueness.
> > > >
> > > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > > ---
> > > >  drivers/usb/typec/Makefile         |  2 +-
> > > >  drivers/usb/typec/mode_selection.c | 38 ++++++++++++++++++++++++++=
++++
> > > >  drivers/usb/typec/mode_selection.h |  6 +++++
> > > >  include/linux/usb/typec_altmode.h  |  1 +
> > > >  4 files changed, 46 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > > >
> > > > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefil=
e
> > > > index 7a368fea61bc..8a6a1c663eb6 100644
> > > > --- a/drivers/usb/typec/Makefile
> > > > +++ b/drivers/usb/typec/Makefile
> > > > @@ -1,6 +1,6 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > >  obj-$(CONFIG_TYPEC)          +=3D typec.o
> > > > -typec-y                              :=3D class.o mux.o bus.o pd.o=
 retimer.o
> > > > +typec-y                              :=3D class.o mux.o bus.o pd.o=
 retimer.o mode_selection.o
> > > >  typec-$(CONFIG_ACPI)         +=3D port-mapper.o
> > > >  obj-$(CONFIG_TYPEC)          +=3D altmodes/
> > > >  obj-$(CONFIG_TYPEC_TCPM)     +=3D tcpm/
> > > > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec=
/mode_selection.c
> > > > new file mode 100644
> > > > index 000000000000..2179bf25f5d4
> > > > --- /dev/null
> > > > +++ b/drivers/usb/typec/mode_selection.c
> > > > @@ -0,0 +1,38 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright 2025 Google LLC.
> > > > + */
> > > > +
> > > > +#include "mode_selection.h"
> > > > +#include "class.h"
> > > > +#include "bus.h"
> > > > +
> > > > +static int increment_duplicated_priority(struct device *dev, void =
*data)
> > > > +{
> > > > +     struct typec_altmode **alt_target =3D (struct typec_altmode *=
*)data;
> > > > +
> > > > +     if (is_typec_altmode(dev)) {
> > > > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > > > +
> > > > +             if (alt !=3D *alt_target && alt->priority =3D=3D (*al=
t_target)->priority) {
> > > > +                     alt->priority++;
> > > > +                     *alt_target =3D alt;
> > > > +                     return 1;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +void typec_mode_set_priority(struct typec_altmode *alt,
> > > > +             const unsigned int priority)
> > > > +{
> > > > +     struct typec_port *port =3D to_typec_port(alt->dev.parent);
> > > > +     int res =3D 1;
> > > > +
> > > > +     alt->priority =3D priority;
> > > > +
> > > > +     while (res)
> > > > +             res =3D device_for_each_child(&port->dev, &alt,
> > > > +                             increment_duplicated_priority);
> > > > +}
> > > > diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec=
/mode_selection.h
> > > > new file mode 100644
> > > > index 000000000000..cbf5a37e6404
> > > > --- /dev/null
> > > > +++ b/drivers/usb/typec/mode_selection.h
> > > > @@ -0,0 +1,6 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +
> > > > +#include <linux/usb/typec_altmode.h>
> > > > +
> > > > +void typec_mode_set_priority(struct typec_altmode *alt,
> > > > +             const unsigned int priority);
> > > > diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/=
typec_altmode.h
> > > > index b3c0866ea70f..571c6e00b54f 100644
> > > > --- a/include/linux/usb/typec_altmode.h
> > > > +++ b/include/linux/usb/typec_altmode.h
> > > > @@ -28,6 +28,7 @@ struct typec_altmode {
> > > >       int                             mode;
> > > >       u32                             vdo;
> > > >       unsigned int                    active:1;
> > > > +     unsigned int                    priority;
> > >
> > > What is the range of this?  And this value is only incremented, never
> > > decremented?
> > >
> >
> > The range extends from 0 to UINT_MAX. The value is only incremented.
> > The only exception is that If the user sets UINT_MAX for two alternate
> > modes in turn, the priority of the first mode becomes 0. This does not
> > break the algorithm, and the user can check all priorities via
> > =E2=80=98priority=E2=80=99 attributes.
>
> Why not use u32 to define a sane range?  Or u8?  How many different
> priorities will actually be used in the real world?
>

The priority can be u32 or u8, but not bool. I use unsigned int as the
precise bit count is not important here.

Three different priorities are enough for DisplayPort, Thunderbolt,
USB4, at least for now. The algorithm is designed to accommodate any
number of modes, as it does not rely on predefined MAX_ALTMODE or
MAX_PRIORITY values.

Priority numbers are used only with the '<' operator.
In fact, we need a list of modes to determine the order of entry.
Previously, a list was used in the 'mode selection' series, but
parsing it is more complex than using kstrtouint().

> And what happens when it wraps?
>

If a user sets all priorities (either 2 or 3) to UINT_MAX, the
resulting mode sequence will not be as expected due to overflow.

> > I am unsure if a check for this specific case is necessary, as it
> > would require examining priorities across all modes, not just a simple
> > 'if' statement.
> > There are a few ideas in this algorithm:
> > - all priorities must always be valid and unique
>
> Is that true?  Where is that validated?
>

typec_mode_set_priority() ensures all priorities remain unique. Any
numerical value is valid as long as it can be compared to another,
kstrtouint() will return this value.

> > - no unnecessary restrictions for the user
>
> What does the user actually want to do here?
>

User wants to set the highest priority mode. For this, a single '0'
write operation is required. Also user can prioritize all modes by
assigning '0' to the 'priority' attribute for each mode, beginning
with the lowest prioritized mode and moving upwards.

For example, USB4 is the preferred mode, with priority 0. If a partner
(or port) device does not support USB4, the user can set the next
preferred mode (TBT or DP) based on security policy by assigning
priority 1 for only one mode. This mode is TBT when a user is logged
in, and DP otherwise.

> > - as simple as possible
>
> But not too simple :)
>
> thanks,
>
> greg k-h

Thanks,
Andrei
