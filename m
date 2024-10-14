Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44849620
	for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 04:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881795; cv=none; b=nrxNhbIZglr+bxPIW66Srs3LB6cy53S01krrJBF8bT/fSrhyW40vcue6QltroAIVzxxK4QcC6VfrwuJ2zKUaUSxaKBMdLu9W2BUg4lWR0dIKeFclRMyYjPy+S71wC9kh2SSGgp7imImUf3xFj43i2urucCdAcpBAmVB8fOAfPwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881795; c=relaxed/simple;
	bh=/wdhZ+coLekzp0Cl2NvQ3T1ZDoJZFEx5Rghyv0mqUmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1immQzdip1iQntXNv8ynBVjBZzZhDTxHEctaIvNDE1nDQTVW04z9ZxBmg1wL0NrYJWuu9jicGz9h13F2v4tf7ZttjdOPCXQui/DVkLLPH4fzSL9Np521Jv+9IKsMZVkG6N1omqNTQ1HL1cDwL+r+lneAJculK4C8I1xTKPJZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J0j4v7tG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J0j4v7tG"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so414649e87.1
        for <chrome-platform@lists.linux.dev>; Sun, 13 Oct 2024 21:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728881792; x=1729486592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9mFtNqYh9KUexI71xOhNoOB0u6iXKtOOnwmm3eW4KA=;
        b=J0j4v7tGyHhergq4D4q8HMf6D0KqXqPNX/lXlZAG8omnz90HxSAhAb619++H7eViUq
         CETekqSUbUg3vC7Zz7I9TM9qcBmXHh4g7hz5dyhxPW9NFTBhxIOizlWscXRyLcZctpWN
         /AMIGk0QvZlvCcyYwIYpMAECJlnska8WTjqS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728881792; x=1729486592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9mFtNqYh9KUexI71xOhNoOB0u6iXKtOOnwmm3eW4KA=;
        b=g1MqBEURMSfOTFVta7mu6IG9GLUjySigU8qTkSm5Esq5JpkjXjnGTVJLZWCKzIprDq
         4h3uwED486GsnDKD+tALoNIeW/ZS4fudzx9SpD/4QPU9YIFm7lNNS4/Or2McKUOJCuHA
         6NiarkORsKDle6DEJ8TKV0BjKYaYKoAP9eoUmlQgcDvnkwVDMajl37laA0/814b6jWB/
         cJHM/ivt1+o6Scn0K5G4BRiYbYRkdD19hGld/BtKl65Oph/RNBc2Oyt6p6Sby6rahLU/
         oVpzUQathBw5iwzkpSOR6nUN8ZFkKTxYWQGbzJDzKrYc3EjsPJ7lRhTN1mLPSLRzd+vT
         HDzw==
X-Forwarded-Encrypted: i=1; AJvYcCVnpy2xkmXkcZ2MIKJzKM9rhgSfFqXNsA+asVZlZQsEKQxaPAmujpBha0a9aMsnSVoLtue+QUY0VzUQbrxJXkg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEJMmgxUAqwYbOX6kVUvgc7lXG59E7rLXwSuTWqJdccgJE8Jx5
	Wl1tg9w/acOENEP9uWq+2S8FQDFMcB8MnHV/aj9a+pulWlInELPIQfkBqzBm3k4rodSxTdVBDJQ
	Rqasl61D51wIG4eAyzbEDRWp6nc9cjMbxlcCC
X-Google-Smtp-Source: AGHT+IHhR8KAjvYTJxUr2lWhSCMmkKSBa/eO8EdYJtU/6/vYtzRfFH677PpHu0f+4UfTQZcguYvFpFsxHDu0B8cJTi8=
X-Received: by 2002:a05:6512:4204:b0:539:e3d8:fa33 with SMTP id
 2adb3069b0e04-539e3d8fcd6mr2914559e87.54.1728881791743; Sun, 13 Oct 2024
 21:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com> <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
In-Reply-To: <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 12:56:20 +0800
Message-ID: <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 11:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_=
touchscreen =3D {
> > > +   .cfg =3D &(const struct i2c_of_probe_cfg) {
> >
> > Perhaps you can introduce something like
> >
> > #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)                \
> >       (struct ...) {                                  \
> >               .ops =3D _ops_,                           \
> >               .type =3D #_type_,                        \
> >       }
> >
> > and use it here as
> >
> >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),
> >
> > > +           .type =3D "touchscreen"
> >
> > Ditto.
>
> This was for leaving trailing comma.

Ack.

> > > +   }
> >
> > Ditto.
> >
> > > +};
> > > +
> > > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_track=
pad_cfg =3D {
> > > +   .ops =3D &i2c_of_probe_simple_ops,
> > > +   .type =3D "trackpad"
> >
> > Leave a comma.

Ack

> > > +};
>
> ...
>
> > > +   .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
> >
> >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_op=
s),
> >
> > Or even
> >
> > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

I'm not inclined on using compound literals here. "simple X cfg" will
likely get shared between multiple |chromeos_i2c_probe_data| entries,
and AFAIK the toolchain can't merge them. So we would end up with one
compound literal per entry, even if their contents are the same.

> With that also looking at the above
>
> #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
>         DEFINE_I2C_OF_PROBE_CFG(type, NULL)

For the "dumb" case it makes sense though, since it would be one instance
per type. But we could go further and just wrap the whole
|chromeos_i2c_probe_data| declaration.


ChenYu
