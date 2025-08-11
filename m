Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3C02E4279
	for <chrome-platform@lists.linux.dev>; Mon, 11 Aug 2025 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754936574; cv=none; b=a10NZUC1t+dQgI4mtv3ak7q2psZOby/uyB8XKHpII6X3tHyRx5sdTlmFjKFJYciWN6f7U3qlHIC2mdjiqfrkLkHoyIdA+9OGLJBOnJ+Jm83qZb753KE6n6TpK3m/fZ43VE42u4Y7XuJsZuQoYOr4Anvh2xclKAAIRfoAwhA6JX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754936574; c=relaxed/simple;
	bh=SQbwykiHGLln1NkvLJGyaMc5VVcISV73Gb4eVjvGXDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FP/NpN2Z7HoSf3/214V7towle4BYZdFgTFQmXMwb0CJA6aJrlEkhXFYZun4ykcFmF20khvNalBRCJ+pzjj3wPke4siBUb8g8bpTPpwj9jSLL/jxUtOJwLb1ji6N3cdYzHizuQIMSMvf36FStcLItsf5NO4PPcHYO8i28+PPWROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lYify9Q5; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lYify9Q5"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7180bb37846so44178887b3.3
        for <chrome-platform@lists.linux.dev>; Mon, 11 Aug 2025 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754936571; x=1755541371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym7Fo9lmX9m9TKt5uny1Z01CMLIWacuIt1EMi1o/0ps=;
        b=lYify9Q59Ru6dqkWUE7bMD3bEiQgs7sNqgHOkaYP9n22xxBtMFAPyOtnBVbH0zdeXC
         WrLI8uDY78sY/kwurv48jGru+iVZ1x8LDH228iT3v+pocgxx0hvEdTqrGJUGahhY7W3w
         FRc3seVZSQIrG1LPeYyyPGsALjmYCOHpyq0YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754936571; x=1755541371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ym7Fo9lmX9m9TKt5uny1Z01CMLIWacuIt1EMi1o/0ps=;
        b=Yq190l92J/AnLLXjKcSztlS0hQSOoXKrquva3+jkJW6PJ1yGeK71QJ1oCE1qB7gUbX
         qn6s2HfR6utQ2TFx6ofsvzv5smCr4aTF3i0SZjtW5rBDoF5bFmAGMkT8dwAyuagTHw3L
         ggzGLzzzJmOkDUQL1X1LcaCrz5dBm7lfix3HJ77+WWLF/Q1wqrNUckWaT6blz/+YEB5K
         InUiRebUBpSPoJaAWILKF2gd572/jgk8JoJhJXUaqDx/hbltb+nQY7r/flLwuYzuOom9
         YfF8AmPlFuKbDJnzBOY9wj8rOy0kNdKuwlQ3hgYRvO+Wg7bLnkDUAdAGuEJdu/wRDFv/
         sGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoS3Bvz8JP38+EpBCsI50mS1mntn+mn/UYcfqNKPubWvgudsC66TvfL8Vyi40w8uCi8PiJ1P59b+JVJgatkAs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVVvLJTpMwD12hrztK3qtDETtOyWi9KuUrPOpAaMndmTAAMbRT
	TSHY/1UfET6Ettackgbd7RjVs7H2lJEkywimKvPmZgSmB1n8BX/sG/jG5ZZ8+4E2JGBH96uRF1B
	2/KgxLWal6/GOosEXk59FMALUy0vYsB5+6XOD/0qO
X-Gm-Gg: ASbGnctUGljgiGjNNrXzoPLMPgbvw2TTRidi0Bduz6rch37axXSbojv0XFdF3IDhvny
	AGgJFH+UqFBcyOkNiWcUb8PIqlEsXmaDkgk7hez/e9Scb9TbBzY84AAsPby9srYswXdI+/UJJs+
	EIF9COrR18yHOr9e9BNLfihH85m+AIzvHQSyCN9pJz978U8vTREF3KAJgUc5d6UJF5g2uyvmI4m
	CvoqVg=
X-Google-Smtp-Source: AGHT+IEEnEs+itkEYon3NOh75HeFeyBl/aw7paDfFFTwaU9TdUDPABAiYt22jftI1RhXU7SNri0bOVM8N4+iLmcDXyY=
X-Received: by 2002:a05:690c:7092:b0:71b:fe47:a1de with SMTP id
 00721157ae682-71bfe47a7abmr170874797b3.24.1754936570690; Mon, 11 Aug 2025
 11:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804090340.3062182-1-akuchynski@chromium.org>
 <20250804090340.3062182-5-akuchynski@chromium.org> <aJn9ZSy3w4zW4Xvq@kuha.fi.intel.com>
