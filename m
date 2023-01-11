Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75617EF
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 09:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B581DC433F0;
	Wed, 11 Jan 2023 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673427984;
	bh=DINKIwky+vcNmGPVG9rFmFLhLHgA5KczAqkKBK0sUvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCqwdgxYPtCihavmfppTtKCa/KdWQKANeQ/2LC/7SAV2ApYe/49gzVrY2/uBjxSNs
	 EvPehOycgZ9urv//JcKvtvQVB/7BxWLOAUawrccRo3uu5wp5ICfeyDvs9VByeJL1B9
	 pubxAgMiMS3aEOVDIovQr/qkTaFzVcNbRetgfoAgWVFUVAWC7KF8vsalPkl3itvYPq
	 M7QtoGsm2X8fpV+N6zp3XhvFKxuYRlchsDSmm6Hh3rCJ8o5WTyoR8f5AXEQ8Q/32iP
	 sa5YIxLne8u5Iyu9Hb74ypwbXvV1JWQqwAzVQJvDD0pJomTic2/nPv54w4CSCTrvr6
	 l1gH3omzYLaPQ==
Date: Wed, 11 Jan 2023 17:06:21 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Use per-device lockdep key
Message-ID: <Y758DUP51fQ7Bw0Y@google.com>
References: <20230111074146.2624496-1-wenst@chromium.org>
 <CAGXv+5HTOR2Nt5CtmiYx2jrJ-0=YjFaGnQXesRBNFMoogsHJQw@mail.gmail.com>
 <CAGXv+5FtXn3Q7Y_om11vh-rkw_mKC_8k4XdTVLN4z7xefrzTDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5FtXn3Q7Y_om11vh-rkw_mKC_8k4XdTVLN4z7xefrzTDw@mail.gmail.com>

On Wed, Jan 11, 2023 at 05:03:22PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jan 11, 2023 at 4:47 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Wed, Jan 11, 2023 at 3:41 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> > > the following lock sequences:
> > >
> > > 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> > > 2. lock(&ec_dev->lock); lock(prepare_lock);
> > >
> > > The actual dependency chains are much longer. The shortened version
> > > looks somewhat like:
> > >
> > > 1. cros-ec-rpmsg on mtk-scp
> > >    ec_dev->lock -> prepare_lock
> > > 2. In rt5682_i2c_probe() on native I2C bus:
> > >    prepare_lock -> regmap->lock -> (possibly) i2c_adapter->bus_lock
> > > 3. In rt5682_i2c_probe() on native I2C bus:
> > >    regmap->lock -> i2c_adapter->bus_lock
> > > 4. In sbs_probe() on i2c-cros-ec-tunnel I2C bus attached on cros-ec:
> > >    i2c_adapter->bus_lock -> ec_dev->lock
> > >
> > > While lockdep is correct that the shared lockdep classes have a circular
> > > dependency, it is bogus because
> > >
> > >   a) 2+3 happen on a native I2C bus
> > >   b) 4 happens on the actual EC on ChromeOS devices
> > >   c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
> > >      happens to expose a cros-ec interface, but does not have an
> > >      i2c-cros-ec-tunnel I2C bus
> > >
> > > In short, the "dependencies" are actually on different devices.
> > >
> > > Setup a per-device lockdep key for cros_ec devices so lockdep can tell
> > > the two instances apart. This helps with getting rid of the bogus
> > > lockdep warning. For ChromeOS devices that only have one cros-ec
> > > instance this doesn't change anything.
> >
> > Actually, hold off on this for a bit. I just realized this makes the
> > kernel give a big warning:
> >
> > INFO: trying to register non-static key.
> > The code is fine but needs lockdep annotation, or maybe
> > you didn't initialize this object before use?
> > turning off the locking correctness validator.
> >
> > CPU: 0 PID: 99 Comm: kworker/u16:3 Not tainted
> > 6.2.0-rc3-next-20230111-04021-g65853aed7123-dirty #472
> > 8115f54190814e6abf2d53f6a2194c1af0b27040
> > Hardware name: Google juniper sku16 board (DT)
> > Workqueue: events_unbound async_run_entry_fn
> > Call trace:
> >  dump_backtrace.part.0+0xb4/0xf8
> >  show_stack+0x20/0x38
> >  dump_stack_lvl+0x88/0xb4
> >  dump_stack+0x18/0x34
> >  register_lock_class+0x16c/0x40c
> >  __lock_acquire+0xa0/0x1064
> >  lock_acquire+0x1f0/0x2f0
> >  down_write+0x5c/0x80
> >  __blocking_notifier_chain_register+0x64/0x84
> >  blocking_notifier_chain_register+0x1c/0x28
> >  cros_ec_debugfs_probe+0x218/0x3ac
> >  platform_probe+0x70/0xc4
> >  really_probe+0x158/0x290
> >  __driver_probe_device+0xc8/0xe0
> >  driver_probe_device+0x44/0x100
> >  __device_attach_driver+0x64/0xdc
> >  bus_for_each_drv+0xa0/0xc8
> >  __device_attach_async_helper+0x70/0xc4
> >  async_run_entry_fn+0x3c/0xe4
> >  process_one_work+0x2d0/0x48c
> >  worker_thread+0x204/0x274
> >  kthread+0xe8/0xf8
> >  ret_from_fork+0x10/0x20
> 
> I think this is caused by
> 
>     d90fa2c64d59 platform/chrome: cros_ec: Poll EC log on EC panic
> 
> That commit is missing a BLOCKING_INIT_NOTIFIER_HEAD() call.

Yes.  https://patchwork.kernel.org/project/chrome-platform/patch/20230110221033.7441-1-m.szyprowski@samsung.com/
