Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1731C6F6D
	for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064961; cv=none; b=rt4pScwWqt7uaVG6kOZLTl/f6YHhQbVeIvrWinhxjDkOFT4YAUrJ9pQQwh+vIfM57Jq5RGGQpN9o+NVuS4HwSB02U+w63Aa00vWTRnHpyFT0RiwGPAMjYpfGpird2r5/pwHE183BmUjOcP+hpi8x8G0cWB6RWvv2Z9/v4aGPTto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064961; c=relaxed/simple;
	bh=PyStb3/Pmwe3ISP9nOh9GcWb5KrhI9ZlHni3WfxuEa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ND48bYHt5criKemMnvJXB+FsL/NICMUKMzl2Dv+435xDGkiCi/nY8DiHgMmNaQFjEulcR+bOgHxSgJGDqNWvqUVcSvvkZa73w4jw0x517WWgAkanbJ61F2z81urj8rRy2HDLNIMIPnopS7ZKcYu0nwFtpV8E9gC/i2qk8BVOMuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RsyP9q+S; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RsyP9q+S"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3541587e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729064957; x=1729669757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=;
        b=RsyP9q+SefNHT71V72dhP/MqVgQ8dJaP4/xtk0sguQRFKqsv146UDa79rSTXkGqvq5
         2FGJRhN02tdJNsp4aio/gRyPqzL7W6uabIiUZ0gP08Yu8niVq+MMdNnYxXDOFN06qwBX
         Ay2JmFF6am2UKeCbClzRHStx1FcbSMOXxLuiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064957; x=1729669757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=;
        b=Mcck15Jln5YGoQnoY/o71r+u+yqE5LsFzbmSp8I7dzch52b7GecR+4HFMHNvSceYiR
         O4M8cyv9C9wtvJGD78AZ9Kn0sJaLL7AcZtr+MbYviGM0vXHPRe3AeHiriO1OakcIE5ZQ
         Pls9VvFeRTAFkJhATgRg6AmTsz0wzMce5XrnEe6QklPR04oCnN5a4PoJZ499TrLV74J0
         +89pYaSlMe2vCQYmylxbOKHa4ORIR1Cah4foYUXsJn3OUkegzl5A9wGgRoFZyIV809Ao
         jTpy6yHDKspj2P1v4gQKeRF8HtB+uWsqh79+Wk+LbuasFUqFFAEurUbCPF60zqRUIYoS
         Wtqg==
X-Forwarded-Encrypted: i=1; AJvYcCW5RAo9SKbp8L0rdFex1Dpw+OmAb5CXHXWWg+5TN5c7TuiwEcvDUWvl2s6c2ZNBgyKfNqI3j8bkETIqg3cv7Kc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHuZKasU1099Ef7AS2alcgUokKe1+9yG2mJlA5p3GSyL/UE+Eo
	LCtfWg8MjrdBlN2D21UQP2zM2NyZenBDrp8etjY9Ave5yPGGt+lC9TFx1LVy/rPtZyf80ilvd6o
	dWaPSjDEdXDyciUoqbAgO/gWNJpPyVItRTb/z
X-Google-Smtp-Source: AGHT+IHvTkwvjhIgGqx3Y94zbgKp7DdoAxdd+wPihZcQpAEuvOqZHroRtSnL6ezi7qQpWv1axzh0aG7P3lW1zmgXUYU=
X-Received: by 2002:a05:6512:b08:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53a03ea078amr2069607e87.0.1729064956730; Wed, 16 Oct 2024
 00:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
In-Reply-To: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:49:05 +0800
Message-ID: <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 2:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +       if (!ctx->gpiod)
> > +               return;
> > +
> > +       /* Ignore error if GPIO is not in output direction */
> > +       gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
>
> I'm not sure I understand the comment. Does disable() ever get called
> when set() wasn't called beforehand? How could it not be in output
> direction?

You're right. I think it was carried over (in my mind) from when it was
still four callbacks.

> >  void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
> >  {
> >         struct i2c_of_probe_simple_ctx *ctx =3D data;
> >
> > +       /* GPIO operations here are no-ops if a component was found and=
 enabled. */
>
> Instead of the above, maybe:
>
> GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early()
> was called.

Makes sense. Will change.

> Just commenting nits, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume this stands even after Andy's suggestion to drop the gpiod check
is applied.

Thanks
ChenYu
