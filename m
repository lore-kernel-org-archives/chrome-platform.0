Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2BB7E
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 21:51:39 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31caffa4a45so30614307b3.3
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 14:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Is95C/L9u8P2TPO36yk8p8lfgnPVB5nyDTTX5guyjaU=;
        b=XIkoxh/9JOyfuHjAx7KJIMcBXGxB9e2PCqXf7smuLG4iFkGU8wl0JKd5uqPjcZ0lmu
         MddxyS6x/VAQ+Py6fvej3tqqwuvp5zS5bWwzGtDD/xM+ptQwgRk2Ft45f6Pp+xmxEy00
         LBj9LxTHOeAtk+QcHPKEwGYfaODCTflH7xTVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Is95C/L9u8P2TPO36yk8p8lfgnPVB5nyDTTX5guyjaU=;
        b=JA84ZV3jl44HKw45tObL/HeY1UbD7OsGEglwfudyh/Ki5Q+tu8eZX2FCJvhrENLfYW
         jFYJJK/tVembYw+U4jkc7YSOkyaZeIkinro6BLhSSSIhFteO584K6J2FfCizLk5Vcc+0
         8F64KCsOcONPiSlePzoxf8qxJvsoNWgllB3SaqUMJ8Wrr94M283CHoJbyF1RTPXZ4oxf
         zu8UQrR92f6M6YSR2dOv6tl7r1uLoVY9BwRX8Md+nMn3P2pia/eMgm6TApkuWlvmZr0r
         LftkCirxJ0Tz+roefZ4Jt44h42vogWVd9oD1PhFHA79+qMJ4hacT0Lf1VJ5LrXK4+q6I
         oZXA==
X-Gm-Message-State: AJIora+vGV9PfQu9ujR2DsPfdkQ+PW54H4wcV6TgFwqONaeImVeufCwp
	UGqpb1pHxKgUwdemyEkb6nBBJLXvNRVNQh7eYun9yg==
X-Google-Smtp-Source: AGRyM1tCouO8shQx1D4/D7nmNdE9NSDbKg9yUp3w4dmDoXPXkBMBkN9F0iCrn/FEgA5dgZfulBxSjmA3qMyupeKRcKo=
X-Received: by 2002:a81:6054:0:b0:31c:97f4:b5c with SMTP id
 u81-20020a816054000000b0031c97f40b5cmr12384788ywb.432.1657835499055; Thu, 14
 Jul 2022 14:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
 <CACeCKadV=k5J1ZSG+p8M5iBnX5nXrn-XnK62Nq_op2kJ68+-9w@mail.gmail.com> <CANkg5ewRc5zhBtxLhazo8Wsfa3Srj32AwZD9mD=W=Qqpqi7zJQ@mail.gmail.com>
In-Reply-To: <CANkg5ewRc5zhBtxLhazo8Wsfa3Srj32AwZD9mD=W=Qqpqi7zJQ@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 14 Jul 2022 14:51:28 -0700
Message-ID: <CACeCKaer_hacWmLDDMJSK-KFjxqiXV8S1-ydCWGT3mkQVeN-rg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tim Van Patten <timvp@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org, 
	robbarnes@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

On Thu, Jul 14, 2022 at 1:55 PM Tim Van Patten <timvp@google.com> wrote:
>
> Hi,

Please avoid top-posting [1]

>
> We had issues measuring overall suspend and resume times, which this
> patch attempts to help resolve.   As stated in the description, the EC
> host command logs couldn't be used reliably, since they weren't
> generated at the start of suspend/end of resume, but instead at some
> point in the middle of the procedures.   This CL moves when the
> commands are sent from the AP to the EC to as early/late as possible
> in an attempt to deterministically capture as much of each process as
> possible.

If the timing of the EC host command logs is unreliable, why not add
new host commands specifically for this, and then call those at the moment(s)
you deem is more appropriate, instead of moving the suspend/resume itself
(which may be introducing its own timing ramifications)?

Calling such a theoretical new EC host command from the userspace power manager
would probably accomplish the same thing.

From the kernel documentation[2], "The prepare phase is meant to
prevent races by preventing new devices from being registered; the PM core
would never know that all the children of a device had been suspended if new
children could be registered at will." and "The method may also prepare the
device or driver in some way for the upcoming system power transition, but
it should not put the device into a low-power state."

So it seems like an incorrect usage of this callback.

>
> While this patch could potentially be split, both the logging and PM
> changes are means to the same end: improving logging behavior to make
> it easier for developers to measure suspend/resume time and aid in
> debugging.

That alone is not sufficient cause to combine 2 different changes into
a single patch.
The flip side is: the patch to move the suspend/resume host commands into
prepare/complete() can itself introduce regressions. We should be able to
revert that without touching the patch adding the logging (assuming concerns
regarding that are addressed).

BR,

-Prashant

[1] See "Top-posting" in https://people.kernel.org/tglx/
[2] https://kernel.org/doc/html/latest/driver-api/pm/devices.html#entering-system-suspend




> This will make it easier to bisect CLs in the event of
> regressions, as well as more deterministically verify optimizations
> and improvements.
>
> @Rob Barnes Please fill in any other gaps you think are relevant.
>
>
> On Thu, Jul 14, 2022 at 12:34 PM Prashant Malani <pmalani@chromium.org> wrote:
> >
> > HI Tim,
> >
> > On Wed, Jul 6, 2022 at 7:51 PM Tim Van Patten <timvp@google.com> wrote:
> > >
> > > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
> > > .prepare() and cros_ec_lpc_resume() during .complete. This allows the
> > > EC to log entry/exit of AP's suspend/resume more accurately.
> > >
> > > Signed-off-by: Tim Van Patten <timvp@google.com>
> > > ---
> > >
> > > Changes in v2:
> > > - Include cros_ec_resume() return value in dev_info() output.
> > > - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
> > >
> > >  drivers/platform/chrome/cros_ec_lpc.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> > > index 7677ab3c0ead9..ce49fbc4ed2e1 100644
> > > --- a/drivers/platform/chrome/cros_ec_lpc.c
> > > +++ b/drivers/platform/chrome/cros_ec_lpc.c
> > > @@ -534,19 +534,27 @@ static int cros_ec_lpc_suspend(struct device *dev)
> > >  {
> > >         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
> > >
> > > +       dev_info(dev, "Prepare EC suspend\n");
> >
> > This patch is doing 2 things:
> > 1. Changing the timing of cros_ec_lpc_suspend()/resume() invocation.
> > 2. Adding print logs for these callbacks.
> >
> > Whether 2.) is necessary is already being discussed, so I won't
> > comment on that, but it sounds
> > like this should be 2 different patches.
> >
> > Also, please explain what is wrong with "Previously, those events were sent when
> > suspend/resume were already in progress." IOW, what issue is this
> > solving, besides
> > better ordering of EC logs.
> >
> > BR,
> >
> > -Prashant
>
>
>
> --
>
> Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
