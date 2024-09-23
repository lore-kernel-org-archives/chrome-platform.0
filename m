Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB417BCC
	for <chrome-platform@lists.linux.dev>; Mon, 23 Sep 2024 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727118743; cv=none; b=CYQgrw3yLWEvsqnB5PJQSfG1Y8odGfyVacmkLaHNOomvP/86esOo7/gM4GQkJ8n8f171VWOdNVfy1rGyDsGi+1S5rdOXTw0WJn8wgcj9FWXrzITCwMUHBJN5nz7aCgBXDGAX2NWjjbYGIONyy74lm5k8F6I7qqV1H1a4uQzz47Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727118743; c=relaxed/simple;
	bh=xf364lZIbnjp5yXv/kYTrKS69WYtJ5dXPHV7dU2ANQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssLlsChfnGzv7Ib5btTy3u85sHjwxzsXSmCSmyUa4LfScKiL7LAwyEQYmYU3ST54B20VVjvxLy2Gr/7LIX1Dumx2TQ9y29P9uLIxWPh4BlMxKJhTbepulb0Y1i0WxS6eAdCjL04gRhExXTVrYbgVcIyEFXyuvCWkQOMAIPZlZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B+9eCR5x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B+9eCR5x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c26a52cf82so2943877a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 23 Sep 2024 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727118740; x=1727723540; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=B+9eCR5x7s3jd9Ub8eoW/Zn+Rgm3CyDGT6KELDa1fDldnO6fh6AGNSoGn9XqzRqTZq
         5YkgtOx6qdkHeda/LWLMWI1PRpyOJ/Q1WxR5WgD8Hyc6BQavJMnbufwsAs3c3UFoby7F
         BLtvlIyEvpVxqS2o4g/iOIjrnhmf5Y0Kzu1xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727118740; x=1727723540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=Wd8vWmnKjBuYBPdB93uMS6v7h9V0EHLnskgcoLJdvUXsc4X4DCXFaX7izKXZ1cjIes
         /9y3MlinMYLjUwTrThoq6/gVbNZ6pg3Z8qATaVlm6+D4ZYmi9A3CDIkP24SRvV8ce3jz
         2H4BjRI6Gl2S6jwn90CxvMuMH7uVTj7kmtnuR24k/PhnyqSLVSrPj8EY44uSV3kSVmje
         J0y93zFDfacUGNeolJK4dJmgL6pNQ0CWXT17t6cqWvE7u0fzqkslls8JmpXLRdPVi4FR
         Y1CT7QzELIM35nwWR8syrMdNL9HuOqkYV/DH1Eq3Kyf2Yi4nOYQBcgqaF2hXm8FCTHbB
         VakA==
X-Forwarded-Encrypted: i=1; AJvYcCWmlGnx6FiSkTyZc8RaYIXTS9/zfTH088mzro64zBYjeit/be7peaSmUpYgwD61SQnJy1So5hgywb2+JdzjCbs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLasxYtkaeL2aRTi7+AU6ox1D/LfQqdlhBVEcUbxjN3T3ANdOA
	/3FEebnwc1nDH0mtZ9y4e+cIZyE0WkH33Zmim9ceqdJYCMJPgOp3Kbsg8BQmssMKgfFLxImQVcF
	M/g==
X-Google-Smtp-Source: AGHT+IEoiJWFyi0mTiY2i01xda/Rzl4F56fxfwZCmWUygX9zBU6kA6E7dKUUAM6S9FfR0BSWje2rhA==
X-Received: by 2002:a05:6402:4313:b0:5c3:cb45:2e with SMTP id 4fb4d7f45d1cf-5c46484f321mr15173783a12.5.1727118739764;
        Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb49761sm11086783a12.15.2024.09.23.12.12.19
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c3400367so4187411f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWskvwZ1X1CtIMsUNhXMs5LmrJex4T8qcfMJWlQSOEmG2mtJ4B5pXeqwu2gnaDdZhzssh79LdFjQ2E43L3DPak=@lists.linux.dev
X-Received: by 2002:a5d:4741:0:b0:374:c6b8:50b5 with SMTP id
 ffacd0b85a97d-37a422783aamr9933862f8f.17.1727118739230; Mon, 23 Sep 2024
 12:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
 <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com> <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
In-Reply-To: <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Sep 2024 12:11:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv1uFmxFsaxT9tY=-fwnPsXDjnabNxQ-cK3hm2a9Wo7A@mail.gmail.com>
Message-ID: <CAD=FV=Wv1uFmxFsaxT9tY=-fwnPsXDjnabNxQ-cK3hm2a9Wo7A@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
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

On Tue, Sep 17, 2024 at 5:41=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, str=
uct i2c_of_probe_simple_ctx *ctx)
> > > +{
> > > +       if (!ctx->gpiod)
> > > +               return;
> > > +
> > > +       dev_dbg(dev, "Setting GPIO to input\n");
> > > +
> > > +       gpiod_direction_input(ctx->gpiod);
> >
> > This is weird. Why set it to input?
>
> It seemed to me this would be more like the initial state, without knowin=
g
> the actual initial state.

In this case, though, you're trying to turn off the resource, not
trying to get back to the initial state. IMO deasserting the GPIO is
the way to do this. If the output needs to make it an input in this
case then it can use some type of open drain mode.


> > I would also say: given that you're providing a parameter anyway and
> > you're giving the GPIO name, can you please move away from the "raw"
> > values and move to "logical" values?
>
> I disagree. When hardware engineers design for swappable components, they
> likely look at the electrical compatibility of them. In this case, an
> active-high "enable" pin is electrically compatible with an active-low
> "reset" pin. If we use the logical value here, then we would need more
> logic to know when the logical polarity has to be reversed.
>
> Note that this doesn't work for components that are electrically
> incompatible. But in that case a lot more board dependent code would be
> needed anyway.

As we talked about in person, that made sense in the previous version
of the patch where you were looking for all GPIOs willy-nilly. Now
you'll be specifically asking for a GPIO by name and we should honor
the "active high" or "active low" nature of it.

-Doug
