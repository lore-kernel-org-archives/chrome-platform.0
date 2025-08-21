Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9671813DBA0
	for <chrome-platform@lists.linux.dev>; Thu, 21 Aug 2025 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787501; cv=none; b=bZlcqlYzSS2WysJ0l628VpBgXBYG/2uNvAw4PKDLhm/pItjBm4ykTS7TIkPMA+UJOgPKnQ8cghSQ7gAvupNDKYau19qv71N3kQSnzUVz6o7/wzAIaWGbkM1fjdxVFCy6o/FYRnennIl3MhZDgkxcF0ee8ORuKvVkLIgG8qyM8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787501; c=relaxed/simple;
	bh=B6IU72EL2hHWaSuLNQtE0wgSiba/GI0RK8DJ5KCF+FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWp66QojtUhphW43ku4EdWgflMLFtVuFYM8SK5vQfAtX2SzbywJSRPwJTjmdyubTNxSR65i4L8TFbdqtoH86U+nJuqHuHQuMDyPD6/dnh4oM+BhaFwgWq62p2FgZhIFDcE524zSFK9CVoZa1Jqmxe0oaDQzoOTyYXKmMUOni894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CkmBV07F; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CkmBV07F"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4716fa7706so709881a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 21 Aug 2025 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755787499; x=1756392299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3ZBzNW2iTlfEoA9OPDFh9ySUGnRcfIGtdtT6mqdubA=;
        b=CkmBV07FCPdGCwcBvGXRA6PEKcZZRCi9SbSlF8u+7vD67+3oxnSs2BclvIF66Ef0hT
         I4gZO7jQ4WEaVVPVbQ+p537HfyTsUZCAE63jqj7z50UuKPTqdsyxCvnndedRtNKZBJer
         TcjG2vlpe5cA/kJa3NtS6F4Wv1QvaixTlXXdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755787499; x=1756392299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3ZBzNW2iTlfEoA9OPDFh9ySUGnRcfIGtdtT6mqdubA=;
        b=Di13LQjyQ/uQUWKr8vNB6ooNLKyInSZ9GcG30gA5vbF2lisXMRhg0oxo5+c4xO5ZAv
         tdWzJdgEnVTKLBlMB+D9ihiURgxdQvJncSTcQzkgOMgrPJ8xsQ0VuZcqOWgmaIlbTZJo
         35S4u+BDvuavRy0fo1ydIjrfWRlfpqqf5tTU7ViWTGAlcbsOlJ+xWebCYCjBwZ/fQJ9C
         MBWoGDkQecKgZe8kas+vKxuywxc+SGV4aPxWDivkYy6gF9btAa+MA/kE9/W0ZoVY1VcX
         C/lF1CJGu3V3AVldZcF5INmitV9ctNRzeRsM9Z/TRiRLk8NJNftMR96A5KNoOyYa7Nid
         dIhg==
X-Forwarded-Encrypted: i=1; AJvYcCV4uKLDYHtjjaYFH2NPBNwBDGJEgguQKyxoL6ZvWeiHudYSXaER/m9ADNTd66G5eMbywtkKebA2KOB1MabM+68=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwleVmdb9d/+YH9BlBbpdKdFz7ZZ2/EADHtSgS7GBlDblDH3iT
	u+tW6VpP458+w0eeZcCAyrPnRxRJkfQG8MDgWADcM2NQaCBYeeFX5f4/NJGc3LPYHjL5+iIdGwD
	uEhscBJLy6eW2FN011TANNOop2VkX/tkOdaBYLqJO
X-Gm-Gg: ASbGncvN0/m05ffUMiP5Wa7QJCQ1p5oau9pxZqw/nhxNpQI/T1oe7yDLuIN3DXH0SMH
	uEXBAR6Zst7myUkS3oC7W1Kdo9iRKx5w7cJltOpL65+4NtvKCzhFVomheu47H9IX5Gm/NvXOlkl
	D1DgRvBB5C8dczGdKlwfwCS9zZxdq/7dLNLjaaA7ERHV74JbthJVB75etORojlBIco/UW5aheze
	qgRg7hze/x7vYC0fSg3fQ+VqXJCwaI0
