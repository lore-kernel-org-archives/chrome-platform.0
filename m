Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E22F53
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 16:31:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id dn9so4364383ejc.7
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p//OL3T6T+iN+FpDjfuUmP5riPz2KYcNknEDuB/63us=;
        b=HF8nglO6RLS42LhMGPwU417dT3o8bFVVjPZzDZcbanY06ClqopKuBKQQU1LZQUhO5S
         NEhS+aWaepXdOK0WvU3br7GmA/8ahc2XqAOmWNJ+LFIbL+RcEv2urYKmBw5ajgqOGkeh
         apYfB5DJYPJq5LTDksliy4vJFF53Ir7RVtrshF8wUK7A1xTELvEProa/y6yELs/e4LY8
         frplHjzR2nOycNk1RBKZBPcLuBQPOnjMfoqY3Tv+yo2z3BpQYuCcDhyl7sYevwjJr30D
         tDtvZwENa5izGVrK9Y4Y5+tbAIjm7w7cgNiSAYiIYQsaLhAPt3qGABGzy2VDl5VFQ4E6
         +uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p//OL3T6T+iN+FpDjfuUmP5riPz2KYcNknEDuB/63us=;
        b=bPOPsyit0+TwOovlM2U+8hYFR0JtfZjycLE0+IBr5QyH7Kh3uSqDnNfHUToPnUfll2
         EXDh329qcs//gEqRBzQg+XL41SR0UNQycCxecqgqsTDcO/nCpvOWZLhmHKXSeoxrUm+k
         fs/oYsR+G+Zw+8T0gcXTVodFAb18XpM4zBaBBj3kP103G+he3awnk7rtH4SX44q0UzZL
         6tYEdagodDSEp1SvuaM0DLhTqLVX0CSkc1O2V2NWA5qKczOwZGmJcygZfuba5TqqcyJt
         9zpcRJDa5CoblY6WsXrYC5QKcpaQp1yATZyrVbE8cywFOM0DSkJ7OJ9sVrCpzktH8G24
         trbA==
X-Gm-Message-State: AJIora+naestfTvFLmy5SjL1Me0Tj34jKlb3lY8p8vFiIrWjNSmsFiBe
	wLK/r7EmZ/bvMPrFr2/d/kOBOqSTzexVvBSwP1lIRh4txlSzVQ==
X-Google-Smtp-Source: AGRyM1tslEArlUfNDokY8EHUpH/4NgM51Pos2+EKbdCQr9xr2S3BEu6GusHrPhOhK5hSALoSNQmSxnTrARz8rLDib0A=
X-Received: by 2002:a17:906:9753:b0:722:f1e3:ec27 with SMTP id
 o19-20020a170906975300b00722f1e3ec27mr9415771ejy.355.1657816296819; Thu, 14
 Jul 2022 09:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714160951.9364-1-pdk@semihalf.com>
In-Reply-To: <20220714160951.9364-1-pdk@semihalf.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 14 Jul 2022 09:31:25 -0700
Message-ID: <CABXOdTck1VSxf8r-NGW_YCvpMdLe7hx=7sGFzQVH9Ok51hfbQg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: Update version on
 GET_NEXT_EVENT failure
To: Patryk Duda <pdk@semihalf.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 9:09 AM Patryk Duda <pdk@semihalf.com> wrote:
>
> Some EC based devices (e.g. Fingerpint MCU) can jump to RO part of the
> firmware (intentionally or due to device reboot). The RO part doesn't
> change during the device lifecycle, so it won't support newer version
> of EC_CMD_GET_NEXT_EVENT command.
>
> Function cros_ec_query_all() is responsible for finding maximum
> supported MKBP event version. It's usually called when the device is
> running RW part of the firmware, so the command version can be
> potentially higher than version supported by the RO.
>
> The problem was fixed by updating maximum supported version when the
> device returns EC_RES_INVALID_VERSION (mapped to -ENOPROTOOPT). That way
> the kernel will use highest common version supported by RO and RW.
>
> Fixes: 3300fdd630d4 ("platform/chrome: cros_ec: handle MKBP more events flag")
> Cc: <stable@vger.kernel.org> # 5.10+
> Signed-off-by: Patryk Duda <pdk@semihalf.com>

Nice catch. That may explain some hung task issues. observed in
EC_CMD_GET_NEXT_EVENT handling

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> When Fingerprint MCU is rebooted (e.g. as a part of tests) it jumps to
> the RO image and performs RW image signature check. If kernel calls
> EC_CMD_GET_NEXT_EVENT FPMCU RO will respond with EC_RES_INVALID_VERSION
> because it's older than RW and supports up to version 1 of the command.
> As a result kernel keeps trying to get MKBP events and effectively
> blocks FPMCU from jumping to RW image.
>
> Before patch 3300fdd630d4 the driver called version 1 of the command.
> If the device responded with EC_RES_INVALID_VERSION, the driver would
> use version 0 of the command.
>
> Best regards,
> Patryk
>
>  drivers/platform/chrome/cros_ec_proto.c | 32 +++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index ff767dccdf0f6..0a131045d50a9 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -750,6 +750,7 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
>         u8 event_type;
>         u32 host_event;
>         int ret;
> +       u32 ver_mask = 0;
>
>         /*
>          * Default value for wake_event.
> @@ -771,6 +772,37 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
>                 return get_keyboard_state_event(ec_dev);
>
>         ret = get_next_event(ec_dev);
> +       /*
> +        * -ENOPROTOOPT is returned when EC returns EC_RES_INVALID_VERSION.
> +        * This can occur when EC based device (e.g. Fingerprint MCU) jumps to
> +        * the RO image which doesn't support newer version of the command. In
> +        * this case we will attempt to update maximum supported version of the
> +        * EC_CMD_GET_NEXT_EVENT.
> +        */
> +       if (ret == -ENOPROTOOPT) {
> +               dev_dbg(ec_dev->dev,
> +                       "GET_NEXT_EVENT returned invalid version error.\n");
> +               ret = cros_ec_get_host_command_version_mask(ec_dev,
> +                                                       EC_CMD_GET_NEXT_EVENT,
> +                                                       &ver_mask);
> +               if (ret < 0 || ver_mask == 0)
> +                       /*
> +                        * Do not change the MKBP supported version if we can't
> +                        * obtain supported version correctly. Please note that
> +                        * calling EC_CMD_GET_NEXT_EVENT returned
> +                        * EC_RES_INVALID_VERSION which means that the command
> +                        * is present.
> +                        */
> +                       return -ENOPROTOOPT;
> +
> +               ec_dev->mkbp_event_supported = fls(ver_mask);
> +               dev_dbg(ec_dev->dev, "MKBP support version changed to %u\n",
> +                       ec_dev->mkbp_event_supported - 1);
> +
> +               /* Try to get next event with new MKBP support version set. */
> +               ret = get_next_event(ec_dev);
> +       }
> +
>         if (ret <= 0)
>                 return ret;
>
> --
> 2.31.0
>
