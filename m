Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B2234A32F
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073557; cv=none; b=Db60RTtSdodqBW7WnwI8Kqv5Y5QvzJhRd6ObyUCS/s0awQmQCf/UzyxyQYlzIQiw+bxHkOnc27sMlQKytQa9pOt/R+d+0pdsHhFSNt3rmWSF8BRa8lcXV3AlOfv5R8GhbtkhZ95l8kEiKGY5XsJyEZLTORdd2PHUF1ObI/jktEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073557; c=relaxed/simple;
	bh=eWu1w45THUrcqTubbaxwPPUPaMOnGOxHWGZC6vrwq6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/0i2wpC1r2MFc68C0L77u3kzIFqBRYENg02bAW6KUwa6MW0Oafmn7+zV141SxaqAyNZghacyPEmxAm8VVoOCZ5DA65/ViAKRtPu6OklP4prXW1QjbLbvcVXMfwQgUPngUFr5dbo0Q60Jb3AudDbVn+bFMfCs9SUhze0NkR+bt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e9fjoVqp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e9fjoVqp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32b5d3e1762so1605844a91.3
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757073554; x=1757678354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhISDapWI+OKjnURRW7M0Vh6J8Ihioz0/IeDCwCINSI=;
        b=e9fjoVqpBEbsE1/FeH6LtCVeDp5OPZAU7COd2FnmBfm1FwS7NGCJtHy8mtO7/xJ0fb
         fO2G/3m95/Fta8D9K1mcti4CVLv6BbUbd+EnN/rTk8bT33vtEfzjyA4u7K4HqA4zkzlk
         cOYr+8K7lWQwXevRBRRdVZGQ+AW2bNqKAS8k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073554; x=1757678354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhISDapWI+OKjnURRW7M0Vh6J8Ihioz0/IeDCwCINSI=;
        b=D5t9TQLDBUn3d4JnNbqiM9CxzajOY1xdH9fDm15VwHAMGncGPkQGhJEd8xIyhmN55P
         IPGWnnp8SNB3ZlSrHcas+64kI7Wub8sSaTEy+Z+9eyMkxcsBBggZHVnL9iX1G9C+kzHz
         v2w7pcqLf0XvTtgRQjQlelF9zwtyDJ9obN18gkocvDGVZw68zP8B29cJ1caRepgK5kAx
         EX9wQNjXpG/FbNOtlC9sYMz9VSTw/zE7sXz/PrOW5U9RtRvd/O2OHPTgot11B2xBgnLv
         gdUztsYnqTn7PdQdbRN0Fjc2cO9RRpHN9BZBiYnJ8VDK0vqaeGex7cMJ7TkQqTHEkxyZ
         4/Og==
X-Forwarded-Encrypted: i=1; AJvYcCV6jWmmhr5uIz40zH21l/BYqOECB+Mg2/8n6V4NcpdtGoAeEQkCYPeuB3+ZEjahu5ILvBIUwKQSl2L6yYym4p0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Hhuy2xkvxqXsjUiTTsIQ+OHi4jMLpeOgPEZhaCjaamdACmln
	RhzaPnwHLL9bPiKn4KxLhrQ6faQ8myJkN9mUY7tNfDUk9n/N5pFScsygTU+xgAYP862Kynn7vIQ
	QBgAstlviKE2ZLVS12RHLwDN8fOIyqrLxHs/gu1oM
X-Gm-Gg: ASbGncsSerYhkSl08Y95KdUicPlaqvhBtQUEyVm6SJc8jLKrrRV4A7qSx5/fHSQRUDp
	dGeScpkvSKFQwR4lyH6tRLTzze2vvRR3eRZwL4HXUFwb5adZVGqUgIZ8urxTGrbff+Zp6Qjhetw
	ONxxqhIUUzDWYP9udx1IE4dzx3D03jQhKYKaiWKzriP05UjJMDXIJur9B0Qe4WjuDvJkwmDXjB+
	mrH/ykK1MLBEZTLQztP+aiN6LGy8rFJYw==
