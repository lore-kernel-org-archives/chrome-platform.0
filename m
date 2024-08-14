Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729791AED3F
	for <chrome-platform@lists.linux.dev>; Wed, 14 Aug 2024 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635257; cv=none; b=o6GDe/+/qrPaUBEMFx5uEFNKFafMy3VmtMkbd/yyU/qyfieos0pQMrulGeOXxcK6/zXO9kDpKEOSbfk8O+oOpft0kcqozC56vemjDJco6JtOZS+HYpViasoKKPck5E//6oCmsUI8W+J6ubCDZIbKPPIcUo5U90zl5RQKmAxS0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635257; c=relaxed/simple;
	bh=Y3MuklvYog8VyQ73068pKvGiO5QLGwX/jhdLUC4qOeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNL2y91RcJDUdSmJOELzGaXutvU6MFp02DfAL/5l7TMFMgwHnl9sdV4e+36qO4KP6w414yj/XKK/Zun3mFjPAQO7BTQiGN3f9OwOMjaAixYxSzh8WZeTvvuX4WiJb1ElD404pirbJun7EM4daWwqnGjEnRxx441SdVRAK7LfQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iHMyBFMd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iHMyBFMd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5314c6dbaa5so6277060e87.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Aug 2024 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635253; x=1724240053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DTUWciiXGejaw0SJ9gyrR/Zy7kjgf0cevdFLxvX7Go=;
        b=iHMyBFMdOfBF6mNX3+I5+b7s/zUOFMmLmXh8OV8qrlgLbdAf/9f6O0j304b3Ca5jKj
         KuECNaHNfk/DTDLC58ph4ANlHyQAo8HB2gI7dKzavLrvZVwW9LI6B656TQxloOrdUpOm
         tWqjlASySEKHXpuIv0zvhio1gn/oUUtlD7gwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635253; x=1724240053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DTUWciiXGejaw0SJ9gyrR/Zy7kjgf0cevdFLxvX7Go=;
        b=LjGuBaGEClnLz10Hf0F9AUK7+/qGiA6bqGDroj5pwC3KT1DejNNquMHhlBaDicZRLZ
         GL0DtDF4jpMZtk8z95zwuhu0YHpjKGI1XRlvWw9qLgXSnsJ287EwCTNaz9cR6D9XunjY
         SlAmPNqwg4XGs6OnqADWxAgckovrvVWm6ifmtNU4KE97awtyuD8kAh0LUAsU3oHHZu4A
         4CsWH3+PrMLIwhthsvLtAt4ft7ksrnjNLSOdIxZ3A5ipnVCDPtjTvqfFRDGuYWGVxD6S
         SmOi8StLIuEbQ7bWtA/sTv2IewKSoQnrKI8pf2/Npk4lDe7JUXLSJMN2fR2j2LbF+fpi
         NVcw==
X-Forwarded-Encrypted: i=1; AJvYcCWhcR+hv/3Y8KH48XIAWGUYuJaO7n2X4tyDyJuVehSX6ak8wT0YlAzYifm4h3khd+OjlYE7CoXc++cGBKSooG4T/jaFRWl++ErDfId+qFTV
X-Gm-Message-State: AOJu0YyJkBvKwbbWiM4Q3lRJg6uabCS3PRIIXVKBJRt3fxh7D2OYH/wz
	WpVHSO7xeYNqIHyw2NlFL3v6TZwHm4WIS78s0pacniV5gWKpgvbXmHCXI4aXXHc8b0CzDsuJLH9
	EEaxyxV+dtRMVn+yg69eftPQtzTZz4zVCgfKg
X-Google-Smtp-Source: AGHT+IGHtXOtyqmjiFmwFzO2IEhU3/HxlXhAqlpIluKBQ4NDerwSVovxb3/0a9iK1QAVUU2JdcZsQmbSEH2aKWMVJ7E=
X-Received: by 2002:a05:6512:1396:b0:52c:e03d:dfd7 with SMTP id
 2adb3069b0e04-532edbe9ab4mr1855931e87.39.1723635253262; Wed, 14 Aug 2024
 04:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-5-wenst@chromium.org>
 <ZrtGXfKE6BwupPPA@smile.fi.intel.com>
In-Reply-To: <ZrtGXfKE6BwupPPA@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Aug 2024 19:34:00 +0800
Message-ID: <CAGXv+5E+D8oXr7nh67HEPermJYoRp+Xf+oqSefOiUoCpyoKYUQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] i2c: of-prober: Add GPIO and regulator support
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

On Tue, Aug 13, 2024 at 7:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2024 at 05:59:27PM +0800, Chen-Yu Tsai wrote:
> > This adds GPIO and regulator management to the I2C OF component prober.
>
> Can this be two patches?

You mean one for GPIOs and one for regulators right? Sure.

> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> >
> > Without specific knowledge of each component's resource names or
> > power sequencing requirements, the prober can only enable the
> > regulator supplies all at once, and toggle the GPIOs all at once.
> > Luckily, reset pins tend to be active low, while enable pins tend to
> > be active high, so setting the raw status of all GPIO pins to high
> > should work. The wait time before and after resources are enabled
> > are collected from existing drivers and device trees.
> >
> > The prober collects resources from all possible components and enables
> > them together, instead of enabling resources and probing each component
> > one by one. The latter approach does not provide any boot time benefits
> > over simply enabling each component and letting each driver probe
> > sequentially.
> >
> > The prober will also deduplicate the resources, since on a component
> > swap out or co-layout design, the resources are always the same.
> > While duplicate regulator supplies won't cause much issue, shared
> > GPIOs don't work reliably, especially with other drivers. For the
> > same reason, the prober will release the GPIOs before the successfully
> > probed component is actually enabled.
>
> ...
>
> > +/*
> > + * While 8 seems like a small number, especially when probing many com=
ponent
> > + * options, in practice all the options will have the same resources. =
The
> > + * code getting the resources below does deduplication to avoid confli=
cts.
> > + */
> > +#define RESOURCE_MAX 8
>
> Badly (broadly) named constant. Is it not the same that defines arguments=
 in
