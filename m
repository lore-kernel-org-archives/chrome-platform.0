Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D57E
	for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 15:01:02 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3378303138bso427384217b3.9
        for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 08:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=w/neHTaTWq1ptoHqjo7z/PdpJgw6jeoMDrumR+964UM=;
        b=ROw5MoxKYMwqB/5il+mLr8BTFl+InjDDa5egW+sJ7qrA+oER7wn6HxufxsyITS6a6C
         PjQGeKgkOseiUZnqzNQP1BSsQWjVmILvJZqWIJBEM/gDOvsPZnppRXwAmsVuQUuAtTxp
         JeAvHgNApD3RZYQlm16Ec2C6ERGOZd98H30cj8Pil4qH3B7kJJJjvD8s6ei7MpPy9yUE
         5KghnaYLtgn6rtK6FdCfh4WPvp1847L/DtrJS40S/DqmXPFColmSMQYtnFtu1sz3o/3N
         rMq9UNrPRwG+4VEgIFW53r/lOkTgD69hXQkblO90vtjC+RPV97PygzZt0DzTY6f2VHxC
         bE8w==
X-Gm-Message-State: ACgBeo1sudjcF9K/eMIj4B8QckhsuAtmI1OdmTLfyqPclTOZ7fimz2fv
	QFgqEq8XEP2vURwec6xkrz/X8E4U/65hLPf6p98=
X-Google-Smtp-Source: AA6agR6/lAmWch493Semg1Kd4FFp/bUFNZNfcthgZaX2pgKcypwxarkt1Qr548YVHjI6HNTUbTAocunJffuYpdMzP2I=
X-Received: by 2002:a25:b749:0:b0:68f:171f:96bd with SMTP id
 e9-20020a25b749000000b0068f171f96bdmr29627443ybm.137.1661353261244; Wed, 24
 Aug 2022 08:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com> <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
 <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
In-Reply-To: <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Aug 2022 17:00:49 +0200
Message-ID: <CAJZ5v0hXAgA2xfYfvXk1GZgu6h+ZVOv_XwgzVS5cpmkiChm7gw@mail.gmail.com>
Subject: Re: [PATCH] PM: suspend: select SUSPEND_SKIP_SYNC too if
 PM_USERSPACE_AUTOSLEEP is selected
To: Juhyung Park <qkrwngud825@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	chrome-platform@lists.linux.dev, Len Brown <len.brown@intel.com>, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 3:36 PM Juhyung Park <qkrwngud825@gmail.com> wrote:
>
> Hi Rafael,
>
> On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
> > >
> > > Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> > > optional") added an option to skip sync() on suspend entry to avoid heavy
> > > overhead on platforms with frequent suspends.
> > >
> > > Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> > > Kconfig") added a dedicated config for indicating that the kernel is subject to
> > > frequent suspends.
> > >
> > > While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> > > configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> > > is selected already.
> > >
> > > Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> > > ---
> > >  kernel/power/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > > index 60a1d3051cc7..5725df6c573b 100644
> > > --- a/kernel/power/Kconfig
> > > +++ b/kernel/power/Kconfig
> > > @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
> > >         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
> > >         depends on SUSPEND
> > >         depends on EXPERT
> > > +       default PM_USERSPACE_AUTOSLEEP
> >
> > Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?
>
> That won't allow developers to opt-out from SUSPEND_SKIP_SYNC when
> they still want PM_USERSPACE_AUTOSLEEP.

I see.

It is not particularly clear, so at least please mention it in the changelog.


> (Can't think of a valid reason
> for this though, as PM_USERSPACE_AUTOSLEEP is only used by Android and
> probably Chromium, afaik.)
>
> I don't think SUSPEND_SKIP_SYNC is critical enough to enforce when
> PM_USERSPACE_AUTOSLEEP is enabled, but I don't have a strong opinion
> on this either.
> (We could do `imply SUSPEND_SKIP_SYNC` from PM_USERSPACE_AUTOSLEEP,
> but that doesn't look good semantically imho.)
>
> If you want, I can send a v2 with 'PM_USERSPACE_AUTOSLEEP select
> SUSPEND_SKIP_SYNC'.

Personally, I would use "select" and I would amend the
PM_USERSPACE_AUTOSLEEP help text to say that it will disable sync on
suspend by default explicitly.

IMV otherwise it is more confusing than it needs to be.

I'm also wondering about a particular use case addressed by this
change.  Is there any?
