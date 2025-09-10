Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A062571DC
	for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532955; cv=none; b=EMu4oqPWa7/Eu5HNGPyFCiZLTXqdn8dL3VUc1VHsY6admv8aKD5h2ZAeqs3oz7Yzx9GsFsDDQCX4puCO5bNsX3Fv/pJ8siiPrYpdccUQoW99wo7jQDwrbfNKzQV4yxuIpy+UyTcnRkeSk+0jJkkxlSzmwZGMTfCIokWLliT+Eow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532955; c=relaxed/simple;
	bh=PtN1wZSHACRT6avekYs3yn3rwtGd9wSgDovmjolOpF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHBoUC1zDVtXB1SdZ40pMUzH4Ust8M/HPLb5+Xys3oG3+fj1UMT9P5S+6MFsTkW2uhpGov9IeNTJKlI243oKE/NAMp4Klke4y1i7Jm0c3yRWeI+mPO8iJZ4eJR/4TEEjWy9RQ5LqHAR7701sYcXq1ZfIqWg+k/etWW9RN7vGnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LCk43v14; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LCk43v14"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77251d7cca6so6151482b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 12:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532953; x=1758137753; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDKunTxf/S5CBlU8+drFx4GQVl38jBRjcy2CRI8kVQU=;
        b=LCk43v14AAVn4Zse4VtxYN3RdrWzMc6fmq63Tim9rdbQg/Zqhdnqk3SiMvAIOkNyEy
         6skrQuG2VmbJQkwXSntCOP2NrD0rWUXDFM6fXc0LWd+P838b3XF1e87iyS1flYfXQXNK
         bh1+GI74DQbAoPJ0avMeogHyWxju8bPmR00us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532953; x=1758137753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDKunTxf/S5CBlU8+drFx4GQVl38jBRjcy2CRI8kVQU=;
        b=eLLu6VkDW4K808EjlTH0uayekyVdvr6dYfqlVEZj96jqRh5cKCZE9jYWDqV4uXSSWz
         vSQtRgdnHE2TsGRO19zeN9K0sNMAhKyFId86nxZP5eEIGxnPNgIdNc610VWaRznRtun8
         FD34v7RLeYvKK9NI2GoWpJc64vhXqBNHx5Y+FZuEEM+unT9cNwlk4YnaLBYKX8ogT5sv
         odDZadWrQafvNCDbsEf+8aJdoq7ny85K+tWAEGMEdXjij3bknmpRJGDd997M4KuwY+Zy
         e0XQxkGO+TdyJ5OqFiT0LUo53W2t37jHeeIYeTYAVGLpY8Z9uxtFq/ViVX582zG+/3Qq
         Vb5A==
X-Forwarded-Encrypted: i=1; AJvYcCVD81Z5znbisuhWjYksLh59yGv1S7nkJLu4sCupswammKDZ9/g1u1VVndqInGyvm1hNqiZn7YLFzMTgklGz0Uo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYtCTfp6UBU0f7MP2j8we3V24Bbb9eWrmi6oF53JpE1D5ljK31
	U6XtmLO+OHIV6es/CLpiaD4QoPUJbLF1CIK2D+l7ChEuHSx3dkZgoSYRiea0EuOCzB0N6uDv9cv
	5myb20wJ9wPZ1ul2dfpVHuPSeF+GOVdACinXVsy6h
X-Gm-Gg: ASbGncuiWP5vmk3xVzgHIakxum8hFUnZNis0SIhheNnJLBmmwGTWQ/4VmnLaJ7DWJ8V
	kSW/aQtBNOXvsDX70xLe3iKbpAHx1hgOMkLI4HOvdjLH3cNna8Fo/JNc+hp9eYMwehApsyuJ9+V
	VwbfzrEk8SA8fUpHCJQ6qeu/8vos7oLoZTXvcOvVVPduJpmt/yKQ26OFBTG10h9zK1afcvsgNnX
	hyVtZ2ZRirH6n1XUxJmmBuJp0ReylTNBvk=
X-Google-Smtp-Source: AGHT+IEecFj4d2N8l54ipxV9A0HELOpzA3uq6yMz+0dnkVdznSIvHQpERqoi0pQkGgHfRcYwyH9WUSZ+n1fNKe/lvIs=
X-Received: by 2002:a05:6a21:33a1:b0:24a:6bef:bdd5 with SMTP id
 adf61e73a8af0-25344130fbfmr23540158637.41.1757532953527; Wed, 10 Sep 2025
 12:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-5-akuchynski@chromium.org> <2025091029-snarl-decimal-aea2@gregkh>
In-Reply-To: <2025091029-snarl-decimal-aea2@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:35:42 +0000
X-Gm-Features: Ac12FXxPN_dgj5aIjIjw1flHyJdM6r_Y2JbGmXYfsM4L8NDijYd8kjCgCMLV2jo
Message-ID: <CAMMMRMdOiGQdmgQ7COa1Nf9Rh9BQLD79TJ77VW4ejadx_bNyeg@mail.gmail.com>
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

On Wed, Sep 10, 2025 at 1:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:05PM +0000, Andrei Kuchynski wrote:
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
> > +}
> > diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mod=
e_selection.h
> > new file mode 100644
> > index 000000000000..cbf5a37e6404
> > --- /dev/null
> > +++ b/drivers/usb/typec/mode_selection.h
> > @@ -0,0 +1,6 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <linux/usb/typec_altmode.h>
> > +
> > +void typec_mode_set_priority(struct typec_altmode *alt,
> > +             const unsigned int priority);
> > diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/type=
c_altmode.h
> > index b3c0866ea70f..571c6e00b54f 100644
> > --- a/include/linux/usb/typec_altmode.h
> > +++ b/include/linux/usb/typec_altmode.h
> > @@ -28,6 +28,7 @@ struct typec_altmode {
> >       int                             mode;
> >       u32                             vdo;
> >       unsigned int                    active:1;
> > +     unsigned int                    priority;
>
> What is the range of this?  And this value is only incremented, never
> decremented?
>

The range extends from 0 to UINT_MAX. The value is only incremented.
The only exception is that If the user sets UINT_MAX for two alternate
modes in turn, the priority of the first mode becomes 0. This does not
break the algorithm, and the user can check all priorities via
=E2=80=98priority=E2=80=99 attributes.
I am unsure if a check for this specific case is necessary, as it
would require examining priorities across all modes, not just a simple
'if' statement.
There are a few ideas in this algorithm:
- all priorities must always be valid and unique
- no unnecessary restrictions for the user
- as simple as possible

Thanks,
Andrei
