Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF252F88
	for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889499; cv=none; b=LVPq6SmjFVierDOyTUOsksjMHaRe5B0YCsUnm5h11J9RwbcfbUOCcuRBjU1PKhxf0speBzqpdOXjI1Xm8jsdIGPVq4+aBRBzTV1gpdGDx65pQF4K/U/02OvF5fu3qK2d6IRs1ZRBX93vuRiHPxzfIwI7z3eYswD8sRSOGFQq0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889499; c=relaxed/simple;
	bh=jb6fmG3jUcn9rj+/51XFR2D89XJgwcnKnAqRPEOP71o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qefy1Rckyevr9cqdY+5NEkuxaw0bvgQ3n9vbkKHtb1peZogh2xjYJ5Hl7ZHh/A+1iLnVn5FjL9buS05xbJjlhAf38qOE1l8VizSYsjge4HhONPVktT3MCIFJTHQfEjM9dB7f/1PNatdU0k6AXqPp+GL689UqbMOjkO8+4BumCyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=efm/m/Si; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="efm/m/Si"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5389917ef34so4308011e87.2
        for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 00:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728889496; x=1729494296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ynM5W4VrPGHZiCTug5hrtZgV83Yif26KnCypK7Mhz8=;
        b=efm/m/Si6GJZOq242MmjdPWTEVVSIt+9UzMN1HdQutuHlrfdrOvnGsIUySjFrxtIT+
         5gJeN2Tk1gNKGwLXnkYOF8X1H0/XcKipDV1wxHQYzn6s+UpTkeZY9zSgeTun4UhC4vhS
         YOk25MWrsW2cJQ87LzKIR+4YhkAUELzR8GtSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889496; x=1729494296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ynM5W4VrPGHZiCTug5hrtZgV83Yif26KnCypK7Mhz8=;
        b=DYFk+v3b5yHMD6sKPDcpILyAxAC9y7ATsQtS0lO2S776kRRg70C8QHiwyp40Btx8AX
         4jsGPKDzcxvrIyk2DAFvpOTKEIHfmBOjBHArY+wrnpyQAjx9Le7+VHCZhbuK3ha6yZIB
         Tskf4PwLTXDHYM0GSPuv2l40hcbQZPi9Yeikyy9FRRVvgPYMqlH9J3WbWMUkwgaAWR1E
         XOBKHbvuM540ywVOVWy7v7//fHX+9uje/Y7bAELNctnOnvzY/xw4wFLTlQgEJ8nr3kID
         BRSSMfjfVz92ZE/vnKR+koAbncaOEneE7GIL1O0ClscexAp7iUJgPk2oVWUosasTciD0
         5j9w==
X-Forwarded-Encrypted: i=1; AJvYcCVYIkXaFYjqMec17EBPLLg3FxL7nFhxmeimsedOpwi7V1diOB0pMEa9oGxUSm0YPNkjUjFa0jKEtkPvsR8qsSw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtCHIt0VPNZ+h3po/g9XXLcbPYHPlTlPYaqmXsFGxfMbN+gIhm
	g7og3ZHzNqxN2fguIZQJxUHabdso0TACTiO+98eJrrA0qT4RXU+RTz6tzYsrAwcGtq6Z8ppPvNA
	BrA9XZwMuHR1VZ3mkAoN2IBjcYZOkj6pWsZwK
X-Google-Smtp-Source: AGHT+IFT7HlAXavEjKzdhXvzBtEDuZfwe6IvILZ8dpouGERPtoOe8fs5ejCzMZSurR6nnvkNUPToEI3YRpIVnaoznhU=
X-Received: by 2002:a05:6512:b11:b0:539:8d9b:b624 with SMTP id
 2adb3069b0e04-539e5742bdamr2688773e87.55.1728889495769; Mon, 14 Oct 2024
 00:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
In-Reply-To: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 15:04:44 +0800
Message-ID: <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
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

On Thu, Oct 10, 2024 at 11:29=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
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
> > set to "fail-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/errno.h>
> > +#include <linux/i2c-of-prober.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
>
> > +static int chromeos_i2c_component_prober(struct device *dev, const voi=
d *_data)
> > +{
> > +     const struct chromeos_i2c_probe_data *data =3D _data;
> > +     struct i2c_of_probe_simple_ctx ctx =3D {
> > +             .opts =3D data->opts
>
> Leave trailing comma in such cases (when it's not a terminator and
> not on the same line with the variable definition).

Ack.

> > +     };
> > +
> > +     return i2c_of_probe_component(dev, data->cfg, &ctx);
> > +}
> > +
> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_to=
uchscreen =3D {
> > +     .cfg =3D &(const struct i2c_of_probe_cfg) {
>
> Perhaps you can introduce something like
>
> #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)          \
>         (struct ...) {                                  \
>                 .ops =3D _ops_,                           \
>                 .type =3D #_type_,                        \
>         }
>
> and use it here as
>
>         .cfg =3D DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),

Overall reply about the compound literals is in my other email.

> > +             .type =3D "touchscreen"
>
> Ditto.

Ack.

>
> > +     }
>
> Ditto.
>
> > +};
> > +
> > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpa=
d_cfg =3D {
> > +     .ops =3D &i2c_of_probe_simple_ops,
> > +     .type =3D "trackpad"
>
> Leave a comma.

Ack.

> > +};
>
> ...
>
> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_tr=
ackpad =3D {
> > +     .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
>
>         .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_op=
s),
>
> Or even
>
> #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                  \
>         DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
>
> > +     .opts =3D &(const struct i2c_of_probe_simple_opts) {
>
> Perhaps also DEFINE_xxx for this compound literal?

I think it's better to leave this one as is. Not every entry will
use the same combination of parameters. And having the entry spelled
out like this makes it easier to read which value is for what
parameter, instead of having to go up to the macro definition.

For comparison, this entry uses just two of the parameters, while for
another platform I'm working on the full set of parameters is needed.

> > +             .res_node_compatible =3D "elan,ekth3000",
> > +             .supply_name =3D "vcc",
> > +             /*
> > +              * ELAN trackpad needs 2 ms for H/W init and 100 ms for F=
/W init.
> > +              * Synaptics trackpad needs 100 ms.
> > +              * However, the regulator is set to "always-on", presumab=
ly to
> > +              * avoid this delay. The ELAN driver is also missing dela=
ys.
> > +              */
> > +             .post_power_on_delay_ms =3D 0,
> > +     }
> > +};
> > +
> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +     { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> > +     { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_hana_trackpad },
>
> These strings are a bit long, perhaps wrap on one member per line?

Sure.


ChenYu


> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
