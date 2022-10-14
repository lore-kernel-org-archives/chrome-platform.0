Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D177B
	for <chrome-platform@lists.linux.dev>; Fri, 14 Oct 2022 07:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BF4C433D6;
	Fri, 14 Oct 2022 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665732250;
	bh=3+4ELQRvpQGXuMkn5AtQjc15E6olmIrVFv8lJeW/QFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXpkCrpIJPJWtsWLfgYXVvltQKARrqoxunUliXHr3UDG9hWTFntI4Px6MtP+9FkO0
	 v0PpDzTczjwnR4yW8TanxlfPBwefeHcpswq8V3ihfTq912Dnt8LMRb22TkRXQHzfp7
	 yK7oVRvlVkj8srZ/tDa4+EAzktnct7Q9Gf5hNa4I=
Date: Fri, 14 Oct 2022 09:24:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Y0kOxqyDM3/4HSnx@kroah.com>
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com>
 <Yzxl2oczTtwEvIqt@chromium.org>
 <Yzxsu2Ms43eTfOYR@kroah.com>
 <Yzy6KNUHFqxWZb9U@chromium.org>
 <CAODwPW-7Y_CbCch+Y5unH3yJD1T=3epYvqja6w_CB-23C9x9sw@mail.gmail.com>
 <Yz0jVbfDOITZfE9M@kroah.com>
 <CAODwPW8R2uXFJ_5V737Dy8z-WJHUwKkLyG4MW_Q50fs-OFm7Sw@mail.gmail.com>
 <Yz52r89A9JYEICCi@kroah.com>
 <Y0iCZip0k9WcHgsz@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0iCZip0k9WcHgsz@chromium.org>

On Thu, Oct 13, 2022 at 03:25:58PM -0600, Jack Rosenthal wrote:
> On 2022-10-06 at 08:33 +0200, Greg KH wrote:
> > On Wed, Oct 05, 2022 at 04:26:55PM -0700, Julius Werner wrote:
> > > > If the kernel is reporting a value, that value needs to be documented
> > > > somewhere.  If the kernel is acting on that value, it needs to know what
> > > > those values are.
> > > >
> > > > In this specific instance it seems that the kernel knows a subset of the
> > > > values, and some random userspace tool knows all of them?  Think about
> > > > what you would want to see here if you knew nothing about this at all.
> > > 
> > > The kernel doesn't know any of the values. The kernel is just telling
> > > userspace that spaces with these IDs exist and providing an interface
> > > to access them, it's not supposed to know what any of them mean.
> > 
> > Ah, ok, that was not obvious to me, sorry.  If the kernel is just a
> > pass-through, no objections.
> 
> Does this mean PATCH v13 looks good to you?

No idea, sorry.  It's the middle of the merge window, as my bot told
you, so I can't do anything with changes until after it is over.  Please
relax, there is no rush here...

greg k-h
