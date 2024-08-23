Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771024F88C
	for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396737; cv=none; b=rNvKbT+zoNw+74FsuBPKL9tlGycUjvju6aHyvVxdPRVIg1KpRbw9lUmdrOlnmvPIOeNunQ44GTox0ZaDwaZVHbeygRcEB5qyT0wO9vfMVeYT6lKpZRk1no2Ut3CJHDsPz138Q8NVeOdBt5YDjc7YCmR/PUpxQecRcNCodV4m1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396737; c=relaxed/simple;
	bh=0DkaIH/nX+twHmI7wfMWeM8/bOcrhMdeBUghxa7zFeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BP6qQWfEg0khadz+T9F9vBjeXhujX3wEYb1gdJlRk8LSAYvFr7mAt8j4hQpPPEtP4M+Xr2LgUH5XMKibnv9h6V85VhTuOXjHtsS5vYqaOYwRwYDEMATeIochpa3wJWVezR9a7p9VanXQPGX96mjCss7g4Yk7LRmAWYY+gLzOazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xvxa/Oc7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xvxa/Oc7"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f3cd4ebf84so18877601fa.3
        for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724396733; x=1725001533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSqREulePxg8CKTf5awNX/HJBRiZ4QLVJ8cgBAYKHIo=;
        b=Xvxa/Oc7fO3pCM6tmAIt9bjVnhX7brv3VCFaQeT1SvY+fnJAjHtsGjJYFp/NWy5lRF
         gAJESE0pfle3NcCcVPdiA8yToU3P22B+Gf4+HnoCIvihABpMmm0HWa58Tk3KYG5rq0V3
         wJ9DhohOaNXisqtZzx1KwJAsBdfJdOYmIpAfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396733; x=1725001533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSqREulePxg8CKTf5awNX/HJBRiZ4QLVJ8cgBAYKHIo=;
        b=Fq1RevlrseSSNo9Me4cTc4qYDmWcsvsM3wrCKJo6W2Qd6oGdaA8W8z4io3oUFS+nik
         B8HwW+h6OdOa5+gjDMeCPqyZSKH2TYxiVouBlsiHRoADdUEeEh3wKY4J453xdFOs4w8L
         CkzDKcOyt8r8hD6jjikdULyO4n5kH3SZfBXg4kYO8HbUu+guFj+H1GUrthutSBKllY6S
         1WezvDod8HtjLi1iQrS1ArNuJjZlMr5Snu/16npwz8sFthmFLM4bLAce3u0daOShnpqX
         XlCSutzDyGxAAFqG7yAxDKLvLr+RHdpDqHkkMe3K41Mx52yWPYPHU42cmDOCMq9JYIKj
         TaXw==
X-Forwarded-Encrypted: i=1; AJvYcCUVY7kMhmgTbKDXtZu7LulrTkDghN0n4DSf+4FyxlDws9vltZIUNbGJl+uRXCxPbBpcnYI+6mRAJoMMBIaTcic=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQhP8N3Zh/luvCWfCdYDQdFJbBZY8ZmpyE6Jyt2XGTND3K7YWq
	DYHU2POpKQ3lB2X1FSZ4x3JpYF36JI8mOZv16O2B9Vb7zsoLurrDJFjq9vFtJQ3K75ZQ6GRh8PS
	MtQruGz81EntEJdql4unHFCrCMsUxHgauI6Ze
X-Google-Smtp-Source: AGHT+IGNtTDEfjRQCAU7zqH2LB9KdSvjRzwWhHcPb4xis4wVU2lVsZpgq0JMxBRDIb+KkRoJXAdbfiGPaOxPwtfJ6oc=
X-Received: by 2002:a05:6512:695:b0:530:b871:eb9a with SMTP id
 2adb3069b0e04-534387baca6mr662910e87.47.1724396733400; Fri, 23 Aug 2024
 00:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-5-wenst@chromium.org>
 <ZsdC8wkgsdsMJuAL@smile.fi.intel.com>
In-Reply-To: <ZsdC8wkgsdsMJuAL@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 15:05:22 +0800
Message-ID: <CAGXv+5H3RvWFTg6dnMR6QBG-gLnv29fEC_5icdHE7Tjfy7fvxA@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
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

On Thu, Aug 22, 2024 at 9:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:57PM +0800, Chen-Yu Tsai wrote:
> > The to-be-introduced I2C component prober needs to enable regulator
> > supplies (and toggle GPIO pins) for the various components it intends
> > to probe. To support this, a new "pure DT lookup" method for getting
> > regulator supplies is needed, since the device normally requesting
> > the supply won't get created until after the component is probed to
> > be available.
> >
> > Convert the existing of_regulator_bulk_get_all() for this purpose.
> > This function has no in-tree users, as the original patch [1] that
> > used it was never landed. This patch changes the function ABI, but
> > it is straightforward to convert users.
> >
> > The underlying code that supports the existing regulator_get*()
> > functions has been reworked in previous patches to support this
> > specific case. An internal OF-specific version of regulator_get(),
> > of_regulator_get_optional(), is added for this.
>
> > [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/
>
> Make it Link tag
>
> Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/ [1]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> ...
>
> >       /* first do a dt based lookup */
> >       if (dev && dev->of_node) {
>
>         if (dev_of_node())
>

Not part of the original change, but I don't see why not.

> > -             r =3D of_regulator_dev_lookup(dev, supply);
> > +             r =3D of_regulator_dev_lookup(dev, dev->of_node, supply);
>
>         dev_of_node()

Ack.

> >               if (!IS_ERR(r))
> >                       return r;
> >               if (PTR_ERR(r) =3D=3D -EPROBE_DEFER)
>
> ...
>
> >  /**
> >   * of_get_regulator - get a regulator device node based on supply name
> > - * @dev: Device pointer for the consumer (of regulator) device
> > + * @dev: Device pointer for dev_printk messages
>
> dev_printk()

Ack.

> > + * @node: Device node pointer for supply property lookup
> >   * @supply: regulator supply name
> >   *
> >   * Extract the regulator device node corresponding to the supply name.
> >   * returns the device node corresponding to the regulator if found, el=
se
> >   * returns NULL.
> >   */
>
> ...
>
> >  /** of_regulator_dev_lookup - lookup a regulator device with device tr=
ee only
> > - * @dev: Device pointer for regulator supply lookup.
> > + * @dev: Device pointer for dev_printk messages.
>
> Ditto.

Ack.

> > + * @node: Device node pointer for regulator supply lookup.
> >   * @supply: Supply name or regulator ID.
> >   *
> >   * If successful, returns a struct regulator_dev that corresponds to t=
he name
> > @@ -636,13 +639,13 @@ static struct regulator_dev *of_find_regulator_by=
_node(struct device_node *np)
> >   * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could =
succeed
> >   * in the future.
> >   */
>
> ...
>
> > +/**
> > + * of_regulator_get_optional - get optional regulator via device tree =
lookup
> > + * @dev: device used for dev_printk messages
>
> Ditto.

Ack.

> > + * @node: device node for regulator "consumer"
> > + * @id: Supply name
> > + *
> > + * Returns a struct regulator corresponding to the regulator producer,
> > + * or IS_ERR() condition containing errno.
> > + *
> > + * This is intended for use by consumers that want to get a regulator
> > + * supply directly from a device node, and can and want to deal with
> > + * absence of such supplies. This will _not_ consider supply aliases.
> > + * See regulator_dev_lookup().
>
> Fix kernel-doc warning.

Ack.


Thanks
ChenYu

> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
