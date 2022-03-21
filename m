Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC5F612C
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 18:40:17 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id n7so17169142oif.5
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dmOvQ46mCjtGBLLol9T8BAHHpl5PuIHQ6rbM4/XPpWY=;
        b=gf93xLWq1SRRwEeFNDc/jQ2J9L5ZY2uDdhJruRdep/V65U1HSr3+SoQa0FvUWsumSR
         2BXG2rd1qFj17Pf1WPzjwRVFnz4sAzaPudShLoN7Qx9LefXdVKWwjbnR5cwa8SbkbjAs
         4xpN2X+ZDC1aHg/apcrFbaHoBnVrICbkXiYDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dmOvQ46mCjtGBLLol9T8BAHHpl5PuIHQ6rbM4/XPpWY=;
        b=umlLFTh21htOmQnjGGqJeqFGu2nOwkuunij111Zn4qZOsecysvXfXZL79tMH1uUy5b
         aEPSe1ADI7BwOhnjaM2hvVtcfLjKYswDsXTUdO7mS6UBtBepISN5TwtLQkkpcdnn+AfG
         0QyOWwiEh19FyjKAxih1/M5SdHNwzI2hkqKZNzsxjxanUaBwgUO/QWuIQNYAUDyJPoxH
         T1c4S0Dm0q0OwWDttwK7iutDjF0bDKvYnTLz+JH1j/5mBjRknSfw0jGN6J1qIU/uRhxR
         gxviiCBze7GrxR2wlqRgIG1QBhrEvS6byBpCyH4HBjmd4TOTukZ63YdcZ5hXQCRrsxbT
         paQA==
X-Gm-Message-State: AOAM533m+EgeryGZKOiyPUMq+Gba2r6K3GZXhAxRGQUbBN3kkS69c4jL
	9128kAOqzHbc6CjbJfkrDQe/67ETKPOhw9UBYvoghg==
X-Google-Smtp-Source: ABdhPJzZkterKbexQXTlKdtePkB2cipBfqvcKciOA7QEie/qzOh4Ze0Be7/L1/ZxwmkJarGxb9yskMPb/4PEzChpUoM=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr255999oif.63.1647888016943; Mon, 21 Mar
 2022 11:40:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Mar 2022 19:40:16 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAE-0n534-bDXrGUPMxs9qb0F26mO7XyegSt+c4GXKR7ywegcqw@mail.gmail.com>
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-4-swboyd@chromium.org>
 <CAD=FV=VJFoNgfMUHE5mUY6Uq2Jj5cyQVyW0osUm6jyHRE1no=w@mail.gmail.com>
 <CAE-0n50HcLLUUDgiMc7u4Gx5gb-bcpO22iD9emHrnM8sx8nbOQ@mail.gmail.com>
 <CAD=FV=V9U-zzpYNLKxqg1xh+W-RXLzV6BxaO4ZVF0GVXBVujUQ@mail.gmail.com> <CAE-0n534-bDXrGUPMxs9qb0F26mO7XyegSt+c4GXKR7ywegcqw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 21 Mar 2022 19:40:16 +0100
Message-ID: <CAE-0n501URga+ya37zmWjpZLxMO16CfoLeL2-Ui4qZa1PGK3CQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
To: Doug Anderson <dianders@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2022-03-18 16:36:32)
> Quoting Doug Anderson (2022-03-18 15:06:59)
> > On Fri, Mar 18, 2022 at 3:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > I'd rather not expose regulator control to userspace through some other
> > > sysfs attribute. Instead I'd prefer the flashing logic that twiddles
> > > gpios and power live all in the kernel and have userspace interact with
> > > a character device to program the firmware.
> >
> > Yeah, that would be even better, you're right.
> >
> > Hmmm, so maybe the answer is to just delay adding the regulator until
> > we're actually ready to specify it correctly and have the flashing
> > happen in the kernel?
> >
>
> I can enable it during probe just so that if the BIOS isn't doing it
> we'll have something that works assuming the DT is actually controlling
> the regulator. Or do nothing. It doesn't matter right now.

Thinking about it more there's no point in controlling the supply here
until we support flashing logic in the kernel. Without flashing support
in the kernel and without the BIOS turning on the power we can simply
make the regulator always-on and boot-on with real gpio control and then
it will be turned on during boot, emulating what the BIOS is doing. The
power cycling after flashing the firmware doesn't seem to be necessary
from my testing. And even then, the flashing script could unbind that
regulator driver if it really needed to control the power.
