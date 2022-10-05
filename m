Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE45365
	for <chrome-platform@lists.linux.dev>; Wed,  5 Oct 2022 06:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A4DC433C1;
	Wed,  5 Oct 2022 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664951085;
	bh=M/Q+9mGG+P81XeSVT+uevouZE4XbbGBku5NH0ti+rPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvedLHbjDV9v+QYxDIARdT7tVWo5CVPYL8rLYzeZ3Psp4ACLRlZJY9XK0p9nVde7l
	 mA1MRNsHmQ0yvN3Zra+Pw3gV87/C6LENtVWLH911/bDHhhH5xycQG18Lbktbh73pYc
	 XKV41R9PHmRyNROpgfbBjMdjJ1q8YXpCGks/b4nY=
Date: Wed, 5 Oct 2022 08:25:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Jack Rosenthal <jrosenth@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Yz0jVbfDOITZfE9M@kroah.com>
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com>
 <Yzxl2oczTtwEvIqt@chromium.org>
 <Yzxsu2Ms43eTfOYR@kroah.com>
 <Yzy6KNUHFqxWZb9U@chromium.org>
 <CAODwPW-7Y_CbCch+Y5unH3yJD1T=3epYvqja6w_CB-23C9x9sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-7Y_CbCch+Y5unH3yJD1T=3epYvqja6w_CB-23C9x9sw@mail.gmail.com>

On Tue, Oct 04, 2022 at 06:10:01PM -0700, Julius Werner wrote:
> > > Then how does the kernel know what to print out?  Why not add such a
> > > reference somewhere?
> >
> > The kernel really doesn't need to know the list of possible ids: it
> > simply reads what coreboot gives it from the coreboot tables and proxies
> > that on up to sysfs nodes.
> >
> > In an earlier version of this patch
> > (https://lore.kernel.org/chrome-platform/CAODwPW-JzXXsEANaS+6n695YqriAQ0j0LXm31R2u1OP3MhX9Uw@mail.gmail.com/T/#u),
> > I actually had this list so that the directory names were human-readable
> > instead of using the 32-bit CBMEM id, but Julius didn't like it citing
> > that we'd have to keep the kernel tree and the coreboot tree in sync.
> >
> > I'm fine with either solution ... just want to make all parties happy
> > here =)
> 
> There is quite a long list of possible IDs (79 at the current count),
> many of them are just coreboot-internal implementation details for
> specific platforms that are really not interesting to the running OS
> after we're done booting, and new ones get added all the time. I don't
> think there's any practical value in trying to maintain a
> corresponding list in the kernel, it would just be unnecessary bloat
> and a maintenance nightmare to keep in sync.
> 
> This whole driver is supposed to be a thin bridge between coreboot and
> coreboot-specific userspace tools. Those tools will know about the
> specific meaning of individual IDs and the data format of their
> contents, and they are much easier to keep updated and in sync with
> new coreboot releases than the kernel itself. So the whole goal of the
> design is to leave all those details to the userspace tools and have
> the kernel involved as little as possible, just passing the raw
> information through without being involved in its interpretation.

If the kernel is reporting a value, that value needs to be documented
somewhere.  If the kernel is acting on that value, it needs to know what
those values are.

In this specific instance it seems that the kernel knows a subset of the
values, and some random userspace tool knows all of them?  Think about
what you would want to see here if you knew nothing about this at all.

thanks,

greg k-h
