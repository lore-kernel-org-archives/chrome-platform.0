Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D523C0
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 06:19:50 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id k4so7571085vsc.4
        for <chrome-platform@lists.linux.dev>; Sun, 08 Jan 2023 22:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=106uD06AzbNxk62noX8/CiR5uQr2OwaIURM2AqUxNqU=;
        b=KKlqbXe8YdVAhhRpmR/QNe1LyJ5nWrsuNWXUFZKYjFQTa4mo5bec9f9XNYpsdBbIxd
         DfvEgehaKBiAQLHI67cHXned06E5DhxtUp6gCzm+oDZJTTW7v2He2TVYoK52ZooVQxEn
         GCQAxF967limKBoz7kOCWWg8PgcU/gK4hLL9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=106uD06AzbNxk62noX8/CiR5uQr2OwaIURM2AqUxNqU=;
        b=I8NwM5SfExwZKnf2z44IhHnDqhlzTdR+nXlrT5SAHdagh19WUOKsvEMonAzNQnKHxX
         v02bv6DABQRaUaPF/Rb+/yonJ2OMo1nt4Q1ljZSqPFQ8qS1Vm4OvOEZ4wi9GtTxaGyyT
         GyohDeu/fmjxwg/W6+iNZsX4XTunqUfzvbi4edbcsSlWPZy19+m4gd57C2nfUiXSR7gl
         Or8SrTCAjs9qxcu/5vtBPRzW9bzaPKAn0V9BlMDXn352Iw4KDueRvLBvzNeFd8E+WNIk
         rucg+Vz6gfxdsgP+6UJa8w6sKO5ePC/KxrTT7bk5fXu4RinG30qO3MMZ+ViNsZXN2iRh
         4T5w==
X-Gm-Message-State: AFqh2koSSbNpdV1XTvgMvxVaFJEXxlGzln18aEOGDhRUf3JhnupxuDym
	u4rCbVF2ZZqCTSPH7CM6jNpfzJNhLzm/fZy9gUTrjg==
X-Google-Smtp-Source: AMrXdXuVhwhLKcDsnsdWzIyAuuiqkdrTwY2VDzmktFx5YnMTYMwDmmQu5EKubdQQCDilvp6+oq7A+BC4ewXjF6zIBNo=
X-Received: by 2002:a67:447:0:b0:3ce:d0ae:f6f6 with SMTP id
 68-20020a670447000000b003ced0aef6f6mr2866248vse.26.1673245189605; Sun, 08 Jan
 2023 22:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230106045537.1243887-1-wenst@chromium.org> <Y7flCydDtLVwsXIJ@google.com>
 <CAGXv+5Gnc6tCjO95VjBJ4F5p5bnS+M96at3ErpSX==3qPwNUsg@mail.gmail.com> <Y7uqJ+DPyqFxaQUV@google.com>
In-Reply-To: <Y7uqJ+DPyqFxaQUV@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 14:19:38 +0800
Message-ID: <CAGXv+5GNUyVpe5P7QazHB6K37C_0dNLwoP9gWKhgAbfXWRxJwA@mail.gmail.com>
Subject: Re: [PATCH] platform/chromeos: cros_ec: Use per-device lockdep key
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 1:46 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Sat, Jan 07, 2023 at 01:43:57PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jan 6, 2023 at 5:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > >
> > > On Fri, Jan 06, 2023 at 12:55:37PM +0800, Chen-Yu Tsai wrote:
> > > > Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> > > > the following lock sequences:
> > > >
> > > > 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> > > > 2. lock(&ec_dev->lock); lock(prepare_lock);
> > > >
> > > > The actual dependency chains are much longer. The shortened version
> > > > looks somewhat like:
> > > >
> > > > 1. cros-ec-rpmsg on mtk-scp
> > > >    ec_dev->lock -> prepare_lock
> > > > 2. In rt5682_i2c_probe() on native I2C bus:
> > > >    prepare_lock -> regmap->lock -> (possibly) i2c_adapter->bus_lock
> > > > 3. In rt5682_i2c_probe() on native I2C bus:
> > > >    regmap->lock -> i2c_adapter->bus_lock
> > > > 4. In sbs_probe() on cros-ec-i2c (passthrough) I2C bus on cros-ec
> > > >    i2c_adapter->bus_lock -> ec_dev->lock
> > > >
> > > > While lockdep is correct that the shared lockdep classes have a circular
> > > > dependency, it is bogus because
> > > >
> > > >   a) 2+3 happen on a native I2C bus
> > > >   b) 4 happens on the actual EC on ChromeOS devices
> > > >   c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
> > > >      happen to expose a cros-ec interface, but do not have a passthrough
> > > >      I2C bus
> > > >
> > > > In short, the "dependencies" are actually on different devices.
> > >
> > > Path of 4 looks weird to me.
> > >
> > > Could you point out where sbs_probe() gets to acquire ec_dev->lock?
> >
> > sbs_probe() calls sbs_get_battery_presence_and_health(), which
> >
> >   -> does an I2C transfer. This SBS instance is connected on the I2C bus
> >      on the EC, so the I2C transfer
> >
> >      -> acquires i2c_adapter->bus_lock, and
>
> I see.
>
> Another question: the i2c_adapter here should be different from the native
> I2C bus in 2 and 3.  Did they really form the circular dependencies?

That's why it's a false positive. lockdep normally doesn't track individual
instances, only classes of locks. The class is declared as part of the
mutex_init() macro.

ChenYu
