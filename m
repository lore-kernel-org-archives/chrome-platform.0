Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D4199FA5
	for <chrome-platform@lists.linux.dev>; Thu,  5 Sep 2024 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523895; cv=none; b=lmQTrV2qfCIsXcsiZ/8gnBxxCdU1GmmEQ+4M8NZW4Q8PZst0LGyuuFidi9dOseKQPnrLT/+33maj/mBdupTVz6v5RsDUdJTZyiA+EQ1il+8uNOI86YsQiiTrj0OkQ3zeAQrTHIHSY71rnzok/ZOYOpb0Kparx/vBaV/68sQZ/yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523895; c=relaxed/simple;
	bh=F4EbLyf6kkAeGukY+adQL1kHBSivOSuwUA1FnPkwLr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQP3VA3dzkRYBftm/vLgRfWjjhZLN2D5pgw0Z2As/1sNGbQUzDzSL60SdY08qNscDZVST1iMlEjbhGAjKnG7BHoFP0Rdyp4foG9XY67Kc3I4cFDT5LPfkZGCwD05B2CboJdO1WlvOVmuYlDasLnYpudHCz7LGk0sMMhytd5GCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cgNoNNrg; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cgNoNNrg"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f406034874so5359841fa.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Sep 2024 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725523891; x=1726128691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=;
        b=cgNoNNrgTLFm6Bca+yHdYARLDMIrtRgWGnzU3HJh7TRCGH6fURFIKmHzDXVUSXHikC
         9jzugsO1E7JpsL2hLs1FUajvRmp4pY2Uq3YR79DQfSsJagB7r97tvNpNhqbdEylM/cX1
         xTaHDF/GbRufFanLRbF1aNDUVCWW9OUHcuE2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523891; x=1726128691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=;
        b=oV7ZHlrLof4Z94yKdmq184LVwIyDl67KjhPw6szQmMd6sD8IRylNARcHZn4k5T2B/N
         pG/VHftL+XsmJYtPJ488D3ONvQeuDWUhwa3WEkIYFDQqMaiFeDvdzpmL7ZU5eueMlj88
         VwUaLcC0aXaQFPYpfpf+VqGzLqPepD18gloBPNeLpF30i3fZPjjPV+cxTGj/5/guGsMs
         +7FqNDicpPQ+E3s+I85GrPT263frBUe/viB3Kin0PtRT2tUalqTsuxlhnr6iK+a+9dyi
         M9kvhtjTwRNVCGINCbVxOLrZOZRUUcSLqJEdHBqCD4Ik0i9D1vCqfBpj+SJXmMfD9lqV
         MuRw==
X-Forwarded-Encrypted: i=1; AJvYcCXdoP/9BGIKx0wCf3YoFoIQBfjkAUwXg2KQPk/f1ogxmuZcPIvwzGVlpp2P1AEyX7fLXhFi9IVGCbtiYpVXJYk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8u9Pmt7EkMC+rXSZGER4GTGF+edx3MszTw4v46UtlSiDaYJFp
	0U531kBMKJBUMJTrAaGnP/xmlzY1oXVb+xrfBGXHciqfQ+vGXNQ89S/fjqnaJk98YRqLtnczTks
	clE7uCK6B8kJLmvkmlxDsMQ4n9VK/AZmZalAO
X-Google-Smtp-Source: AGHT+IHgBQxVW+6mWOLd4xU/v/uqA2bXrlgX+qclLv/VfI8suvKUwIZp0O6ejzR9OBlUf64DSkNg9Mtn8N7ARtFnYaI=
X-Received: by 2002:a2e:a9a9:0:b0:2f4:9fb:5905 with SMTP id
 38308e7fff4ca-2f64d38cf3fmr53482011fa.0.1725523891012; Thu, 05 Sep 2024
 01:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com> <ZthdU6UGlM75GJVj@smile.fi.intel.com>
In-Reply-To: <ZthdU6UGlM75GJVj@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 16:11:18 +0800
Message-ID: <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
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

On Wed, Sep 4, 2024 at 9:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 04:09:26PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:
>
> > > +static struct device_node *of_get_child_regulator(struct device_node=
 *parent,
> > > +                                             const char *prop_name)
> > > +{
> > > +   struct device_node *regnode =3D NULL;
>
> > > +   struct device_node *child =3D NULL;
>
> Btw, redundant assignment here, as child will be assigned anyway AFAIR.
>
> > > +   for_each_child_of_node(parent, child) {
> >
> > > +           regnode =3D of_parse_phandle(child, prop_name, 0);
> > > +           if (!regnode) {
> > > +                   regnode =3D of_get_child_regulator(child, prop_na=
me);
> > > +                   if (regnode)
> > > +                           goto err_node_put;
> > > +           } else {
> > > +                   goto err_node_put;
> > > +           }
> >
> > I know this is just a move of the existing code, but consider negating =
the
> > conditional and have something like
> >
> >               regnode =3D of_parse_phandle(child, prop_name, 0);
> >               if (regnode)
> >                       goto err_node_put;
> >
> >               regnode =3D of_get_child_regulator(child, prop_name);
> >               if (regnode)
> >                       goto err_node_put;
> >

Looks like Mark already merged this one. I'll send extra patches to clean
this up later.

ChenYu

> > > +   }
> > > +   return NULL;
> > > +
> > > +err_node_put:
> > > +   of_node_put(child);
> > > +   return regnode;
> > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
