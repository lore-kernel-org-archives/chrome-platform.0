Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD883C30
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 00:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726014623; cv=none; b=JoIyu5UZA9IPgjhV0hTq2td7GVh8klR3FeUNYTGVqCOinfJoYWNFk49LpLEjJtexgurwL0ONhn/ENScVZAzDCVFDkHgvVQ9Q+DygPprRGr+u4eYR3SxDARKKk2QAvct88BZ/Jd+3ICKaAorBWJ7NxzzV0uY5sjRGzUU1uydeaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726014623; c=relaxed/simple;
	bh=CWQ3FKYSH0+6wrCe/fWknwQLJk3iFkVwYWj/rMRRcdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1x8kzxarZNtCCOuQRpzn/p4Pk33yJy+r0H7HQG13Cyst6KLkMQlJB465Vxw8oUj2cW9ERRMcCCC9nqwR94V69QDoRL3dDFl4Vo/XxEFFuvbJ/Qz1RvAOC2sVgoIa3ckVVDRBWWoqwbdTFzAfzJmq0cJNslUlRWgJM6/JCCVwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XxTAk5Lz; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XxTAk5Lz"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c3561804b5so35205516d6.0
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 17:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726014620; x=1726619420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXQuFZTJ8lIqW5Ag+qwYyd702ndWzlmLQdZRxiEWDFg=;
        b=XxTAk5Lzb4l1AacFfUe8qdz5RaJD+KlxNT5sAPUS/EmySvvXCRSWNuIHscihkkIuXZ
         pxco9A78NOFaafDDGRnlgkBO8YiYHcFXGnqZStdzYqXI5GhGVAcsgzZNQFIAXRWuDBy1
         wRv+bkXTTysT1gUjZk1O4EQKRJlsLCmkMu5dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726014620; x=1726619420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXQuFZTJ8lIqW5Ag+qwYyd702ndWzlmLQdZRxiEWDFg=;
        b=Vfzs6HLMNRTpNxyXj/oUJW4iIjGVITI94eY7nz39133UGp607/wyMwIIGBpKWYMWop
         3iA+iMQv9bAKfZdO7XwpEKp41cN+ny2V/yAWafaRmIITdxh6dtRa91KnEBwp8Eehlxjw
         Af4QxWYZX+TAuxrJwS4AFmqfHe3Kv9WGvx0Kfo7Ll0MxllWL8JVyUCGKCw63z9N3TFbK
         pwSVhUQ+oGqmGr2jIsQWK7hFSDhLWQ5Cpz3qdB0zj6clYXy1Vq7/LJ6yyoHZwpJ9BPqv
         6Y2EZ5LOxgTPZ+XmXxUqBnkWmdmgtqkb9LGbyrZBytYkqfByk/OkQdC4U3dshRRsTGW7
         eY0A==
X-Forwarded-Encrypted: i=1; AJvYcCWgJCssoy5/TqQHoZtwcXXHE+FQxbO9Pyw/tD3Az3bhb80OwsZtV0Si/7Mt8EvRMCMIUQdsYor4aM95pFmDk6E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Hfq1IenF71f6qwKVqFohkGh9XB2TronV2ugeolyyM8c4ohIy
	ltZ3yEozZ/dR74MVkXyyAxaASVGPufOBRn8DglXsifnLbpMZ43m/UGEOt6BLEwhy/pGd7Wlm058
	=
X-Google-Smtp-Source: AGHT+IFOt18V7wKzmF9NE6Z26bQWfig8FJ3NY1V46QQMCMyX6Owtxou0aC0kxB9fD0ArjSI2fIJGxw==
X-Received: by 2002:a05:6214:2e45:b0:6c5:17c9:a851 with SMTP id 6a1803df08f44-6c52850d730mr237807286d6.46.1726014620234;
        Tue, 10 Sep 2024 17:30:20 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4582f9ac84fsm24313811cf.15.2024.09.10.17.30.19
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:30:20 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6c53bc6f9faso22056916d6.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 17:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKUyQ6cMQ0Fc9aGQuSlTtmfKdLzmGwbKoYhldvq3qWEA5eMWE/vjbibDvZZjoLh/OdP2MgxI9QfEDwHJqIS4Q=@lists.linux.dev
X-Received: by 2002:a05:6214:5b06:b0:6c5:52d5:bbd0 with SMTP id
 6a1803df08f44-6c552d5bbf8mr80721586d6.32.1726014619235; Tue, 10 Sep 2024
 17:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com> <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
In-Reply-To: <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 17:30:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Message-ID: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hi,

