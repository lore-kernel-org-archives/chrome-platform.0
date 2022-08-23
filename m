Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC25D320D
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 16:00:29 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-32a09b909f6so391813507b3.0
        for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3dQyigqDySUcnNz+kI5C34gtlF6MAv3IrSZUE3ZzswU=;
        b=Q5raPWzg01QQ8b+RC93TmhU7VQi6OaROc9XODIa66NwvXNLQoRJfbs2XNBpQ9OsLT5
         XFx9/CAfAVTZL/RsJ4WN/WWpqTBo6DEWOdg6thWz6poiaPAjtf1uKVhCOOPtujtOaBDn
         loia6T7GVu/y9PlUju3lYuPQkKnl8NyRdPaG0tZbeDkiLTK35y+o70hlK+iDC244Cnex
         nOdfGSrMA3NZST8xeu6h6gMdN5HaR4i7GPlc+ctTzqLVK/ay0H98/CRPufHGGvJl1Rq3
         44ePZO+ikO+ITfB1bsnDQ1GaO+X/2lDq875P5iOW33UXTV0E6AxYorUCgusHji+VMF/V
         O+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3dQyigqDySUcnNz+kI5C34gtlF6MAv3IrSZUE3ZzswU=;
        b=nuvBUgowniXMjKUrDlZk/Ti9Jx16vBKpljZB1HhKn0BBMXl4hGVGvtdf4P1GRG6UKV
         n34PvRMjk0i2pojzn5Bkpxhtwp87xMpoFTawYOwEzYy9rRh+YVa95uiSO6/3znm4I751
         dokg+57eHnr789uaeu9tvfPX4QIXxC8RVxPFN6wK2rDjipgs7hyP9hOKkpWcwsBOOUOI
         8G/1mJb1roHYTkW3reT9hjaXgH0/pVHfEVoF/FLhiIzKAOv7fPSGUBjqSy6HXX4/Mbbq
         W44uNRn899s+FoVX0f9s2cEf5tIsKmtugkI8iFE5z4laBsd93khFy/CJp1JzN2d3EG0N
         DsRQ==
X-Gm-Message-State: ACgBeo3SFd//cN2DISqkjyJoAa2zHgwNSk5zSm/A1HKp513zB8bsA4V9
	B9Nd426xifr6uLFDBbUp54pLzDx2kB5pg6S9SZ4ymw==
X-Google-Smtp-Source: AA6agR5EYC9PSySqyvuhEwP4rGhe0NxC1ENen2hEqZbLD/v8D5dxCWvpD+wgaxFUM6KI9puS4IdrfU0TAy9dXIAqu9w=
X-Received: by 2002:a0d:e003:0:b0:338:59fb:2123 with SMTP id
 j3-20020a0de003000000b0033859fb2123mr19854641ywe.357.1661270428610; Tue, 23
 Aug 2022 09:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid>
 <Yv27K4+rLfskcQdm@google.com> <CANkg5ewGUcWagRNOLfbRx8hLqgX+FfdYGB5Qt7tO5=zicGBVDg@mail.gmail.com>
 <YwRAL79BN2d/A0V0@google.com>
In-Reply-To: <YwRAL79BN2d/A0V0@google.com>
From: Tim Van Patten <timvp@google.com>
Date: Tue, 23 Aug 2022 10:00:17 -0600
Message-ID: <CANkg5eyEzEpGtO_ZyQrCauX_xLR=9Z9B3jbLsHxTSPK=xk4awQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: rrangel@chromium.org, robbarnes@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 8:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Aug 22, 2022 at 10:21:47AM -0600, Tim Van Patten wrote:
> > On Wed, Aug 17, 2022 at 10:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > >
> > > On Tue, Aug 02, 2022 at 11:40:08AM -0600, Tim Van Patten wrote:
> > > > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> > > > .prepare() and cros_ec_lpc_complete() during .complete(). This allows the
> > > > EC to log entry/exit of AP's suspend/resume more accurately.
> > >
> > > As what I commented on [1], the term "host event" in the commit title is
> > > confusing.  Also, as this is a cros_ec_lpc specific patch, please change
> > > the prefix.
> >
> > I've updated the prefix to "cros_ec_lpc" and the title/description to
> > indicate that this CL moves when the host event is sent to
> > .prepare()/.complete().
> >
> > > [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid/#24934911
>
> I'm not sure if any unclear.  "host event" is a terminology for CrOS EC.
> The usage here is confusing.

I updated the title/description to "host command".

>
> > >
> > > > -static int cros_ec_lpc_resume(struct device *dev)
> > > > +static void cros_ec_lpc_complete(struct device *dev)
> > > >  {
> > > >       struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
> > > > +     int ret;
> > > > +
> > > > +     ret = cros_ec_resume(ec_dev);
> > > >
> > > > -     return cros_ec_resume(ec_dev);
> > > > +     dev_info(dev, "EC resume completed: ret = %d\n", ret);
> > >
> > > cros_ec_resume() always returns 0.
> >
> > Yes, it always returns 0 today, but that may not be the case forever.
> >  While "ret" is not returned by cros_ec_resume() today, it's possible
> > for it to be non-zero and someone may update cros_ec_resume() to
> > return that status.
>
> Does it really need to print if `ret` is always 0?

Yes, we should always print the return value in case it changes in the future.

-- 

Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
