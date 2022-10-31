Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A233ED
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 17:56:19 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso10928431pjc.2
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxgPHQHNXTKXnyvhcje4Li+ofkcsjx3B5bd4RNfVWXk=;
        b=dUXBx8hVozpOkOz977UeZcQxZgudAy0HoQ4H2Tw0+XOSTRQuxi0gfAAKF/KR/3suQO
         vlamhWKFGb2GnqOWVpxMEQT2GFxMXfHOebjfJ568UBf6Mvfe0SAAGqTGOkzu3aFgptHM
         YRDkPRop2GG5L8z1IUs6jkQb35ire4p/FR3Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxgPHQHNXTKXnyvhcje4Li+ofkcsjx3B5bd4RNfVWXk=;
        b=TqQFbwMlsFFPtkWUg8RudhChnvukcDC8NeBH8tg3FAsqkU4rh+Ba/Uetp/MibvpQaI
         PVLt/bcFIlgYIdXIiz5B2YhgicvVtS8gB+LLjL3NUtMhRA3LZIJc9mXzA3ywXrAP3ybC
         q52AHtTrDR+JvRKF9F2uCFd3OPN2Uxxttxvp9U8nui/lsXSgevCqvnBZmr8Iex5Lyqxl
         3p1Ay8ii+KQ3XFbpI3U0cEz9TNAyMQnbREKvm4gqRE28OrPbUeSa0jxUUzTVoxmWcfsR
         wL2KljzUCH+ocrowaNES4uN+I8nyBuyj2ixPNjVpI67tMeFM+6ycFvdpKLMiI3UgooVy
         x4Qw==
X-Gm-Message-State: ACrzQf0TdhDaO3dCBnfmUms+cNU0LJeVMJa9V0A0jIUHWSfkJTRkPPZu
	qzI8sUy/CXkEXp+g01h8ATrccQ==
X-Google-Smtp-Source: AMsMyM7DDaxA1ZH4CAmtziKbAO8TUQb9uroHMUhTHF8xrbgyf1O2GjfuMdrRAWUOQnJYoyuW/vhisg==
X-Received: by 2002:a17:90a:e20d:b0:212:ec76:6fc6 with SMTP id a13-20020a17090ae20d00b00212ec766fc6mr16361891pjz.0.1667238979435;
        Mon, 31 Oct 2022 10:56:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id 62-20020a621641000000b00562a526cd2esm4863663pfw.55.2022.10.31.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 10:56:18 -0700 (PDT)
Date: Mon, 31 Oct 2022 10:56:16 -0700
From: Brian Norris <briannorris@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y2AMQAf/nDGLNMcI@google.com>
References: <20221029005400.2712577-1-linux@roeck-us.net>
 <Y2ABnbBGSJGM3gSS@mail.local>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2ABnbBGSJGM3gSS@mail.local>

CC kernel/time/alarmtimer.c maintainers

On Mon, Oct 31, 2022 at 06:10:53PM +0100, Alexandre Belloni wrote:
> On 28/10/2022 17:54:00-0700, Guenter Roeck wrote:
> > RTC chips on some older Chromebooks can only handle alarms less than 24
> > hours in the future. Attempts to set an alarm beyond that range fails.
> > The most severe impact of this limitation is that suspend requests fail
> > if alarmtimer_suspend() tries to set an alarm for more than 24 hours
> > in the future.
> > 
> > Try to set the real-time alarm to just below 24 hours if setting it to
> > a larger value fails to work around the problem. While not perfect, it
> > is better than just failing the call. A similar workaround is already
> > implemented in the rtc-tps6586x driver.
> 
> I'm not super convinced this is actually better than failing the call
> because your are implementing policy in the driver which is bad from a
> user point of view. It would be way better to return -ERANGE and let
> userspace select a better alarm time.

There is no way to signal user space. alarmtimer_suspend() is doing this
on behalf of CLOCK_BOOTTIME_ALARM or CLOCK_REALTIME_ALARM timers, which
were set long ago. We could possibly figure out some way to change the
clock API to signal some kind of error back to the timer handlers, but
that seems destined to be overly complex and not really help anyone
(stable ABI, etc.). The right answer for alarmtimer is to just wake up a
little early, IMO. (And failing alarmtimer_suspend() is Bad.)

I think Guenter considered some alternative change to teach
drivers/rtc/* and alarmtimer_suspend() to agree on an error code
(ERANGE? or EDOM?) to do some automatic backoff there. But given the
existing example (rtc-tps6586x) and the inconsistent use of error codes
in drivers/rtc/, this seemed just as good of an option to me.

But if we want to shave more yaks, then we'll have a more complex /
riskier patch set and a harder time backporting the fix. That's OK too.

Brian
