Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA920E3
	for <chrome-platform@lists.linux.dev>; Thu, 13 Oct 2022 05:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDDCC433C1;
	Thu, 13 Oct 2022 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665640192;
	bh=3fyap5LhSza2L+4JHuJ6ML5HQdF9DEP7yZF+q8oMha8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyQeKUdorM33zBwvzzNEUPgVBlmD2cDNcA7+SGKG2KEwXmLfzjMxK3Z/ClCy9eSmC
	 9OkKwOOTLxCCq/YJOqPu3bk60BkkixwJQleCpjlCTEfviv9UTwm48OG3TMXYlh3QAI
	 IFFHWdwbXHfbisPzsXCufu3m1+sfw9dYdDITzAnagZ/oq6f/hL8UDQUbxzq43WUmgh
	 CPKfI+hsnvxILmduWxaJIiyvZ76Jj6hkmHg6NcMqHhiXIiqjg3rNE3Oyfl0typN80Z
	 d6bChRUzjISnf7FnQi44gVp/7oTgyebM6iyHHU7phwbBxk8HvUzijSpyTEtlC+xbMJ
	 J7rJXyICY3S0Q==
Date: Thu, 13 Oct 2022 13:49:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dan Callaghan <dcallagh@chromium.org>
Cc: chrome-platform@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	Sami =?iso-8859-1?Q?Ky=F6stil=E4?= <skyostil@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 1/1] platform/chrome: add a driver for HPS
Message-ID: <Y0em/bnh3uk/zw6b@google.com>
References: <20221012040918.272582-1-dcallagh@chromium.org>
 <20221012040918.272582-2-dcallagh@chromium.org>
 <Y0Z++9QUAOOUAQrj@google.com>
 <CAL=kDigzLLfqxJyGCon3Tk6jHH0r=Zw9ZJDT0LL4Rcr8tmmppw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL=kDigzLLfqxJyGCon3Tk6jHH0r=Zw9ZJDT0LL4Rcr8tmmppw@mail.gmail.com>

On Wed, Oct 12, 2022 at 09:29:03PM -0700, Dan Callaghan wrote:
> Excerpts from Tzung-Bi Shih’s message of 2022-10-12 19:46:51 +1100:
> > On Wed, Oct 12, 2022 at 03:09:18PM +1100, Dan Callaghan wrote:
> > > +     hps->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_HIGH);
> > > +     if (IS_ERR(hps->enable_gpio)) {
> > > +             ret = PTR_ERR(hps->enable_gpio);
> > > +             dev_err(&client->dev, "failed to get enable gpio: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret = misc_register(&hps->misc_device);
> > > +     if (ret) {
> > > +             dev_err(&client->dev, "failed to initialize misc device: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     hps_set_power(hps, false);
> >
> > IIUC, the GPIO will raise to HIGH in the first place, and then fall
> > to LOW until here.  Is it an expected behavior?  How about gpiod_get()
> > with GPIOD_OUT_LOW?
> 
> It might seem a little unusual, but it is intentional. The enable line is
> already high when we enter the kernel from firmware. Acquiring the GPIO
> line with GPIOD_OUT_HIGH preserves its existing state (high) in case later
> steps fail.
> 
> We power off the periphal only once the driver is successfully bound and has
> taken control of its power state.

I see.  Please put some context comments before calling devm_gpiod_get().

> > > +static int hps_i2c_remove(struct i2c_client *client)
> > > +{
> > > +     struct hps_drvdata *hps = i2c_get_clientdata(client);
> > > +
> > > +     pm_runtime_disable(&client->dev);
> > > +     misc_deregister(&hps->misc_device);
> > > +     hps_set_power(hps, true);
> >
> > Why does it need to raise the GPIO again when removing the device?
> 
> Similar to the above, we want to preserve the default power state
> (i.e. powered on) whenever the driver is not bound to the device.
> 
> This behaviour made sense to us mainly because we were originally controlling
> the peripheral entirely from userspace, so it was always powered on by default.
> 
> Do you think this behaviour is acceptable, or do we need to change it?

I think it's fine.  Please put some context comments before calling
hps_set_power().
