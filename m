Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6517A339BC
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040270; cv=none; b=mB9HEGOf6FV/y3cFhuVtwSHS/pCEounYg5KzSbUeVZXJa6iot605RSfMlwG7jl7/9gw46Y9FDidEycwnc+XuMVmrQoq7ROcPe3GquN/cnJkxDq9oLFRfmzpyTMqdC0Ercjxt+oup2vDLkAmHPKcsXdCNa2K3kK4I2rMOQZ46VC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040270; c=relaxed/simple;
	bh=OJiD0dE4D2l6iH8UbnBaYGFLq+atL+gXbKu7MBslUAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHTG1B6kWwhwCy/LBIMvb8JSqjm+lg+4s4Ci/gZ9jaa07r/KAxBK6ARWRhTLlgmM+rundRErckEKa67jIrGPO5JJA2/XH9k8Xgmsp+H1P/K7mCy2ax7stom2EudgFlgqpEpI6Yum3GDaIsDpj8pnkKUOTDvxS0lx7Mjj/S4MYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wt9zKI3X; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wt9zKI3X"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53653682246so2125962e87.1
        for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726040266; x=1726645066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=;
        b=Wt9zKI3X6Ib7S9Qfg9h7fEG0wktRk3OQFk8q0z1JRNWKgvAPyWBw12bokrNpZpmTb6
         DIzmQ8z0IcuML4NQS1erCvPHxEvn3+sHOv5YsajXKus7oeoO0HRHEp1K5RBoABlF8Zso
         /1MQPCjuyqZoUnj4FDIze0Ljb9wB5zPCtpI14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040266; x=1726645066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=;
        b=RsVEyvNWb9C+cyPAqH0BTgWFkN2KLd2vm5rY0LBWt7JfD79weD6pZdmViYlbRuQn+j
         388PiO1MKu+Yqq00bgPZwDmyVmWPLbFxArbrwzTeX1y73M9iZLsQO3BIJSzmNGLxTusd
         XYo1UwYhbXVg1N4xTo8Kx1PLuypeiqicfm+nsF37pflGpOm9qrVtJ+fTlm/6MPCZSR9k
         KcGGZA0oJT3T98LVWHtxg7g1l7WEGWwmmv5ehc9zl9pPgfEuoj8iWnlVKZXHSeHUlwCQ
         GtLxIu+2VCQaNAwbuj2s+KImmi8UMJncNMj0xuncIA+1CUOb9GDqS8kskp3cfv5rhQJ5
         fxHA==
X-Forwarded-Encrypted: i=1; AJvYcCXRgGt0FAxrNVw+71kr+TusfNPW6J4orY3SDqhKTMtVdZ1zQWHuyNdrAZ93yznId4rgOtwdrh+wEWDApbeXoNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXIGCwkaiWDazwmOgF6pZVYOZSABMmkPx/LJNoD1/F7i2dZG0m
	JRiU9vmoYhiAv1Jb1DmOOqpUoh4sYcvjASmvHJu3/dblT+f/sr4WXRFtVc73P+T32kXWe4sHa9V
	uTf3WQJMgtEUCFvmMx28hcYfkANRr4Bqe7pN1
X-Google-Smtp-Source: AGHT+IEd4894jUMhTj+lpuZUCwhAQoDemTfiQND7C5Rfboo0QkW+QbXwdarpgS+S2rznD6UFho/GB5hhLLZk1Dxbtzw=
X-Received: by 2002:a05:6512:b23:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-53673c95c1fmr1178265e87.39.1726040266114; Wed, 11 Sep 2024
 00:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com> <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
In-Reply-To: <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Sep 2024 15:37:35 +0800
Message-ID: <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
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

On Mon, Sep 9, 2024 at 10:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Sep 4, 2024 at 9:40=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> > > The I2C device tree component prober needs to get and toggle GPIO lin=
es
> > > for the components it intends to probe. These components may not use =
the
> > > same name for their GPIO lines, so the prober must go through the dev=
ice
> > > tree, check each property to see it is a GPIO property, and get the G=
PIO
> > > line.
> > >
> > > Instead of duplicating the GPIO suffixes, or exporting them to the
> > > prober to do pattern matching, simply add and export a new function t=
hat
> > > does the pattern matching and returns the length of the GPIO name. Th=
e
> > > caller can then use that to copy out the name if it needs to.
> >
> > > Andy suggested a much shorter implementation.
> >
> > No need to have this sentence in the commit message, changelog area is =
fine.
> > But if you wish... :-)
>
> It does seem out of place without any context. I'll move it to the
> changelog area. :D
>
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > ...
> >
> > > +/**
> > > + * gpio_get_property_name_length - Returns the GPIO name length from=
 a property name
> > > + * @propname:        name of the property to check
> > > + *
> > > + * This function checks if the given property name matches the GPIO =
property
> > > + * patterns, and returns the length of the name of the GPIO. The pat=
tern is
> > > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > > + *
> > > + * Returns:
> > > + * The length of the string before '-<GPIO suffix>' if it matches
> > > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > > + * -EINVAL if the string doesn't match the pattern.
> >
> > Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel=
-doc.
>
> Ack.
>
> In the regulator cleanups I did, I used -%EINVAL instead. But then I
> realized that constants aren't really cross-referenced. I probably
> have to go through all of them to fix those up.

FTR this patch ended up getting dropped from the series as it was no
longer needed. However if folks think there is still value in this patch,
I can still send a new version.


ChenYu
