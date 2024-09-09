Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1A1ACE0B
	for <chrome-platform@lists.linux.dev>; Mon,  9 Sep 2024 03:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725852272; cv=none; b=HMiFPlZsedJND1B7OnuydioaNqndZsBwOc1g4Z4IkWFVTOS6Q8XpSIPN8vX0oAd5yeCMazpUMUSYsPVybL2nmElBj1QgxQ0hc4AozOC5nsBGJ/KnYTJLv56Z9ZiUbYbniHHOymCqwKeooqWmxtfCu94YfB62fePRxBuRHh9k1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725852272; c=relaxed/simple;
	bh=G7T4bpgolBzILEWM6GVCDO1R1TBWpnOO2nt9s8m4VzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Nu4TVeAlcoGz1I9c7y1WJh5u+vOdrX/UiiQbLoMgHk7hjrHBHO9MeWRV5AJf3r+dCCr1RvnBbWeJggUxm5MsF7s4rie/KtUbtodMs0l0Xno4729fV/dQYEA4JCvpYsO5G0px5oWdHxxjcc1pmr45kBZmxOsuRtA3lmyozCLcN6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bVaGuMdz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bVaGuMdz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365cc68efaso1886366e87.1
        for <chrome-platform@lists.linux.dev>; Sun, 08 Sep 2024 20:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725852268; x=1726457068; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frs1KSFCSS0JpElWdth4hB4NSBy03nJOWJU9+47Nzc4=;
        b=bVaGuMdzX6UEfnucKsrfxBgwNQyFpVbe7HPk5aV2WnuhgzWC9OrGNWHkKf3LJ3KOun
         FF6rj4o2HLHFlWW90twlpxxPXWK8N2Yh1qdhnHiTI1/mHiWquhn4YieZKkGk8Ww57QMg
         ddalVOFoH/xFKcpFVx8xfFfaxAUnUj8JpIKqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725852268; x=1726457068;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frs1KSFCSS0JpElWdth4hB4NSBy03nJOWJU9+47Nzc4=;
        b=MMAoBuJpLMjobAsp3Idu7QgGp7xtuJfl1A+r1ruj9nLWfjJ3OvO2K+/RGfvhsADZUX
         DZveM9mIlquvPTnkA7+Fmav6rQAacH4yaccQd6Vo68NhQ9LSLeKX5yFC8AJKQzzVED9i
         P+hWVbCa5H3Sx8OREX8ofltTYSeZg/aaB15HeEUYduEfg7lB5B1lTMvLeKM8tI6jawnL
         T/M0pi4SHuMwzI6iM2Xt7Q0vbQAgJdfR0+66q/IJ5lJZ4KFTjFTgmVAjB3Gc9yuRy26a
         yQ9ZlfZ+kYgCJYLMuCqqwRNyT1ZqCJHz6MlUcYXuilAFmJGXNqCmAdjTUa3hUMoSYWL+
         FbeA==
X-Forwarded-Encrypted: i=1; AJvYcCWehurRQbMFsZTcxff3Y6kSyWSf70SBvFkHa+OOxYbqhskVIJca1zN6tsU0HfB6YpUF3KaDx7YPuRzQwJW+/9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTxhg6EHLxvTufCrcuB7Y+HfZApg6JjLAxk4lrTI2v0GCXZu48
	1RGck8+QBQ2a5lRXjN2nss1wqh9WhbrxM5Kb392/oJjD8gMu9uWOATUS/I/nybb6JKW9becg8om
	ucc6hAPkt7ERYfPHKqf2RP7o3/c3VHpzaj5Ak
X-Google-Smtp-Source: AGHT+IGGXKgPLETTHLUWOOhnE7DlxTOB7pQ5xz6dQdhouSMW1QPkyBdJaUNfm4Ni6IhLXaV+O7X1PD7KISZ/W6Rojug=
X-Received: by 2002:a05:6512:ea6:b0:536:5551:b73f with SMTP id
 2adb3069b0e04-536587b547emr5811005e87.31.1725852268014; Sun, 08 Sep 2024
 20:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <ZtyGJhm-0GEEFfYf@shikoro>
In-Reply-To: <ZtyGJhm-0GEEFfYf@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 11:24:17 +0800
Message-ID: <CAGXv+5F8rTLdYGjkxyJqUxs=W_L9gGgpHRZZ250swbvDR=zJMQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] platform/chrome: Introduce DT hardware prober
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 12:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> this series gets quite some review from people I trust. This is awesome.
> So, I will keep to some high level questions:
>
> > undiscoverable devices" [2] series, but follows the scheme suggested by
> > Rob, marking all second source component device nodes as "fail-needs-pr=
obe",
> > and having a hardware prober driver enable the one of them.
>
> Where is this "fail-needs-probe" documented? I neither see it here nor
> in the dt-schema repo.

You are correct that it has not been documented yet. I will send a patch
to the dt-schema repo.

> > The other case, selecting a display panel to use based on the SKU ID
> > from the firmware, hit a bit of an issue with fixing the OF graph.
> > It has been left out since v3.
>
> Does it make sense then to add touchscreens only? Will the panels be
> worked on once this is upstream? Or what is the way forward?

The devices this patch series targets all use eDP panels, which are
more or less directly probe-able.

The panels mentioned for the second phase are MIPI panels, which require
specific power and command sequences and thus are not probe-able. This
will be worked on once this part is done. For the panels it is entirely
handled in the chrome platform device tree prober. See the following
patch for an earlier version of it:

    https://lore.kernel.org/all/20231109100606.1245545-6-wenst@chromium.org=
/

> > Wolfram, would you be able to handle the late PR? Assuming you get a
> > chance to look at the patches that is.
>
> Yes, I can do this, but...
>
> >  drivers/i2c/Makefile                          |   7 +-
> >  drivers/i2c/i2c-core-of-prober.c              | 437 ++++++++++++++++++
>
> ... this is quite some code. Would you be willing to maintain it (i.e.
> please add a MAINTAINERS entry then). Kudos for not touching other parts
> of the I2C core!

Sure!

> All the best,
>
>    Wolfram

Thanks. There are still some comments to address, in particular making
the prober more of a pluggable framework and exposing more code as
helpers.


ChenYu
