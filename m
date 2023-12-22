Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D42EB14
	for <chrome-platform@lists.linux.dev>; Fri, 22 Dec 2023 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Irqf3Ro5"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bb945f88b4so237316b6e.3
        for <chrome-platform@lists.linux.dev>; Fri, 22 Dec 2023 14:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703283607; x=1703888407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh4GNA4Y05yXEeCWYCD5IWiPdQ5iIa0JnfPD6CHsXY4=;
        b=Irqf3Ro5a6u0rSjA3YGIUmmxcMCtwXidnlNDKiZyIUNPdxT49BAbGOk5OA+AP1k/1L
         rk5rwraO8X+aZDqgDiCjoaMvG0vHIeLABXIGDTCG/wsHbByfwSbvBL+il42Q+IGRGjvP
         IOv3RCe8iPhfzwtLarNPbaP9rmcv58e8kAWRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703283607; x=1703888407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh4GNA4Y05yXEeCWYCD5IWiPdQ5iIa0JnfPD6CHsXY4=;
        b=UEBQvPTvgafj2pg+P0WGEeBiGi78aVzyoXFR2jzrb1BOyyjdceEzeU7HzvcwWmWr3Q
         RUF6OTGWjLjoLgEHRJqKE4vLis4zuBSK0kqLVgubxsYpYnIFu0J+XLxHfFm1i1Onl9dO
         BhzYqfwCd0RLZmMwr0KlgIdccn+ua20FzRsmImfyF+yhG0Dleqvc992+wv7ac19Nho8Y
         nrjsScTlSvKV2cra+DGnDgcM6f9de0yG/aUQnchtSXsGS1bC72VJEHsTu6ZBLZQ/1c6a
         SfJCHCCbGT6nYt+cHfMPh5qxW5dCew5lMOxKDDQCR0TNW8lUKQdDEWKckLO35l78WXnJ
         e8Jw==
X-Gm-Message-State: AOJu0YxAXcDYOdCJdOb/5diDcLofEn3eoI9GwD7lrg0Mbo0TtsYGda56
	iEPl/eFZWAMHX3sc1fEHAJAnuAQCV8p1+H+j6eLqkG9zuJ0s
X-Google-Smtp-Source: AGHT+IH1gfrcqYhXI4r48hl59zh7w2/OMXufec1y3JujW5Fx/vftezklyAWWZx0YfAU1/S92XP07ZkzsKE7TgE5mhqY=
X-Received: by 2002:a05:6808:2014:b0:3b9:e20f:96e7 with SMTP id
 q20-20020a056808201400b003b9e20f96e7mr2217983oiw.28.1703283607328; Fri, 22
 Dec 2023 14:20:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org>
 <20231220165423.v2.22.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid> <ZYP-H27vsJvMTupH@google.com>
In-Reply-To: <ZYP-H27vsJvMTupH@google.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 22 Dec 2023 15:19:56 -0700
Message-ID: <CANg-bXAUiw-v3D6u3dzve3i65b29wqPSAnw3uuZ2mFNsVgY9Hw@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Raul Rangel <rrangel@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, Lee Jones <lee@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 1:58=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, Dec 20, 2023 at 04:54:36PM -0700, Mark Hasemeyer wrote:
> > The IRQ wake logic was added on an interface basis (lpc, spi, uart) as
> > opposed to adding it to cros_ec.c because the i2c subsystem already
> > enables the wakirq (if applicable) on our behalf.
>
> The setting flow are all the same.  I think helper functions in cros_ec.c=
 help
> to deduplicate the code.

I'll see what I can do.

> > +MODULE_DEVICE_TABLE(dmi, untrusted_fw_irq_wake_capable);
>
> Does it really need `MODULE_DEVICE_TABLE`?

Nope. Will drop.

> >       ret =3D cros_ec_register(ec_dev);
> >       if (ret) {
> > -             dev_err(dev, "couldn't register ec_dev (%d)\n", ret);
> > +             dev_err_probe(dev, ret, "couldn't register ec_dev (%d)\n"=
, ret);
>
> The change is irrelevant to the series.

I'll drop the use of dev_err_probe() to stay consistent with current
conventions. Perhaps it can be added in a follow-up patch.

> > @@ -470,6 +512,8 @@ static void cros_ec_lpc_remove(struct platform_devi=
ce *pdev)
> >               acpi_remove_notify_handler(adev->handle, ACPI_ALL_NOTIFY,
> >                                          cros_ec_lpc_acpi_notify);
> >
> > +     dev_pm_clear_wake_irq(dev);
> > +     device_init_wakeup(dev, false);
>
> Is it safe to call them anyway regardless of `irq_wake` in cros_ec_lpc_pr=
obe()?

According to bench tests, it's not a problem. That said, I am
refactoring the code to move the logic into cros_ec.c and will
conditionally call the cleanup functions.

> > +     if (!np)
> > +             return;
> > +
>
> The change is an improvement (or rather say it could change behavior).  B=
ut
> strictly speaking, the change is irrelevant to the series.

Will drop.

>
> > @@ -702,6 +710,11 @@ static void cros_ec_spi_dt_probe(struct cros_ec_sp=
i *ec_spi, struct device *dev)
> >       ret =3D of_property_read_u32(np, "google,cros-ec-spi-msg-delay", =
&val);
> >       if (!ret)
> >               ec_spi->end_of_msg_delay =3D val;
> > +
> > +     if (ec_dev->irq > 0 && of_property_read_bool(np, "wakeup-source")=
) {
>
> Or just use `spi->irq`[2].
>
> [2]: https://elixir.bootlin.com/linux/v6.6/source/drivers/platform/chrome=
/cros_ec_spi.c#L762
>
> They are the same, but does of_property_present() make more sense?

Yes it does. I'll use it.

> > @@ -768,6 +778,9 @@ static int cros_ec_spi_probe(struct spi_device *spi=
)
> >                          sizeof(struct ec_response_get_protocol_info);
> >       ec_dev->dout_size =3D sizeof(struct ec_host_request);
> >
> > +     /* Check for any DT properties */
> > +     cros_ec_spi_dt_probe(ec_spi, spi);
>
> `spi` is possibly not needed.  See comment above.

Agreed.
