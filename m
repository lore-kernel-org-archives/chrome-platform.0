Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258541844
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 01:07:55 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id y6so1368392ybc.5
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 17:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gdo2wMqVpSAdD+zCmIMcGNIMzTWzh5NTL76ARqezIx8=;
        b=Ww8D8K/75iMW3dHvAAL6WPDwe4Prx6rT+2xLKp9rXnuSOtx+l2QJXsaVB/SwbYg/+M
         Z7wbTLe7BGUdnXX/ShQagv8KUwTszxZxpu9HpSR4t7atu7in/AnJfqZ3TZJMm9wOJOJx
         RBEmFv7WsgBHZkCDAqD4AYK8cy+CocxjGCsZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gdo2wMqVpSAdD+zCmIMcGNIMzTWzh5NTL76ARqezIx8=;
        b=wzG2WY16yCMqczRpdoMEo4PCg/riGJndkUfZ3WomE8gMB2/C7OfQ9QBAF/ACfYqSob
         wLePdrfYI5Sx9eEhPrkRj1Ow2PxAhCMpvvuWx5wWZducUDK/jGor4ZmbZlnSdgsgwrdk
         LGu7YQ2S70ZNoCyAuas10ROmKzTLrQyqUmDMFWOTUDrw6WowwvCmV9RwyjsNpzNP5g7A
         gsMTnLHaPKLpuqviWWuc9kD+ze8Ohwu9Gl3bEvHk5XT4rc+qNE4PJ44mCX7V+xGvg1AX
         D3jWQYztixy8Au6LwZOUL2S6gaWxlaub+nljFcCkXKo3VXgzyf7UwZP9jjY8xGCFrqQ6
         +60A==
X-Gm-Message-State: AOAM5315h8q1nwNE8A8gbaTQWehqmkrQ+OrRLe+SBIN6SrUokil1VbYK
	JyrgWCCfFM2UWs35FDCmmVSeGdZvKPnj7EEnJz2L+Q==
X-Google-Smtp-Source: ABdhPJxuqlrEkWx6stDEdSDZ8HL3YwOgd1BHIjMLBEBZFFx6ufynLBZ7kjZdREr8CGCjhnKmcvuu0kpHF+e0UfOlSCI=
X-Received: by 2002:a81:9212:0:b0:2d0:ccb0:a8b0 with SMTP id
 j18-20020a819212000000b002d0ccb0a8b0mr380811ywg.235.1644973674233; Tue, 15
 Feb 2022 17:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com> <20220209045035.380615-4-tzungbi@google.com>
 <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com> <YgOLLmLKQWNyjvr1@google.com>
In-Reply-To: <YgOLLmLKQWNyjvr1@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 17:07:43 -0800
Message-ID: <CACeCKadSTq22aN1mwpT2re5dcA0J+GW7R8=gg4no5MB6j9m+Bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] platform/chrome: cros_ec: determine `wake_enabled`
 in cros_ec_suspend()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 9, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Feb 08, 2022 at 10:05:58PM -0800, Prashant Malani wrote:
> > On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > >
> > > `wake_enabled` indicates cros_ec_resume() needs to call
> > > disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> > >
> > > Determine `wake_enabled` in cros_ec_suspend() instead of
> > > reset-after-used in cros_ec_resume().
> > It sounds like we can accomplish the same thing as this patch by either:
> > - Initializing ec_dev->wake_enabled = false during cros_ec_register()
>
> This doesn't sound like a good idea.  Value of device_may_wakeup(dev) changes
> during runtime.  It should check in cros_ec_suspend() instead of in
> cros_ec_register().

Hmm, I'm pretty sure it shouldn't change for Cros EC. In any case, I'm
not suggesting
moving the check away from cros_ec_suspend(), just the initialization
of the flag.

>
> > or
> > - Setting ec_dev->wake_enabled = false just before the
> > device_may_wakeup(dev) check.
>
> Did you mean:
>
> ec_dev->wake_enabled = false;
> if (device_may_wakeup(dev))
>         ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);
>
> If so, this way is suboptimal to me.  ec_dev->wake_enabled can be written
> once; however, it is written twice if device_may_wakeup(dev) is true.

I don't think it is a concern on any modern computer hardware, and
seems more readable to me, but
it's up to you.
