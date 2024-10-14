Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451F231CB1
	for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728878043; cv=none; b=IpkFzTQAHwTIRwppEuNuS/0gcblUyQ4cmzam5tiaZIno03YZpmmM7OisX7VX4n4ptvTGkt41M31iuIMVCsS2Lnez4hwsOIqmsGvxngQxeFDovcEnkuGNsAeCPHk9snFoJiwZQ5iVk7IQujHJd5HRYOQcV3Dm4g7N9XoeSYoBoBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728878043; c=relaxed/simple;
	bh=u0PlDHHV/2N72J7VOsa02rvBMYZAXVzQdaQv5644zzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOH2ActNmXy827RLShE7z5+kF6FBaGH/7lEH/xjT+z/WEW56MswnMgSKrzMAcYDCepWoMt2SI2C4sIIKN1S1oYs+iWXd5O+G3K9K+1lHLOgd4SL9fXctCxYS2VMm5YBgoXzZjD8YeFdbfI++eL+p6v3xtq11n9/qBx0FpKIFb7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GU50Yqo7; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GU50Yqo7"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso308341e87.1
        for <chrome-platform@lists.linux.dev>; Sun, 13 Oct 2024 20:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728878039; x=1729482839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3lLQfUo/s0gGdA9DmoonFF1hWOI8uf/oAseIjpYmyc=;
        b=GU50Yqo7LpJJY56MZh62bfpJMoYKd4PkNBsBxQDh+YId0nKrI5TCB558FQ1fVGjJnn
         UoiA2mwv7jzLdDhj65P1dKye2AQvTrO6L/AQ5C9uUiLfiokCfHBn7ZOXJuV+S8aWc2id
         o5scO903EUaXigoMUneoaDp/ZxThXumyAADxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728878039; x=1729482839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3lLQfUo/s0gGdA9DmoonFF1hWOI8uf/oAseIjpYmyc=;
        b=OtcjBnASkaMXtzxqf0iXg7/4k2Uql7/D/eeCGIaPeku/Gf5uPFPOwqKYJLFottvgAH
         aN+1/vk6NkYmO06iogvMphC+T+9d4kO5L+4yco0dRj8rubnZwbwJ9ss/YSx5aLhP9VQo
         mN2k7r5AQyY7GgHOeMhrv3AOFV9nkFmEuGdnmSJRbgDOIhQveoPRlu0HEgJkrfXzRCdp
         fecAtotUXN24DPIJi4i2Zv+73G/xfTsz3vcul955YP0yinLizfjFDiI8STMebyelDgP+
         rQpD5NF1Zjhj6xT3wmcEbdBTx/oUBHMagVha0ty1KNzqKgKOP+j8SYlw3e6NdWb5kF+z
         +BiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXprHsI5drHiOsAAFmvKlc0J8DDKnKtwoF6yiuHQEPY2xLx69oxjaaN8WI7I7YgopRVt5YaJJ73d5izS28J+7g=@lists.linux.dev
X-Gm-Message-State: AOJu0YysTZYakeRDek8H6Ng13+Jdm0wV4mM75BppX2+c2dOnP/7RBItX
	W+8y69VhyMG8g3OZJiWdReCY+SS/+XZtn5WPzyFfEcMt+ww46h59yeD38UZkgIS3FxgoTCvTSd3
	Cgib52F24vo7gFjf4nvPIbYonAgyrd5Zp5L7U
X-Google-Smtp-Source: AGHT+IEzxwWlDLTghtVV9WGeXOw9CFAW2YJnxa1CC/fbZlqyGTRNtILA9Q+qUXeSLMHOqXVX0fu1XTuMTWycvKaDLXI=
X-Received: by 2002:a05:6512:2255:b0:539:9f52:9e4 with SMTP id
 2adb3069b0e04-539da583dbbmr3799259e87.48.1728878038726; Sun, 13 Oct 2024
 20:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
In-Reply-To: <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 11:53:47 +0800
Message-ID: <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 11:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:
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
> > this change introduces a simple I2C component probe function. For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "fail-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> Fresh reading of the commit message make me think why the firmware or
> bootloader on such a device can't form a dynamic OF (overlay?) to fulfill
> the need?

