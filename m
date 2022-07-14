Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2367E
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 20:55:42 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31c89111f23so29779017b3.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8FT3ZLNutfEmoo7t4rmO72smGUxB3YnBpqHmRoafQzY=;
        b=HZ44XAYGX8FzWTES4hRq2tiVKduTfdz38wnNZEGET5WEeI1z2v0MODo+hIiiXGMhhk
         lo1yal2LVQ/5q8OYb8sVbTJ1uQSNdmlmaPLmsWaB4vYeTn4RhaDqoOUdUIsEVCrC6Dfk
         lUnKh47qKGa8VtgxYoFUYXyuo5vKSwJOZwHXIMR60d0czsUXWTwhqg+d9dH5ctJsuXQn
         0V85jGrrNquwx5uzqTr9Ba4DvwDiaNAwPYyxhZH+BvxpDm11mQVtIc7DVli9QbNV0a0L
         SN/86WICfm4XgWrivcQxcxs/HlLehyh90AM/D3FAuYCm44bJ/C7fqVxrhkyY5dd/8/I3
         pxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8FT3ZLNutfEmoo7t4rmO72smGUxB3YnBpqHmRoafQzY=;
        b=RMy9yTmC6oOcNAQD9JpSgR3md4TGu2WmGWCSmE1DbfWPUzXNNH2qKtdx5iBPqJ1N2H
         NgItMf1rBsVh3opjHG6fPNWScfPRpl/4lXC1M8v4x5uFZJP+3yGjD/F6QzaP7Z7XiSzd
         wFejuJnU0sPHP8zTWzBJXXvl6N+0Goex5+R311ehUGCSMX8Zq+VxOf5lG1eZFjemOmce
         LRSBwgZ81JEQemlOqQJxeHOuzJp++DB0+xaVWw1xEUewsa5LxVvvh9WQ8qhd99i9IzdK
         u6AF+AJowNC3+O4e1ZU/Ds498Zi9q3b8rB7V9vROtr2GvTIvq7QdA9SH2DgNdZqNmT2j
         iu5w==
X-Gm-Message-State: AJIora+MggRegjqeAEJz3y/W7H6Wi/TyXz6kSGTVuNSLsRn207AUhRZ0
	n3BCqt5thDWwqwrRKBzlX5xZrXwJbcjuCH/iN1tz8w==
X-Google-Smtp-Source: AGRyM1vsf/AW9faiwfGsjYUxLdsLPzeCK7YiaADgr56vd4wbtXntiSBwM2BNvhM3ZJQTIQwNrAkxVD4gGrf+ES60C9A=
X-Received: by 2002:a81:4427:0:b0:31d:b9ad:4a7c with SMTP id
 r39-20020a814427000000b0031db9ad4a7cmr11478167ywa.396.1657832140847; Thu, 14
 Jul 2022 13:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
 <CACeCKadV=k5J1ZSG+p8M5iBnX5nXrn-XnK62Nq_op2kJ68+-9w@mail.gmail.com>
In-Reply-To: <CACeCKadV=k5J1ZSG+p8M5iBnX5nXrn-XnK62Nq_op2kJ68+-9w@mail.gmail.com>
From: Tim Van Patten <timvp@google.com>
Date: Thu, 14 Jul 2022 14:55:29 -0600
Message-ID: <CANkg5ewRc5zhBtxLhazo8Wsfa3Srj32AwZD9mD=W=Qqpqi7zJQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
To: Prashant Malani <pmalani@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org, 
	robbarnes@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

We had issues measuring overall suspend and resume times, which this
patch attempts to help resolve.   As stated in the description, the EC
host command logs couldn't be used reliably, since they weren't
generated at the start of suspend/end of resume, but instead at some
point in the middle of the procedures.   This CL moves when the
commands are sent from the AP to the EC to as early/late as possible
in an attempt to deterministically capture as much of each process as
possible.

While this patch could potentially be split, both the logging and PM
changes are means to the same end: improving logging behavior to make
it easier for developers to measure suspend/resume time and aid in
debugging.   This will make it easier to bisect CLs in the event of
regressions, as well as more deterministically verify optimizations
and improvements.

@Rob Barnes Please fill in any other gaps you think are relevant.


On Thu, Jul 14, 2022 at 12:34 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> HI Tim,
>
> On Wed, Jul 6, 2022 at 7:51 PM Tim Van Patten <timvp@google.com> wrote:
> >
> > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
> > .prepare() and cros_ec_lpc_resume() during .complete. This allows the
> > EC to log entry/exit of AP's suspend/resume more accurately.
> >
> > Signed-off-by: Tim Van Patten <timvp@google.com>
> > ---
> >
> > Changes in v2:
> > - Include cros_ec_resume() return value in dev_info() output.
> > - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
> >
> >  drivers/platform/chrome/cros_ec_lpc.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> > index 7677ab3c0ead9..ce49fbc4ed2e1 100644
> > --- a/drivers/platform/chrome/cros_ec_lpc.c
> > +++ b/drivers/platform/chrome/cros_ec_lpc.c
> > @@ -534,19 +534,27 @@ static int cros_ec_lpc_suspend(struct device *dev)
> >  {
> >         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
> >
> > +       dev_info(dev, "Prepare EC suspend\n");
>
> This patch is doing 2 things:
> 1. Changing the timing of cros_ec_lpc_suspend()/resume() invocation.
> 2. Adding print logs for these callbacks.
>
> Whether 2.) is necessary is already being discussed, so I won't
> comment on that, but it sounds
> like this should be 2 different patches.
>
> Also, please explain what is wrong with "Previously, those events were sent when
> suspend/resume were already in progress." IOW, what issue is this
> solving, besides
> better ordering of EC logs.
>
> BR,
>
> -Prashant



-- 

Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
