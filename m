Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8091FD8
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 05:55:25 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id bt13so2900785ybb.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPx4UDA0xjlooJ4eCu99HX2L927DwDwAQ03WVkuhsXI=;
        b=dg5+0W532VSUwgWEbDzf9brHWJTYLQTw2QQOtwrEAQVNJMLcebAiNXsP3dzqnILxGw
         6pRbbcP18G1cRUWRp1/iPY/O7CH6jV2B4PVwe2yEQmmirD7b6Sy3go9Xi55rHLWzFcTg
         G7cnIsrm3Pgy6sOAu8zkjGKGkp6lU97Pw7jWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPx4UDA0xjlooJ4eCu99HX2L927DwDwAQ03WVkuhsXI=;
        b=iPuXUjzRL9kbyRTZAPh9wxjrBEPlE+8DNDtanLdw0MItN61DQlg7N7yCtlEhOT0Jsp
         TD7SYriA4MTWS06MULktkx/yeX5K1fhlQhhtNVBOWoePwZ8cnsKNhos+IaJ+fYmQlkcb
         bUfWqBjQEBBTEYzybKPmj1J7/zRE6lGsUt3FS7AV+27XppO4rEQ3gyFni/9W1zbmOqri
         wW7yejTdhl/kQqqV05OJEs7SaPbUpcYrt7CW0HFZqGwfPMH6u3zdnK1eCs/b6LkluA/V
         0Nf3Spm4/LhLf7dRF7G3Miky9izaUgrlzUeRYO5VizB4jWdtey7PqUQiwqpy8XNUJ1wj
         LCrw==
X-Gm-Message-State: AOAM533+mXmQ07v8IfBukc8jhkBl5mOyPanPaUNs+cb359lMV9zMfrKw
	l+0rLjKN323FAR1jrnJoeud5+EcAK6TYrc37TRuz+A==
X-Google-Smtp-Source: ABdhPJwpwMxSPePQhJTEcjbn9jHJBysTp8pZalQQ+krL7pMp5+uRqYLh7Ta4hN07ITmssmOyI11J8GIjc0NptEFQP40=
X-Received: by 2002:a81:a148:0:b0:2d0:7177:5f2b with SMTP id
 y69-20020a81a148000000b002d071775f2bmr1140657ywg.182.1644990924592; Tue, 15
 Feb 2022 21:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com> <20220209045035.380615-4-tzungbi@google.com>
 <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com>
 <YgOLLmLKQWNyjvr1@google.com> <CACeCKadSTq22aN1mwpT2re5dcA0J+GW7R8=gg4no5MB6j9m+Bw@mail.gmail.com>
 <Ygx53F0bziAWceqJ@google.com>
In-Reply-To: <Ygx53F0bziAWceqJ@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 21:55:13 -0800
Message-ID: <CACeCKaduGaq-s-XO7FZ1Hin6Nr15_v_6-KUmbO-F+MWDu-gWMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] platform/chrome: cros_ec: determine `wake_enabled`
 in cros_ec_suspend()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 8:13 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Feb 15, 2022 at 05:07:43PM -0800, Prashant Malani wrote:
> > On Wed, Feb 9, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > >
> > > On Tue, Feb 08, 2022 at 10:05:58PM -0800, Prashant Malani wrote:
> > > > On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > > >
> > > > > `wake_enabled` indicates cros_ec_resume() needs to call
> > > > > disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> > > > >
> > > > > Determine `wake_enabled` in cros_ec_suspend() instead of
> > > > > reset-after-used in cros_ec_resume().
> > > > It sounds like we can accomplish the same thing as this patch by either:
> > > > - Initializing ec_dev->wake_enabled = false during cros_ec_register()
> > >
> > > This doesn't sound like a good idea.  Value of device_may_wakeup(dev) changes
> > > during runtime.  It should check in cros_ec_suspend() instead of in
> > > cros_ec_register().
Actually, circling back to this (apologies), can you provide an
example of this changing during runtime?
I'm not aware of one, but I could be omitting some use cases that you
might be familiar with.

> >
> > Hmm, I'm pretty sure it shouldn't change for Cros EC. In any case, I'm
> > not suggesting
> > moving the check away from cros_ec_suspend(), just the initialization
> > of the flag.
>
> Got it.  I misunderstood.  Let's go this direction.  Will fix in the next
> version.
