Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426401D27B7
	for <chrome-platform@lists.linux.dev>; Wed,  6 Nov 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880766; cv=none; b=MUWsbVmR7CzNl5xlc+IZOo80XQHA7nrBGa8YYL+EDeAQiEfl9E3S8ppxrE/BUaY/zQdxGZIAecR4O1OMQaVoQPFiLfgBV4Gg7JjsIIH6XM0H7fTyx52nAZtiSGe97bZgldcCEcO4upg1xgyrusIMjj63TpWia99u2aX6ygvMjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880766; c=relaxed/simple;
	bh=PwDGAlyKdmmc5GuuZqP8HMvO5lUzY6G+euYKC9FUcqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Up+rr43AwBEtpTLTxwQqyumFawumluR46RsPY5JH9EdyAD0SdtzN3Fm50/7UeVVQUS3w095G9YjdRaDU8Ne0IfyMhKWTpQVOUx/Gave7udKJ/Rl1qklbwerV47ciFRzPwKZ1wvlxKpSyFEsg0crYN12bdhySvbWeaY93g21kFL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fUAkOW9w; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fUAkOW9w"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a0c160b94so7156160e87.2
        for <chrome-platform@lists.linux.dev>; Wed, 06 Nov 2024 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730880762; x=1731485562; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=;
        b=fUAkOW9w5OjcMGWCBRx8Y1nX2gztQ2CVBlV5fFQdM4ERd8XE1pMEW41akopKpKRlHy
         CV6Hnca3iGJT1OqWT0+ld3X/TCVHJg5H2jWLrcPgNO2H4KTJ5/NG/KNgwkuLt7uXNfsv
         zTTEoL1ro8RALIL2EkbBglyeXU+jRzXAoJuGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730880762; x=1731485562;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLqlwBIHxlc/QVraFxaZVp3Z+LmsfbO7nLUsDg2kico=;
        b=BunndZqZNqScGaIF0K5rgeeYDWkE65JjrHehikFiZMRbFiNzF4b0f0rWmMDWBHtiL2
         xnKQJwGZqeR4jT/XlCEXtXCqFUMtoaqTVRVe/90PC1apL8GwiPKR22QRAGPj9lHBVLtw
         mG+f28pqFEjdAooBXFfZNlpnrn2+TGiGfF/NlpfGmCLRspSCXfDF3HC4LBAS6Jzdc+9b
         gQ3Yjpv6IaBGXzlcfI3+CSZ3pRe6OmBLICAsA87B4NWQ5VqQ1JNukppIDrAIszvILJZA
         8YPheZgJTk8+F3BqBL4EzTYL3famxhx1ZKmxwW/4Nid/PrVY1JnG0E2RIKCwV+sup7TD
         uX5w==
X-Forwarded-Encrypted: i=1; AJvYcCU+cn3JGSElOIC3C2qBVr2/mV9JOr7hTdcC46CsyniuWX/aGQW+q0Xlg/DWTVRiNfoei1nTSLxdBBa+lredyOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEi8zuVXRFEGxCmeP5w4Rn2q7O591faY1gUZwcLXYaAQMyv0xJ
	dgvkBe5AqQES/ppNOlsfNyT4lXTPRsx5wnYen0LPRWcbaBPSyT26JzX1itYFgVqSrVGnXRbiMpy
	Xi/2TV1OZJzICmgkvAm4a1gm5kv7vaSw3vmNq
X-Google-Smtp-Source: AGHT+IFnaWLxRM0mMC+tlxLZKaZ3C13GE82EXMBINEFxJtBK8SRUM88wS0f5O5dEyFh3FYLnqrjYeFV5SGWw53gqPvY=
X-Received: by 2002:a05:6512:6cd:b0:536:52ed:a23f with SMTP id
 2adb3069b0e04-53d65d945a9mr9893295e87.0.1730880762336; Wed, 06 Nov 2024
 00:12:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030072229.1013235-1-wenst@chromium.org> <20241030072229.1013235-6-wenst@chromium.org>
 <ZypER5bqLAlH7VxK@skv.local>
