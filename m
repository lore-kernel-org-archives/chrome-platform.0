Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A9362
	for <chrome-platform@lists.linux.dev>; Fri, 19 May 2023 01:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB03CC433D2;
	Fri, 19 May 2023 01:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684461338;
	bh=wVIV4JUX6HfKfNi01tfd1YVz2GWTdgoR9UFjHLnx8FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJa2cc8HQU4tGJPfnLsdZFX/Ht+73XKkdYQwacfqXliHMbZXzOfXVdC9ZFNL9gufq
	 O7HoksUMQPE5wLsw7GE/Ut0MuLPdWyndjpjBRDSI587iNkKRg7J4ZLHhWfv4ABuYDf
	 t56AlBsf7i4OMV3T/ykdVVkMq20vH3zAEp3lnQDo3m9A5NhBJudx0chKSW0njXRXCs
	 nd6W3KEqZhlQAboo636YljTB42Bd8V3/fGS6A71mvxgwCwNKTQMNu7zjouXq/rssVS
	 zsLBk6w/ejozzFA19VfDNpHf9YdC15cOmXP226NV9jvXduN6xEm0/0h/y01pYruB1O
	 MszdEkCRt2Zkg==
Date: Fri, 19 May 2023 09:55:34 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, robbarnes@google.com,
	lalithkraj@google.com, rrangel@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Garrick Evans <garrick@google.com>
Subject: Re: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to
 prepare/complete
Message-ID: <ZGbXFtrBzbaD9rQs@google.com>
References: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
 <ZGQ9Y+vqWhQLHAQh@google.com>
 <CAMaBtwHxaevxLY7zWNDU8zbyWx=puLkeeRAjFtovvrA5pjtJ4w@mail.gmail.com>
 <ZGWBhEMmo2lStTg9@google.com>
 <CAMaBtwFtE=vjuhVy7rw9zCe9WV0dRyeBWj88JH2j3bkbh2BkXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMaBtwFtE=vjuhVy7rw9zCe9WV0dRyeBWj88JH2j3bkbh2BkXA@mail.gmail.com>

On Thu, May 18, 2023 at 10:47:23AM -0600, Tim Van Patten wrote:
> On Wed, May 17, 2023 at 7:38 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > On Wed, May 17, 2023 at 09:56:59AM -0600, Tim Van Patten wrote:
> > > The issue is that we need the EC aware of the AP being in the process
> > > of suspend/resume from start to finish, so we can accurately
> > > determine:
> > > - How long the process took to better gauge we're meeting ChromeOS requirements.
> > > - When the AP failed to complete the process, so we can collect data
> > > and perform error recovery.
[...]
> > How could the *error* recovery do?
> 
> I don't understand what this is asking.

Given that you said "we can collect data and perform error recovery" if the
suspend-resume takes more/less time than expected.  I'm trying to understand
what does "error recovery" mean.  What recovery it could take?

> > > > What about other interfaces (i2c, spi, uart)?  Do they also need to change
> > > the callbacks?
> > >
> > > We aren't concerned about those devices, because they aren't being
> > > used on the devices we're seeing issues with. If devices using those
> > > ECs want this change, they can pick it up as well, but we don't have
> > > any way to test changes on those devices (whatever they may be).
> >
> > This doesn't sound good.  As I would suppose you are adding some new EC FW
> > features regarding to EC_CMD_HOST_SLEEP_EVENT, you should consider the
> > existing systems too.
> 
> Again, why are you assuming there is new EC FW for this? This is only
> changing when an already-existing host command is being sent. Nothing
> is being added or removed.

I see.  There is no EC changes.

Specifically, do you see any crashes, or premature events, or mal-functions
regarding to the measurement is not that accurate?

Also, we wouldn't want it to be LPC-specialized.  Please consider other
interfaces.
