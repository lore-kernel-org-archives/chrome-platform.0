Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D43443D
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 22:05:02 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id EC57ACE265
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 21:55:29 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9A816240003;
	Mon, 31 Oct 2022 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667253322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9TGJAtdtjk5IN4wFS84yVevB7Syr2Cb58PAmAkCAa8=;
	b=jvrmXiQEc6YbTbjp6KPJDeMgUKPU0UKz5K+jnxPUTMAoxCFYQmzL/ZER7xXS5RYUR7F/7S
	wGTzHoKGZdeYx9I2R4u/nO3Wa8ZxuSkLHcA5m7gEzwUL1f0LoT+Pcq0LiV8j19hAvILUD/
	rDgdqRtFIdriADNyUmSEB4Yk9A4Ix23eHhT7/RarEkZgTnIileOVPYj4r9JFAdS3j7w15s
	xdeWUM2S7q0LKyEy8kfKpNUBKMkNgnSQUVbc/KaCQxZ1UxHopDeDmQA/bkKXPxpScAV2/h
	DhD1/13kJLpDVXwdVZKzjgOlDgLuvZUj51JfrpuMZBhE+TjEbxZeTISHFnmv/g==
Date: Mon, 31 Oct 2022 22:55:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y2BESUyKX4KJzhQZ@mail.local>
References: <20221029005400.2712577-1-linux@roeck-us.net>
 <Y2ABnbBGSJGM3gSS@mail.local>
 <Y2AMQAf/nDGLNMcI@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2AMQAf/nDGLNMcI@google.com>

On 31/10/2022 10:56:16-0700, Brian Norris wrote:
> CC kernel/time/alarmtimer.c maintainers
> 
> On Mon, Oct 31, 2022 at 06:10:53PM +0100, Alexandre Belloni wrote:
> > On 28/10/2022 17:54:00-0700, Guenter Roeck wrote:
> > > RTC chips on some older Chromebooks can only handle alarms less than 24
> > > hours in the future. Attempts to set an alarm beyond that range fails.
> > > The most severe impact of this limitation is that suspend requests fail
> > > if alarmtimer_suspend() tries to set an alarm for more than 24 hours
> > > in the future.
> > > 
> > > Try to set the real-time alarm to just below 24 hours if setting it to
> > > a larger value fails to work around the problem. While not perfect, it
> > > is better than just failing the call. A similar workaround is already
> > > implemented in the rtc-tps6586x driver.
> > 
> > I'm not super convinced this is actually better than failing the call
> > because your are implementing policy in the driver which is bad from a
> > user point of view. It would be way better to return -ERANGE and let
> > userspace select a better alarm time.
> 
> There is no way to signal user space. alarmtimer_suspend() is doing this
> on behalf of CLOCK_BOOTTIME_ALARM or CLOCK_REALTIME_ALARM timers, which
> were set long ago. We could possibly figure out some way to change the
> clock API to signal some kind of error back to the timer handlers, but
> that seems destined to be overly complex and not really help anyone
> (stable ABI, etc.). The right answer for alarmtimer is to just wake up a
> little early, IMO. (And failing alarmtimer_suspend() is Bad.)

But it is not the right answer from the RTC subsystem point of view
because there are many uses cases were you don't want to forcefully wake
up earlier or you are going to unnecessarily deplete a battery for
example or you may be able to select another RTC device which can wake
you later on.

> I think Guenter considered some alternative change to teach
> drivers/rtc/* and alarmtimer_suspend() to agree on an error code
> (ERANGE? or EDOM?) to do some automatic backoff there. But given the
> existing example (rtc-tps6586x) and the inconsistent use of error codes

The existing example predates actual maintenance of the subsystem. You
can't complain about inconsistent use of error codes (which I believe
has been cut down) and at the same time introduce inconsistent
behaviour.

> in drivers/rtc/, this seemed just as good of an option to me.
> 
> But if we want to shave more yaks, then we'll have a more complex /
> riskier patch set and a harder time backporting the fix. That's OK too.
> 

The issue with the current patch is that it forbids going for a better
solution because you will then take for granted that this driver can't
ever fail.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