On Thu, Sep 5, 2024 at 8:45=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > > IIUC we could have the "options" data structure have much more board
> > > specific information:
> > >
> > >   - name of node to fetch resources (regulator supplies and GPIOs) fr=
om
> > >   - names of the resources for the node given from the previous item
> > >   - delay time after each resource is toggled
> > >   - polarity in the case of GPIOs
> > >   - prober callback to do power sequencing
> > >
> > > The "resource collection" step would use the first two items to retri=
eve
> > > the regulator supplies and GPIOS instead of the bulk APIs used right =
now.
> > >
> > > The power sequencing callback would use the resources combined with t=
he
> > > given delays to enable the supplies and toggle the GPIOs.
> > >
> > > For now I would probably only implement a generic one regulator suppl=
y
> > > plus one GPIO helper. That is the common case for touchscreens and
> > > trackpads connected over a ribbon cable.
> > >
> > > Does that sound like what you have in mind?
> >
> > I guess I'd have to see how the code looks to know for sure, but if I
> > understand it sounds a little awkward. Specifically, the "options"
> > sound like they might become complicated enough that you're inventing
> > your own little programming language (with delays, abilities to drive
> > pins low and high, abilities to turn on/off clocks, and abilities to
> > turn off/on regulators) and then probers need to code up their
> > programs in this language. You also need to handle undoing things
> > properly if there is a failure in the middle. Like your "program"
> > would look like this (obviously you'd have to play with enums more,
> > but you get the idea):
> >
> > {
> >    { OPCODE_TURN_REGULATOR_ON, "vdd" },
> >    { OPCODE_DELAY, 10 },
> >    { OPCODE_GPIO_ASSERT, "reset" },
> >    { OPCODE_DELAY, 5 },
> >    { OPCODE_GPIO_DEASSERT "reset" },
> >    { OPCODE_DELAY, 100 },
> >    { OPCODE_TURN_REGULATOR_ON, "vddIO" },
> > }
> >
> > Why not just expect the board probers to write C code to turn things
> > on before looking for i2c devices, then provide helpers to the C code?
> >
> > So there wouldn't be some generic "resource collection" API, but you'd
> > provide a helper to make it easy to grab regulators from one of the
> > nodes by name. If you think bulk enabling regulators is common then
> > you could make a helper that grabs all of the regulators from a node
> > in a way that is consistent with the bulk APIs, but I wouldn't expect
> > every driver to use that since devices I've seen expect regulators to
> > be enabled in a very specific order even if they don't need a delay
> > between them.
> >
> > I wouldn't expect a "collect all GPIOs" API because it seems really
> > weird to me that we'd ever want to jam multiple GPIOs in a state
> > without knowing exactly which GPIO was what and asserting them in the
> > right sequence.
>
> So I'm slightly confused, as it sounds like at this point the i2c prober
> would be litter more than just a framework, and the heavy lifting is to
> be all done by callbacks provided by the board-specific driver?
>
> So the framework becomes something like:
>
> 1. find i2c bus node
> 2. call provided callback with i2c bus node to gather resources;
>    let callback handle specifics
> 3. call provided callback to enable resources
> 4. for each i2c component, call provided callback to probe

I don't think I'd do it as callbacks but just have the HW prober call
the functions directly. AKA, instead of doing:

  i2c_of_probe_component(dev, "touchscreen", ts_opts, ts_callbacks);

Do:

  grab_touchscreen_resources(...);
  power_on_touchscreens(...);
  i2c_of_probe_component(...);
  power_off_touchscreen(...);
  release_touchscreen_resources(...);

Obviously I'm spitballing here, though. Without writing the code it's
hard for me to know that my proposal would be better, but my gut tells
me that trying to write something overly generic with lots of options
/ callbacks would be more confusing.


>   If the probe succeeded:
>
>     5. call provided callback for early release of resources (GPIOs)
>     6. set "status" to "okay"
>     7. call provided callback for late release of resources (regulators)
>
>   Otherwise at the end of the loop
>
> 8. release resources
>
> The current code can be reworked into helpers for steps 2, 3, 5, 7 for
> the single regulator single GPIO case.
>
> > > This next item would be a later enhancement (which isn't implemented =
in
> > > this series anyway):
> > >
> > >   - optional prober callback that does actual probing
> > >
> > > In our case it would only be used for cases where an HID-over-I2C
> > > component shares the same address as a non-HID one, and some extra
> > > work is needed to determine which type it is. I still need to think
> > > about the structure of this.
> >
> > IMO _that_ would be a great option to the i2c prober. It feels like
> > you could have an optional register read that needs to match to have
> > the i2c prober succeed. Most people would leave it blank (just the i2c
> > device existing is enough) but probably a single register read would
> > be enough to confirm you got the right device. Most i2c devices have
> > some sort of "version" / "vendor" / "id" type register somewhere.
>
> At least for the stuff that we have (touchscreens and trackpads) such
> registers typically don't exist, unless it's an HID-over-I2C device,
> in which case there's the standard HID descriptor at some address.
> But, yeah, reading the HID descriptor was the use case I had in mind.
>
> At least for one Chromebooks it's a bit more tricky because that one
> HID-over-I2C component shares the same address as a non-HID one. We
> currently have different SKU IDs and thus different device trees for
> them, but we could make the prober work with this. It just has be able
> to tell if the component it's currently probing needs the special
> prober and is it responding correctly. This bit I need to think about.

I guess Mark Brown also thought that there wouldn't be some magic
register, but my gut still tells me that most i2c devices have some
way to confirm that they are what you expect even if it's not an
official "vendor" or "version" register. Some type of predictable
register at a predictable location that you could use, at least if you
knew all of the options that someone might stuff.

For instance, in elan trackpads you can see elan_i2c_get_product_id().
That just reads a location (ETP_I2C_UNIQUEID_CMD =3D 0x0101) that could
theoretically be used to figure out (maybe in conjunction with other
registers) that it's an elan trackpad instead of an i2c-hid one. You'd
have to (of course) confirm that an i2c-hid device wouldn't somehow
return back data from this read that made it look like an elan
trackpad, but it feels like there ought to be some way to figure it
out with a few i2c register reads.

...that being said, I guess my original assertion that you might be
able to figure out with a simple register read was naive and you'd
actually need a function (maybe as a callback) to figure this out.


-Doug
