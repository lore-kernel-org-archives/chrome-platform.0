Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70965AD21
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 23:15:37 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fy8so14212874ejc.13
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 15:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FlP6AKXyfsY8osv9smpKXc+sJXoOdEbrkb5H5RIj5Rg=;
        b=aclJ+8dgNuNUKezC/tevLetwUo63WIkYV3mxD2arQONKtJ0q0rx+gqq/LqzYsls9zx
         UCYerDsVxfzIs1LL650gG8DS4iXU8i64sTsYLMPw+p4Kb8ARb8noeg6APShk0AwJ0fyh
         L7pBon9Pwpe6RMY8pzvj+L/w7bmz8LZlnY82/CkZ8gd2rVApubgmdie5rzraUiJrIAta
         ZeYOK6OsPAXbD5DJvl6I3kJY21U91QeVO3qC1xBeK/Zar0N0wgtvCbS6zLKR3kPig2fz
         wkdAi87L8KdHDTM2U73ZWO4MwMS2qyxq5yO87GNcdDHh8u7IkEgYAB05+ipBLxrT7Nxm
         aaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlP6AKXyfsY8osv9smpKXc+sJXoOdEbrkb5H5RIj5Rg=;
        b=TfKWTYEVjTMqPCM8nFQCZQB7XPH24Fnh+u/TiCplAne8yMn4WgtgmLxsfziLa4wHMg
         /gQa0IzRe5mW/bA3xqwwq6NuJ43XW89HeYkCVumJk+6jVHm3hsmQ63UZ5bR0r8vtx2Su
         QeWOhh0lg376/hO1cp9Ic7eDMuGT981WzplshAPeYN3rQVwisGNabzF8QpHu9oUmYEMN
         Pb1kmnNhn+jRI3LzO770dUYTvlxA2e/q5Ya55n5KiM3M5qhPNbG2WP32f/EagF+bgc3d
         gkQxMKT9qIrFvtVhAMmMT2twf/sNS47H6eNhRWUWTQceoilVDA4fVSaNmFJHXBQwCJXQ
         lMaw==
X-Gm-Message-State: AFqh2krnpmJldd9sKh/11i+N12/1dSQPJWLojxrZ5uaGp5Fgjw93Vf+0
	SYCK8PjL8H68vEHHQt1btAgygKg89qb72drGEDBnHQ==
X-Google-Smtp-Source: AMrXdXttzhykV6L+/83GnDjq+1G30wNkN9JkVAov20JyXOd9aqYlb5HDTt4RBbNtT5FpzAs4WKpBdEdGW5woPYpcNk8=
X-Received: by 2002:a17:906:5156:b0:801:e0d9:b29a with SMTP id
 jr22-20020a170906515600b00801e0d9b29amr3481999ejc.571.1672787735440; Tue, 03
 Jan 2023 15:15:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221185540.2265771-1-robbarnes@google.com>
 <CACeCKafZu=46NE--r9W-wtJWAhj8=s46yCBO4N4u5nt4COqYAQ@mail.gmail.com>
 <CA+Dqm30XF=wDVcdUabbHySp-fwf+zFNqXpdYDW3bDTOwRbkiZw@mail.gmail.com> <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
In-Reply-To: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
From: Rob Barnes <robbarnes@google.com>
Date: Tue, 3 Jan 2023 16:14:59 -0700
Message-ID: <CA+Dqm33CAjWv=DFhp0+iee2-EugJzjWOYcyfieaULq2H9egheA@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Handle CrOS EC panics
To: Prashant Malani <pmalani@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 21, 2022 at 5:38 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> On Wed, Dec 21, 2022 at 3:55 PM Rob Barnes <robbarnes@google.com> wrote:
> >
> > On Wed, Dec 21, 2022 at 12:23 PM Prashant Malani <pmalani@chromium.org> wrote:
> > >
> > >
> > > Can you provide a link (either in the commit, or here in the comment)
> > > to the coreboot/BIOS code which uses this value? I feel this should
> > > be documented in some form that correlates the caller and the callee.
> >
> > Link: https://chromium-review.googlesource.com/c/chromiumos/third_party/coreboot/+/4023535
>
> Thanks. Please add a code link (for example, I could find [2], but you
> could use another code mirror
> if there is a canonical one for coreboot) to the commit description,
> or in the comment when you send
> out v2.
>
> > > Any reason we cannot use the existing event_notifier (with value argument)?
> > > It's a system panic, so I doubt that computational overhead for other
> > > notifier block
> > > listeners is a concern.
> >
> > The value field is already being used for "queued_during_suspend" in
> > event_notifier.
>
> OK, I suppose you could use the data pointer...

The data pointer contains ec_dev, so that's not really an option either.

>
> It's just I find having a notifier for a single use case overkill(even
> 2 would be fine); one could get away with exposing a method
> in cros_typec_debugfs via a local .h file (it can compile to a stub if
> cros_typec_debugfs is not compiled to the kernel);
> the LPC code can then just call that method instead of invoking a notifier.

My first implementation did make a direct call to cros_ec_debugfs.c,
but an internal reviewer recommended using an event notifier instead.
So I'm histent to go back to a direct call.

There may be other sub drivers that want to handle EC panics. So I
think keeping this as a separate notifier makes sense given the
constraints.

>
> Best regards,
>
> -Prashant
>
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
> [2] https://github.com/coreboot/coreboot/blob/ff6b3af113f84a1957dcdf8a8179a751ce08becf/src/ec/google/chromeec/acpi/ec.asl#L15
