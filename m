Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376EA5A
	for <chrome-platform@lists.linux.dev>; Wed, 10 Jan 2024 00:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nt8wOaye"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28da6285c1so636569266b.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Jan 2024 16:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704845725; x=1705450525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kAqGhucPMVtfo1InPdfTFWkdNUtgMKoqN9J3JzON2c=;
        b=nt8wOayemc6TK+giMDXekmUvunYDcX91q3mVnOK4GvtjqbATliav+DQJtc5lQNg8Ly
         Mc1fC9FrhHee4utBwtcR1epK+0GyTQs98ocee1nw21igDUfJ5v4VaYlA30UxWfjTMxyZ
         V/44IvX5lAriWohC7rZFOSfz5CamanJ5+nz/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704845725; x=1705450525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kAqGhucPMVtfo1InPdfTFWkdNUtgMKoqN9J3JzON2c=;
        b=Epx2c6eMvixRRvPL64IeqqDZNUPuPtEtD47WCgotgK91hIUWOfgYtBhpkAqtyLZ5il
         vIE20i50evUo7DAzL76XEoSQ/Ehbic/cZw4OUXPZMzWE1gePXzQmsfBs1WVkEHozyKm8
         YtnID5mawbqTTsw3qllYCHwi2Kk3MM/g1BqRYpxa4Pp4PccgMYjZ9BolFus93uvUyGbm
         qZPEbgu3W504dLP9nJnoyiw9fauPqqbSeJniWcG8tSKMdxmG84Qw/8BkPY3fJLY4lyYd
         ce1JOv2cjT6ZaCSOP5SjVKlZ3ux3vV3kLzi2jN13HJ8Z1JolS5m5fs0+V7oRoghcCnWv
         y2Ww==
X-Gm-Message-State: AOJu0YwkxNyw/hPy68enh132TFBArDvBcAc/pfqLouZ8b3asD8i6ySHp
	jkbuKngF0JlF1h2zqOScUJd2u4I3hwowp9wHFQuWlmrugA8/rsg=
X-Google-Smtp-Source: AGHT+IHig6WKeWmuLPG8kUlY4c89k4XrNXTnujvsC2Ac9Fh3GgXIIdQMoOFzCncWOk1thXnRRQ6j7g==
X-Received: by 2002:a17:906:4948:b0:a19:a409:37dc with SMTP id f8-20020a170906494800b00a19a40937dcmr266254ejt.53.1704845725789;
        Tue, 09 Jan 2024 16:15:25 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id m2-20020a170906234200b00a2684d2e684sm1534892eja.92.2024.01.09.16.15.25
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 16:15:25 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-557bbcaa4c0so1975a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 09 Jan 2024 16:15:25 -0800 (PST)
X-Received: by 2002:a05:600c:43c5:b0:40d:5fee:130 with SMTP id
 f5-20020a05600c43c500b0040d5fee0130mr62920wmn.5.1704845704513; Tue, 09 Jan
 2024 16:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1704835845.git.u.kleine-koenig@pengutronix.de> <53d8c545aa8f79a920358be9e72e382b3981bdc4.1704835845.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <53d8c545aa8f79a920358be9e72e382b3981bdc4.1704835845.git.u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Jan 2024 16:14:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UyoSc7fpvaO08Bhj54UG5b1OGteXV95tCVkpDzrvzwsw@mail.gmail.com>
Message-ID: <CAD=FV=UyoSc7fpvaO08Bhj54UG5b1OGteXV95tCVkpDzrvzwsw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pwm: Drop useless member .of_pwm_n_cells of struct pwm_chip
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, dri-devel@lists.freedesktop.org, 
	kernel@pengutronix.de, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 9, 2024 at 1:35=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Apart from the two of_xlate implementations this member is write-only.
> In the of_xlate functions of_pwm_xlate_with_flags() and
> of_pwm_single_xlate() it's more sensible to check for args->args_count
> because this is what is actually used in the device tree.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/pwm/core.c                    | 22 +++-------------------
>  drivers/pwm/pwm-clps711x.c            |  1 -
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  4 +---
>  include/linux/pwm.h                   |  2 --
>  6 files changed, 4 insertions(+), 27 deletions(-)

I haven't done massive thinking about this, but it seems reasonable to
me. I remember being confused about why we needed some of these extra
checks ages ago when I looked at this code, so getting rid of them
makes sense to me.

I've been involved with both the ti-sn65dsi86.c and the pwm-cros-ec.c
code and both looks fine to me.

I'm an official reviewer for ti-sn65dsi86.c and I'm fairly happy with
this tag for it:

Acked-by: Douglas Anderson <dianders@chromium.org>

...and I think it would be fine to go through the PWM tree. If one of
the senior drm-misc maintainers disagrees with me, however, then you
should listen to them rather than me.

-Doug