In-Reply-To: <ZypER5bqLAlH7VxK@skv.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Nov 2024 16:12:30 +0800
Message-ID: <CAGXv+5E5izmR0Oe8RK8eGRxV4vk+98yKJDMc5imgSznxPZp01Q@mail.gmail.com>
Subject: Re: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple helpers
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:14=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> On 24-10-30 15:22, Chen-Yu Tsai wrote:
> > Add GPIO support to the simple helpers for the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > Regulator supplies were handled in the previous patch.
> >
> > The assumption is that the same class of components to be probed are
> > always connected in the same fashion with the same regulator supply
> > and GPIO. The names may vary due to binding differences, but the
> > physical layout does not change.
> >
> > This supports at most one GPIO pin. The user must specify the GPIO name=
,
> > the polarity, and the amount of time to wait after the GPIO is toggled.
> > Devices with more than one GPIO pin likely require specific power
> > sequencing beyond what generic code can easily support.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
>
> > diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-probe=
r.h
> > index df95aa6ad90e..a232f3cbb252 100644
> > --- a/include/linux/i2c-of-prober.h
> > +++ b/include/linux/i2c-of-prober.h
> > @@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const =
struct i2c_of_probe_cfg *cf
> >   *
> >   * The following helpers are provided:
> >   * * i2c_of_probe_simple_enable()
> > + * * i2c_of_probe_simple_cleanup_early()
> >   * * i2c_of_probe_simple_cleanup()
> >   */
> >
> > @@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, cons=
t struct i2c_of_probe_cfg *cf
> >   * struct i2c_of_probe_simple_opts - Options for simple I2C component =
prober callbacks
> >   * @res_node_compatible: Compatible string of device node to retrieve =
resources from.
> >   * @supply_name: Name of regulator supply.
> > + * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty strin=
g ("") if GPIO
> > + *          line is unnamed.
> >   * @post_power_on_delay_ms: Delay after regulators are powered on. Pas=
sed to msleep().
> > + * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed =
to msleep().
> > + * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set =
to logical high,
> > + *                      to enable the component.
> > + *
> > + * This describes power sequences common for the class of components s=
upported by the
> > + * simple component prober:
> > + * * @gpio_name is configured to the non-active setting according to @=
gpio_assert_to_enable.
> > + * * @supply_name regulator supply is enabled.
> > + * * Wait for @post_power_on_delay_ms to pass.
> > + * * @gpio_name is configured to the active setting according to @gpio=
_assert_to_enable.
> > + * * Wait for @post_gpio_config_delay_ms to pass.
> >   */
> >  struct i2c_of_probe_simple_opts {
> >       const char *res_node_compatible;
> >       const char *supply_name;
> > +     const char *gpio_name;
> >       unsigned int post_power_on_delay_ms;
> > +     unsigned int post_gpio_config_delay_ms;
> > +     bool gpio_assert_to_enable;
>
> This header is missing '#include <linux/types.h>' for bool
> type. Otherwise compilation may fail with following error:
>
> ```
> ./include/linux/i2c-of-prober.h:117:9: error: unknown type name =E2=80=98=
bool=E2=80=99
>   117 |         bool gpio_assert_to_enable;
>       |         ^~~~
> ./include/linux/i2c-of-prober.h:12:1: note: =E2=80=98bool=E2=80=99 is def=
ined in header =E2=80=98<stdbool.h>=E2=80=99; this is probably fixable by a=
dding =E2=80=98#include <stdbool.h>=E2=80=99
>    11 | #include <linux/kconfig.h>
>   +++ |+#include <stdbool.h>
>    12 |
> ```

Thanks for catching this.

I'll send an update.

> >  };
> >
> > +struct gpio_desc;
> >  struct regulator;
> >
> >  struct i2c_of_probe_simple_ctx {
> > @@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
> >       const struct i2c_of_probe_simple_opts *opts;
> >       /* private: internal fields for helpers. */
> >       struct regulator *supply;
> > +     struct gpio_desc *gpiod;
> >  };
> >
> >  int i2c_of_probe_simple_enable(struct device *dev, struct device_node =
*bus_node, void *data);
> > +void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data)=
;
> >  void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
> >
> >  extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
> > --
> > 2.47.0.163.g1226f6d8fa-goog
> >
>
> --
> Best regards,
> Andrey Skvortsov
