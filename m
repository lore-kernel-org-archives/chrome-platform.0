Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274615D5C7
	for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498747; cv=none; b=RJefU91mm037OFSWz8FxMQv64e0Lm6wc3FUnIGFoGPRebuYkmhk4kvw4tHwvty9TALLkTq8jR0v0FaUwK0ogdG0r1Y4w59pM4gKqdnjpALwYATxQRQTAnjgCLumUdIe//tFbMSCiT/N6MMS0rH8b9PwUNLr77TJkndkn2nV1f1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498747; c=relaxed/simple;
	bh=+JwIeJpbnxQcpqJOWKCJ3QmtYIYu8glAU1smt81y76U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJz9Z5X0lPajP46xl2zdLMk53xKo6WjUnrPsUQ+kXFDXrckLvbaoGLoS0oTDe6RcUZ+mE8dIZQsR/FaUVWRKjDehcqI+amwH6x/36Goxy0ustnfC48KIMHKRv/X3XEBpqzNwq0nzwSX2tGTeeEkaxhI2K0dUlIPoqDc7sV9ZpFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dqqpq1R9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dqqpq1R9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365c512b00so5340794e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726498743; x=1727103543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=;
        b=Dqqpq1R9Ckih6cBhpaL+sa9PLs4Rt5kH/ge1+PmRuoluDgZNAEm47RZBrgqSzSS5p9
         F8S5V+fjZ6dM6PpQpVcOv1eS3MowDtwTioVuUuSMZstYeEU0uWEzQ0bcmVzWvBjeA+D/
         DLXWE4sRACwctK+6j2tMVbiUB5kgvozlhvVkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498743; x=1727103543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mKFbvl3FRfknVVQd9F2VGjZGmbz4CE84EcQSXZolvo=;
        b=Nb4tpPUZJjIUQVy8iSaVrgOnKCo1IlFPHaDFhk6cH+jZ7JE9rWQvH6GU0nhIP0EkH4
         oeL381rgSZNI3++lSn3gURfYRVKekQa2aYK7CFyXSvpG3Ux8BCYhn7X51AJKQEEhnMPj
         at7p5jLwEng2Qe/Z116nUP7ZMWqZFNZhZgwaqL9Bm0bJpY7MmwkfnxYgjukE+Av6K0Z2
         TvpgINtOWNlXDflC1kBVyzdiCw3dLShZkhIA4ghIXCR82H8wcIBkfkBVQ0Cpnn329jA+
         /Z7+hnRicuTu4cOizZ6T1OBPJvA9zbn70qMOxaBxOElxQKLITdTWSj8PKsKTmB6tDS4Z
         hUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0KevZRWcSv1xFNrahx9rwJ1WKAQv3Qdb+7rDqF8cGwWJqYZFMyLUzFmSXHFOv5ycDBf5/0CViQpXbuXHZHkk=@lists.linux.dev
X-Gm-Message-State: AOJu0YywzyVhBZXSRiRSFirl5CQL9iQk/pLYKeNHbWlij1t2P06coFRq
	/TUXTNzB3qihTHlP7nGhSVgUw5k2ryuLpiOe27rkCnhyJnh/C0V6EZaKqhWoGfVULxVEyvPv91S
	SIXth0tNgZILLqwFO0o6nTgPXgOx7EeA47oUY
X-Google-Smtp-Source: AGHT+IFzocyQXiHJ7IGC6/o9lODvUjZ8bZDDkxYaKMNeJriFadvyYRFY1CoEermaKv4PHMS4vAciuIhFJjjOmqh9esA=
X-Received: by 2002:a05:6512:3f18:b0:536:52ec:2870 with SMTP id
 2adb3069b0e04-53678fcd14cmr8312496e87.28.1726498742804; Mon, 16 Sep 2024
 07:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-10-wenst@chromium.org>
 <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:58:51 +0200
Message-ID: <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 1:43=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)             +=3D chromeos_a=
cpi.o
> >  obj-$(CONFIG_CHROMEOS_LAPTOP)          +=3D chromeos_laptop.o
> >  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  +=3D chromeos_privacy_screen.o
> >  obj-$(CONFIG_CHROMEOS_PSTORE)          +=3D chromeos_pstore.o
> > +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    +=3D chromeos_of_hw_prober.o
>
> "o" sorts before "p" so "of" should sort before "privacy"?
>
> I guess it's not exactly all sorted, but this small section is. Since
> it's arbitrary you could preserve the existing sorting. :-P

To me it seemed more like they are just sorted in the order they were
added.

> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compo=
nent_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> > +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compo=
nent_prober, .data =3D &chromeos_i2c_probe_dumb_trackpad },
>
> The fact that the example is only using "dumb" probers doesn't make it
> quite as a compelling proof that the code will scale up. Any chance
> you could add something that requires a bit more oomph? ;-)

I only have a hacked up thing right now.

This is the one I'm using to test things:
http://git.kernel.org/wens/c/5c2c920429167a15b990a7cf8427705eec321134

About this one, it seems we can at least merge the device trees of
each product into just one. The touchscreen or trackpad (or lack thereof)
is probed by the kernel.


This one I only started looking into:
http://git.kernel.org/wens/c/42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783

About the second one, AFAIK the device tree descriptions are incomplete.
Only one of the trackpad options has the regulator supply described.
The regulator itself is marked as always on, so things currently work.
Some work will need to be put in to research the schematics and test
whether things do work correctly.

> > +static int chromeos_of_hw_prober_driver_init(void)
> > +{
> > +       size_t i;
> > +       int ret;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible))
> > +                       break;
> > +       if (i =3D=3D ARRAY_SIZE(hw_prober_platforms))
> > +               return -ENODEV;
> > +
> > +       ret =3D platform_driver_register(&chromeos_of_hw_prober_driver)=
;
> > +       if (ret)
> > +               return ret;
> > +
> > +       chromeos_of_hw_prober_pdev =3D
> > +                       platform_device_register_simple(DRV_NAME, PLATF=
ORM_DEVID_NONE, NULL, 0);
> > +       if (IS_ERR(chromeos_of_hw_prober_pdev))
> > +               goto err;
>
> FWIW if you didn't want to see your prober called over and over again
> if one of the devices deferred you could just register one device per
> type, right? Then each device would be able to defer separately. Dunno
> if it's worth it but figured I'd mention it...

I think that adds some unnecessary complexity, and more lingering devices
in the system. These platform devices are not removed.

> Also: as a high level comment, this all looks much nicer to me now
> that it's parameterized. :-)

Thanks!

ChenYu
