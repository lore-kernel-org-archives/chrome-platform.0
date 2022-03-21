Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E543F612C
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 20:04:37 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id k10so5507624edj.2
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EphSPWlAG/seg8/XxUJ+C6+QPSj46eTtMcd7G1mgPek=;
        b=GJiGVlHHVxpjdeq+5wwQIz8f5/ZJWDeVpfFx00K5d5coCxSF4lf0U5NM44hce0/8dS
         cDFuTSLXY1Tt08BWUK1bQeUbHtbjiOlkx/fMqd5T3EQHiTBKDRUWj5duxUWAnfoZwX6n
         MJ+uELUJaR+tdQCDhu96nQH9BWXME35LCBwrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EphSPWlAG/seg8/XxUJ+C6+QPSj46eTtMcd7G1mgPek=;
        b=NBSTxejx1KgkDQfOf+EH03ndoSniXBPeSCR5xVWGgLkONlNciZl4LPdMWBaigqsFQd
         sPPbZ586O8W/oDLwNGagNu+Cfr5GWRQlqT8yQAHjCZnOcypxDldrBIb34SRsirMmwzHd
         SAv/Ys6VNtDwWRqOo5kIUGb8lhrdpMSU4D2uc+6G/Yu935N5K5OZZ0kIIhYl7XCk49Gp
         LjBXu9HOzsUa9xOk+4ZtYCy1Vb0N5qXkQtragZu34mnpCDtkdeAbAwciFatUsyU8XO6Y
         eJ8OjxAFkqPN+46/PSVKRleWR6NSvO4hQ+ce/u9wK8LKuxyITY6J8S8rFzGwEQzPKh6e
         uEhQ==
X-Gm-Message-State: AOAM530qFMgYgmIneetQ9e3VLypUmcfMZHtqhalY1M+Y3Sd6mc9do9Zx
	S+LFecbuxSf/SkDoXuPswhoGxhnXg+7TRQ==
X-Google-Smtp-Source: ABdhPJyZ/reeY5R9zaD8QkgxMKwyFEkMAVBow9pJuZLGqNAa0Qh6X0+6p7wHdN/sEy0zWjKDPJms4w==
X-Received: by 2002:a05:6402:280f:b0:419:4c6f:a91b with SMTP id h15-20020a056402280f00b004194c6fa91bmr4042380ede.84.1647893075788;
        Mon, 21 Mar 2022 13:04:35 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id qa44-20020a17090786ac00b006dbcd7c9656sm7276162ejc.172.2022.03.21.13.04.34
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 13:04:35 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id j18so12577227wrd.6
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 13:04:34 -0700 (PDT)
X-Received: by 2002:a5d:5551:0:b0:203:f916:e319 with SMTP id
 g17-20020a5d5551000000b00203f916e319mr13385092wrw.422.1647893074416; Mon, 21
 Mar 2022 13:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220321191100.1993-1-swboyd@chromium.org> <20220321191100.1993-4-swboyd@chromium.org>
In-Reply-To: <20220321191100.1993-4-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Mar 2022 13:04:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXeJVVbJhdcoCc8iUESZ-Vz07iY-yt1OY3EM9m7T-axw@mail.gmail.com>
Message-ID: <CAD=FV=UXeJVVbJhdcoCc8iUESZ-Vz07iY-yt1OY3EM9m7T-axw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Mar 21, 2022 at 12:11 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add gpio control to this driver so that the fingerprint device can be
> booted if the BIOS isn't doing it already. This eases bringup of new
> hardware as we don't have to wait for the BIOS to be ready, supports
> kexec where the GPIOs may not be configured by the previous boot stage,
> and is all around good hygiene because we control GPIOs for this device
> from the device driver.
>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_spi.c | 42 +++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 51b64b392c51..92518f90f86e 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -4,6 +4,7 @@
>  // Copyright (C) 2012 Google, Inc
>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -690,11 +691,13 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
>         return cros_ec_xfer_high_pri(ec_dev, ec_msg, do_cros_ec_cmd_xfer_spi);
>  }
>
> -static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
> +static int cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
>  {
>         struct device_node *np = dev->of_node;
>         u32 val;
>         int ret;
> +       struct gpio_desc *boot0;
> +       struct gpio_desc *reset;
>
>         ret = of_property_read_u32(np, "google,cros-ec-spi-pre-delay", &val);
>         if (!ret)
> @@ -703,6 +706,37 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
>         ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
>         if (!ret)
>                 ec_spi->end_of_msg_delay = val;
> +
> +       if (!of_device_is_compatible(np, "google,cros-ec-fp"))
> +               return 0;
> +
> +       boot0 = devm_gpiod_get(dev, "boot0", 0);

I think that the last parameter to devm_gpiod_get() is better
described by "GPIOD_ASIS", right? Same for the other one below.


> +       if (IS_ERR(boot0))
> +               return PTR_ERR(boot0);
> +
> +       reset = devm_gpiod_get(dev, "reset", 0);
> +       if (IS_ERR(reset))
> +               return PTR_ERR(reset);
> +
> +       /*
> +        * Take the FPMCU out of reset and wait for it to boot if it's in
> +        * bootloader mode or held in reset. This isn't the normal flow because
> +        * typically the BIOS has already powered on the device to avoid the
> +        * multi-second delay waiting for the FPMCU to boot and be responsive.
> +        */
> +       if (gpiod_get_value(boot0) || gpiod_get_value(reset)) {

I believe that the above two calls are illegal as documented. The file
`Documentation/driver-api/gpio/consumer.rst` says that if you use
`GPIOD_ASIS` to get the GPIO that "The direction must be set later
with one of the dedicated functions.". The "must" there is important.

Oh, and further down it appears to be even more explicit and says "Be
aware that there is no default direction for GPIOs. Therefore, **using
a GPIO without setting its direction first is illegal and will result
in undefined behavior!**".

I assume that "get" counts as using?

I think this sorta gets into some of the limitations of the GPIO APIs
in Linux that try to make sure that they work on a "lowest common
denominator" GPIO controller. I don't think they promise that
"get_value" while in output mode is legal across all GPIO controllers.

Maybe a solution is to at least add a comment saying that the code
will only work on GPIO controllers that will let you get the value
back if it's an output?


> +               /* Boot0 is sampled on reset deassertion */
> +               gpiod_set_value(boot0, 0);
> +               gpiod_set_value(reset, 1);

Those two calls are almost certainly illegal / not guaranteed to work
without setting a direction, at least in the general case. Luckily I
think it's easy to just change both of them to
"gpiod_direction_output", which takes a value.

Actually, even on Qualcomm hardware I don't think those will work if
the boot direction was input, will they? They'll set the value that
_will_ be driven but won't cause it to actually be driven, right?


-Doug
