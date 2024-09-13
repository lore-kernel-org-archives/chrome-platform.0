Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8610C15B108
	for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271367; cv=none; b=NHUOr5AXfpaKJs50/zbWEm0dN2GAxQz13WTZo78g2Qv9I4qE15JMwhQLdObjjOKU/tocKjjdp7rLcPzSiTqlY58stvoPqG6UqreV2qIF5+JPrQyfh1BjODIct9kbF1Gz+/xZ2Lt+A97vUkICoLIA9HLbL5w+fsa3w2m63/JIEA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271367; c=relaxed/simple;
	bh=0ahzFG2oNxj4NQXzKVIJir1WD7KoViMiBM80pX771gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwgKXocj+5ypvyVzXPrfYlsJKMYnk/NWTCWTNTAZBN9yvtYFa0286ZxcqK9zsY5dCF5Ms+6GirLoP5xwHm/Ij2Nd8kpUnTwE8XjJmIEgQCLvwyy7iq1oeGZ66BkhQDl5vlky7qYcc8HcyBl8j1+/mZgolZltdBK/BtKtimdWVjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OhE+JlV/; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OhE+JlV/"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e03d17365bso1540971b6e.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 16:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271364; x=1726876164; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=;
        b=OhE+JlV/QynetkdYCZdy92j0kKHg+a9og2QmGEzKTJUIRHijAZzzmY4Dk/sIpJttPk
         wWJkrZcijpbzxUrSZpTCIpCpfa+zpgis3lgINCEqcc9V6lnaYxwFzCLKEU1aC4OEhF32
         mAx2S/wh8LkerekCRO/RWsHYQOLzwHnyc76e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271364; x=1726876164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=;
        b=O7I5j9evje9T6v/tExrJlH/BXHgk2H+zSC9X4VaFo1At2CpKk8cYwcLwSvpdYzpGGP
         nE2mSkT04W4kmWev+946DiN9Hs6HoviDAB9wcmB8rX7nk3SzmXKTONxtjrrfzodbAGBn
         NsdG0f8Alrg2mn9/XWzhtxNygoNDJiFuccVNO26hydktccnbURxWYAB7QkB90ASCZq25
         zWDy8J6r1s5t6JSri0rgAhMLTcdULs00KDU2mS22ynIz1W40xhzIIFgU6PI+dBRPGUQD
         EFqJYbsf7Grl+EVZ1hD/4jBtZu334NvLJcDKkEhYf+57DADNpiLE88fyYinrrK2v002e
         2iWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEvUGDzSI2OZzRfgkDuN44xTVNF2dyZsPohJkvLJQdMnZeoGeQcsFgIFz7yUT0NVVeDpSXoe02V7wFW6o4PQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvnEnKTP/BBwH9Q9+Vown8gzJt3f1C18vKm+euIK6zt3NsW7Fg
	RZ0HOIHyP5UofYe8R6slKOHXaUMLgW3wZSRDJsGKC8uDJJZpBeogozFfuFdg+OvIR6Zdun9VXSs
	=
X-Google-Smtp-Source: AGHT+IFO2wOGM8bOwfzRnDEx9W2rGLFN6FjSdIRYT34C5Ni9vvYmgj7AgVJsObhXPha5gri+CrGDyg==
X-Received: by 2002:a05:6808:3a0f:b0:3e0:3ffd:e1ad with SMTP id 5614622812f47-3e071aca0afmr6089128b6e.21.1726271363882;
        Fri, 13 Sep 2024 16:49:23 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-27c959431f8sm152010fac.37.2024.09.13.16.49.21
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:49:22 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5dfaccba946so1352758eaf.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 16:49:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/WmAk2p9DoabCxUEOXDqG0mlSY9B+kKlWAE3uCJqWusjj7zgzr4C4gmwQnI8o6tXOIPxNXCOW0AtGD6lc2Z8=@lists.linux.dev
X-Received: by 2002:a05:6214:390a:b0:6bf:7d3c:a64d with SMTP id
 6a1803df08f44-6c573570b31mr113649466d6.32.1726271002581; Fri, 13 Sep 2024
 16:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-8-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VL3nA8hwC8Ejy9T0ZWdYKxMjts8fgF7Y3CO507njOKkg@mail.gmail.com>
Message-ID: <CAD=FV=VL3nA8hwC8Ejy9T0ZWdYKxMjts8fgF7Y3CO507njOKkg@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> +static int i2c_of_probe_simple_enable_regulator(struct device *dev, stru=
ct i2c_of_probe_simple_ctx *ctx)
> +{
> +       int ret;
> +
> +       if (!ctx->supply)
> +               return 0;
> +
> +       dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->sup=
ply_name);
> +
> +       ret =3D regulator_enable(ctx->supply);
> +       if (ret)
> +               return ret;
> +
> +       msleep(ctx->opts->post_power_on_delay_ms);

Presumably you want an "if (ctx->opts->post_power_on_delay_ms)" before
the call to msleep() since it doesn't check that for you.


> +/**
> + * i2c_of_probe_simple_enable - Enable resources for I2C OF prober simpl=
e helpers
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages
> + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> + *
> + * If a regulator supply was found, enable that regulator.
> + *
> + * Return: %0 on success or no-op, or a negative error number on failure=
.
> + */
> +int i2c_of_probe_simple_enable(struct device *dev, void *data)
> +{
> +       struct i2c_of_probe_simple_ctx *ctx =3D data;
> +       int ret;
> +
> +       ret =3D i2c_of_probe_simple_enable_regulator(dev, ctx);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Instead of the above, just:

return i2c_of_probe_simple_enable_regulator(dev, ctx);

I guess maybe you'd have to undo it in the next patch, but it does
make this patch stand by itself better..

Although I'd also say that if it were me I might just get rid of the
helpers and inline the stuff. The helpers don't _really_ add too much.
3 of the 4 callers are just simple wrappers of the helper and I don't
think it would be terrible to inline the last one. I guess with the
next patch when you add GPIOs it maybe makes more sense, but even then
it feels like a stretch to me. Anyway, feel free to ignore if you
want.

> +/**
> + * DOC: I2C OF component prober simple helpers
> + *
> + * Components such as trackpads are commonly connected to a devices base=
board
> + * with a 6-pin ribbon cable. That gives at most one voltage supply and =
one
> + * GPIO besides the I2C bus, interrupt pin, and common ground. Touchscre=
ens,

Maybe speculate here that the GPIO is often an enable or reset line?
Otherwise you leave the reader wondering what this mysterious GPIO is
for.