> the OF phandle lookup? Can you use that instead?

I'm not sure what you are referring to. This is how many unique instances
of a given resource (GPIOs or regulators) the prober will track.

MAX_TRACKED_RESOURCES maybe?

> ...
>
> > +#define REGULATOR_SUFFIX "-supply"
>
> Name is bad, also move '-' to the code, it's not part of the suffix, it's=
 a
> separator AFAICT.

OF_REGULATOR_SUPPLY_SUFFIX then?

Also, "supply" is not a valid property. It is always "X-supply".
Having the '-' directly in the string makes things simpler, albeit
making the name slightly off.

> ...
>
> > +     p =3D strstr(prop->name, REGULATOR_SUFFIX);
>
> strstr()?! Are you sure it will have no side effects on some interesting =
names?
>
> > +     if (!p)
> > +             return 0;
>
> > +     if (strcmp(p, REGULATOR_SUFFIX))
> > +             return 0;
>
> Ah, you do it this way...
>
> What about

About? (feels like an unfinished comment)

Looking around, it seems I could just rename and export "is_supply_name()"
from drivers/regulator/of_regulator.c .

> > +
> > +     strscpy(con, prop->name, p - prop->name + 1);
> > +     regulator =3D regulator_of_get_optional(node, con);
> > +     /* DT lookup should never return -ENODEV */
> > +     if (IS_ERR(regulator))
> > +             return PTR_ERR(regulator);
>
> ...
>
> > +     for (int i =3D 0; i < data->regulators_num; i++)
>
> Why signed?

No real reason, other than being the same as the for loops in the
free functions.

> > +             if (regulator_is_equal(regulator, data->regulators[i])) {
> > +                     regulator_put(regulator);
> > +                     regulator =3D NULL;
> > +                     break;
> > +             }
>
> ...
>
> > +#define GPIO_SUFFIX "-gpio"
>
> Bad define name, and why not "gpios"?

"-gpio" in strstr() would match against both "foo-gpio" and "foo-gpios".
More like laziness.

> ...
>
> > +     p =3D strstr(prop->name, GPIO_SUFFIX);
> > +     if (p) {
> > +             strscpy(con, prop->name, p - prop->name + 1);
> > +             con_id =3D con;
> > +     } else if (strcmp(prop->name, "gpio") && strcmp(prop->name, "gpio=
s")) {
> > +             return 0;
>
> We have an array of these suffixes, please use it. If required make it ex=
ported
> to the others.

OK. I'll rewrite this section with that then.

> > +     }
>
> ...
>
> > +     ret =3D of_parse_phandle_with_args_map(node, prop->name, "gpio", =
0, &phargs);
> > +     if (ret)
> > +             return ret;
>
> > +     gpiod =3D fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "=
i2c-of-prober");
> > +     if (IS_ERR(gpiod)) {
> > +             of_node_put(phargs.np);
> > +             return PTR_ERR(gpiod);
> > +     }
>
> Try not to mix fwnode and OF specifics. You may rely on fwnode for GPIO c=
ompletely.

Well, fwnode doesn't give a way to identify GPIOs without requesting them.

Instead I think I could first request GPIOs exclusively, and if that fails
try non-exclusive and see if that GPIO descriptor matches any known one.
If not then something in the DT is broken and it should error out. Then
the phandle parsing code could be dropped.

> > +     if (data->gpiods_num =3D=3D ARRAY_SIZE(data->gpiods)) {
> > +             of_node_put(phargs.np);
> > +             gpiod_put(gpiod);
> > +             return -ENOMEM;
> > +     }
>
> ...
>
> > +     for (int i =3D data->gpiods_num - 1; i >=3D 0; i--)
> > +             gpiod_put(data->gpiods[i]);
>
> This sounds like reinvention of gpiod_*_array() call.

Indeed. Will switch to gpiod_put_array() with some slight tweaks.

> ...
>
> > +     for (int i =3D data->regulators_num; i >=3D 0; i--)
> > +             regulator_put(data->regulators[i]);
>
> Bulk regulators?

Bulk regulators API uses its own data structure which is not just an
array. So unlike gpiod_*_array() it can't be used in this case.

> ...
>
> > +     for_each_child_of_node_scoped(i2c_node, node) {
>
> Eventually _scoped(), but...
>
> > +             u32 addr;
> > +
> > +             if (!of_node_name_prefix(node, type))
> > +                     continue;
> > +             if (of_property_read_u32(node, "reg", &addr))
> > +                     continue;
> > +
> > +             dev_dbg(dev, "Requesting resources for %pOF\n", node);
> > +             ret =3D i2c_of_probe_get_res(dev, node, &data);
> > +             if (ret) {
>
> > +                     of_node_put(i2c_node);
>
> ...huh?!

Oops. This and the next "of_node_put(i2c_node)" should be
"i2c_put_adapter(i2c)" instead.


Thank you for the review. More stuff to try.


Regards
ChenYu

> > +                     return ret;
> > +             }
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
