Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA9B3209
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 15:09:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id g23so20183862edy.13
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EW58m2+b9sI8zBQxJJNwiRm2NLx6RkDOvMaweiiKwJI=;
        b=kP0sjsAoi+T8Qd0UDI0pKRBJxpP0ihheGFQgxyMYs9AHtJ6sFLwBIzKvl2ZQUnbF61
         9n91OBEICBk2fREjbLlMG0LW3/mcvUaEjToNI49hAKWzZMxSTcWX8bjxpDW+dzkEKpcP
         63+I/QdvJSIPvl8JSQmUqWaKUnY52tyVnfi3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EW58m2+b9sI8zBQxJJNwiRm2NLx6RkDOvMaweiiKwJI=;
        b=D7o4pUip6deN2SHgMI9fyWtwrubUBCt04rXs1B0u1/o6RVgYWL+NjunIR0zH2adPlm
         RwzcTl7TiClIQq1j8KzpYV2lHdXoMbbbJ6wnYXZt/FVI5o6MlDg9m6D9z53Vk2AwbevL
         R3ED+yr4jvzOGcEiT4QWloHLASgk8r7d8x7z8l7Uec4HprpPb2qYHAWO6DUfIvh4OEVz
         C8sHPojC/GO1uc+dhCqejC2jscGc1I2dI3UoH5FcFSsfeZer5jmiyUOicd2yro7l96m/
         /LT5jUlBEl+xjXG2d04H6jRz6sJQqKpvxQjbNAImn5081qA963ERSe4ThYs1kC9oy5mT
         tt2g==
X-Gm-Message-State: AOAM533guIU0u1iTPc7XuESo7SwTmq7te61dU9CWk6s8+Tc/WMhL00hb
	mtVVIRe5uPW7zoZfrz4FTqi3XQAkW5VMXr9I
X-Google-Smtp-Source: ABdhPJwzb3nIRUgY5UIE2H/Ur2zCIw40sB0kNhkjtEcBKrz8HfT7hMWmLfjyBCzoemx96yOlNO5Lzg==
X-Received: by 2002:a05:6402:1d90:b0:425:dd36:447c with SMTP id dk16-20020a0564021d9000b00425dd36447cmr18661440edb.347.1651590565723;
        Tue, 03 May 2022 08:09:25 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id f8-20020a50fc88000000b0042617ba63b6sm7958374edq.64.2022.05.03.08.09.23
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:09:24 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id m62so10051673wme.5
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 08:09:23 -0700 (PDT)
X-Received: by 2002:a05:600c:4e44:b0:394:46b4:7b0e with SMTP id
 e4-20020a05600c4e4400b0039446b47b0emr3671832wmq.29.1651590563205; Tue, 03 May
 2022 08:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220503042242.3597561-1-swboyd@chromium.org> <20220503042242.3597561-3-swboyd@chromium.org>
In-Reply-To: <20220503042242.3597561-3-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 May 2022 08:09:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDHwOeQOFevwH9rfd=UN9OcEoOS=HeydYnNAZMUdCaBQ@mail.gmail.com>
Message-ID: <CAD=FV=XDHwOeQOFevwH9rfd=UN9OcEoOS=HeydYnNAZMUdCaBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Input: cros-ec-keyb - skip keyboard registration
 w/o cros-ec-keyb compatible
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, May 2, 2022 at 9:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> In commit 4352e23a7ff2 ("Input: cros-ec-keyb - only register keyboard if
> rows/columns exist") we skipped registration of the keyboard if the
> row/columns property didn't exist, but that has a slight problem for
> existing DTBs. The DTBs have the rows/columns properties, so removing
> the properties to indicate only switches exist makes this keyboard
> driver fail to probe, resulting in broken power and volume buttons. Ease
> the migration of existing DTBs by skipping keyboard registration if the
> google,cros-ec-keyb-switches compatible exists.
>
> The end result is that new DTBs can either choose to remove the matrix
> keymap properties or leave them in place and add this new compatible
> indicating the matrix keyboard properties should be ignored. Existing
> DTBs will continue to work, but they will keep registering the keyboard
> that does nothing. To fix that problem we can add this extra compatible
> to existing devicetrees and the keyboard will stop being registered.
> Finally, if google,cros-ec-keyb is missing then this driver won't even
> attempt to register the matrix keyboard. Of course, this driver won't
> probe until this patch is applied in that scenario, but that's OK. This
> last case is likely only going to be used by new devicetrees created
> after this commit.
>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Fixes: 4352e23a7ff2 ("Input: cros-ec-keyb - only register keyboard if rows/columns exist")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index eef909e52e23..04c550aaf897 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -536,14 +536,11 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         u32 *physmap;
>         u32 key_pos;
>         unsigned int row, col, scancode, n_physmap;
> +       bool register_keyboard;
>
> -       /*
> -        * No rows and columns? There isn't a matrix but maybe there are
> -        * switches to register in cros_ec_keyb_register_bs() because
> -        * this is a detachable device.
> -        */
> -       if (!device_property_present(dev, "keypad,num-rows") &&
> -           !device_property_present(dev, "keypad,num-cols"))
> +       /* Skip matrix registration if no keyboard */
> +       register_keyboard = device_get_match_data(dev);
> +       if (!register_keyboard)
>                 return 0;

I'm a little on the fence about the local variable. It could have been
shorter as:

/* Skip matrix registration if no keyboard */
if (!device_get_match_data(dev))

...but I guess the "register_keyboard" maybe makes it more a little
more obvious?

In any case, I'm happy either way:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
