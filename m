Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93821C7287
	for <chrome-platform@lists.linux.dev>; Fri,  1 Nov 2024 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485153; cv=none; b=G2f1VWB9Nj/1+j4BW80ULHSOulWy0hYl3FilRbz9CExjpmv7TdIdDiMQWPiCe2CJ5VslhtF7HBOe2v2JGLmcos6IsKh+f7xFNdJyzO0AWu3Bk9gX8s1ysqf6RlRhZVrZkVakRR3T1knpwdhuGVMMBUKr4P1QIt8xnfQZgzh3Y14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485153; c=relaxed/simple;
	bh=jOGNatYKO7LyfoMaEY3D4pl3e46xv0D7qv7HJZZbDO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNdp4EM6EPsKtEC+knE3nUGr/kMhcAoKdAoIW8emEpnQVidJm4RNb/40KWJnwSJ+Z2bWK4Rm5CH7VJ7XIvJjT4s1g2pi1tzEDTl8cVuxpven24ymG9Jdd+mn95wpu0UteGAd+BSEYzS+xCQqu9XGaROJ9c/BRxPj1ecxf5zOUTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xYS/WFnw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xYS/WFnw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso308640366b.2
        for <chrome-platform@lists.linux.dev>; Fri, 01 Nov 2024 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730485148; x=1731089948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCb0avfMfhqFRdPMe3Ycp6E7ngzUGoHw4RlfxTUvmP4=;
        b=xYS/WFnwAlSPTgHQ/r5UXqpXUsnNURYxfh8EwRBBCEHtzljzRZb03wScL3iU0v3AEI
         x3QwkPl0fPzEgu/df8TssusXH5g+bTZxgsjLBSpQq5/VPAonXz69V9rr2JS17xTDrrpt
         LCL0gVjnPSzWM8u9EE4gYEIam5GvmICW41Xnw+COlXoCzZENMwhtCgdBnEynBTm87+AD
         Pdx6JeCgaAU3kEP/E4ckc7nzCfowplZcX9M3ipY3nfhapkSy48be4oHry2+/1IMH1N1V
         wwu21Ak+b5NesfT6eN9XVhN5yv4VzuEETu6Tj7QZvxSzcOiiMzpLrKV/r3E9AS3VLOMY
         YWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730485148; x=1731089948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCb0avfMfhqFRdPMe3Ycp6E7ngzUGoHw4RlfxTUvmP4=;
        b=vx99tBWx0sCJc0b0Bowg74RtUjDDyg7Ib8umBu342f8uARN9mhCTrLHzAPm4dpjY3+
         gTb/YGD+tCVy5LwkfRv9BUgkfOOGGCGXxYMbKtbkLI/0MIPvPDfbowrqr2bqpIpnDlmh
         oB77Gb3ivdsHhYA0JQvFcTElFxLKRfdiv7FWoEfXkriFwP+4EoUmgzLVTnTyxfjgh/k2
         WiSTRUrsn4Pi7GwalNyPUUNlnOofZvwoM/4jzWSreRWNcI8HrHMJ8gPjKudmx//c2e90
         gmw3pmSxaujRK3HP0uRnJj6nMWe/B/BYTKkKRoJBRkoiNR/8aTOZtheNuNPpE0JGtye0
         EKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqWRmu8aIix3LBJPTdqLJVlAk4n0U09GBD+K58+C+UiHAjJ75eHl/TSMpVLOPg3hS6nVGK7JI5/CNJxLLD9h0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2p0PSbbVhiQDanr7lTBnzp6u1xtkUSnBvC0qP/I1ZatY5gSLw
	F/+NAEaQbLE2x8lcdIT6/F1/ZMPzWpeFrH4tdrZmWwGPa6LwO6VunYmL041Xz7bmPa68QHOyeDW
	dHUxkpSqOFNF7inXqrlhO+LuXqSIrulVBfy1HdA==
X-Google-Smtp-Source: AGHT+IFcq0AMZn+pZ24DpM6HGZ4OavdIPRNi8d8rMXlbIsaq2gBK6JoQrQewB37SFhHsyDDEtF8jHre0Mg6mo5VxsRA=
X-Received: by 2002:a17:907:3da9:b0:a99:e98f:e73d with SMTP id
 a640c23a62f3a-a9e5097d255mr759902366b.37.1730485148179; Fri, 01 Nov 2024
 11:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
 <ef4fe230-b7fb-4f7e-9173-ae85d305e9ae@baylibre.com> <20241101154451.227defba@jic23-huawei>
