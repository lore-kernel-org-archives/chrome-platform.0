Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520D6ABB
	for <chrome-platform@lists.linux.dev>; Thu,  1 Sep 2022 15:51:08 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-33dc345ad78so341314337b3.3
        for <chrome-platform@lists.linux.dev>; Thu, 01 Sep 2022 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9/85cTHq3emRQ3FYqSmuCNE4ONe2BFqYrwpiqVZJ/+I=;
        b=GLqdEt2U0HzwcNjRmjhPqqIu6x/w6F2LttPAZi7J0vfn/J2WsIDmFyWmI6WyeOdaxs
         JQLZcdRpfZI2EYzI+ydaUbWGOr7pR+CIUOzU/u7wNJd1oyIT1S+QUh41GimnENcOPBLC
         u95SYoLU4aivhXW/fsnYdRYo6fH1qCqKERjxTRywmjZML0N6nAOf766qae6zCGYIf04Z
         mel+yueezG/blln/Q7oQFiXbGkyyGPy6GjKXA8PBcjIan2bjAqvzNsFDpCJAwXPaLzJs
         j0Q/GC9DhAleZ1oc0PKXXx7BFwMCE4WuuFlj2ReeZNWrfmjv+EYHZlnMHTg2kNwxkPCV
         efBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9/85cTHq3emRQ3FYqSmuCNE4ONe2BFqYrwpiqVZJ/+I=;
        b=wQ2Ro3lACC86RZycRdgu/IClRdb3PbeCAb6hutTc6RFswGyj+HSwXWd+cVkreAbJN4
         edVthdGUt7cKUom0PpNa3ATsTWa9kV+BgrmPH+eHGAoqBHJp/wUUxYu97PfuePQod+s2
         HU01aPttKVy2c6gKkr3v8U/r/qo7XQpXYaxCYzysTF0BJ8jNLh65YuPCHkyWnfsNRcXp
         Eba+5N3Pcx5AR8KLfTos6OiEeAT8R/lxtLDaE0xZ6uEpEHZ3RZPwugZ6hPj+biB7PTZG
         ppCGIJ1+I0IKa1oZPjx3G//gY0MIJuPGyIbXaEXae4LRXIo7Afgan/8UDZrIssFL1yUF
         Mj4g==
X-Gm-Message-State: ACgBeo1kFbYnaaRmKFM+1VSHXnxNbbnxoNUwAvqZTQHacoS8001MsXes
	AaljtCa2SU19jP4r6B3LA77ZG6EeTNs1xxfIaPfRJw==
X-Google-Smtp-Source: AA6agR7eihsqKGGZ03rwk9JoEJ1V06h0gbOgwGz7mci0vwEegX0oe/aTUXPvZQI1j8Xh/RBPv2iEYvHYLlSYtoQ7htg=
X-Received: by 2002:a0d:eb4f:0:b0:341:8004:8ebd with SMTP id
 u76-20020a0deb4f000000b0034180048ebdmr11329175ywe.396.1662047467426; Thu, 01
 Sep 2022 08:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
 <CANkg5ezTvzSFLkRWbhMDUqezQXW6996DYVohWMUa+cYwSB+YBw@mail.gmail.com>
 <YxAQaxQXn2YTN1BJ@google.com> <CAHQZ30C4-B9ypnsdRqEZCJuZ7QVfaHXaK9f61vTtz_gcvC9EQQ@mail.gmail.com>
 <YxAchTWf/99oaqix@google.com>
In-Reply-To: <YxAchTWf/99oaqix@google.com>
From: Tim Van Patten <timvp@google.com>
Date: Thu, 1 Sep 2022 09:50:56 -0600
Message-ID: <CANkg5exCTrFVMidSnf1aB6mvwNSKXfFjE6P0NxZJHN0HC8qxGg@mail.gmail.com>
Subject: Re: [PATCH v7] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 8:44 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Wed, Aug 31, 2022 at 08:21:23PM -0600, Raul Rangel wrote:
> > On Wed, Aug 31, 2022 at 7:52 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > > On Tue, Aug 23, 2022 at 9:59 AM Tim Van Patten <timvp@google.com> wrote:
> > > > >
> > > > > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> > > > > .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> > > > > host command that the AP sends and allows the EC to log entry/exit of
> > > > > AP's suspend/resume more accurately.
> > > > >
> > > > > Signed-off-by: Tim Van Patten <timvp@google.com>
> > > > > ---
> > > > >
> > > > > Changes in v7:
> > > > > - Rename "host event" to "host command" in title/description.
> > > > >
> > > > > Changes in v6:
> > > > > - Fully restore fixes from v3.
> > > > >
> > > > > Changes in v5:
> > > > > - Restore fixes from v3.
> > > > >
> > > > > Changes in v4:
> > > > > - Update title and description.
> > > > >
> > > > > Changes in v3:
> > > > > - Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
> > > > > - Update cros_ec_lpc_resume() to cros_ec_lpc_complete()
> > > > >
> > > > > Changes in v2:
> > > > > - Include cros_ec_resume() return value in dev_info() output.
> > > > > - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
> > >
> >
> > > I don't buy-in the ideas from the discussion in v3[1].  Thus, I would defer
> > > to other reviewers/maintainers on the list to seek their suggestions.
> > >
> > > [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid/
> >
> > Just to clarify, you are opposed to printing the return code because
> > `cros_ec_resume` currently always returns 0? Or is there another
> > objection?
>
> Yes.  I'm not sure if always printing 0 is a good idea.

We want the print statements to know when the EC sees suspend/resume
start/complete.   Having two versions of the same print statement, but
picking the correct one based on whether the return value is non-zero
is a bad design, which is why it always prints the return value.
Ignoring the return value entirely is also a bad design, since it can
change in the future. For example if cros_ec_resume() is updated to
pass along a bad return value instead of swallowing it always
returning 0.

-- 

Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
