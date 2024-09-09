Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F616D4EF
	for <chrome-platform@lists.linux.dev>; Mon,  9 Sep 2024 02:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725849598; cv=none; b=QBksxUBIwLc4geHkYaYz5Gy1/G27Hld68Y/r9qXnNg1E03wKosv+tNKJa9UiucoCXpdfIWt35NYL8oxJ1YomTLMCoV8Bj1xM955kcc+Y3cd8AamXCahhW0fco8nMeZDjSRZ6bJkE7pIkDAfvIotzXQfzfTnggL8fmvw7dI4swJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725849598; c=relaxed/simple;
	bh=CXncZPiQ0Stl5rweg8akghGFSW67+FTjXiBapm0vHJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c05ciIIwOIRMbTLIjarLVxpFmvFr9AdvV9nElMnl3j2wWeQBIMU2RLdezR6Xli9Jw8ff49WPv/99i2BqRMUUNQKC4w01O4PKBBWMQVTMpulo/VF2Ja8cc6UFI6oVycCdr+WUpLlvNERXJGL7eoqN9OhPAo1ru/8yr0gTTvkxmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bQAxHIwc; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bQAxHIwc"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365cf5de24so1812170e87.1
        for <chrome-platform@lists.linux.dev>; Sun, 08 Sep 2024 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725849594; x=1726454394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=;
        b=bQAxHIwcTiVZEualoRUEDkurLloxWcH6VDFq0ujUGKAiCx7bKnXjKKkFh90ZiegwEk
         /DVetw5TKbG41rnjiowJRt7AqcdPO9pNkdnWt5oG5416jEJ+VacFouDN506kKdQCEmOJ
         b7sgWF0WDJ9MppcdMIfvY/tecdZk+Ttk6EHY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849594; x=1726454394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=;
        b=af9l1GrSmivPG0p8msk074rxBi/Ja0IyBaOziM0G5kGiKIafLEL0JLoURPxE0PGnuL
         nyeZGyGaeU6uUPElwjg2urEFXMgiOoWUTQlw64BtjMV195ISClMFotRUHIv0o3htKTmA
         MYWeUwtt6FpCd21eesFW43BVy/2gQ6IFE+skAPim7WAtB4v9GRv+qRD2GulvtQHM2FW9
         plZP8gsxLRacrV6mORBFLkbTcuyxHdWWKSYelQzY2Oy3iZWNJCcEOPPf9pNXMR0Aw/5A
         Yh8f4LCkNOOwQEWGtI6JQ3mNRDcQ8Bz0ef4UrEd028CqD5bPgUMrLkIu5vTYkd+Smawe
         rYbw==
X-Forwarded-Encrypted: i=1; AJvYcCW2jelTmvl5VeB58Jb/okrt3+GBFZnItz7UZiMlpdKCiO8gn2l4UWfJFgZqco2CEZXr1oJBdiPWw7d9rVeTEtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkhgC/kAd7DPJh5q4fO7nr3cfZC2mbW/KUIofs92Q24B+ZPy4F
	bKpwpOZH5cMNNxO8pudZN0Sl2RYY3ooE83vNxLwCZTssnQXpOYvOXfDf6X8CFh2kyBwZRNnp3zi
	poOJO1himoXvxMx/dEnPf6/pCCW7IXIIMW2N7
X-Google-Smtp-Source: AGHT+IHlN5GLZpAnPwP9Nfh6dJDXv4dqOvMPNVAV72HrfVF/EPodSu+G81D645T++W4Kv1SPpVAmGlS4gT+SnusBNKU=
X-Received: by 2002:a05:6512:1384:b0:52f:413:7e8c with SMTP id
 2adb3069b0e04-536587abe8amr5156459e87.14.1725849593704; Sun, 08 Sep 2024
 19:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-6-wenst@chromium.org>
 <Zthc8r62z2eaR8k0@smile.fi.intel.com>
In-Reply-To: <Zthc8r62z2eaR8k0@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 10:39:42 +0800
Message-ID: <CAGXv+5FCctBG5uOSvH_-0z2Jgi36zRs-Cg0_P+q8aikxLcwmbw@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
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

On Wed, Sep 4, 2024 at 9:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 05:00:07PM +0800, Chen-Yu Tsai wrote:
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
> >
> > Also convert an existing usage of "dev && dev->of_node" to
> > "dev_of_node(dev)".
>
> > [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Make it Link tag.
>
>   Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec=
@gmail.com/ [1]
>   Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Ack.
