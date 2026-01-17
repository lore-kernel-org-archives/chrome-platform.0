Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0DD286D57
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678109; cv=none; b=rqLM02o8GeMPYhlzg8T4U8Kf0PfmMv2jC10g/A6lT3OLDGQB7N5POz7xvZgCODChwAJ80AVkIkjSjN/XUrsvX8nB1aPL96RSC+WrIqsh2zsKFI13rhBUs752G63oIL7xdeqwRHPZ7Iu2CGL1ZE9S3VfKVIfgkWdtBdG7fA7WCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678109; c=relaxed/simple;
	bh=Wg5Xqnwy2vbbtX9RTMyBaGJiW5IhHY0ZZ63Omd67Q6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NK31GMXAOJNp6BDCcdlVVPKCYox9ffGCerG7Ql5hmv8f/GV7JMpqK/k3qpx3CfUSpOhX2p9aJMsc4YIKUBm6y9gwlg+ZcBdGQkaUJZ2FCvPvVMYSesnIukrPR86eccGyFdMXetw3eedVjLcNDx67jYvdOR9DZ6Do8F7K9tZsd7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AvxtR6OH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AvxtR6OH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso1840317a91.0
        for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 11:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768678107; x=1769282907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZTF1+LgXV/vIjF0ra+qRa28WGiK3BElrTtPKASsQpU=;
        b=AvxtR6OH4bdYH/Ce0El/fVldD7pZllb3KS+cBA3OkDNYkBV8AiDqENixs6d3HkRnfS
         27k2MgxydSshUqlVbv4XXMceyL2MiI0yRGQDeYiwvP0W+ZU3dIzYutnWguH+pQwHZ0rr
         f3snjl0neFPdptQwHshtIpYL2451hZjrqB6uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678107; x=1769282907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZTF1+LgXV/vIjF0ra+qRa28WGiK3BElrTtPKASsQpU=;
        b=OOskfydKw5l2Bi97J9zFZomxQIfi7Gbt0TjDShIk+UQ00PJgKIzksfsZfdcrBPyVla
         aoQ68u+ec85q33OZRvHxtgIQImmAOsYry/i72Uj/S+4+G7uswj+EYMU7jMOrft+kw3fr
         SK7Xj6cLixHJsxiMuxVjGEozntt8bz6oUIwf+k5gtoS4xdTDLY73x9X1Gwxea3v0/r7W
         vdKs7QqI0BPKCW1RKCJizUf/AWHNsLGmSgJoaz3b/4q8306BJEjFVrC+GPKogEaAfnPe
         5Dc7HVlqfqoxGfrA8h8Y3Fjip7qDnP1TEzuyn7Si+erXjnPl8Wo+DRuE7iX8EkIAvxx9
         nxvw==
X-Forwarded-Encrypted: i=1; AJvYcCWsHbZlv4fYCp6xFdWKMiKpW35W7CUrBoXgtF2lfKQ0ypd9lz/Y70Q1UPbxuYL33Y9twdVGLZVSDSpclUKLbEM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVKFPPZIXbdi/0AyXSyoAsiKxAEEzb8bXulrDiIIQ1MsukuHL1
	nKxDgRa2QoP7SIhXNYb3LbrUqZraG5lf+OragrMVk7OcIlM/KgPUFMUZ/LfKAyblgSpb/8JRydI
	nkv86Tt8fqra91NNkh0mFr48xvCE0lTDW8tP8Ii5H
X-Gm-Gg: AY/fxX6evtuAZ/rmgD6hyGV2CvSQxHLRjFM9aoCCFW85VbpNKVMfNFtkqh51ck/LrUY
	dYQbSC7Wc1zAW3/a58RZo3p7HrF0TeCyA8/DiavtZ6V2vIlY240uLMjpptlzSIAeICdauuN6XXe
	8UzzotlI+kI06bVYxKfTS36IcYuIkygbURHHpqsYE2eMgwZYKwvwdaA2y8hgw1qQ6ObfoBOcat1
	L6sRG9B39ofD5neY8/YyvCCX/1xXJnJIEVElT2RZ7MTPst3y/WnOWKShICNDNvsi1IsxA==
X-Received: by 2002:a17:90b:570f:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-35272bcba8cmr6159734a91.1.1768678106947; Sat, 17 Jan 2026
 11:28:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113130536.3068311-1-akuchynski@chromium.org>
 <20260113130536.3068311-6-akuchynski@chromium.org> <aWj_M-NH4RL8h-jy@kuha>