X-Google-Smtp-Source: AGHT+IFNtnOhcXO5r4wnyrBsxPjARdpyn400H+T0JTuNzh/jY8gXOZS7qb54ju5ejnnjPlgi5xp/6ms+Lj0fR6CAnH8=
X-Received: by 2002:a17:90b:268a:b0:32b:b514:3935 with SMTP id
 98e67ed59e1d1-32bb5143ecfmr4921834a91.16.1757073554292; Fri, 05 Sep 2025
 04:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-5-akuchynski@chromium.org> <aLq6oNcA_yoMZyrf@kuha.fi.intel.com>
In-Reply-To: <aLq6oNcA_yoMZyrf@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 13:59:02 +0200
X-Gm-Features: Ac12FXzKIlpnIFvZ07xg53BwKH3RD7_AIIZJnlGh0sZcQrFiqTbCi9PW-RPEnOE
Message-ID: <CAMMMRMcOUdo1eSoHv9+M9zR=8WPjKZ9Q0Af3OTQrH78==kqWgQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] usb: typec: Implement alternate mode priority handling
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:25=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 02:57:49PM +0000, Andrei Kuchynski wrote:
> > This patch introduces APIs to manage the priority of USB Type-C alterna=
te
> > modes. These APIs allow for setting and retrieving a priority number fo=
r
> > each mode. If a new priority value conflicts with an existing mode's
> > priority, the priorities of the conflicting mode and all subsequent mod=
es
> > are automatically incremented to ensure uniqueness.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/Makefile         |  2 +-
> >  drivers/usb/typec/mode_selection.c | 38 ++++++++++++++++++++++++++++++
> >  drivers/usb/typec/mode_selection.h |  6 +++++
> >  include/linux/usb/typec_altmode.h  |  1 +
> >  4 files changed, 46 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/usb/typec/mode_selection.c
> >  create mode 100644 drivers/usb/typec/mode_selection.h
> >
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index 7a368fea61bc..8a6a1c663eb6 100644
> > --- a/drivers/usb/typec/Makefile
> > +++ b/drivers/usb/typec/Makefile
> > @@ -1,6 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_TYPEC)          +=3D typec.o
> > -typec-y                              :=3D class.o mux.o bus.o pd.o ret=
imer.o
> > +typec-y                              :=3D class.o mux.o bus.o pd.o ret=
imer.o mode_selection.o
> >  typec-$(CONFIG_ACPI)         +=3D port-mapper.o
> >  obj-$(CONFIG_TYPEC)          +=3D altmodes/
> >  obj-$(CONFIG_TYPEC_TCPM)     +=3D tcpm/
> > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mod=
e_selection.c
> > new file mode 100644
> > index 000000000000..2179bf25f5d4
> > --- /dev/null
> > +++ b/drivers/usb/typec/mode_selection.c
> > @@ -0,0 +1,38 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2025 Google LLC.
> > + */
> > +
> > +#include "mode_selection.h"
> > +#include "class.h"
> > +#include "bus.h"
> > +
> > +static int increment_duplicated_priority(struct device *dev, void *dat=
a)
> > +{
> > +     struct typec_altmode **alt_target =3D (struct typec_altmode **)da=
ta;
> > +
> > +     if (is_typec_altmode(dev)) {
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +
> > +             if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_ta=
rget)->priority) {
> > +                     alt->priority++;
> > +                     *alt_target =3D alt;
> > +                     return 1;
>
> Couldn't you just always return 0?
>

Priority values for each mode are consistently unique, eliminating the need
for further processing if a duplicate is found.

> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +void typec_mode_set_priority(struct typec_altmode *alt,
> > +             const unsigned int priority)
> > +{
> > +     struct typec_port *port =3D to_typec_port(alt->dev.parent);
> > +     int res =3D 1;
> > +
> > +     alt->priority =3D priority;
> > +
> > +     while (res)
> > +             res =3D device_for_each_child(&port->dev, &alt,
> > +                             increment_duplicated_priority);
>
> Then this could be:
>
>         device_for_each_child(&port->dev, &alt, increment_duplicated_prio=
rity);
>
> right?
>

Unfortunately, the child's list is not in prioritized order. When a
duplicated value is found, the cycle should start for the whole list again.
I definitely need a loop here.

Thanks,
Andrei
