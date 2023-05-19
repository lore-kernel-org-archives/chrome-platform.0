Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D95670
	for <chrome-platform@lists.linux.dev>; Fri, 19 May 2023 15:33:03 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7576516c81fso330474285a.1
        for <chrome-platform@lists.linux.dev>; Fri, 19 May 2023 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684510382; x=1687102382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kxy+rwK3enUPv3xL2BXOn58zbTbgfauUuJX0uZ3fQ6Q=;
        b=mym6MEH6W1MyKl99fdoCqm1n9Yj6eOg4ue991079wWcQZiTubCmnUf2QwbNveAsQ7I
         rtmG70t6mug7qYSTmuLGy6Ob+Ix0zrhQNr5gRNG3qd5FBBf0PKZeCoP70R2ptdvifnZi
         HAPtUInBrHu4Ig4lzJTzQUu+0/nLbVaxRvP5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684510382; x=1687102382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kxy+rwK3enUPv3xL2BXOn58zbTbgfauUuJX0uZ3fQ6Q=;
        b=ixCLnaGs7BFO8dj02q1eGHp/6PUH68uXIyvC65PZrO/Qm1XVb1Cu6ztmIpsuEiqLAH
         JjOLHcnl7pNp4G6L1pLl4SOAKtNFqlq5WDN2YE5hl7AKtxRB1iBkpRIbpr9YJ9KGFDtn
         5jNJq0CxgU12lPUTZRfD6dpy4y7sFDUZmEGXSYSNo0zWYlO2OexQzpgnT8IExNFvak6O
         iv4hTL2nQUCMDEUrMc4APvF7Nr3PJ91T3tzHqfKrWW/+fJwWSZfPQR2fDJzvyOhRk6LT
         0byNxlW7zgUBHKWSrd5RYDVJPmtqmvxI55tBlj7wyhih4rwZkUb237EXAg3NSy20JAc+
         dR3A==
X-Gm-Message-State: AC+VfDyxAvcse4Xw3HM3oTkm1nYq5fXJ90rJD/VezvrsclJVwjipVRC0
	nJ8lqCtqS5cCJj/V8W5St5Bnc5GNNneVZhAxm3Y/BQ==
X-Google-Smtp-Source: ACHHUZ4euJqTxX9RYlpmPT+2WCkKOpGIAFPFTBdjpEhT2FoeJf3WzB2Yu+faYR8G6kOx+r1SQEFXaNYECKjMV0lYVZM=
X-Received: by 2002:a05:622a:1183:b0:3f5:491e:946d with SMTP id
 m3-20020a05622a118300b003f5491e946dmr4850090qtk.51.1684510381993; Fri, 19 May
 2023 08:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
 <ZGQ9Y+vqWhQLHAQh@google.com> <CAMaBtwHxaevxLY7zWNDU8zbyWx=puLkeeRAjFtovvrA5pjtJ4w@mail.gmail.com>
 <ZGWBhEMmo2lStTg9@google.com> <CAMaBtwFtE=vjuhVy7rw9zCe9WV0dRyeBWj88JH2j3bkbh2BkXA@mail.gmail.com>
 <ZGbXFtrBzbaD9rQs@google.com>
In-Reply-To: <ZGbXFtrBzbaD9rQs@google.com>
From: Tim Van Patten <timvp@chromium.org>
Date: Fri, 19 May 2023 09:32:51 -0600
Message-ID: <CAMaBtwHwfZCCQ4J_kNjNQtPJ1b5uHQTRHtHaxS+8odBUjivFUg@mail.gmail.com>
Subject: Re: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, robbarnes@google.com, 
	lalithkraj@google.com, rrangel@chromium.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Garrick Evans <garrick@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 7:55=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, May 18, 2023 at 10:47:23AM -0600, Tim Van Patten wrote:
> > On Wed, May 17, 2023 at 7:38=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > > On Wed, May 17, 2023 at 09:56:59AM -0600, Tim Van Patten wrote:
> > > > The issue is that we need the EC aware of the AP being in the proce=
ss
> > > > of suspend/resume from start to finish, so we can accurately
> > > > determine:
> > > > - How long the process took to better gauge we're meeting ChromeOS =
requirements.
> > > > - When the AP failed to complete the process, so we can collect dat=
a
> > > > and perform error recovery.
> [...]
> > > How could the *error* recovery do?
> >
> > I don't understand what this is asking.
>
> Given that you said "we can collect data and perform error recovery" if t=
he
> suspend-resume takes more/less time than expected.  I'm trying to underst=
and
> what does "error recovery" mean.  What recovery it could take?

Currently, for AMD, the EC will trigger data collection and either
reset the AP or send a host event to attempt to trigger the AP into
it's own recovery. Intel is looking into adding error recovery as
well.

> > > > > What about other interfaces (i2c, spi, uart)?  Do they also need =
to change
> > > > the callbacks?
> > > >
> > > > We aren't concerned about those devices, because they aren't being
> > > > used on the devices we're seeing issues with. If devices using thos=
e
> > > > ECs want this change, they can pick it up as well, but we don't hav=
e
> > > > any way to test changes on those devices (whatever they may be).
> > >
> > > This doesn't sound good.  As I would suppose you are adding some new =
EC FW
> > > features regarding to EC_CMD_HOST_SLEEP_EVENT, you should consider th=
e
> > > existing systems too.
> >
> > Again, why are you assuming there is new EC FW for this? This is only
> > changing when an already-existing host command is being sent. Nothing
> > is being added or removed.
>
> I see.  There is no EC changes.
>
> Specifically, do you see any crashes, or premature events, or mal-functio=
ns
> regarding to the measurement is not that accurate?

No, we don't see any issues with the current or new timings of sending
these commands.

> Also, we wouldn't want it to be LPC-specialized.  Please consider other
> interfaces.

I'm intentionally excluding those interfaces because we don't have any
way to test/validate this change on those devices. Additionally, we
don't have any devices that use this suspend/resume tracking logic
using those interfaces, so there's no reason to introduce any risk by
changing devices that don't need it.