In-Reply-To: <aWj_M-NH4RL8h-jy@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Sat, 17 Jan 2026 20:28:15 +0100
X-Gm-Features: AZwV_QhME5I2zCA0dSsWE14FK0wJZAI3-PLyWEuk_WlQjvPiX1_S-nrQK_P-2Ps
Message-ID: <CAMMMRMepwLPExp4i3M-d3mD_55rcLPGRsB-wVjB0Z-+yzn75-Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] usb: typec: Implement mode selection
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

On Thu, Jan 15, 2026 at 3:53=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Tue, Jan 13, 2026 at 01:05:33PM +0000, Andrei Kuchynski kirjoitti:
> > The mode selection process is controlled by the following API functions=
,
> > which allow to initiate and complete mode entry based on the priority o=
f
> > each mode:
> >
> > `typec_mode_selection_start` function compiles a priority list of suppo=
rted
> > Alternate Modes.
> > `typec_altmode_state_update` function is invoked by the port driver to
> > communicate the current mode of the Type-C connector.
> > `typec_mode_selection_delete` function stops the currently running mode
> > selection process and releases all associated system resources.
> >
> > `mode_selection_work_fn` task attempts to activate modes. The process s=
tops
> > on success; otherwise, it proceeds to the next mode after a timeout or
> > error.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/Makefile         |   2 +-
> >  drivers/usb/typec/class.h          |   2 +
> >  drivers/usb/typec/mode_selection.c | 288 +++++++++++++++++++++++++++++
> >  include/linux/usb/typec_altmode.h  |  40 ++++
> >  4 files changed, 331 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/usb/typec/mode_selection.c
> >
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index 7a368fea61bc9..8a6a1c663eb69 100644
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
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index 2e89a83c2eb70..d3435936ee7c8 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -9,6 +9,7 @@
> >  struct typec_mux;
> >  struct typec_switch;
> >  struct usb_device;
> > +struct mode_selection;
> >
> >  struct typec_plug {
> >       struct device                   dev;
> > @@ -39,6 +40,7 @@ struct typec_partner {
> >       u8                              usb_capability;
> >
> >       struct usb_power_delivery       *pd;
> > +     struct mode_selection   *sel;
> >
> >       void (*attach)(struct typec_partner *partner, struct device *dev)=
;
> >       void (*deattach)(struct typec_partner *partner, struct device *de=
v);
> > diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mod=
e_selection.c
> > new file mode 100644
> > index 0000000000000..63a1d251c72b4
> > --- /dev/null
> > +++ b/drivers/usb/typec/mode_selection.c
> > @@ -0,0 +1,288 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2025 Google LLC.
> > + */
> > +
> > +#include <linux/types.h>
> > +#include <linux/list_sort.h>
> > +#include <linux/slab.h>
> > +#include <linux/mutex.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/usb/typec_altmode.h>
> > +
> > +#include "class.h"
> > +
> > +/**
> > + * struct mode_state - State tracking for a specific Type-C alternate =
mode
> > + * @svid: Standard or Vendor ID of the Alternate Mode
> > + * @priority: Mode priority
> > + * @error: Outcome of the last attempt to enter the mode
> > + * @list: List head to link this mode state into a prioritized list
> > + */
> > +struct mode_state {
> > +     u16 svid;
> > +     u8 priority;
> > +     int error;
> > +     struct list_head list;
> > +};
> > +
> > +/**
> > + * struct mode_selection - Manages the selection and state of Alternat=
e Modes
> > + * @mode_list: Prioritized list of available Alternate Modes
> > + * @lock: Mutex to protect mode_list
> > + * @work: Work structure
> > + * @partner: Handle to the Type-C partner device
> > + * @active_svid: svid of currently active mode
> > + * @timeout: Timeout for a mode entry attempt, ms
> > + * @delay: Delay between mode entry/exit attempts, ms
> > + */
> > +struct mode_selection {
> > +     struct list_head mode_list;
> > +     struct mutex lock;
> > +     struct delayed_work work;
> > +     struct typec_partner *partner;
> > +     u16 active_svid;
> > +     unsigned int timeout;
> > +     unsigned int delay;
> > +};
> > +
> > +/**
> > + * struct mode_order - Mode activation tracking
> > + * @svid: Standard or Vendor ID of the Alternate Mode
> > + * @enter: Flag indicating if the driver is currently attempting to en=
ter or
> > + * exit the mode
> > + * @result: Outcome of the attempt to activate the mode
> > + */
> > +struct mode_order {
> > +     u16 svid;
> > +     int enter;
> > +     int result;
> > +};
> > +
> > +static int activate_altmode(struct device *dev, void *data)
> > +{
> > +     if (is_typec_partner_altmode(dev)) {
> > +             struct typec_altmode *alt =3D to_typec_altmode(dev);
> > +             struct mode_order *order =3D (struct mode_order *)data;
> > +
> > +             if (order->svid =3D=3D alt->svid) {
> > +                     if (alt->ops && alt->ops->activate)
> > +                             order->result =3D alt->ops->activate(alt,=
 order->enter);
> > +                     else
> > +                             order->result =3D -EOPNOTSUPP;
> > +                     return 1;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int mode_selection_activate(struct mode_selection *sel,
> > +             const u16 svid, const int enter)
>
> You need to run these through "scripts/checkpatch.pl --strict".
> Please fix all the checks that it gives you.
>

Looks like I ran it without the "--strict" parameter.
My mistake, I'll fix it.

> > +
> > +     __must_hold(&sel->lock)
> > +{
> > +     struct mode_order order =3D {.svid =3D svid, .enter =3D enter, .r=
esult =3D -ENODEV};
> > +
> > +     /*
> > +      * The port driver may acquire its internal mutex during alternat=
e mode
> > +      * activation. Since this is the same mutex that may be held duri=
ng the
> > +      * execution of typec_altmode_state_update(), it is crucial to re=
lease
> > +      * sel->mutex before activation to avoid potential deadlock.
> > +      * Note that sel->mode_list must remain invariant throughout this=
 unlocked
> > +      * interval.
> > +      */
> > +     mutex_unlock(&sel->lock);
> > +     device_for_each_child(&sel->partner->dev, &order, activate_altmod=
e);
> > +     mutex_lock(&sel->lock);
> > +
> > +     return order.result;
> > +}
> > +
> > +static void mode_list_clean(struct mode_selection *sel)
> > +{
> > +     struct mode_state *ms, *tmp;
> > +
> > +     list_for_each_entry_safe(ms, tmp, &sel->mode_list, list) {
> > +             list_del(&ms->list);
> > +             kfree(ms);
> > +     }
> > +}
> > +
> > +/**
> > + * mode_selection_work_fn() - Alternate mode activation task
> > + * @work: work structure
> > + *
> > + * - If the Alternate Mode currently prioritized at the top of the lis=
t is already
> > + * active, the entire selection process is considered finished.
> > + * - If a different Alternate Mode is currently active, the system mus=
t exit that
> > + * active mode first before attempting any new entry.
> > + *
> > + * The function then checks the result of the attempt to entre the cur=
rent mode,
> > + * stored in the `ms->error` field:
> > + * - if the attempt FAILED, the mode is deactivated and removed from t=
he list.
> > + * - `ms->error` value of 0 signifies that the mode has not yet been a=
ctivated.
> > + *
> > + * Once successfully activated, the task is scheduled for subsequent e=
ntry after
> > + * a timeout period. The alternate mode driver is expected to call bac=
k with the
> > + * actual mode entry result via `typec_altmode_state_update()`.
> > + */
> > +static void mode_selection_work_fn(struct work_struct *work)
> > +{
> > +     struct mode_selection *sel =3D container_of(work,
> > +                             struct mode_selection, work.work);
> > +     struct mode_state *ms;
> > +     unsigned int delay =3D sel->delay;
> > +     int result;
> > +
> > +     mutex_lock(&sel->lock);
>
> guard(mutex)(&sel->lock); ?
>

Sounds great. Thanks

> > +     ms =3D list_first_entry_or_null(&sel->mode_list, struct mode_stat=
e, list);
> > +     if (!ms) {
> > +             mutex_unlock(&sel->lock);
> > +             return;
> > +     }
> > +
> > +     if (sel->active_svid =3D=3D ms->svid) {
> > +             dev_dbg(&sel->partner->dev, "%x altmode is active\n", ms-=
>svid);
> > +             mode_list_clean(sel);
> > +     } else if (sel->active_svid !=3D 0) {
> > +             result =3D mode_selection_activate(sel, sel->active_svid,=
 0);
> > +             if (result) {
> > +                     dev_dbg(&sel->partner->dev, "enable to exit %x al=
tmode\n",
> > +                                     sel->active_svid);
>
> "enable to exit" ?
>
> Just drop that dev_dbg.
>
> > +                     mode_list_clean(sel);
> > +             } else {
> > +                     sel->active_svid =3D 0;
> > +             }
> > +     } else if (ms->error) {
> > +             dev_dbg(&sel->partner->dev, "%x: entry error %pe\n",
> > +                             ms->svid, ERR_PTR(ms->error));
>
> dev_err (or dev_warn)?
>

I will change dev_dbg to dev_err and remove the message when exiting
the mode.

Thanks,
Andrei
