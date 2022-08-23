Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB7E7EE
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 02:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B54C433D6;
	Tue, 23 Aug 2022 02:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661222962;
	bh=SxDOFgx9HkJ+LkUsLoDu+m9YfREIA9QbhGWo7/Vo378=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrgmIZ1DvHFjxPaLm/Vypu4az7JWHp6tFzWx5owQTuaJocH8aoS78phNmconZ8Gu1
	 g7Jwm4jw936QBT7zuvz3sgdBvvZ/WKmOyRIFh/2NSrHOkU8w8qor39+2E8aIcgoLrq
	 0UZG88P0Auwav/X/90jkwtZ1+ymXK/vMwfHlIxl39vtYhgE5O7lYq7zNfH711OgiF3
	 8tonqlvIGtWMq/ho7weCaQOLNt/+LGP1S+HG3+FPk2PO2AJfGJEsOs+ep7MGYOwi5B
	 aGw2pmzaSu/760ioa+0jJFjbiFi6HlpA6uD4tWVxWzBjUwU8LWhdh8E9qVtlpzdTLJ
	 yFFMWm7DWp1+g==
Date: Tue, 23 Aug 2022 02:49:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@google.com>
Cc: rrangel@chromium.org, robbarnes@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Send host event for
 prepare/complete
Message-ID: <YwRAL79BN2d/A0V0@google.com>
References: <20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid>
 <Yv27K4+rLfskcQdm@google.com>
 <CANkg5ewGUcWagRNOLfbRx8hLqgX+FfdYGB5Qt7tO5=zicGBVDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANkg5ewGUcWagRNOLfbRx8hLqgX+FfdYGB5Qt7tO5=zicGBVDg@mail.gmail.com>

On Mon, Aug 22, 2022 at 10:21:47AM -0600, Tim Van Patten wrote:
> On Wed, Aug 17, 2022 at 10:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Aug 02, 2022 at 11:40:08AM -0600, Tim Van Patten wrote:
> > > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> > > .prepare() and cros_ec_lpc_complete() during .complete(). This allows the
> > > EC to log entry/exit of AP's suspend/resume more accurately.
> >
> > As what I commented on [1], the term "host event" in the commit title is
> > confusing.  Also, as this is a cros_ec_lpc specific patch, please change
> > the prefix.
> 
> I've updated the prefix to "cros_ec_lpc" and the title/description to
> indicate that this CL moves when the host event is sent to
> .prepare()/.complete().
> 
> > [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid/#24934911

I'm not sure if any unclear.  "host event" is a terminology for CrOS EC.
The usage here is confusing.

> >
> > > -static int cros_ec_lpc_resume(struct device *dev)
> > > +static void cros_ec_lpc_complete(struct device *dev)
> > >  {
> > >       struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
> > > +     int ret;
> > > +
> > > +     ret = cros_ec_resume(ec_dev);
> > >
> > > -     return cros_ec_resume(ec_dev);
> > > +     dev_info(dev, "EC resume completed: ret = %d\n", ret);
> >
> > cros_ec_resume() always returns 0.
> 
> Yes, it always returns 0 today, but that may not be the case forever.
>  While "ret" is not returned by cros_ec_resume() today, it's possible
> for it to be non-zero and someone may update cros_ec_resume() to
> return that status.

Does it really need to print if `ret` is always 0?