In-Reply-To: <aJn9ZSy3w4zW4Xvq@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Mon, 11 Aug 2025 11:22:38 -0700
X-Gm-Features: Ac12FXzfwalQEF2UnE_ZakLD_CIuWtIBqVS25uzX2bdcyZv8ipEuAItW0vg9Ed4
Message-ID: <CANFp7mVUFZyF8z0dN-Mo7ntPOXh06ZD0RH5GyvJJymOXrhSD1g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] usb: typec: Expose mode priorities via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 7:25=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Mon, Aug 04, 2025 at 09:03:33AM +0000, Andrei Kuchynski wrote:
> > This patch introduces new sysfs attributes to allow users to configure
> > and view Type-C mode priorities.
> >
> > `priority`, `usb4_priority` attributes allow users to assign a numeric
> > priority to DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> >
> > `mode_priorities` - read-only attribute that displays an ordered list
> > of all modes based on their configured priorities.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec |  33 +++++
> >  drivers/usb/typec/Makefile                  |   2 +-
> >  drivers/usb/typec/class.c                   | 103 +++++++++++++++-
> >  drivers/usb/typec/class.h                   |   1 +
> >  drivers/usb/typec/mode_selection.c          | 130 ++++++++++++++++++++
> >  drivers/usb/typec/mode_selection.h          |  23 ++++
> >  include/linux/usb/typec_altmode.h           |   7 ++
> >  7 files changed, 295 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/usb/typec/mode_selection.c
> >  create mode 100644 drivers/usb/typec/mode_selection.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..575dd94f33ab 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,39 @@ Description:     Lists the supported USB Modes. Th=
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
> > +
> > +             What:           /sys/class/typec/<port>/usb4_priority
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for USB4 mode. I=
ts behavior and
> > +             priority numbering scheme are identical to the general al=
t-mode
> > +             "priority" attributes.
>
> I'm not sure those above two file make any sense.
>
> > +What:                /sys/class/typec/<port>/mode_priorities
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description: This read-only file lists the modes supported by the port=
,
> > +             ordered by their activation priority. It reflects the pre=
ferred sequence
> > +             the kernel will attempt to activate modes (DisplayPort al=
t-mode,
> > +             Thunderbolt alt-mode, USB4 mode).
> > +             This attribute is visible only if the kernel supports mod=
e selection.
> > +
> > +             Example values:
> > +             - "USB4 Thunderbolt3 DisplayPort"
> > +             - "DisplayPort": the port only supports Displayport alt-m=
ode
>
> Why not just use this one instead so that you write the highest
> priority mode to it?

Feedback from Greg on
https://lore.kernel.org/linux-usb/2025070159-judgingly-baggage-042a@gregkh/=
:

"quote":
Multiple value sysfs files are generally frowned apon.  sysfs files that
also have to be manually parsed in the kernel are also frowned apon.
Are you _SURE_ there is no other way that you could possibly do this?

The reason we originally suggested a single "mode priorities" was
because we weren't sure what to do about USB4. Otherwise, it makes
sense to push a priority field to each alt_mode sysfs group and keep
it internally ordered. This is where I really wish we just treated
USB4 as an alternate mode :)

As such, our current API recommendation looks like the following:

* On each port, we lay out priorities for all supported alternate modes + U=
SB4.
* We expose a file to trigger the mode selection task. Reading from it
gives you the current status of mode selection (single value).
* Detailed results from mode entry are pushed to the mode sysfs group
(via entry_results). Converting these to UEVENT is fine but a more
persistent value in debugfs would be useful for debugging.

