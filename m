Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC27B
	for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 13:35:58 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id u9so4595371ejy.5
        for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YJF/VwA2mzDN6MSkPG2T+mKWxJTEYBZ1TSfzmhRiSak=;
        b=R9gl5wXeQfCG8uiYehnAeR3v/OEYCuTPDmd/1TNe0sotS6OatzHswNMV+vpydDeuZ+
         Nry6Uw7h6RaXcLOXUdUP1JO3/cqsz8UaaPA3D9ek55/RD3uHWHAz3nmJ4sfnx/uRPS57
         FsNKpwySB94vkx6KFQlV1JRnY1hoWZziD1C8HUquIpxYa0DNSP/np0MVmb9NzrMi/FNt
         H/p29EYX8l8mNG3XdMcZz8XTPlfHM8MP9K2VLaWA7J1trYkBBmpGqkrlqXCGoCQuTm0c
         ek833ROccmN71xDurLvPkf5+d06+GDQnhcXcvyGV5i0MKsyfz2nUo6Es5k1kjReVjE1t
         H71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YJF/VwA2mzDN6MSkPG2T+mKWxJTEYBZ1TSfzmhRiSak=;
        b=7p5HWNrmJblwOHq44vHquIQhSysHpP7ALUsB+ns53JktbT0LgXjhS/k6Le8Jg/FwSh
         XpsJ5qNojJ1vRABM1RCH21tRKxhjQPVgGu1Bm915lkV7ikwyEgS3ulIhvbOqNHJPwRxP
         78Rr5sZCgs8eLnA9pApvzXdyFPDmSD/0oET7klmmfcmEBBEqWAXZhMrAI101Veoqbtb+
         h43p4NfzmUIVW32fOmWcPlNVHBVgHvYfPk0jrjK7Ufavinn7Bg1roZ/mkMwgwnyiuo0p
         CG4bPO1EoJI6xHM0GbRntIRW7PLSBOcjJ0CUtkewpttWG/PAfXBziI7SUoTMyL2Z6ehZ
         8MLA==
X-Gm-Message-State: ACgBeo3gE9iOIGMcHtZhhY5LXfrAfrOGkOEEQnX+POdP445dIMgnVRnM
	AxkSUkZRwn9qQut6ASm1gcRIi6HIZB/oRn3TaIqZXvegNnE=
X-Google-Smtp-Source: AA6agR7lw/fobBjH73PzZWmf8nrsUxZFGAqZHhPw1j17fQTgk9/IfDwNCuXesiIgyvgw7r26L2bSENsYjKb7Qm06zF0=
X-Received: by 2002:a17:907:60c7:b0:731:2be4:f72d with SMTP id
 hv7-20020a17090760c700b007312be4f72dmr3004924ejc.639.1661348156634; Wed, 24
 Aug 2022 06:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com> <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Wed, 24 Aug 2022 22:35:45 +0900
Message-ID: <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
Subject: Re: [PATCH] PM: suspend: select SUSPEND_SKIP_SYNC too if
 PM_USERSPACE_AUTOSLEEP is selected
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, chrome-platform@lists.linux.dev, 
	Len Brown <len.brown@intel.com>, Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rafael,

On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
> >
> > Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> > optional") added an option to skip sync() on suspend entry to avoid heavy
> > overhead on platforms with frequent suspends.
> >
> > Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> > Kconfig") added a dedicated config for indicating that the kernel is subject to
> > frequent suspends.
> >
> > While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> > configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> > is selected already.
> >
> > Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> > ---
> >  kernel/power/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > index 60a1d3051cc7..5725df6c573b 100644
> > --- a/kernel/power/Kconfig
> > +++ b/kernel/power/Kconfig
> > @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
> >         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
> >         depends on SUSPEND
> >         depends on EXPERT
> > +       default PM_USERSPACE_AUTOSLEEP
>
> Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?

That won't allow developers to opt-out from SUSPEND_SKIP_SYNC when
they still want PM_USERSPACE_AUTOSLEEP. (Can't think of a valid reason
for this though, as PM_USERSPACE_AUTOSLEEP is only used by Android and
probably Chromium, afaik.)

I don't think SUSPEND_SKIP_SYNC is critical enough to enforce when
PM_USERSPACE_AUTOSLEEP is enabled, but I don't have a strong opinion
on this either.
(We could do `imply SUSPEND_SKIP_SYNC` from PM_USERSPACE_AUTOSLEEP,
but that doesn't look good semantically imho.)

If you want, I can send a v2 with 'PM_USERSPACE_AUTOSLEEP select
SUSPEND_SKIP_SYNC'.

Thanks.

>
> >         help
> >           Skip the kernel sys_sync() before freezing user processes.
> >           Some systems prefer not to pay this cost on every invocation
> > --
