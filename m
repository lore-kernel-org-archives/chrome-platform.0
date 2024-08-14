Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FBB1AD9C6
	for <chrome-platform@lists.linux.dev>; Wed, 14 Aug 2024 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723630219; cv=none; b=Uosx3LzD6znutf0h2mWamAzCznjiDNvy3XhbbF91fZK1ltiCgnTWrNrtQJwjm2MAswi7kFuXSTQf/t065v1S561OALFJ+8I9a6GPZzpQTKB+mgP2ZKysGl1pE6ALnru1H16D1H98uwbBLnxsXNeCCAHgqQyUtA0uVWH2OXPhFU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723630219; c=relaxed/simple;
	bh=HtmsSU5ENdUZpr+MPxoYuH51F28PtAovj20fVUAbRwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBErNn3hZFL1lyxqxeP+pNxxJkKLsv0m3C+DfFYa7/6TcjYD27DpjoGR4QB1Zs3DYLSa1mUGHRm8V038ZGq0r3y77o1/cGP7puvfG+kZ/l8jVzHfYfT0+zQgz499OUxe6W4rGu3w9YlA1jfvn2wR5jjQTKKFCF01rRk2Sgnlrio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EO3NY/nt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EO3NY/nt"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so68092661fa.3
        for <chrome-platform@lists.linux.dev>; Wed, 14 Aug 2024 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723630215; x=1724235015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=;
        b=EO3NY/nt/ZuLiVIUZz3mI64+q5JwCaUhsCx5u6UVoKG6bhPnV5xNAyZNRQr8qDHDo2
         db5SWNmXKk5xQclJkdjmTlB5AxxTXOP1OikqG1sOMh8FTnvsZevDtQOThNehmPMQyuja
         eyJO++wnBBgt+NPzDnD2ZoHzxKPMKSDen531I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723630215; x=1724235015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=;
        b=fEj4YnrdZLftt5W1nKENS6HUaWQGbpgqYBEUWoRWeDHzKindpZ3WAZkshtrbQUrBKO
         CxH9MnLlJwC5lMIb7Jr14xnYwqPYZQ9BR6iqKJloVhIOJH7ehhh992qnVu6LY/Ahn1EQ
         5zU2D3Zue/209D+bx/1fVQ10O+8/wne0WGfri3JubFQvfVtl/YWwFVK8qONjEkmYWLxi
         jqTbiQifIDwh99EAh/PF+nXbIBsRzCE3uiXGxDq0ahpGFVFIxZ4IK4dIFQpq3L06ACXn
         ya0KijWwxy/irlWpHFWXjWD0za4ndSQCnvnQ0VYJBJ1X/V9v7VvO6h9GSOJul3JgTH/n
         HmLw==
X-Forwarded-Encrypted: i=1; AJvYcCURhEVX2iy+LefOGAHzsjLpVaVIllhH4UFx0SWKCS3P3093jEP6j30w7t9o+gVRP9zQCZdm718rCp9lAfN+ig4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtQYH3X4uvW82wX2cfhoiA85Z+kMVMjOfN8zfwhX9sY8CybDoL
	sSyVecPANX4g3KwXKB6DfZHYMiITBZsdwM7m/Dv+QbOuVQhlz68yVNwgJXCeraEknj2K27AOVSw
	/+5y8yB/pIGWBE08+xU5Z7JUopT7tdfHqU7FP
X-Google-Smtp-Source: AGHT+IEe32jN8gUqbf1l9ngrSD5IPLARvV8fpV4Tje3WEqH7kkd+ZQY+1xW4UvomRXZlgVtw/pLaiYHStH4ShpBNc/E=
X-Received: by 2002:a2e:4a1a:0:b0:2f0:33e:d286 with SMTP id
 38308e7fff4ca-2f3aa1a5198mr14064661fa.20.1723630214840; Wed, 14 Aug 2024
 03:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-6-wenst@chromium.org>
 <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
In-Reply-To: <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Aug 2024 18:10:03 +0800
Message-ID: <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware prober
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

On Tue, Aug 13, 2024 at 7:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:
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
> > this change introduces a simple I2C component prober. For any given
> > class of devices on the same I2C bus, it will go through all of them,
> > doing a simple I2C read transfer and see which one of them responds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree.
> > The status for all the device nodes for the component options must be
> > set to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > + * Copyright (c) 2023 Google LLC
>
> At bare minimum we are in 2024 now.

Ack.

> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
> Why?

Might have been left over from previous work and squashed into the wrong
commit. Will remove.

> > +#include <linux/platform_device.h>
>
> ...
>
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > +             if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
> > +                     continue;
>
> > +             int ret;
>
> I didn't know we allow this kind of definition mix besides for-loop and
> __free()... Can you point me out where this style change was discussed?

Will move to the top of the for loop block.

> > +             ret =3D hw_prober_platforms[i].prober(&pdev->dev, hw_prob=
er_platforms[i].data);
> > +             /* Ignore unrecoverable errors and keep going through oth=
er probers */
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     return ret;
> > +     }
>
> ...
>
> > +static void chromeos_of_hw_prober_driver_exit(void)
> > +{
> > +     if (!chromeos_of_hw_prober_pdev)
> > +             return;
>
> First of all, this is dup for the next call, second, when may this condit=
ional
> be true?

When the module is loaded on a machine that doesn't match any entry,
neither the driver nor the device are registered. Hence the check.

Or maybe the proper way to handle it is to return -ENODEV or something?
I'll work towards that.

Thanks
ChenYu

> > +     platform_device_unregister(chromeos_of_hw_prober_pdev);
> > +     platform_driver_unregister(&chromeos_of_hw_prober_driver);
> > +}
> > +module_exit(chromeos_of_hw_prober_driver_exit);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