>
> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> >  What:                /sys/class/typec/<port>-partner/accessory_mode
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
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index a72325ff099a..414d94c45ab9 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -19,6 +19,7 @@
> >  #include "bus.h"
> >  #include "class.h"
> >  #include "pd.h"
> > +#include "mode_selection.h"
> >
> >  static DEFINE_IDA(typec_index_ida);
> >
> > @@ -445,11 +446,45 @@ svid_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> >  }
> >  static DEVICE_ATTR_RO(svid);
> >
> > +static ssize_t priority_store(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            const char *buf, size_t size)
> > +{
> > +     struct typec_altmode *adev =3D to_typec_altmode(dev);
> > +     unsigned int val;
> > +     int err =3D kstrtouint(buf, 10, &val);
> > +
> > +     if (!err) {
> > +             err =3D typec_mode_set_priority(to_typec_port(adev->dev.p=
arent),
> > +                     typec_svid_to_altmode(adev->svid), val);
> > +             if (!err)
> > +                     return size;
> > +     }
> > +
> > +     return err;
> > +}
> > +
> > +static ssize_t priority_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     struct typec_altmode *adev =3D to_typec_altmode(dev);
> > +     int val;
> > +     const int err =3D typec_mode_get_priority(to_typec_port(adev->dev=
.parent),
> > +                     typec_svid_to_altmode(adev->svid), &val);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return sprintf(buf, "%d\n", val);
> > +}
> > +static DEVICE_ATTR_RW(priority);
> > +
> >  static struct attribute *typec_altmode_attrs[] =3D {
> >       &dev_attr_active.attr,
> >       &dev_attr_mode.attr,
> >       &dev_attr_svid.attr,
> >       &dev_attr_vdo.attr,
> > +     &dev_attr_priority.attr,
> >       NULL
> >  };
> >
> > @@ -458,7 +493,7 @@ static umode_t typec_altmode_attr_is_visible(struct=
 kobject *kobj,
> >  {
> >       struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
> >
> > -     if (attr =3D=3D &dev_attr_active.attr)
> > +     if (attr =3D=3D &dev_attr_active.attr) {
> >               if (!is_typec_port(adev->dev.parent)) {
> >                       struct typec_partner *partner =3D
> >                               to_typec_partner(adev->dev.parent);
> > @@ -469,6 +504,15 @@ static umode_t typec_altmode_attr_is_visible(struc=
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
> >
> >       return attr->mode;
> >  }
> > @@ -1942,6 +1986,44 @@ static ssize_t orientation_show(struct device *d=
ev,
> >  }
> >  static DEVICE_ATTR_RO(orientation);
> >
> > +static ssize_t mode_priorities_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     return typec_mode_get_priority_list(to_typec_port(dev), buf);
> > +}
> > +static DEVICE_ATTR_RO(mode_priorities);
> > +
> > +static ssize_t usb4_priority_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     struct typec_port *port =3D to_typec_port(dev);
> > +     int val;
> > +     const int err =3D typec_mode_get_priority(port, TYPEC_USB4_MODE, =
&val);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return sprintf(buf, "%d\n", val);
> > +}
> > +
> > +static ssize_t usb4_priority_store(struct device *dev,
> > +                               struct device_attribute *attr,
> > +                               const char *buf, size_t size)
> > +{
> > +     struct typec_port *port =3D to_typec_port(dev);
> > +     unsigned int val;
> > +     int err =3D kstrtouint(buf, 10, &val);
> > +
> > +     if (!err) {
> > +             err =3D typec_mode_set_priority(port, TYPEC_USB4_MODE, va=
l);
> > +             if (!err)
> > +                     return size;
> > +     }
> > +
> > +     return err;
> > +}
> > +static DEVICE_ATTR_RW(usb4_priority);
> > +
> >  static struct attribute *typec_attrs[] =3D {
> >       &dev_attr_data_role.attr,
> >       &dev_attr_power_operation_mode.attr,
> > @@ -1954,6 +2036,8 @@ static struct attribute *typec_attrs[] =3D {
> >       &dev_attr_port_type.attr,
> >       &dev_attr_orientation.attr,
> >       &dev_attr_usb_capability.attr,
> > +     &dev_attr_mode_priorities.attr,
> > +     &dev_attr_usb4_priority.attr,
> >       NULL,
> >  };
> >
> > @@ -1992,6 +2076,13 @@ static umode_t typec_attr_is_visible(struct kobj=
ect *kobj,
> >                       return 0;
> >               if (!port->ops || !port->ops->default_usb_mode_set)
> >                       return 0444;
> > +     } else if (attr =3D=3D &dev_attr_mode_priorities.attr) {
> > +             if (!port->alt_mode_override)
> > +                     return 0;
>
> I think the mode order could be visible even when it's read only.
>
> > +     } else if (attr =3D=3D &dev_attr_usb4_priority.attr) {
> > +             if (!port->alt_mode_override ||
> > +                     !(port->cap->usb_capability & USB_CAPABILITY_USB4=
))
> > +                     return 0;
> >       }
> >
> >       return attr->mode;
> > @@ -2029,6 +2120,7 @@ static void typec_release(struct device *dev)
> >       typec_mux_put(port->mux);
> >       typec_retimer_put(port->retimer);
> >       kfree(port->cap);
> > +     typec_mode_selection_destroy(port);
> >       kfree(port);
> >  }
> >
> > @@ -2496,6 +2588,8 @@ typec_port_register_altmode(struct typec_port *po=
rt,
> >               to_altmode(adev)->retimer =3D retimer;
> >       }
> >
> > +     typec_mode_set_priority(port, typec_svid_to_altmode(adev->svid), =
-1);
> > +
> >       return adev;
> >  }
> >  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
> > @@ -2645,9 +2739,12 @@ struct typec_port *typec_register_port(struct de=
vice *parent,
> >       port->con.attach =3D typec_partner_attach;
> >       port->con.deattach =3D typec_partner_deattach;
> >
> > -     if (cap->usb_capability & USB_CAPABILITY_USB4)
> > +     typec_mode_selection_init(port);
> > +
> > +     if (cap->usb_capability & USB_CAPABILITY_USB4) {
> >               port->usb_mode =3D USB_MODE_USB4;
> > -     else if (cap->usb_capability & USB_CAPABILITY_USB3)
> > +             typec_mode_set_priority(port, TYPEC_USB4_MODE, -1);
> > +     } else if (cap->usb_capability & USB_CAPABILITY_USB3)
> >               port->usb_mode =3D USB_MODE_USB3;
> >       else if (cap->usb_capability & USB_CAPABILITY_USB2)
> >               port->usb_mode =3D USB_MODE_USB2;
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index f05d9201c233..c6467e576569 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -82,6 +82,7 @@ struct typec_port {
> >       struct device                   *usb3_dev;
> >
> >       bool                            alt_mode_override;
> > +     struct list_head                mode_list;
> >  };
> >
> >  #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, de=
v)
> > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mod=
e_selection.c
> > new file mode 100644
> > index 000000000000..9a7185c07d0c
> > --- /dev/null
> > +++ b/drivers/usb/typec/mode_selection.c
> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2025 Google LLC.
> > + */
> > +
> > +#include <linux/usb/typec_altmode.h>
> > +#include <linux/slab.h>
> > +#include <linux/list.h>
> > +#include "mode_selection.h"
> > +#include "class.h"
> > +
> > +static const char * const mode_names[TYPEC_MODE_MAX] =3D {
> > +     [TYPEC_DP_ALTMODE] =3D "DisplayPort",
> > +     [TYPEC_TBT_ALTMODE] =3D "Thunderbolt3",
> > +     [TYPEC_USB4_MODE] =3D "USB4",
> > +};
> > +
> > +static const int default_priorities[TYPEC_MODE_MAX] =3D {
> > +     [TYPEC_DP_ALTMODE] =3D 2,
> > +     [TYPEC_TBT_ALTMODE] =3D 1,
> > +     [TYPEC_USB4_MODE] =3D 0,
> > +};
> > +
> > +/**
> > + * struct mode_selection_state - State tracking for a specific Type-C =
mode
> > + * @mode: The type of mode this instance represents
> > + * @name: Name string pointer
> > + * @priority: The mode priority. Higher values indicate a more preferr=
ed mode.
> > + * @list: List head to link this mode state into a prioritized list.
> > + */
> > +struct mode_selection_state {
> > +     enum typec_mode_type mode;
> > +     const char *name;
> > +     int priority;
> > +     struct list_head list;
> > +};
>
> The name member looks unnecessary, but maybe you use it out side of
> this file in the following patches.
>
> > +/* -------------------------------------------------------------------=
------- */
> > +/* port 'mode_priorities' attribute */
> > +void typec_mode_selection_init(struct typec_port *port)
> > +{
> > +     INIT_LIST_HEAD(&port->mode_list);
> > +}
>
> Useless function.
>
> > +void typec_mode_selection_destroy(struct typec_port *port)
> > +{
> > +     struct mode_selection_state *ms, *tmp;
> > +
> > +     list_for_each_entry_safe(ms, tmp, &port->mode_list, list) {
> > +             list_del(&ms->list);
> > +             kfree(ms);
> > +     }
> > +}
> > +
> > +int typec_mode_set_priority(struct typec_port *port,
> > +             const enum typec_mode_type mode, const int priority)
> > +{
> > +     struct mode_selection_state *ms_target =3D NULL;
> > +     struct mode_selection_state *ms, *tmp;
> > +
> > +     if (mode >=3D TYPEC_MODE_MAX || !mode_names[mode])
> > +             return -EOPNOTSUPP;
> > +
> > +     list_for_each_entry_safe(ms, tmp, &port->mode_list, list) {
> > +             if (ms->mode =3D=3D mode) {
> > +                     ms_target =3D ms;
> > +                     list_del(&ms->list);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!ms_target) {
> > +             ms_target =3D kzalloc(sizeof(struct mode_selection_state)=
, GFP_KERNEL);
> > +             if (!ms_target)
> > +                     return -ENOMEM;
> > +             ms_target->mode =3D mode;
> > +             ms_target->name =3D mode_names[mode];
> > +             INIT_LIST_HEAD(&ms_target->list);
> > +     }
> > +
> > +     if (priority >=3D 0)
> > +             ms_target->priority =3D priority;
> > +     else
> > +             ms_target->priority =3D default_priorities[mode];
> > +
> > +     while (ms_target) {
> > +             struct mode_selection_state *ms_peer =3D NULL;
> > +
> > +             list_for_each_entry(ms, &port->mode_list, list)
> > +                     if (ms->priority >=3D ms_target->priority) {
> > +                             if (ms->priority =3D=3D ms_target->priori=
ty)
> > +                                     ms_peer =3D ms;
> > +                             break;
> > +                     }
> > +
> > +             list_add_tail(&ms_target->list, &ms->list);
> > +             ms_target =3D ms_peer;
> > +             if (ms_target) {
> > +                     ms_target->priority++;
> > +                     list_del(&ms_target->list);
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +int typec_mode_get_priority(struct typec_port *port,
> > +             const enum typec_mode_type mode, int *priority)
> > +{
> > +     struct mode_selection_state *ms;
> > +
> > +     list_for_each_entry(ms, &port->mode_list, list)
> > +             if (ms->mode =3D=3D mode) {
> > +                     *priority =3D ms->priority;
> > +                     return 0;
> > +             }
> > +
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +ssize_t typec_mode_get_priority_list(struct typec_port *port, char *bu=
f)
> > +{
> > +     struct mode_selection_state *ms;
> > +     ssize_t count =3D 0;
> > +
> > +     list_for_each_entry(ms, &port->mode_list, list)
> > +             count +=3D sysfs_emit_at(buf, count, "%s ", ms->name);
> > +
> > +     return count + sysfs_emit_at(buf, count, "\n");
> > +}
> > diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mod=
e_selection.h
> > new file mode 100644
> > index 000000000000..151f0f8b6632
> > --- /dev/null
> > +++ b/drivers/usb/typec/mode_selection.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <linux/usb/typec_dp.h>
> > +#include <linux/usb/typec_tbt.h>
> > +
> > +static inline enum typec_mode_type typec_svid_to_altmode(const u16 svi=
d)
> > +{
> > +     switch (svid) {
> > +     case USB_TYPEC_DP_SID:
> > +             return TYPEC_DP_ALTMODE;
> > +     case USB_TYPEC_TBT_SID:
> > +             return TYPEC_TBT_ALTMODE;
> > +     }
> > +     return TYPEC_MODE_MAX;
> > +}
> > +
> > +void typec_mode_selection_init(struct typec_port *port);
> > +void typec_mode_selection_destroy(struct typec_port *port);
> > +int typec_mode_set_priority(struct typec_port *port,
> > +             const enum typec_mode_type mode, const int priority);
> > +int typec_mode_get_priority(struct typec_port *port,
> > +             const enum typec_mode_type mode, int *priority);
> > +ssize_t typec_mode_get_priority_list(struct typec_port *port, char *bu=
f);
> > diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/type=
c_altmode.h
> > index b3c0866ea70f..5d14363e02eb 100644
> > --- a/include/linux/usb/typec_altmode.h
> > +++ b/include/linux/usb/typec_altmode.h
> > @@ -145,6 +145,13 @@ enum {
> >
> >  #define TYPEC_MODAL_STATE(_state_)   ((_state_) + TYPEC_STATE_MODAL)
> >
> > +enum typec_mode_type {
> > +     TYPEC_DP_ALTMODE =3D 0,
> > +     TYPEC_TBT_ALTMODE,
> > +     TYPEC_USB4_MODE,
> > +     TYPEC_MODE_MAX,
> > +};
> > +
> >  struct typec_altmode *typec_altmode_get_plug(struct typec_altmode *alt=
mode,
> >                                            enum typec_plug_index index)=
;
> >  void typec_altmode_put_plug(struct typec_altmode *plug);
>
> It looks like this patch would allow the user space to write the mode
> priority order without it taking effect. You need to re-organise this
> series.
>
> Please introduce the kernel APIs first followed by the user space ABI
> changes. That should also make these a bit easier to review.
>
> thanks,
>
> --
> heikki
