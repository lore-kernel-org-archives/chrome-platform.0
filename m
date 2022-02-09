Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C202F23
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 03:42:09 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id y129so2367199ybe.7
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 19:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CnPuieAA45R+Cn7cQOpi068J2AYd/JgSUtDlGNknSQI=;
        b=AZnwjfRshXyPzqPIPPOZIBwXE2OBB4TSrGQFToT0R0Wu4pzLEYJsDVs4oqb2JDdI2b
         NeQPh3dKpSqjUmhkIiEdUcdC2WLGHHYULSJfRHoCj+J0nyHK9KzthFi386KJOowopwvZ
         00fFIXDuuJiUp0TZD2Sdh8n1KE2SAwXh0+i+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CnPuieAA45R+Cn7cQOpi068J2AYd/JgSUtDlGNknSQI=;
        b=YUcwQI0Y/2wJ0hVdfEiGzeF/ztQjISrhEilYaAgb9Cy+wseyVu/7G+zSeO9fmaFSem
         YqA0r2Svw9MvCx8ww8symBR+xKF/gnvDLf38N79A8W+7l+7M4TFgjBH2+lSvID6Zmvjd
         nYqm9y4KkfOu0vhd5yO7imGkJiutJ8E/Xyv2g/AzyIYhGBDF+kdV/9bxz7hL8D+2EWUW
         Hz/RJH+WXuOIsiZBKJYbuu2wiPVxl+ZHC2t3sUwpbAdcxp8kfXn3VJpmr+9S7g42xllU
         YZW6BkIr9a1orow+mVZgL+wg4H2a270NvXqlyDWkBOspWZz5u4PXiTStoSIhywMfEL+B
         cW3w==
X-Gm-Message-State: AOAM533Y2Mat8mEwEfwN5U7S1rAuHLuPwyjFKyCCPRYfk/N+1QtdNdrC
	RhnJMQTEAoA5Nmu6njYueHneHrphAoHIpUqef6JCJw==
X-Google-Smtp-Source: ABdhPJy4AuPuBilZB61l9fPeAtLlFGVf2W2h4Ha6zFYFfX08a8Ah4rVomwclUlKHdtLJRVjmPUVCKLciLbTpFwKoUPo=
X-Received: by 2002:a81:34d7:: with SMTP id b206mr290747ywa.489.1644378128857;
 Tue, 08 Feb 2022 19:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-4-pmalani@chromium.org> <YgIBv2SQdwXm7RLt@google.com>
 <CACeCKaezRNgsqrq3QJ1ViHjYScFrjpC-kCaYmE8kOXCcW9MRrw@mail.gmail.com>
 <YgJQ30D8nc4LWvUy@google.com> <CACeCKaf4+jxSkKFqx9g3YSPWj-FkbL=jrmHE3YEu7oU0ySPJ4Q@mail.gmail.com>
 <CACeCKadujMj4pJqf_jNNmO4UkQinw9QNu_MXe5zkTySUn6R=dw@mail.gmail.com> <YgM1pjwN2MHaMQCJ@google.com>
In-Reply-To: <YgM1pjwN2MHaMQCJ@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 8 Feb 2022 19:41:58 -0800
Message-ID: <CACeCKafm3o2Ht3F0njQZ+JptDM=yZMpi0qUS=DR07LiCC_O4Ww@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_typec: Configure muxes at
 start of port update
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 7:31 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Feb 08, 2022 at 02:58:51PM -0800, Prashant Malani wrote:
> > On Tue, Feb 8, 2022 at 10:35 AM Prashant Malani <pmalani@chromium.org> wrote:
> > > In general, I think you may benefit from reading:
> > > - The entire cros_ec_typec driver
> > > - The EC Type C state machine [2] and interfaces [3][4]
> > >
> > > The above 2 will help understand how this entire stack works. Without
> > > it, it is challenging
> > > to process the flow (just from code review).
> > >
> > > If you have further questions our would like to better understand the
> > > drivers, feel free to reach
> > > out to me over IM/email. I don't think public list code review is the
> > > best option for this
> > > sort of explanation.
> > >
> > > [1] https://elixir.bootlin.com/linux/latest/source/drivers/platform/chrome/cros_ec_typec.c#L549
> > > [2] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/usbc/
> > > [3] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/driver/usb_mux/usb_mux.c
> > > [4] https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/common/usb_pd_host_cmd.c
>
> Thanks for the link pointers.  It would take me some time to understand the
> background for reviewing the patch though.
>
> But in general, I would suggest to change the title for a stronger signal
> that it fixes something (per [1]).  Otherwise, the title and the description
> in cover letter looks like a move refactor.

I'm hesitant to use the term "fix" in the title; IMO the commit
message describes the potential race involved.
Since it is an unlikely edge case, brought about by limitations in how
the EC updates its state,
I'd like to avoid assigning it a "Fixes" label  too.

I can perhaps add some info to the cover letter, but I don't think
that alone is worth a v3.
I'll let this series hang for a few days; if there are other comments
which necessitate a respin, I'll
reword the cover letter.

-Prashant

>
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220207214026.1526151-4-pmalani@chromium.org/#24727676
