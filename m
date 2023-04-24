Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306172FAE
	for <chrome-platform@lists.linux.dev>; Mon, 24 Apr 2023 16:44:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4edc63e066fso12891e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Apr 2023 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682354697; x=1684946697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inVmY4dP78W6+xfv8444E1ni+qlbdKtlq0CSyg98djs=;
        b=sK9LVYYN1nzZk/yRCmg/OTBq5nDJy8x/DHH8c8vl53JdZpH/U1Bhh3oHpkAP/PgNuc
         OB0lbsRBTWCbL8Ea6TE1NzFRpeYfR658Fge17h3/f4ILc53bEsyXIkHkteoXUlrnt8cv
         /jK24x6+RBH2KVCckpAHFjJfTzFG0sodU1nAjfvViTUbu6bKn5ftM8bDrt3YAoB8EAN5
         j+2ueDDRlPMMn0nXD+K3yK2bcCjkG8RrsIiMACTGqhQX3ZTeH0cqJCeUjMVsk0orVqVZ
         RXS61T4qFPHJ0qZb7UiG/GgH7z7BT84muxIR/d4Jx0w/3skw95HDsWeZmbrTqUhCOVMw
         OWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354697; x=1684946697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inVmY4dP78W6+xfv8444E1ni+qlbdKtlq0CSyg98djs=;
        b=ByjcOU5ddTV3s/oxRQb0BAqUSYBZ3FDJVwGw0F/F/APbK0yxf9sW/w/Pa+Ngy2oJxy
         IcOIw1+q3YtVzUaoTRpSBVcgu7foXot5pZ0+KHnCR5QiiSN4U0i4c8Vi+cjoao7dZBDM
         6Ir0MAVy0WXTMXa9QyjvH00B+Rp3aUEIlem7PJDXU1ud8vfF8YzU0gTlPmRCfAd5ZOWB
         ChTxe9nIapggAkZM2z5RbBr3E7Bsl/7LNziSBvmXB/525orNaLoV/BEKD6ExDiMVC4zl
         g6OVsPr/YmAwmPJjOQ3rsr+LrQAa6Ecx5mn96R21Py3nIrYun1qiHwJl7HmmXCnO4N5n
         dR8w==
X-Gm-Message-State: AAQBX9cC4Q2EZVTVtvGQ/pL5xOVFKWvBmqsmGYy7lo+4ldld1D4/RxtH
	sjtRMCr+SO945py56ELNoNKsY0M1+4xrwDKJjIw9uQ==
X-Google-Smtp-Source: AKy350Z307o2Ng/bGOjwOT7j47djzujHR20ivE+4hMp8T8pmrxPl4fXwrQ7w9j/+rX+dOeJh+s+DV/ABzM7RNeA+/jk=
X-Received: by 2002:a05:6512:2825:b0:4ec:5157:bb37 with SMTP id
 cf37-20020a056512282500b004ec5157bb37mr275558lfb.2.1682354696702; Mon, 24 Apr
 2023 09:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230420174623.2794634-1-robbarnes@google.com> <CACeCKafp-bww4zW_taj9pxx1d_+4fuj4abiOZOvxSKPp9xswEw@mail.gmail.com>
In-Reply-To: <CACeCKafp-bww4zW_taj9pxx1d_+4fuj4abiOZOvxSKPp9xswEw@mail.gmail.com>
From: Rob Barnes <robbarnes@google.com>
Date: Mon, 24 Apr 2023 10:44:20 -0600
Message-ID: <CA+Dqm32q5oDiHgAFQzMi12H-hd+f=v-NL6F5Bx9r2Jh6THNZrw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Report EC panic as uevent
To: Prashant Malani <pmalani@chromium.org>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 3:08=E2=80=AFPM Prashant Malani <pmalani@chromium.o=
rg> wrote:
>
> On Thu, Apr 20, 2023 at 10:46=E2=80=AFAM Rob Barnes <robbarnes@google.com=
> wrote:
> >
> > Create a uevent when an EC panic is detected. This will allow udev rule=
s
> > to trigger when a panic occurs. E.g. a udev rule could be added to
> > create an EC coredump. This approach allows more code to be moved out
> > of the kernel drivers.
>
> Can you elaborate? What code do you plan on moving out of the kernel driv=
ers?
> Is there a follow up patch which does this?
>
More accurately, it's preventing the need for more code to be added to
the kernel drivers
to support new features, like EC coredump.

> Also, do you have a link to the userspace code that generates the coredum=
p?
>
This CL adss a udev rule to trigger the crash collector on EC panic:
https://chromium-review.googlesource.com/c/chromiumos/platform2/+/4450501

This WIP CL adds the EC coredump utility:
https://chromium-review.googlesource.com/c/chromiumos/platform/ec/+/4421417

This WIP CL adds a udev rule to trigger EC coredump utility on ec panic:
https://chromium-review.googlesource.com/c/chromiumos/overlays/chromiumos-o=
verlay/+/4424209

The WIP CLs should be ready for review later this week.
> >
> > Change-Id: I4fe7e4e603dcbf0ae6d4c4506f8978b0486abbbf
> Change-Id's are not accepted in upstream submissions.
>
> > Signed-off-by: Rob Barnes <robbarnes@google.com>
> > ---
> >  drivers/platform/chrome/cros_ec_lpc.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/c=
hrome/cros_ec_lpc.c
> > index b399f7cbf17be..f2d5b00e6c3a0 100644
> > --- a/drivers/platform/chrome/cros_ec_lpc.c
> > +++ b/drivers/platform/chrome/cros_ec_lpc.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/kobject.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_data/cros_ec_commands.h>
> >  #include <linux/platform_data/cros_ec_proto.h>
> > @@ -313,6 +314,23 @@ static int cros_ec_lpc_readmem(struct cros_ec_devi=
ce *ec, unsigned int offset,
> >         return cnt;
> >  }
> >
> > +/**
> > + * cros_ec_lpc_panic_uevent() - Publish EC panic uevent
> > + * @ec_dev: Device that panic'd
> > + *
> > + * This function will generate a uevent to notify userspace.
> > + * Typically the system will be reset shortly after an EC panic occurs=
.
> > + *
> > + * Return: 0 on success or <0 on error.
> > + */
> > +static int cros_ec_lpc_panic_uevent(struct cros_ec_device *ec_dev)
> > +{
> > +       struct device *dev =3D ec_dev->dev;
> > +       static char *env[] =3D { "ERROR=3DPANIC", NULL };
> > +
> > +       return kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, env);
> > +}
>
> I think it's better to just inline this. I don't see any other user for t=
his,
> and  the return value is being ignored anyway.
>
> > +
> >  static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, voi=
d *data)
> >  {
> >         struct cros_ec_device *ec_dev =3D data;
> > @@ -324,6 +342,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle dev=
ice, u32 value, void *data)
> >         if (value =3D=3D ACPI_NOTIFY_CROS_EC_PANIC) {
> >                 dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdow=
n is imminent!");
> >                 blocking_notifier_call_chain(&ec_dev->panic_notifier, 0=
, ec_dev);
> > +               cros_ec_lpc_panic_uevent(ec_dev);
> > +
> >                 /* Begin orderly shutdown. Force shutdown after 1 secon=
d. */
> >                 hw_protection_shutdown("CrOS EC Panic", 1000);
> >                 /* Do not query for other events after a panic is repor=
ted */
> > --
> > 2.39.2
> >
> >
