Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101626289
	for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 23:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271414; cv=none; b=PqnKJU+4BoJTikPiPjrNBACKckvxgiBX9olysIMO6q4nTxnOZAuXlT4TYt3+BQ3asd5tq1OJVVw28mrP/8rXyQ+kY9WLaAmh8sJ4cSa6xJGYMPcHLnm8JFLOVEgZdNcq7DlYiDCIq+Yd7mhZqruwLUKWpwrpsIP58RX6GFoXLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271414; c=relaxed/simple;
	bh=iShfGa2K9v84syG+aLK78YPAr6h3bqgDt5AT1QZtHo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVF0f+COK+apb/JjWouR19S4KrW+bGZTioJiLHQQTWgt4lWM8Ybi/W8RAKluJIo2fYIDDcBQ3DZYNjXx4tQT1MWwqdnL5eMLdPl0fr4OTXK7x7oR0e8bvTThvrA2zGXmuiZ/vj0s+U3v48tUMUW3mbF2ntBg3rHJ1Df6IbyVbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lkc2VigF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lkc2VigF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45830ff5b70so21486051cf.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 16:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271412; x=1726876212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=;
        b=lkc2VigFQp8AUkpWQ8tRY28OWFAj7/4LpdqOIcuMYLrMmQjetBZzKDEWCjm565n+Nz
         0kNPg78+j+vBRSi5bNLGFZpThAiwE2UshDz01pkEX7tY8PltWOuhjDXBheujab8o0pW3
         AjMGZarOu9APV3DQUNsK6HOlzCFdhcybEnmNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271412; x=1726876212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=;
        b=fDq5NXQ17P8bO3LRJbiWEOyVsTreI5gUhVOVCyAOT11RFCbiOgkKlw0sa/GQrzLIG+
         IuLHk312g4nLVd5DMkgkWKSf+M/ppMFa+OuV1A/B82M8fgeE2hzbF/g6UJ09FtIpTlHW
         Paq04tQo7sHY7TnZ9hD7PCNMD3GPeU+7IYgRo7DHYek9S7mmiN04r9iV0n7nxUoAhCT4
         orPfdfvSVo2aBLpfyo7xhQtUxSZ9D/V5CmkLeJ52D7T2o9UT6IOPW861SxmocMWxNlYH
         e/8+e7zxSTEVS4hjSMBzKWZMdezP3TiptYoe9muASG2LGc/a0LF87n5xz9EktlnCMx7Z
         hW1A==
X-Forwarded-Encrypted: i=1; AJvYcCVBSd4wpJc+wpNDtJ6fmshmEIIJFom9zn6f+mCnluQk4c30lCrDGxNjjgS57yaeGU7bqSWj+V4ukmB3SU5oe6E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrfmJ+pwcusWFPa9SnVag+cMblslL6K8wo5hGGN/fexYWon0OX
	D41OZCGFiTHI7b54sK5xKNTvlvEjml03g1zQvc1gW9QthtpLmO0XFnTlTXX14XMNEGzzPYdvZ9g
	=
X-Google-Smtp-Source: AGHT+IG40fcMjYySyad/CbLS52HfPetHdJElvxVmbYPlcNUPM77KzJpSZdKqUSOMexlvmy4ltzqzaQ==
X-Received: by 2002:ac8:5ac2:0:b0:458:36c0:f5b8 with SMTP id d75a77b69052e-45860364758mr115256681cf.36.1726271411603;
        Fri, 13 Sep 2024 16:50:11 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-459aaca4a3dsm1415311cf.52.2024.09.13.16.50.11
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:50:11 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45830ff5b70so21485891cf.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 16:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAQiSLf6l3kGKYn2whfGSuavd/BGH9fGWD+fjvEcWpeDvRHFQ+vQsj9gaDvhaxHxAgiBXR31/rs3zRKdNGe+w=@lists.linux.dev
X-Received: by 2002:a05:6214:448c:b0:6c3:5599:93a0 with SMTP id
 6a1803df08f44-6c57347d602mr144060086d6.0.1726271006617; Fri, 13 Sep 2024
 16:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
Message-ID: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
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

On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_o=
f_probe_simple_ctx *ctx)
> +{
> +       int ret;
> +
> +       if (!ctx->gpiod)
> +               return 0;
> +
> +       dev_dbg(dev, "Setting GPIO\n");
> +
> +       ret =3D gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_hi=
gh_to_enable ? 1 : 0);
> +       if (ret)
> +               return ret;
> +
> +       msleep(ctx->opts->post_reset_deassert_delay_ms);

Like in the previous patch, you need an "if
(ctx->opts->post_reset_deassert_delay_ms)" before the msleep().


> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct =
i2c_of_probe_simple_ctx *ctx)
> +{
> +       if (!ctx->gpiod)
> +               return;
> +
> +       dev_dbg(dev, "Setting GPIO to input\n");
> +
> +       gpiod_direction_input(ctx->gpiod);

This is weird. Why set it to input?


> @@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev, v=
oid *data)
>  {
>         struct i2c_of_probe_simple_ctx *ctx =3D data;
>
> +       i2c_of_probe_simple_disable_gpio(dev, ctx);

Maybe add a comment before the GPIO call that it's a noop if we found
something and i2c_of_probe_simple_free_res_early() was already called?
Otherwise you need to read into the function to understand why this
doesn't crash if the early call was made. To me, that makes the
abstraction add confusion instead of simplifying things.


> @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const =
struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component pr=
ober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve re=
sources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO.

Talk about the fact that gpio_name can be NULL or an empty string and
that they mean different things.


>   * @post_power_on_delay_ms: Delay in ms after regulators are powered on.=
 Passed to msleep().
> + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passe=
d to msleep().
> + * @gpio_high_to_enable: %true if GPIO should be set to electrical high =
to enable component.

Now that you've added the GPIOs and more delays, the description of
this structure needs to list exactly what the power sequence your
simple functions assume.

I would also say: given that you're providing a parameter anyway and
you're giving the GPIO name, can you please move away from the "raw"
values and move to "logical" values?
