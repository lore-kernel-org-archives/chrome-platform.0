Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F0E8BEF
	for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724395814; cv=none; b=mGKvJVkP4KYkfso02c3fOZJYV5BqR+hi2xRrpLSCMTIJgVlN6RQ6eBN7BcBPj/EHhHrAvKzBU776PZzcLm2XYn8opVVLJeoQUsP53YnGnv6EhPTh6J49DnIM1/+3qAx1XRnHyyvcSmeqC67cYOPuph10BhN1zrRMknLBZR8zSlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724395814; c=relaxed/simple;
	bh=TB2ZVz2m724zZx6Ujp8dGDELTqfijkJibPZvF/Zp9rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UK11+lSD/f8y5k43gE6Y7ZPyNkWEBPzsOqlzunDAmt+6d2Lvn6/gMXNT/lAcDgXBiOfPZyrK309AngkU+zvIv24None+Y4AJYT5gmZNhzcWGvFd/boAh6a7Q75mnHW75LKetvBSgp69HTkeXbGMZGpOXOVNL0ACPbUtIhdyhVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nux5hs60; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nux5hs60"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52fcc56c882so1915403e87.0
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724395811; x=1725000611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB2ZVz2m724zZx6Ujp8dGDELTqfijkJibPZvF/Zp9rA=;
        b=Nux5hs60x4Mq1Y568iVo7j70d09F2yV4Q9JvI6BscqoilaY4qsCK2IB2OvkOgiF6oj
         hNLE+pHko3aNeC8qeW59yP3WeeG3Y4xuCivbBrcRXeKgqx2DoN78o7UrNzzYbhdvmHHH
         LufVn4hb1MVAkPt5yh0jU5q8t6T6/8tsqTMv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395811; x=1725000611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB2ZVz2m724zZx6Ujp8dGDELTqfijkJibPZvF/Zp9rA=;
        b=JuJK/y06uSBWvcYqmPSM4uCVi3DFTUPmbdxAsIOQ2dvdLpdwSh5hq73WP4oteE04oV
         tNnA1XfJqYwP6k+2GxxuDOvjNttnPPA1TQq4kIRDC8CrUDK7ZRJwAl+hNDllCqv6f0H8
         moAg1ApT4TSOlmC0xv0flNN493SK+QRfmHA9fJmvt4dyqLd+cbKxCqAYpsKLXogTLe2B
         0xDeoZdlET0iWiZ2bC0xhrV9y5ge0ALH6OvRe3e8Tts7LdoEAFnCXRIyugYnhSV1PQES
         XWs/dLDfSKlCXpM0+85w8voMxCAb+Ae3b1MFhZ5RutHHKWLWnPBftlA6TUVuopxlDXwp
         Jp1w==
X-Forwarded-Encrypted: i=1; AJvYcCUS6h1r8so7QqIid5lPL6Z/7nWhkT7UUxjfxWB5vsu0KIYBcJjoHiletck5pUREm/z2VegDFXH/XGywdU7rcl0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhKfI8gLZHMqqJW6Vm5KbqZ3PSke2FfFq9N/fNh//X6+VSzYTT
	jFfZR7jfdmtQt47wTN+1khBOWvlusE3fjT1M1KODrxY9LO6hROY4c1qhuyZ2fzJpLWVdbRUvUd3
	N3axFkp6vu/kUxRgfQET8m1aiimV2fFZFPima
X-Google-Smtp-Source: AGHT+IGa3g4OYj5kLrZwDfDw6Q/Usbiq0edBIdEx656twbCcRzHHZoU+PFE0vnmEsF1p09zxCx1iToHq1XRcOx6R0cA=
X-Received: by 2002:a05:6512:3052:b0:533:4613:21be with SMTP id
 2adb3069b0e04-5334ca861e8mr1890209e87.18.1724395810568; Thu, 22 Aug 2024
 23:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-3-wenst@chromium.org>
 <ZsdBddTDuvNasHNq@smile.fi.intel.com>
In-Reply-To: <ZsdBddTDuvNasHNq@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 14:49:59 +0800
Message-ID: <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
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

On Thu, Aug 22, 2024 at 9:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:
> > There's still a bit of OF-specific code in the regulator device lookup
> > function.
> >
> > Move those bits of code over to of_regulator.c, and create a new
> > function of_regulator_dev_lookup() to encapsulate the code moved out of
> > regulator_dev_lookup().
> >
> > Also mark of_find_regulator_by_node() as static, since there are no
> > other users in other compile units.
> >
> > There are no functional changes.
>
> ...
>
> > +/**
> > + * of_get_child_regulator - get a child regulator device node
> > + * based on supply name
> > + * @parent: Parent device node
> > + * @prop_name: Combination regulator supply name and "-supply"
> > + *
> > + * Traverse all child nodes.
> > + * Extract the child regulator device node corresponding to the supply=
 name.
> > + * returns the device node corresponding to the regulator if found, el=
se
> > + * returns NULL.
>
> At the same time you may fix kernel-doc warnings (no "Return" section) in=
 these
> three (on your wish you may fix others in a separate change, but it's not
> related to this series).

As you said some other functions are missing it as well, so I'll do a
patch separate from this series to fix them all.

> > + */
>
> ...
>
> > +/** of_regulator_dev_lookup - lookup a regulator device with device tr=
ee only
>
> Something went wrong with the indentation.

Will fix, and also add a "Return" section.


Thanks
ChenYu

> > + * @dev: Device pointer for regulator supply lookup.
> > + * @supply: Supply name or regulator ID.
> > + *
> > + * If successful, returns a struct regulator_dev that corresponds to t=
he name
> > + * @supply and with the embedded struct device refcount incremented by=
 one.
> > + * The refcount must be dropped by calling put_device().
> > + * On failure one of the following ERR-PTR-encoded values is returned:
> > + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could =
succeed
> > + * in the future.
> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
