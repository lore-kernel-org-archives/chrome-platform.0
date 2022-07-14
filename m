Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2BB6029
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 22:17:44 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id y195so5718786yby.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 15:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fB7UyA3G0pIY+h82doefrasqYLaby+Atx6RkVerDDjc=;
        b=SfrNlaZsJvjnnOLnUOsgA1fvwinhQETk/ZCTxYT021RkcK4JrTklS1y+xOWlIBkkmQ
         QTLgDz1Lf0FHZklmOC+oXYOxB/SGngALX2X8hmKH1rrzw/pgbnhuUOQAilFGU6d+ku9O
         gxftjQPjzLeHLMfQ1CQE85R1bmYC4xm4BQKxKkjpNOFKo2ti3zoVluTXzPtoRAbbjuBQ
         0iDKiK1PbV9FJyfwgBRO8ONatjQULnd9Ly8uwqLlRFgEglBktxhYJAsYJMrEPnC5bCG0
         0rjYaJwOr3mKTM1SqTp7EUOnS1vVZDgwS8M7Lhu9LaCZIHqJMhl/dHrwrVdBC9zrAKtp
         ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fB7UyA3G0pIY+h82doefrasqYLaby+Atx6RkVerDDjc=;
        b=D2bNoY/ZTxe9sYwWF09VbURdTTx7b3maoLI95V6ArEJNB2wF1LGgCjq+Q98YKKKDcC
         lDSmNZcUWkyT3U3mf1Wge4AZxAEtNRvpCAbLa8qM6ctyfsZm76LMAmVD8j936qRujixD
         YW0auOZshqNyu48gi7vRZL92Upyctya+mQWAfZmnurj1CTDWyytKTbr1OJ9ynO9tyBLs
         ejq3E9PeLZVMvrLW11QwC06bagWwcDhoPq+vqcqWpTN0+Jw7igpHsaBzrNhHFIdr3BQx
         +zL/QNo735gUkTTidwoIXC5Q9V0NaI/wFHRR+5wNhFicG7fU1+B3ctI73SuGXllFPjGV
         sRYQ==
X-Gm-Message-State: AJIora8hsM1GPqpF/P6FeGmtjMbEnOTv79cSjB0CBcHJW/sMiA8dyXzz
	n/OEuV6APNU+O1Cdxty4CumlUZ2Gm8apFvdE59Sprw==
X-Google-Smtp-Source: AGRyM1uSAUTzD2JD0rgbA4MiEYzs6sy1mv8pRq4j5LVuDaq5SlFPJUd7LrUABX+V2rxEkIvQOjU4rGx0oe3onjRPwk8=
X-Received: by 2002:a25:8a81:0:b0:65b:9268:2760 with SMTP id
 h1-20020a258a81000000b0065b92682760mr11279476ybl.119.1657837063641; Thu, 14
 Jul 2022 15:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
 <CACeCKadV=k5J1ZSG+p8M5iBnX5nXrn-XnK62Nq_op2kJ68+-9w@mail.gmail.com>
 <CANkg5ewRc5zhBtxLhazo8Wsfa3Srj32AwZD9mD=W=Qqpqi7zJQ@mail.gmail.com> <CACeCKaer_hacWmLDDMJSK-KFjxqiXV8S1-ydCWGT3mkQVeN-rg@mail.gmail.com>
In-Reply-To: <CACeCKaer_hacWmLDDMJSK-KFjxqiXV8S1-ydCWGT3mkQVeN-rg@mail.gmail.com>
From: Tim Van Patten <timvp@google.com>
Date: Thu, 14 Jul 2022 16:17:32 -0600
Message-ID: <CANkg5exPZH7LXV93SbAbNPsX2M-kE1yHqDhfk-cB0ywS15pOPQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
To: Prashant Malani <pmalani@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org, 
	robbarnes@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

> > We had issues measuring overall suspend and resume times, which this
> > patch attempts to help resolve.   As stated in the description, the EC
> > host command logs couldn't be used reliably, since they weren't
> > generated at the start of suspend/end of resume, but instead at some
> > point in the middle of the procedures.   This CL moves when the
> > commands are sent from the AP to the EC to as early/late as possible
> > in an attempt to deterministically capture as much of each process as
> > possible.
>
> If the timing of the EC host command logs is unreliable, why not add
> new host commands specifically for this, and then call those at the moment(s)
> you deem is more appropriate, instead of moving the suspend/resume itself
> (which may be introducing its own timing ramifications)?
>
> Calling such a theoretical new EC host command from the userspace power manager
> would probably accomplish the same thing.

We investigated something like that internally initially:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3646238)

We decided to take this simpler approach instead, since it
accomplishes the same goal without requiring new host commands.

> From the kernel documentation[2], "The prepare phase is meant to
> prevent races by preventing new devices from being registered; the PM core
> would never know that all the children of a device had been suspended if new
> children could be registered at will." and "The method may also prepare the
> device or driver in some way for the upcoming system power transition, but
> it should not put the device into a low-power state."
>
> So it seems like an incorrect usage of this callback.

Why is this usage incorrect?

Sending the message to the EC is the preparation for the AP to enter
the system power transition.   For example, it allows the EC to begin
watchdogging the AP once the suspend begins and stop once the resume
completes. This allows the EC to watchdog the entire process, without
any gaps - a beneficial side effect of this change.

> > While this patch could potentially be split, both the logging and PM
> > changes are means to the same end: improving logging behavior to make
> > it easier for developers to measure suspend/resume time and aid in
> > debugging.
>
> That alone is not sufficient cause to combine 2 different changes into
> a single patch.
> The flip side is: the patch to move the suspend/resume host commands into
> prepare/complete() can itself introduce regressions. We should be able to
> revert that without touching the patch adding the logging (assuming concerns
> regarding that are addressed).

Keeping the logging while reverting the PM change would be misleading
to developers while debugging, since the log messages are no longer
indicating the start/end of suspend/resume.

Regardless, I can move them into a separate patch if this necessary.

-- 

Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