X-Google-Smtp-Source: AGHT+IG6la090boFC0adFQ5R5iuoZ3O2i10q0RcjDij42X5nvHVjdaGi0WKBdDiWmyhYk3G4cOpQhrpyGK1XbyMp1IY=
X-Received: by 2002:a17:902:c946:b0:246:61e:b562 with SMTP id
 d9443c01a7336-246061ebb49mr31764835ad.59.1755787498861; Thu, 21 Aug 2025
 07:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250814184455.723170-1-akuchynski@chromium.org>
 <20250814184455.723170-6-akuchynski@chromium.org> <aKbMeSCHf-ZhbcvT@kuha.fi.intel.com>
In-Reply-To: <aKbMeSCHf-ZhbcvT@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 21 Aug 2025 16:44:45 +0200
X-Gm-Features: Ac12FXz6CpwUI9KCMT5e9L3vISv4bbNnmCuQHgIVlGc9lVaESXs2xstG0gJQrRA
Message-ID: <CAMMMRMd4Gw+yC+4wB=_ZRChuE1=TEZXePYZa5PoqmLSiGDJCRQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] usb: typec: Expose alternate mode priority via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 9:36=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Thu, Aug 14, 2025 at 06:44:55PM +0000, Andrei Kuchynski wrote:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 12 ++++++
> >  drivers/usb/typec/class.c                   | 47 ++++++++++++++++++++-
> >  2 files changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..001202d651fa 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,18 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +             What:           /sys/class/typec/<port>/<alt-mode>/priori=
ty
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for a specific a=
lt-mode.
> > +             When read, it shows the current integer priority value. L=
ower numerical
> > +             values indicate higher priority (0 is the highest priorit=
y).
> > +             If the new value is already in use by another mode, the p=
riority of the
> > +             conflicting mode and any subsequent modes will be increme=
nted until they
> > +             are all unique.
> > +             This attribute is visible only if the kernel supports mod=
e selection.
>
> I was expecting this to be already used in this series.
>
> IMO this file should be the only thing the user space needs to use by
> default at least.
>

No more entries for mode priorities.
What about the trigger of the process?
I'm going to introduce a mode_selection binary sysfs attribute in
the next series. Writing 1 to this attribute will activate the
mode selection process. Writing 0 will cancel the process and
exit the currently active mode.

> > @@ -469,6 +500,15 @@ static umode_t typec_altmode_attr_is_visible(struc=
t kobject *kobj,
> >                               !adev->ops->activate)
> >                               return 0444;
> >               }
> > +     } else if (attr =3D=3D &dev_attr_priority.attr) {
> > +             if (is_typec_port(adev->dev.parent))  {
> > +                     struct typec_port *port =3D to_typec_port(adev->d=
ev.parent);
> > +
> > +                     if (!port->alt_mode_override)
> > +                             return 0;
> > +             } else
> > +                     return 0;
> > +     }
>
> If we have the local port variable, this should be enough:
>
>                 if (!is_typec_port(adev->dev.parent) || !port->alt_mode_o=
verride)
>                         return 0;
>

typec_altmode2port is really powerful. Thank you again for this hint!

> >       return attr->mode;
> >  }
> > @@ -2029,6 +2069,7 @@ static void typec_release(struct device *dev)
> >       typec_mux_put(port->mux);
> >       typec_retimer_put(port->retimer);
> >       kfree(port->cap);
> > +     typec_mode_selection_destroy(port);
> >       kfree(port);
> >  }
> >
> > @@ -2496,6 +2537,8 @@ typec_port_register_altmode(struct typec_port *po=
rt,
> >               to_altmode(adev)->retimer =3D retimer;
> >       }
> >
> > +     typec_mode_set_priority(adev, -1);
>
> This really should not be necessary. Why can't we set the priority
> based on the order the drives registers the altmodes for the port?
>

Setting priorities based on the order of registration is a good
idea. This simplifies the logic by making the default_priorities
unnecessary.
I will modify the initialization to call

          typec_mode_set_priority(adev, 0);

With this change, the later a mode is registered, the higher its
priority will be. For the cros_ec_typec driver, this produces the
same default sequence: USB4 TBT DP.

Thanks,

Andrei



> >       return adev;
> >  }
> >  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
> > @@ -2645,6 +2688,8 @@ struct typec_port *typec_register_port(struct dev=
ice *parent,
> >       port->con.attach =3D typec_partner_attach;
> >       port->con.deattach =3D typec_partner_deattach;
> >
> > +     INIT_LIST_HEAD(&port->mode_list);
> > +
> >       if (cap->usb_capability & USB_CAPABILITY_USB4)
> >               port->usb_mode =3D USB_MODE_USB4;
> >       else if (cap->usb_capability & USB_CAPABILITY_USB3)
>
> thanks,
>
> --
> heikki
