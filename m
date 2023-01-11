Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DDC17D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 06:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CADC433F0;
	Wed, 11 Jan 2023 06:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673417085;
	bh=8x00PHMnsNBNIzoLDGAVgEZW9hiYElc7W/tzQLc74OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQQcNKFRMghri3Bh3vkTFMYLHwtvEQBr6XibSbqxKjTZU3SDXe/TuIO3hyDm2f3eW
	 nNUjL9vY0ih3LVd7imB+iv3jy5lN+1hxOP2VlV5IVHLRlOQ6yWtjdeNbj2S0hv7foB
	 asthPvwQ1fwoXz/Xuu0UGaHEvQMh+4/UYwHwiMaRKfq6ZL9qxi4cPKku/m/uizwlak
	 j8LRqj5KAzf/lwecO8lSVC1XRIC3BwnkzoSxijJFXvczqUtVyal7ooyFpmruugILEP
	 Bno5NaYvoftfuVMPYZo+CJL7gAnTvhegFt/kVnugSo6YUxIejEYhJ7BzsoLYXf/d6t
	 5fppUz9s3BHIA==
Date: Wed, 11 Jan 2023 14:04:42 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chromeos: cros_ec: Use per-device lockdep key
Message-ID: <Y75RelNR3/QVdyyK@google.com>
References: <20230106045537.1243887-1-wenst@chromium.org>
 <Y7flCydDtLVwsXIJ@google.com>
 <CAGXv+5Gnc6tCjO95VjBJ4F5p5bnS+M96at3ErpSX==3qPwNUsg@mail.gmail.com>
 <Y7uqJ+DPyqFxaQUV@google.com>
 <CAGXv+5GNUyVpe5P7QazHB6K37C_0dNLwoP9gWKhgAbfXWRxJwA@mail.gmail.com>
 <Y7vCeNzJMn0nOrla@google.com>
 <CAGXv+5FELCKmmU2tiETGagOk+83x8OkYAxFTTxt+9tRdsujtmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5FELCKmmU2tiETGagOk+83x8OkYAxFTTxt+9tRdsujtmA@mail.gmail.com>

On Mon, Jan 09, 2023 at 03:35:08PM +0800, Chen-Yu Tsai wrote:
> On Mon, Jan 9, 2023 at 3:30 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Mon, Jan 09, 2023 at 02:19:38PM +0800, Chen-Yu Tsai wrote:
> > > On Mon, Jan 9, 2023 at 1:46 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > >
> > > > On Sat, Jan 07, 2023 at 01:43:57PM +0800, Chen-Yu Tsai wrote:
> > > > > On Fri, Jan 6, 2023 at 5:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, Jan 06, 2023 at 12:55:37PM +0800, Chen-Yu Tsai wrote:
> > > > > > > Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> > > > > > > the following lock sequences:
> > > > > > >
> > > > > > > 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> > > > > > > 2. lock(&ec_dev->lock); lock(prepare_lock);
> > > > > > >
> > > > > > > The actual dependency chains are much longer. The shortened version
> > > > > > > looks somewhat like:
> > > > > > >
> > > > > > > 1. cros-ec-rpmsg on mtk-scp
> > > > > > >    ec_dev->lock -> prepare_lock
> > > > > > > 2. In rt5682_i2c_probe() on native I2C bus:
> > > > > > >    prepare_lock -> regmap->lock -> (possibly) i2c_adapter->bus_lock
> > > > > > > 3. In rt5682_i2c_probe() on native I2C bus:
> > > > > > >    regmap->lock -> i2c_adapter->bus_lock
> > > > > > > 4. In sbs_probe() on cros-ec-i2c (passthrough) I2C bus on cros-ec
> > > > > > >    i2c_adapter->bus_lock -> ec_dev->lock
> > > > > > >
> > > > > > > While lockdep is correct that the shared lockdep classes have a circular
> > > > > > > dependency, it is bogus because
> > > > > > >
> > > > > > >   a) 2+3 happen on a native I2C bus
> > > > > > >   b) 4 happens on the actual EC on ChromeOS devices
> > > > > > >   c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
> > > > > > >      happen to expose a cros-ec interface, but do not have a passthrough
> > > > > > >      I2C bus
> > > > > > >
> > > > > > > In short, the "dependencies" are actually on different devices.
> > > > > >
> > > > > > Path of 4 looks weird to me.
> > > > > >
> > > > > > Could you point out where sbs_probe() gets to acquire ec_dev->lock?
> > > > >
> > > > > sbs_probe() calls sbs_get_battery_presence_and_health(), which
> > > > >
> > > > >   -> does an I2C transfer. This SBS instance is connected on the I2C bus
> > > > >      on the EC, so the I2C transfer
> > > > >
> > > > >      -> acquires i2c_adapter->bus_lock, and
> > > >
> > > > I see.
> > > >
> > > > Another question: the i2c_adapter here should be different from the native
> > > > I2C bus in 2 and 3.  Did they really form the circular dependencies?
> > >
> > > That's why it's a false positive. lockdep normally doesn't track individual
> > > instances, only classes of locks. The class is declared as part of the
> > > mutex_init() macro.
> >
> > Is the following understanding correct:
> > It has 2 ways to break the "fake" circular dependencies: separate lockdep key
> > for i2c_adapter vs. ec_dev.  The patch adopts the latter one because it has
> > limited impact for other I2C-related drivers.
> 
> That's correct.

Thanks for the explanation.  The patch looks good to me.

Just realized a kernel-doc warning after applying the patch:
$ ./scripts/kernel-doc -none include/linux/platform_data/cros_ec_proto.h
include/linux/platform_data/cros_ec_proto.h:199: warning: Function parameter
or member 'lockdep_key' not described in 'cros_ec_device'

Please fix the warning and commit title.
