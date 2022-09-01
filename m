Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FA7FA
	for <chrome-platform@lists.linux.dev>; Thu,  1 Sep 2022 02:21:37 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id d1so12515734qvs.0
        for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 19:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zFsBSw/BigrLjjgilq/OTnhc9hR2qJ9pTdpXA8ZsABU=;
        b=O5VcbNULS1FWVhLWl5Plv7rpOUqA+/y3850sIEQGcouANWq2a3JkLShMZl6Kir9blO
         wUkOYgIjaxR/D/OEh0yy5rbrZc4xbYioxv5Fd6Fsl1c0ybaQwjEeZb89HwTR2hBqgZsP
         NonVE7Fgqe7MFYaSGLhOenPb3b79qJaanEGMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zFsBSw/BigrLjjgilq/OTnhc9hR2qJ9pTdpXA8ZsABU=;
        b=5jTDC51azSjYT9GUGmJLl0ILCrIpiZaeVmUwQPvP6k5nOrroFGO3UQkq5BPhON+1F3
         p/U2UgX0igqgTgf3k/tsJ7LV2Q3b/G7J343aIqF3cOZwvp42DK7m2to8HSixmGzfY85X
         EKzxw0py2VktXn+ERHFhtafj85rBMp4uWRGpjKi3tZ06vAKESzy4aW4p5SgGsH44x64G
         WG2j2fX55vmCBRK8WE/BeLHQwAnvMxwARD1XON4mAXfJIJO8+QVIV7MCfRizNRzZsd3y
         w7QOg7O5PMNzZcksyGno9K9g5lNP7Wm8IAX4vswSjl8oADWRfo6twW66+kUoB+h68xYO
         ki0Q==
X-Gm-Message-State: ACgBeo2kDMUbgk/RQjnh5ERXoMtgFVOdZlC9uJCNn5qtQwEux7ONpgzU
	51rslsLBOa+6BbiM638lE8qxlBQmDbxPlw==
X-Google-Smtp-Source: AA6agR7WYGjg7tuJ2JvU8Fq2OvaB/YxhNO7EhtmHgppWFBnu2e2Il71k54DEuo2rpCddILHmV279Pw==
X-Received: by 2002:ad4:5942:0:b0:499:7d:cabc with SMTP id eo2-20020ad45942000000b00499007dcabcmr16831213qvb.121.1661998896106;
        Wed, 31 Aug 2022 19:21:36 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id a14-20020ac8720e000000b003431446588fsm9352868qtp.5.2022.08.31.19.21.34
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 19:21:35 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id l5so12462791qvs.13
        for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 19:21:34 -0700 (PDT)
X-Received: by 2002:a05:6214:1d06:b0:499:7c2:a84a with SMTP id
 e6-20020a0562141d0600b0049907c2a84amr13567009qvd.65.1661998894284; Wed, 31
 Aug 2022 19:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
 <CANkg5ezTvzSFLkRWbhMDUqezQXW6996DYVohWMUa+cYwSB+YBw@mail.gmail.com> <YxAQaxQXn2YTN1BJ@google.com>
In-Reply-To: <YxAQaxQXn2YTN1BJ@google.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Wed, 31 Aug 2022 20:21:23 -0600
X-Gmail-Original-Message-ID: <CAHQZ30C4-B9ypnsdRqEZCJuZ7QVfaHXaK9f61vTtz_gcvC9EQQ@mail.gmail.com>
Message-ID: <CAHQZ30C4-B9ypnsdRqEZCJuZ7QVfaHXaK9f61vTtz_gcvC9EQQ@mail.gmail.com>
Subject: Re: [PATCH v7] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Tim Van Patten <timvp@google.com>, Rob Barnes <robbarnes@google.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 7:52 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Wed, Aug 31, 2022 at 12:00:55PM -0600, Tim Van Patten wrote:
> > Hi,
> >
> > Friendly ping on this patch.
>
> We don't top-post on Linux kernel mailing lists.
>
> > On Tue, Aug 23, 2022 at 9:59 AM Tim Van Patten <timvp@google.com> wrote:
> > >
> > > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> > > .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> > > host command that the AP sends and allows the EC to log entry/exit of
> > > AP's suspend/resume more accurately.
> > >
> > > Signed-off-by: Tim Van Patten <timvp@google.com>
> > > ---
> > >
> > > Changes in v7:
> > > - Rename "host event" to "host command" in title/description.
> > >
> > > Changes in v6:
> > > - Fully restore fixes from v3.
> > >
> > > Changes in v5:
> > > - Restore fixes from v3.
> > >
> > > Changes in v4:
> > > - Update title and description.
> > >
> > > Changes in v3:
> > > - Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
> > > - Update cros_ec_lpc_resume() to cros_ec_lpc_complete()
> > >
> > > Changes in v2:
> > > - Include cros_ec_resume() return value in dev_info() output.
> > > - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
>

> I don't buy-in the ideas from the discussion in v3[1].  Thus, I would defer
> to other reviewers/maintainers on the list to seek their suggestions.
>
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid/

Just to clarify, you are opposed to printing the return code because
`cros_ec_resume` currently always returns 0? Or is there another
objection?
