Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC12564
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 07:35:20 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id z190so3530731vka.4
        for <chrome-platform@lists.linux.dev>; Sun, 08 Jan 2023 23:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0suxQdAcQu0p2UKz47c1j8q2hACyOlrOS3RM69ysgcU=;
        b=Sr6WYLcxn0+IUm77HQaJ5O6/6vU8v2M3Kb0i3kRohqyTL55ykUNdkLJf1RtLIwGRIR
         wRGGlIYb9QTocNQdDknipspG7Zvv9Rr4QCZDhTdams+Sh2OXM+zEMCQk7G1lsRBMWvYW
         DlUKs1dhkelMXvZ8AbmvFsOTYgMDdgkXghqTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0suxQdAcQu0p2UKz47c1j8q2hACyOlrOS3RM69ysgcU=;
        b=uPiEongW7OYF9XpAzmp9+vaRQEQgbU7xtI1KL2SPlRDoHNM/qWJSKN71jEsRXmDajE
         N0qzIJujzK1AY11S+NPGFVTdoBCAKlLfLQPYCsRTA4EIq0sT14uDLpL8iUns0tBYdx4y
         yd6v5/VmlnbllDqztnxTk6+HbQa3foZtjIokeAh5L0ndxQFEWZmrlKdSFpxp5x9ag9Ve
         WW10kVmroMeUDxMWi/2DW44M/1H228LQHcpLkQOStnpnPEAIbhwVgmqmmbUpoPoEDkWX
         62qin9e+dRJqED6yw/ZsmUM9JA/d2+JQlGDn2DWKlHDDfTP5ioqzcj7WJHl4wXHcnnu0
         lW7g==
X-Gm-Message-State: AFqh2kqcT8qchmBZkAia+SCPeAOOoQqgt/RMf8Lvnye1iSTxfBqcjrjE
	iG8o4QnQRQ9zzJaNu3AQBDDZgg4L7k5ciIZbeKy80w==
X-Google-Smtp-Source: AMrXdXup+yxUrF9QQjUzNYfkBT9Vi3LgwtinciNz13DOlCZHzAo9Y/3pKDZ7DrtYumSWVbHr+kwY8Ca83HtT58fSH+0=
X-Received: by 2002:a1f:940a:0:b0:3bd:e439:84e4 with SMTP id
 w10-20020a1f940a000000b003bde43984e4mr7518397vkd.11.1673249719507; Sun, 08
 Jan 2023 23:35:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230106045537.1243887-1-wenst@chromium.org> <Y7flCydDtLVwsXIJ@google.com>
 <CAGXv+5Gnc6tCjO95VjBJ4F5p5bnS+M96at3ErpSX==3qPwNUsg@mail.gmail.com>
 <Y7uqJ+DPyqFxaQUV@google.com> <CAGXv+5GNUyVpe5P7QazHB6K37C_0dNLwoP9gWKhgAbfXWRxJwA@mail.gmail.com>
 <Y7vCeNzJMn0nOrla@google.com>
In-Reply-To: <Y7vCeNzJMn0nOrla@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 15:35:08 +0800
Message-ID: <CAGXv+5FELCKmmU2tiETGagOk+83x8OkYAxFTTxt+9tRdsujtmA@mail.gmail.com>
Subject: Re: [PATCH] platform/chromeos: cros_ec: Use per-device lockdep key
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 3:30 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Jan 09, 2023 at 02:19:38PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Jan 9, 2023 at 1:46 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > >
> > > On Sat, Jan 07, 2023 at 01:43:57PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Jan 6, 2023 at 5:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > > >
> > > > > On Fri, Jan 06, 2023 at 12:55:37PM +0800, Chen-Yu Tsai wrote:
> > > > > > Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> > > > > > the following lock sequences:
> > > > > >
> > > > > > 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> > > > > > 2. lock(&ec_dev->lock); lock(prepare_lock);
> > > > > >
> > > > > > The actual dependency chains are much longer. The shortened version
> > > > > > looks somewhat like:
> > > > > >
> > > > > > 1. cros-ec-rpmsg on mtk-scp
> > > > > >    ec_dev->lock -> prepare_lock
> > > > > > 2. In rt5682_i2c_probe() on native I2C bus:
> > > > > >    prepare_lock -> regmap->lock -> (possibly) i2c_adapter->bus_lock
> > > > > > 3. In rt5682_i2c_probe() on native I2C bus:
> > > > > >    regmap->lock -> i2c_adapter->bus_lock
> > > > > > 4. In sbs_probe() on cros-ec-i2c (passthrough) I2C bus on cros-ec
> > > > > >    i2c_adapter->bus_lock -> ec_dev->lock
> > > > > >
> > > > > > While lockdep is correct that the shared lockdep classes have a circular
> > > > > > dependency, it is bogus because
> > > > > >
> > > > > >   a) 2+3 happen on a native I2C bus
> > > > > >   b) 4 happens on the actual EC on ChromeOS devices
> > > > > >   c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
> > > > > >      happen to expose a cros-ec interface, but do not have a passthrough
> > > > > >      I2C bus
> > > > > >
> > > > > > In short, the "dependencies" are actually on different devices.
> > > > >
> > > > > Path of 4 looks weird to me.
> > > > >
> > > > > Could you point out where sbs_probe() gets to acquire ec_dev->lock?
> > > >
> > > > sbs_probe() calls sbs_get_battery_presence_and_health(), which
> > > >
> > > >   -> does an I2C transfer. This SBS instance is connected on the I2C bus
> > > >      on the EC, so the I2C transfer
> > > >
> > > >      -> acquires i2c_adapter->bus_lock, and
> > >
> > > I see.
> > >
> > > Another question: the i2c_adapter here should be different from the native
> > > I2C bus in 2 and 3.  Did they really form the circular dependencies?
> >
> > That's why it's a false positive. lockdep normally doesn't track individual
> > instances, only classes of locks. The class is declared as part of the
> > mutex_init() macro.
>
> Is the following understanding correct:
> It has 2 ways to break the "fake" circular dependencies: separate lockdep key
> for i2c_adapter vs. ec_dev.  The patch adopts the latter one because it has
> limited impact for other I2C-related drivers.

That's correct.
