Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE7523A7
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 07:45:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id l9so1419999plg.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 23:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YN5uZU/PXTIv8VCQfKOIBlY+j6VWjLtTOcNJOL3vTg8=;
        b=rnf3tToHhhQitGcrIbnwnoa0CoYVvTcaCbeCBVedxr0ccBFj8UU5+8bEJDSCDD0uYf
         huTvKykAMUvcNafTRFgjaPBlrbFWJEDeSv6DYlGb4XCYWjdzyriYo7cRZG5E7Mc3HKjy
         2tKZ2dGJeJ4QMe6kL2CDX9I3CnHayrhrifgU+AjIgPJqyNj4AWjUDU08Xw04ymItqG87
         7n/t1a/wUVVpulGl6bz3yMr6LX+e1I/XUXNO6gVrB/PovYxaxPO5ywqUjZnmHEX0GAQ5
         2uTtJuK10liyMpj/4UMoxTRPnzj6rvsaGn770wDyFd3R4GE4v+kNOrqyzRPPfoY2UGSF
         aPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YN5uZU/PXTIv8VCQfKOIBlY+j6VWjLtTOcNJOL3vTg8=;
        b=fKqYvyP2e/1GDI4jJSJvBLBj4odwm3QGLhqin8XGMpf7hVyrs0EvDarAhywf4l1rOW
         +qbmDQBDYdl9GYvQTzcAI5YNRn+UUOhmIaEiLHp8C4scfmNlfftLXFIpW7SI2o8t+OKC
         CllOii03Bh0DshYBbUPZBNtmJcRSmTKTloPbPfL4Nd1nQ9C9Thf2TyEksLwjmrv9bjKT
         xmvZE9LHbPt2kiLOTmRxLRcE3X7qFFWmNzeBeL2Y4LVjIyYGeVjdaWpUvDasCJrHJViq
         ETxFqnFn75S2/we+D/sBXWHAz/CevlK7QxAFxljqSZdDvxsS2AqbLPmwtdv1I+M2mPKc
         3Kug==
X-Gm-Message-State: AOAM530fFoFpd5GJqr7k+f+5vOSkdcbWwqiOraPNzGxYvsEgzJoJSEEE
	nzoTmwdV/EplJnmvz4bJkmuizw==
X-Google-Smtp-Source: ABdhPJy55esxLtjCyDQYMn9n9Q1peLEQhuGHeNP8/ie6YsI78JqNRD6qmSLjtdRwCpOvZCJfXvXY7Q==
X-Received: by 2002:a17:902:a982:b0:14f:f55:a09a with SMTP id bh2-20020a170902a98200b0014f0f55a09amr1625404plb.33.1644997553944;
        Tue, 15 Feb 2022 23:45:53 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
        by smtp.gmail.com with ESMTPSA id ip10sm5027355pjb.11.2022.02.15.23.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 23:45:53 -0800 (PST)
Date: Wed, 16 Feb 2022 15:45:51 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] platform/chrome: cros_ec: initialize
 `wake_enabled` in cros_ec_register()
Message-ID: <Ygyrr1U9JbqHDSCK@google.com>
References: <20220216043639.3839185-1-tzungbi@google.com>
 <20220216043639.3839185-4-tzungbi@google.com>
 <CACeCKacKtJ50b2TuuhcVYPq0Fd0unVJdMuNDk1PLNK_r2JHZ+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKacKtJ50b2TuuhcVYPq0Fd0unVJdMuNDk1PLNK_r2JHZ+A@mail.gmail.com>

On Tue, Feb 15, 2022 at 09:47:09PM -0800, Prashant Malani wrote:
> On Tue, Feb 15, 2022 at 8:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > `wake_enabled` indicates cros_ec_resume() needs to call
> > disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> >
> > Initialize `wake_enabled` in cros_ec_register() and determine the flag
> > in cros_ec_suspend() instead of reset-after-used in cros_ec_resume().

After reconsidering the 2 options in [1], I feel the flag needs to be set in
cros_ec_suspend() just in case if someone changes the wakeup capability per
[2].

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220209045035.380615-4-tzungbi@google.com/#24739778
[2]: https://patchwork.kernel.org/project/chrome-platform/patch/20220209045035.380615-4-tzungbi@google.com/#24740205

Will change it back in the next version, pardon me.

> > @@ -383,10 +384,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
> >                 dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
> >                         ret);
> >
> > -       if (ec_dev->wake_enabled) {
> > +       if (ec_dev->wake_enabled)
> >                 disable_irq_wake(ec_dev->irq);
> > -               ec_dev->wake_enabled = 0;
> > -       }
> > +
> 
> Better to leave it as is, and ensure "wake_enabled" is cleared after resume?
> Will result in a smaller diff.

No, cros_ec_suspend() uses the flag to tell cros_ec_resume(): don't forget to
call disable_irq_wake().  It shouldn't be reset after used by
cros_ec_resume().
