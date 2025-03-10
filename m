Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0021522B581
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612965; cv=none; b=DYmEFlcXLjYHh6exmvaqUcwdxLf5s4e7jmbt4YWaIQi/BUaPnPgHNmRIXwEj9L9mOTcsgDaHAW+xr8brMyVC4wI1xpe89NFWZ3rYO6L38F5K+McnSzlVrvD8nl6KN8hGmRjzdX7TqHXQvGhayHHTzH2roIUl55de/OMHvhunijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612965; c=relaxed/simple;
	bh=DPKb8ThpUtf/tZId/Di1QGFds3FHv0BZjzDL63AUYKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8WhmERjyvnrSBvcj0hMwaAXdAQNo9rCvh1ousrR7spIClKLzvacpqEKDw+s+gO5YTqtWjDyk+C04rVk26vPFqDhnDNrC0KTe5zWmaY/NZthtqdVKNqJG4PjWCw8TwaskTj7iOjdHybSXr1pfjFjN/Nzlc0D9Gnc8nL7Oe0I9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xWh2ZHYC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xWh2ZHYC"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so4262313e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741612961; x=1742217761; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIR94qx8xpSJrcrgyo8EcRbXb4tKFO0K352zXBNzI/Q=;
        b=xWh2ZHYC5kVXaoi7bztZLlfnNYukQ0DVOcaxXWARhZ79zP6gUq262hh4TaPe9nrLZW
         MSCvxpPQHMqy2IWu1Ck/TtmNB/tmO4aKuKCsUAmWcFRL1T3V/wbhh+J+FzCJ0s3Ol5Ce
         vdIjtOKPEK6z5qVpVLCGK/FZGS1coljH9gZnbfqmnrlDp91UD16FdI0CO89q66+p2AUV
         4fVQPVgGYUIJatg39FsNZ8+vt6Jp0uUjStLmwqDqTW4qio10B9f9xxmLTi3vYnP93ZQI
         tqM/IXgMXZ0g5FRL0Y7HqE4EWGWgTptfvgj2VEBEGN+h/I/pj0wp0Za8b6zh1Pf4HF3h
         hzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612961; x=1742217761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIR94qx8xpSJrcrgyo8EcRbXb4tKFO0K352zXBNzI/Q=;
        b=n8nNzlPtm7yomZcJzVyjL28ZYu1v/nNLjfVQVsh9qkxpgGmkg0cHPrFd4ll100QHRS
         PEZC71Q5zPNQnzVPm48649+eO1F/lX2putKV5ad7xLmOga72weB7bX9XLG1vEHUn0gtw
         2vWF1bhhZscer/oM9kB/D/MSfNujRiUO8CpHs8ttuPlhL7iQZSFY9GsMCCulUNb4mTaP
         N1vd4GxWLuJbFGQI7S8gkLQg5qIEFMG+6Wq9YXr9Au/oXrc4SCJm7NF0bTL71Rm7UkzV
         iD7cG9Fr4tWExgobHBLFQIx1P8bXESO8T1d4S+M0DVl6BjLNFbSRR1+Q3zMQ1ViB02no
         Nf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8JiK1v6YHhYDBDw3tMjsh5S8PzK5gRezwdLFkVyWmyhZcHkpNof3PvqQwnrGPARP110E5n+IjOAFDyxmKeKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSaWkNX+V3EuAO3wQeBEl/BTlHHk9/EYhqyanOZ/DiUFGXedp5
	O9N0Emeruq/GzGdGbgTEvFi6VTLJ9ItoP4OrkV8HqrrImrNrI1yeB6r1rKh8NYyB63rKWQvYCDZ
	VztUiEQk1n6NgaZoErVZQwSyKmS+MSprSpYiutQ==
X-Gm-Gg: ASbGncvn/vqvqdIzir544rQRJjY3FuR3isRQtwj1eE43POZHc08XH9ttn8Y3t5yJOFi
	T7jlJvGjhJwfKN+0s5Lb8nteK9JbiMOU521pZJ7bRt3HDgmizcZz6FXJ8L1OU/eRUmhmOwTs4T+
	x292z/Q5K+C9NrdNBHB640gcFnBi4BZC27nthdA+pYDWKlRKkGGCe/snzXrg==
X-Google-Smtp-Source: AGHT+IEt6orrR0LbnqijRHsXsXIoP9u4govV2U4kennnDAB8LKxqgLR624RGe5IQ9d0SgevP43EOtHRqT3+K9YyJF4I=
X-Received: by 2002:a05:6512:3b14:b0:545:2c2c:5802 with SMTP id
 2adb3069b0e04-54990ec1da0mr4456748e87.48.1741612960898; Mon, 10 Mar 2025
 06:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org> <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
In-Reply-To: <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 14:22:29 +0100
X-Gm-Features: AQ5f1Jr6exc6jnbdN8OgJKfOfnFqkqPylc587CtLf_MV91ith_zm5SakUGtCL8Q
Message-ID: <CAMRc=MfofTMnfCYenUTstWUeGN5RYzJTrg2nGSzCe8tdBMksmw@mail.gmail.com>
Subject: Re: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Michael Buesch <m@bues.ch>, Thomas Richard <thomas.richard@bootlin.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Andy Shevchenko <andy@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	chrome-platform@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 2:20=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> > @@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip=
, unsigned int offset,
> >        * we are dealing with - then we are done
> >        */
> >       if (offset =3D=3D HALL_GPIO_OFFSET)
> > -             return;
> > +             return 0;
>
> Should this be -EINVAL (or, can this check be just dropped?) Value of an
> input pin is tried to be set.
>

I don't want to break existing users but I did notice that and figured
that we should rather check this in core GPIO code not each individual
driver.

I put that on my TODO list.

Bart