The firmware / bootloader on existing devices are practically not upgradabl=
e.
On the other hand, the kernel is very easy to upgrade or swap out.

For said shipped devices, there is also nothing to key the detection
off of besides actually powering things up and doing I2C transfers,
which takes time that the firmware has little to spare. We (ChromeOS)
require that the bootloader jump into the kernel within 1 second of
power on. That includes DRAM calibration, whatever essential hardware
initialization, and loading and uncompressing the kernel. Anything
non-essential that can be done in the kernel is going to get deferred
to the kernel.

Also, due to project timelines oftentimes the devices are shipped with a
downstream kernel with downstream device trees. We don't want to tie the
firmware too tightly to the device tree in case the downstream stuff gets
reworked when upstreamed.

> Another question is that we have the autoprobing mechanism for I2C for ag=
es,
> why that one can't be (re-)used / extended to cover these cases?

I haven't looked into it very much, but a quick read of
Documentation/i2c/instantiating-devices.rst suggests that it's solving
a different problem?

In our case, we know that it is just one of a handful of possible
devices that we already described in the device tree. We don't need
to probe the full address range nor the full range of drivers. We
already have a hacky workaround in place, but that mangles the
device tree in a way that doesn't really match the hardware.

The components that we are handling don't seem to have any hardware
ID register, nor do their drivers implement the .detect() callback.
There's also power sequencing (regulator and GPIO lines) and interrupt
lines from the device tree that need to be handled, something that is
missing in the autoprobe path.

Based on the above I don't think the existing autoprobe is a good fit.
Trying to shoehorn it in is likely going to be a mess.

Doug's original cover letter describes the problem in more detail,
including why we think this should be done in the kernel, not the
firmware:
https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa=
1827df0928c5101@changeid/

> ...
>
> > +#ifndef _LINUX_I2C_OF_PROBER_H
> > +#define _LINUX_I2C_OF_PROBER_H
>
> Missing kconfig.h.

Ack.


Thanks
ChenYu

> > +struct device;
> > +struct device_node;
> > +
> > +/**
> > + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> > + *
> > + * A set of callbacks to be used by i2c_of_probe_component().
> > + *
> > + * All callbacks are optional. Callbacks are called only once per run,=
 and are
> > + * used in the order they are defined in this structure.
> > + *
> > + * All callbacks that have return values shall return %0 on success,
> > + * or a negative error number on failure.
> > + *
> > + * The @dev parameter passed to the callbacks is the same as @dev pass=
ed to
> > + * i2c_of_probe_component(). It should only be used for dev_printk() c=
alls
> > + * and nothing else, especially not managed device resource (devres) A=
PIs.
> > + */
> > +struct i2c_of_probe_ops {
> > +     /**
> > +      * @enable: Retrieve and enable resources so that the components =
respond to probes.
> > +      *
> > +      * Resources should be reverted to their initial state before ret=
urning if this fails.
> > +      */
> > +     int (*enable)(struct device *dev, struct device_node *bus_node, v=
oid *data);
> > +
> > +     /**
> > +      * @cleanup_early: Release exclusive resources prior to enabling =
component.
> > +      *
> > +      * Only called if a matching component is actually found. If none=
 are found,
> > +      * resources that would have been released in this callback shoul=
d be released in
> > +      * @free_resourcs_late instead.
> > +      */
> > +     void (*cleanup_early)(struct device *dev, void *data);
> > +
> > +     /**
> > +      * @cleanup: Opposite of @enable to balance refcounts and free re=
sources after probing.
> > +      *
> > +      * Should check if resources were already freed by @cleanup_early=
.
> > +      */
> > +     void (*cleanup)(struct device *dev, void *data);
> > +};
> > +
> > +/**
> > + * struct i2c_of_probe_cfg - I2C OF component prober configuration
> > + * @ops: Callbacks for the prober to use.
> > + * @type: A string to match the device node name prefix to probe for.
> > + */
> > +struct i2c_of_probe_cfg {
> > +     const struct i2c_of_probe_ops *ops;
> > +     const char *type;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_OF_DYNAMIC)
> > +
> > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_pro=
be_cfg *cfg, void *ctx);
> > +
> > +#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
> > +
> > +#endif /* _LINUX_I2C_OF_PROBER_H */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
