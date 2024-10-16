Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16ED204F8E
	for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070900; cv=none; b=su0kZyHQQ33y2UJVEg7m08ryP/jaTdDQAN1H9CtnmEBz2uy3iQZxRioKkfKC3U7Z6MU6VyAy8X/TQC83o7CA2oKY9DYfw0mbCMqH9cJawdrIIrG5xaScDBKP+QJTFRxS5WMscJ0ISF1tsmUQtbynJXkGaeWNnPx28lA2rfg0pDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070900; c=relaxed/simple;
	bh=udOf30ZlWky3uzp/m7PSgXQuHwti7csL/gsXUNukPSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Go7Ce0m/PZFATLLucG7BlL2LRo6lTwf2Fw1mlibOF+++o5amp6aQCUgj0mjDbm0GzZMyEYQiJx5uDixsISSXV3NAVUdHdDopt/bS0M9aUpNtnuBjcQ4ezeoG53VGyMKCo2IJKAFdlQYVy1lqpwuOhKWZdhNCc36Et5uyA9WnVck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Er33wKZq; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Er33wKZq"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso31863261fa.0
        for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729070897; x=1729675697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=;
        b=Er33wKZq5O4sjrOttcyCMU+X6UmsBB0pA4IelCm2oEovrr/Npyp1oVd+5H5awoFog7
         0N9oJu0Tex8744qIamV2ZUeK9UCeUqXqRaPyEEHPRLRTsgGSx0zOIlnhs0sK7Mzkbvba
         ufghWfHLlwXUEsUgHXnfY8ImeAkU5lYEZ9gWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070897; x=1729675697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlvkqeHB10TeR7p0qpAqomrEbyrl0g2iGDmWLXtmqe8=;
        b=C6f5IXnHXRuK2XaN9kaLVsEmDO7S++GHy+L8gN5XRhp6Hab53nwQJCY4ToYOOjVdvq
         GO+DeQrwi5WU/J/CRtDSgAmZMVOY07igseHYuaLLKmVSM8Ma5jd4dxdRclfRrO1KEyNz
         ZLFoY7O2n66w7tWwWfvZhMvwYquySaxMVNLL6xIpxrhZ34pKZyycKbTy4y9vBecvu71h
         Y2iO/xZkymp81OAkh0OF+5MNtlxw8kBWFsqwme0yP1zoXxx7rKGvHF+9uxxtTZ+aBGJH
         3S+Dqi0vSE1hUvA2IC4CfYGkL+xyN1EElbaVWsN2O3x/UnrRf4F/+/2w+Mcp2tqsi3sk
         xkFw==
X-Forwarded-Encrypted: i=1; AJvYcCWAxzviXZMhnaoOBfEyyFUZXCATfw8JQhKlLXUSEhEeMfcVbPHJ9OD2EZm52Nd0Sw0HiNbVNhL4Tcjc5bGATyE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtrdlUTrH70uHGn29jVVFlj4cqQXcgQzk6VUtfjig/DhdoAAO/
	O3ZnbhqlmBZH3JQOkP/RvCmvp8kDmOBLRc8bV/BUCAF3S/qI5Wr1YjpMVlPjK1weQjAxVxAwDtL
	by6wGFSQFc1u4IYV03mVt9oQHWXFcepP+D2ZF
X-Google-Smtp-Source: AGHT+IEaS5qJnG1F/Na+fPMzIxej3L36Oa+G1Du15MTwKWHu6l9SdRlVC+wBVlX0gEHyVjj7AKsa/2ZIQjZ3p9uU05A=
X-Received: by 2002:a05:6512:b11:b0:530:e323:b1d0 with SMTP id
 2adb3069b0e04-539e54d77bdmr6806437e87.9.1729070896644; Wed, 16 Oct 2024
 02:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com> <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
In-Reply-To: <CAGXv+5FW0UTjR_ZiqZ8VEOQkBemt54omtJe_aTj3jvScC-LuMw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 17:28:05 +0800
Message-ID: <CAGXv+5GHDt3_Td8B441xv=-G1=LBfSXp8_sQ4XRRPX1f4VyTMQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:01=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Oct 16, 2024 at 1:58=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_p=
robe_cfg *cfg, void *ctx)
> > > +{
> > > +       const struct i2c_of_probe_ops *ops;
> > > +       const char *type;
> > > +       struct i2c_adapter *i2c;
> > > +       int ret;
> > > +
> > > +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > +       type =3D cfg->type;
> > > +
> > > +       struct device_node *i2c_node __free(device_node) =3D i2c_of_p=
robe_get_i2c_node(dev, type);
> > > +       if (IS_ERR(i2c_node))
> > > +               return PTR_ERR(i2c_node);
> >
> > I'm still getting comfortable with the __free() syntax so sorry if I'm
> > wrong, but I _think_ the above is buggy. I believe that the definition
> > of the free function for "device_node" is from:
> >
> > DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
> >
> > ...which means it'll call of_node_put() to free "i2c_node" when it
> > goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
> > pointers. So I think that if you get an error back and then return via
> > the PTR_ERR(i2c_node) then it'll crash because it will try to free an
> > ERR pointer. Did I get that right? Presumably you need to instead do:
> >
> >   return PTR_ERR(no_free_ptr(i2c_node));
> >
> > ...or change of_node_put() to be a noop for error pointers?
>
> Good catch! As Andy suggested, it should be updated to handle both.
> I'll add a patch for this.

On second thought, it might be better to change i2c_of_probe_get_i2c_node()
to return NULL on errors. That seems to be what most functions do. I only
found a handful of exceptions.

Rob, any thoughts from your end?


ChenYu
