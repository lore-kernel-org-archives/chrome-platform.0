Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F780BEC
	for <chrome-platform@lists.linux.dev>; Mon, 26 Aug 2024 06:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724654806; cv=none; b=YBMktKEOatfMXdeH4oCSFhRpEyvIAO7Maso+Em3xPzCvHTTH8BEGLZeRV6G5VITUvNNmPKRZj8ErSBMYKMsYzTQEGsHD1MYiQ+wf3R6z+LIHqLbvtooJciHnLArySsNA+3tC0LD24Ysi4ktJpE4CtTQbPRr0txnwYlAfNV/pO3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724654806; c=relaxed/simple;
	bh=Pb5HMPckE7rab17yr39tAC0kkeNgAa+55ZzvCXR8H9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A44WCL9V/eGSkZPckveEKf4htReb/ZMagdUNl2lTW2kgteExGOJN93fQzGLHhc0BD6rVNpY3houQprsJXr7gBR6aEePZNEj4Xaxa5zVFkJW4r9+b0FfuNRrF05+WU0hyupCqV11amjJph5kwGl4h35jVw8WeRSaQQHVEiXkLi4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YQoMgoUq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YQoMgoUq"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-533488ffaf7so5356841e87.0
        for <chrome-platform@lists.linux.dev>; Sun, 25 Aug 2024 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724654802; x=1725259602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb5HMPckE7rab17yr39tAC0kkeNgAa+55ZzvCXR8H9k=;
        b=YQoMgoUqHgmoaZCGFcqHd6GqjR4KqfAqiP/qI5IUcgVIFKjPkRcFxea2tgTqCupsXb
         o1Ivuh/7s0jZkZnKvTXZ7jaqkf4QHNvo2Ih1B3C9F2ovIi0mmRXuNhYj2+D9SIIkOJrI
         QXw9e5FuAejUl8WkIWB5z3qXKscQfyJ24fvqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724654802; x=1725259602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb5HMPckE7rab17yr39tAC0kkeNgAa+55ZzvCXR8H9k=;
        b=l9LWZpwVjxv2dtWq8jn42qt2stiv2ss21x7N8jf/HZoP0pjI1rHy+1E7jaWd3SFK38
         PuZXGAyJzMcs/OT7aIqnoBx6t56h0fz4moGGYSgSwZ4zvlJcOzxCI31H4Yn2vE8MKm04
         d+oCOxwHfziRM7ZhmcMFSx/PW8P4b+++6+Yu7JOlKu9Vg3Fw8LioB9qV8VjYGlUJ7CSh
         tLf6cT5PqfSF8cVBlc5W2JMHHYohu72+aBRN55p1D69cnJWh3fcPyqALKi4iW6+WimC2
         Vama8iZJPjUvl5BlEReYWalNs/TwBl+Kz2f/t/BboQy0Y5qJmKv9ymcFy3Atxpqs4Fhe
         FQJA==
X-Forwarded-Encrypted: i=1; AJvYcCVy3yWzCMbhniOoxzrxRzL3bpD+aq5LOER5k/6IIZwNEQmwyPk65cHLBQXqmE95p82Xyq99DB1kHr8zA0RlYjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDdNMAOCGkCTZ5tFgaa/TleuDO256UNdG/DhHUKI80P9gKKHbq
	62m3cU9j2gTnXZGsFDfUrEdUIgSpdzoXiELnCZyJQVKLQlEY8v0uNVr1q4GVrSFZz7QB+YMprls
	l452QGtgS5NVvo16uXmJoleNejDctit3PU4KblfmxQrOyTdA=
X-Google-Smtp-Source: AGHT+IH4DcAdsdETmFTlhuJdrATVXH7fDL01UNUX4b9VbFz9hg6UqEkKKO/I+KkXGBZXYBevq6GR/cInwzl+FyACB/c=
X-Received: by 2002:a05:6512:3b98:b0:533:4785:82a7 with SMTP id
 2adb3069b0e04-53438783b14mr7187223e87.28.1724654802231; Sun, 25 Aug 2024
 23:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-3-wenst@chromium.org>
 <ZsdBddTDuvNasHNq@smile.fi.intel.com> <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
 <ZsiR-kizxnvZufgR@smile.fi.intel.com>
In-Reply-To: <ZsiR-kizxnvZufgR@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Aug 2024 14:46:30 +0800
Message-ID: <CAGXv+5G1OsrPSwFs64-MPSQgp28=Jk7zKs1WDDjVNrmPfSd0sw@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
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

On Fri, Aug 23, 2024 at 9:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 23, 2024 at 02:49:59PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 22, 2024 at 9:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +/**
> > > > + * of_get_child_regulator - get a child regulator device node
> > > > + * based on supply name
> > > > + * @parent: Parent device node
> > > > + * @prop_name: Combination regulator supply name and "-supply"
> > > > + *
> > > > + * Traverse all child nodes.
> > > > + * Extract the child regulator device node corresponding to the su=
pply name.
> > > > + * returns the device node corresponding to the regulator if found=
, else
> > > > + * returns NULL.
> > >
> > > At the same time you may fix kernel-doc warnings (no "Return" section=
) in these
> > > three (on your wish you may fix others in a separate change, but it's=
 not
> > > related to this series).
> >
> > As you said some other functions are missing it as well, so I'll do a
> > patch separate from this series to fix them all.
>
> But you need to fix them in this patch series. We do not add patches with=
 known
> issues, which are really easy to fix beforehand.

I'd say that's a preexisting thing, and code movement shouldn't change it.
But, yeah, I can send another patch fixing up all the kerneldoc issues
in both files.

ChenYu

> (And below seems you indirectly agrees on that)
>
> > > > + */
>
> ...
>
> > > > +/** of_regulator_dev_lookup - lookup a regulator device with devic=
e tree only
> > >
> > > Something went wrong with the indentation.
> >
> > Will fix, and also add a "Return" section.
>
> Thank you!
>
> > > > + * @dev: Device pointer for regulator supply lookup.
> > > > + * @supply: Supply name or regulator ID.
> > > > + *
> > > > + * If successful, returns a struct regulator_dev that corresponds =
to the name
> > > > + * @supply and with the embedded struct device refcount incremente=
d by one.
> > > > + * The refcount must be dropped by calling put_device().
> > > > + * On failure one of the following ERR-PTR-encoded values is retur=
ned:
> > > > + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup co=
uld succeed
> > > > + * in the future.
> > > > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
