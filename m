Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFC17EF
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 09:03:34 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id o63so15000480vsc.10
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 01:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CuDeia0CiKF+kBYrZ/MDemWf2Ns0OMCpwHIl94bJeDQ=;
        b=SixLufghEGhPEmxxlP0A0/uka1fXtkDi/h1sYVTDiDGSlE0gbb40W49vQf0gi91EE0
         0IegYvFndksHzUGIFeissTjQDwqojJcWExswCWYzIvSlpvvSAZ+P8xpLv9AG490w1gIf
         WEHEqyme0EAovtS1Mln9nBgIy2p+jVZQbvQpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuDeia0CiKF+kBYrZ/MDemWf2Ns0OMCpwHIl94bJeDQ=;
        b=76lKIw3MfilDoTDGt8m1er38PbVkSDUbCwM8/5kQBknAeaLcOnsPAO7Bh2fJP+8CKK
         z1eqWnKqthys22J0SFOB2GbLdWd9yN2eNCHpxki3jn6fHJQ6rvNrxYBxfTYmIGpPms1o
         13iqn2MYFAkMLM1/KhfcY0K5+1wcCtqmSpYzYCtQr+LM+SGVSxGYAyzuprb9cgON1UI2
         69im01Pyc+bDbluzolcVHTEan1SmQkRAAzHd5whhw3rO2YrNN1Vo37qGXm1t6l+SDnHM
         IB5Flzfd1DVZnpYjnKhAX6nE3evlOHCNq9RQeEIjQ/V3AfXj021NtxBK4sRej13F2cc7
         jwvg==
X-Gm-Message-State: AFqh2kqV1o0/OUt8Ilyq+hQkAmEF7hEFO6jgA8XPbyb4E6920EcCKjuE
	UafGBicoVDhxR65xeR0jlEo65SRdH5jGgj8p1+M8HKjX+P6YVwMx
X-Google-Smtp-Source: AMrXdXsFyoid4ItvwTPHWthZr/uIBj7vvrNjoGsRDiCIZPGJwqc3YKf8CK+48+Q+6SePCDAmPYVJtoonKfk5B/4kQek=
X-Received: by 2002:a67:447:0:b0:3ce:d0ae:f6f6 with SMTP id
 68-20020a670447000000b003ced0aef6f6mr4429984vse.26.1673427813282; Wed, 11 Jan
 2023 01:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111074146.2624496-1-wenst@chromium.org> <CAGXv+5HTOR2Nt5CtmiYx2jrJ-0=YjFaGnQXesRBNFMoogsHJQw@mail.gmail.com>
In-Reply-To: <CAGXv+5HTOR2Nt5CtmiYx2jrJ-0=YjFaGnQXesRBNFMoogsHJQw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Jan 2023 17:03:22 +0800
Message-ID: <CAGXv+5FtXn3Q7Y_om11vh-rkw_mKC_8k4XdTVLN4z7xefrzTDw@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Use per-device lockdep key
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 4:47 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Wed, Jan 11, 2023 at 3:41 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> > the following lock sequences:
> >
> > 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> > 2. lock(&ec_dev->lock); lock(prepare_lock);
> >
> > The actual dependency chains are much longer. The shortened version
> > looks somewhat like:
> >
> > 1. cros-ec-rpmsg on mtk-scp
> >    ec_dev->lock -> prepare_lock
> > 2. In rt5682_i2c_probe() on native I2C bus:
> >    prepare_lock -> regmap->lock -> (possibly) i2c_adapter->bus_lock
> > 3. In rt5682_i2c_probe() on native I2C bus:
> >    regmap->lock -> i2c_adapter->bus_lock
> > 4. In sbs_probe() on i2c-cros-ec-tunnel I2C bus attached on cros-ec:
> >    i2c_adapter->bus_lock -> ec_dev->lock
> >
> > While lockdep is correct that the shared lockdep classes have a circular
> > dependency, it is bogus because
> >
> >   a) 2+3 happen on a native I2C bus
> >   b) 4 happens on the actual EC on ChromeOS devices
> >   c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
> >      happens to expose a cros-ec interface, but does not have an
> >      i2c-cros-ec-tunnel I2C bus
> >
> > In short, the "dependencies" are actually on different devices.
> >
> > Setup a per-device lockdep key for cros_ec devices so lockdep can tell
> > the two instances apart. This helps with getting rid of the bogus
> > lockdep warning. For ChromeOS devices that only have one cros-ec
> > instance this doesn't change anything.
>
> Actually, hold off on this for a bit. I just realized this makes the
> kernel give a big warning:
>
> INFO: trying to register non-static key.
> The code is fine but needs lockdep annotation, or maybe
> you didn't initialize this object before use?
> turning off the locking correctness validator.
>
> CPU: 0 PID: 99 Comm: kworker/u16:3 Not tainted
> 6.2.0-rc3-next-20230111-04021-g65853aed7123-dirty #472
> 8115f54190814e6abf2d53f6a2194c1af0b27040
> Hardware name: Google juniper sku16 board (DT)
> Workqueue: events_unbound async_run_entry_fn
> Call trace:
>  dump_backtrace.part.0+0xb4/0xf8
>  show_stack+0x20/0x38
>  dump_stack_lvl+0x88/0xb4
>  dump_stack+0x18/0x34
>  register_lock_class+0x16c/0x40c
>  __lock_acquire+0xa0/0x1064
>  lock_acquire+0x1f0/0x2f0
>  down_write+0x5c/0x80
>  __blocking_notifier_chain_register+0x64/0x84
>  blocking_notifier_chain_register+0x1c/0x28
>  cros_ec_debugfs_probe+0x218/0x3ac
>  platform_probe+0x70/0xc4
>  really_probe+0x158/0x290
>  __driver_probe_device+0xc8/0xe0
>  driver_probe_device+0x44/0x100
>  __device_attach_driver+0x64/0xdc
>  bus_for_each_drv+0xa0/0xc8
>  __device_attach_async_helper+0x70/0xc4
>  async_run_entry_fn+0x3c/0xe4
>  process_one_work+0x2d0/0x48c
>  worker_thread+0x204/0x274
>  kthread+0xe8/0xf8
>  ret_from_fork+0x10/0x20

I think this is caused by

    d90fa2c64d59 platform/chrome: cros_ec: Poll EC log on EC panic

That commit is missing a BLOCKING_INIT_NOTIFIER_HEAD() call.

ChenYu
