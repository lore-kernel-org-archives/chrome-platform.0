Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A177DA67
	for <chrome-platform@lists.linux.dev>; Thu, 15 Aug 2024 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723715731; cv=none; b=Z0d6M1WdaI4Jl50/TGeDtmEw/J2QaXCt3UGoc8q1icSynm22WCl7b4sPYI7EbpDswtnH5y61+7rqcDm6zxwoZ9Ni8RG0zoPJ21eHx7w9WMaii+7UyqwxsAqtDbrJveR87POXAeon6DhpNfukzRm4I48y4/ACl8nRjbaAtVvyK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723715731; c=relaxed/simple;
	bh=EEV0E6+PsW1vWpYqy+UhX5StmnnbQ0nvPdsdV1auktA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTugkSdYrS5B2megUn9Yh31Tb0JdZmVZGZzujaUThHLoN0ywq4N7ZHoZXpfyoEHJJS6nq4Z4wXgw5XASA3xM2CjvMmJSHJ294OZnt1L9TNKd3zy416mGT/Ouzl1HzB/rf32VqHo8+1JvQaC0Zn1R2kZ/PzEPaLkFmnZMgDMA2Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UVuG+Iui; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UVuG+Iui"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-530d0882370so686785e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 15 Aug 2024 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723715727; x=1724320527; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5h80tcGsfqjYM1UFpSbRtoNZZUnUPL2z1uKz9S/Kkk=;
        b=UVuG+Iuiv6KIRGXvnAHYDXDyu+qG+PgVMxC+DnQQctp8AuJ5ZdC3FlrlOxjIDvrSHb
         wYRHojafQFmZB7pvBFfdRn6GHi8oj9qQkKRtQp2Afv/jsZcs9LvCpQglzw8HL5Gxg2UX
         H9BcSQUPad8QIduSofyqqkVYBlE6GKPVBUjc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723715727; x=1724320527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5h80tcGsfqjYM1UFpSbRtoNZZUnUPL2z1uKz9S/Kkk=;
        b=r9Ka1mTLMbgUAv/3znNWSm7k/cDFhGiSdQHn5Bv58l9Xdpf+VYEtK0V9qZRD6GECjV
         P3GVxGPTIGsDh8VfBXuOmqkOwN+d8DPeqZbcj1EWvONHDn4rPtc+9GYKXkyQ5LQuCyzd
         wN65+GGsLfjYGtnCWNTQXfEtRf1FWkOzvyQor9VixFOb6WAYKte31DQze5nP7uKHYUH5
         4tl77d+UeRnDvlQKQmzmPXGQJnAGx7VqbtkDjPEv23AJDiqH61HSdSZFrNRxfh564q1x
         tQTubWgcfWr4uSZ723YfWNS8vMithsj2PcIU74VKJFRe8crUPg5V7s9LcMPYJ1KfhD19
         s/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWArwMiHOcQMbHQda8WtuoeawJO8upwfdklkD5mofdpcVmkT/MZlYYqC33MlpymPLDrBKNuKPD2YtgNUArZrDJTSMRBBq9c7slJc8G98C4
X-Gm-Message-State: AOJu0Yyqb8cMJk6UMNlYmh+gNujZv8zzQmvQpruq7nUS+sYkvrXfQhkt
	als68WdnMci70Of8wUxamRnYJwst1Heru7y0RV08XokLTDHCQgUi6lZxNaADbUg0UIg7nBN0mKs
	8MQPY/m2kUv8uppvHRoRql8KGxsqzuDURgBZM
X-Google-Smtp-Source: AGHT+IHk5D9Axhf7aH2jIvdVPiigXA+7hFBYb9TbjKDhBcQ8ihLDumNSY3TL20N3WQe0JURETR/Gp6xRXUf3bXq00mc=
X-Received: by 2002:a05:6512:2351:b0:52c:a0b8:4dc0 with SMTP id
 2adb3069b0e04-532edbc076amr3321287e87.28.1723715726777; Thu, 15 Aug 2024
 02:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-4-wenst@chromium.org>
 <ZrtC4Q4N_3x2KTNb@smile.fi.intel.com>
In-Reply-To: <ZrtC4Q4N_3x2KTNb@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Aug 2024 17:55:15 +0800
Message-ID: <CAGXv+5GfCcft4+no1dTVRa3Sx7XbiufjSqJb4UPRc9yZv3b+rQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 7:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2024 at 05:59:26PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component probe. function For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +int i2c_of_probe_component(struct device *dev, const char *type)
>
> Use respective scoped variants and remove the related of_node_put() calls=
.

Ack. Will also try splitting and reworking the code so they have
tighter scopes.

> ...
>
> > +             ocs =3D kzalloc(sizeof(*ocs), GFP_KERNEL);
>
> Use __free()

This ends up only a bit better than with gotos once this small section
is split out into a helper function.

AFAIK ocs, or at least the underlying properties, have to be left around
once the changeset is applied as they are now part of the dynamic live
tree. And that's fine since once applied, nothing is going to un-apply
it. OTOH in the error path it needs extra cleanup if any actions were
added.

So I end up with the following to silence the "must check return value"
warning on success, and cleanup on error:

ret =3D of_changeset_apply(ocs);
if (!ret) {
        void *ptr __always_unused =3D no_free_ptr(ocs);
} else {
        of_changeset_destroy(ocs);
}

In my case it might actually be safe to do of_changeset_destroy(ocs) and
free it regardless, but I'm not really confident.


ChenYu



> > +             if (!ocs) {
> > +                     ret =3D -ENOMEM;
> > +                     goto err_put_node;
> > +             }
>
> > +err_free_ocs:
> > +     kfree(ocs);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