In-Reply-To: <20241101154451.227defba@jic23-huawei>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 1 Nov 2024 19:18:48 +0100
Message-ID: <CAEHHSvZxgREMpA-kC7zarRZAp=bU6dcc2-3qjZU8o01BP3bSzA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] iio: light: adux1020: write_event_config: use
 local variable for interrupt value
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Ramona Gradinariu <ramona.gradinariu@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Dan Robertson <dan@dlrobertson.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, 
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>, 
	Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 1 nov. 2024 =C3=A0 16:45, Jonathan Cameron <jic23@kernel.org> a =C3=
=A9crit :
>
> On Thu, 31 Oct 2024 11:27:45 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On 10/31/24 10:27 AM, Julien Stephan wrote:
> > > state parameter is currently an int, but it is actually a boolean.
> > > iio_ev_state_store is actually using kstrtobool to check user input,
> > > then gives the converted boolean value to write_event_config.  The co=
de
> > > in adux1020_write_event_config re-uses state parameter to store an
> > > integer value. To prepare for updating the write_event_config signatu=
re
> > > to use a boolean for state, introduce a new local int variable.
> > >
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >  drivers/iio/light/adux1020.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux102=
0.c
> > > index 2e0170be077aef9aa194fab51afbb33aec02e513..db57d84da616b91add8c5=
d1aba08a73ce18c367e 100644
> > > --- a/drivers/iio/light/adux1020.c
> > > +++ b/drivers/iio/light/adux1020.c
> > > @@ -505,7 +505,7 @@ static int adux1020_write_event_config(struct iio=
_dev *indio_dev,
> > >                                    enum iio_event_direction dir, int =
state)
> > >  {
> > >     struct adux1020_data *data =3D iio_priv(indio_dev);
> > > -   int ret, mask;
> > > +   int ret, mask, val;
> > >
> > >     mutex_lock(&data->lock);
> > >
> > > @@ -526,12 +526,12 @@ static int adux1020_write_event_config(struct i=
io_dev *indio_dev,
> > >                     mask =3D ADUX1020_PROX_OFF1_INT;
> > >
> > >             if (state)
> > > -                   state =3D 0;
> > > +                   val =3D 0;
> > >             else
> > > -                   state =3D mask;
> > > +                   val =3D mask;
> > >
> > >             ret =3D regmap_update_bits(data->regmap, ADUX1020_REG_INT=
_MASK,
> > > -                                    mask, state);
> > > +                                    mask, val);
> > >             if (ret < 0)
> > >                     goto fail;
> > >
> > >
> >
> > Instead of introducing `val`, I would rewrite this as:
> >
> >       if (state)
> >               ret =3D regmap_clear_bits(...);
> >       else
> >               ret =3D regmap_set_bits(...);
> >
> Good idea.  Rather than go around again and potentially stall the end of =
this series.
> I made that change whilst applying.  Shout if either of you doesn't
> like the result. Diff doesn't do a perfect job on readability (it does
> if I add a line break but then the code looks worse in the end!)
>

Hello Jonathan,

Looks fine to me. Thank you for doing the change yourself.

Cheers
Julien
> From 06a1ca816450d1b5524f6010581a83ab9935d51b Mon Sep 17 00:00:00 2001
> From: Julien Stephan <jstephan@baylibre.com>
> Date: Thu, 31 Oct 2024 16:27:01 +0100
> Subject: [PATCH] iio: light: adux1020: write_event_config: use local vari=
able
>  for interrupt value
>
> state parameter is currently an int, but it is actually a boolean.
> iio_ev_state_store is actually using kstrtobool to check user input,
> then gives the converted boolean value to write_event_config.  The code
> in adux1020_write_event_config re-uses state parameter to store an
> integer value. To prepare for updating the write_event_config signature
> to use a boolean for state, introduce a new local int variable.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> Link: https://patch.msgid.link/20241031-iio-fix-write-event-config-signat=
ure-v2-6-2bcacbb517a2@baylibre.com
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/iio/light/adux1020.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
> index 2e0170be077a..06d5bc1d246c 100644
> --- a/drivers/iio/light/adux1020.c
> +++ b/drivers/iio/light/adux1020.c
> @@ -526,12 +526,11 @@ static int adux1020_write_event_config(struct iio_d=
ev *indio_dev,
>                         mask =3D ADUX1020_PROX_OFF1_INT;
>
>                 if (state)
> -                       state =3D 0;
> +                       ret =3D regmap_clear_bits(data->regmap,
> +                                               ADUX1020_REG_INT_MASK, ma=
sk);
>                 else
> -                       state =3D mask;
> -
> -               ret =3D regmap_update_bits(data->regmap, ADUX1020_REG_INT=
_MASK,
> -                                        mask, state);
> +                       ret =3D regmap_set_bits(data->regmap,
> +                                             ADUX1020_REG_INT_MASK, mask=
);
>                 if (ret < 0)
>                         goto fail;
>
> --
> 2.46.2
>
>
>
> >
> >
>
