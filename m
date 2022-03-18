Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893825388
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 22:07:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t1so11772412edc.3
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/PgRfIslwsblO9zs4IuflguSgx5ur6/sINxkAa/wJQ8=;
        b=NBBZs0yX1MpQvQZX+/cGcj9KOegchui9KkSF/Ws9PW8CZgsDN2tKyH2HhNf9Ru7WfX
         7FjmgPE57eobo/0ULeKp+gMpIc2IniNJt+Yjp/PK63GuSRYZYF9Sn3mnm+O8uYX5dPR0
         6a+n1vtCLN00OLimQ1bd9iKYygFXWdI7x0pT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PgRfIslwsblO9zs4IuflguSgx5ur6/sINxkAa/wJQ8=;
        b=ha8QnJsvKpkW8CcVX5yIvAH+2Avkw4cIhDrGMuB3I1cSa9EmCNid8gKPr/p6d0FF/9
         5aJJTeJNjvKOwp+39bIemKfIKYh+q2iJKIeG7pAttbJYR6Plv4ucS1b5cw3p7wocdvqY
         bzqSbJysfuK6m2gaTHTvlkMIRyHEQp+zMORy5dV0760dujmQb4yaFmSiKhTlBpKEF9FI
         fj5zw4JFUAIj2NPAriemp86jcGkvR+vJi2kukcxTgOqnmCGFuuJwJ8pbKEJ9fRMU79A8
         LmokNCcPJjvl5sjNJ7MUqop0BAjk/sX2UX6BXqWvD4MK7wmM7zhCL5pH75Yp7NW8kp0+
         u4aA==
X-Gm-Message-State: AOAM532j4BgO9GWjiHuh/Zzvhn/g/9gBuousKCTMqXxVs8AJ+60irfvd
	BmorXY2KDt5C1xOqPixVFLXYz5hFpc0yghn8GxU=
X-Google-Smtp-Source: ABdhPJxrSbY664E7VsWLpSwSW7nCbVqb680xwly3Jk3UHLJAB3fh1FpzOsM4dOPn0EnsM96tyjfyhQ==
X-Received: by 2002:a05:6402:2691:b0:416:8dab:b5e7 with SMTP id w17-20020a056402269100b004168dabb5e7mr11932199edd.358.1647641233310;
        Fri, 18 Mar 2022 15:07:13 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id h17-20020a05640250d100b004185745f856sm4699070edb.74.2022.03.18.15.07.12
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 15:07:12 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so5459991wmb.3
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 15:07:12 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:389:eadf:108e with SMTP id
 l6-20020a05600c4f0600b00389eadf108emr17299036wmq.34.1647641231833; Fri, 18
 Mar 2022 15:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-4-swboyd@chromium.org>
 <CAD=FV=VJFoNgfMUHE5mUY6Uq2Jj5cyQVyW0osUm6jyHRE1no=w@mail.gmail.com> <CAE-0n50HcLLUUDgiMc7u4Gx5gb-bcpO22iD9emHrnM8sx8nbOQ@mail.gmail.com>
In-Reply-To: <CAE-0n50HcLLUUDgiMc7u4Gx5gb-bcpO22iD9emHrnM8sx8nbOQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 15:06:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9U-zzpYNLKxqg1xh+W-RXLzV6BxaO4ZVF0GVXBVujUQ@mail.gmail.com>
Message-ID: <CAD=FV=V9U-zzpYNLKxqg1xh+W-RXLzV6BxaO4ZVF0GVXBVujUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Mar 18, 2022 at 3:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > @@ -703,6 +706,37 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
> > >         ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
> > >         if (!ret)
> > >                 ec_spi->end_of_msg_delay = val;
> > > +
> > > +       if (!of_device_is_compatible(np, "google,cros-ec-fp"))
> > > +               return 0;
> >
> > I noticed in your previous patch that you not only added a device-tree
> > match for this device but also a "spi_device_id". ...but won't you
> > fail to do all this important GPIO work in that case?
>
> I don't know when the spi_device_id path will be used. Never? I can
> simply drop it from the spi_device_id list for now and we can take up
> this problem later or never.

That's fine with me. I was guessing it was relevant for x86 but my
experience with the way x86 does things is pretty minimal.


> > > +       ec_spi->boot0 = devm_gpiod_get(dev, "boot0", 0);
> > > +       if (IS_ERR(ec_spi->boot0))
> > > +               return PTR_ERR(ec_spi->boot0);
> >
> > Right now these GPIOs don't actually need to be stored in the "ec_spi"
> > structure. They could just be local variables. I guess you're trying
> > to future proof?
>
> Sure I will drop them because they're not useful later and I can save on
> the kernel-doc.
>
> >
> >
> > > +       ec_spi->reset = devm_gpiod_get(dev, "reset", 0);
> > > +       if (IS_ERR(ec_spi->reset))
> > > +               return PTR_ERR(ec_spi->reset);
> > > +
> > > +       /*
> > > +        * Take the FPMCU out of reset and wait for it to boot if it's in
> > > +        * bootloader mode or held in reset. This isn't the normal flow because
> > > +        * typically the BIOS has already powered on the device to avoid the
> > > +        * multi-second delay waiting for the FPMCU to boot and be responsive.
> > > +        */
> > > +       if (gpiod_get_value(ec_spi->boot0) || gpiod_get_value(ec_spi->reset)) {
> > > +               /* Boot0 is sampled on reset deassertion */
> > > +               gpiod_set_value(ec_spi->boot0, 0);
> > > +               gpiod_set_value(ec_spi->reset, 1);
> > > +               usleep_range(1000, 2000);
> > > +               gpiod_set_value(ec_spi->reset, 0);
> > > +
> > > +               /* Wait for boot; there isn't a "boot done" signal */
> > > +               dev_info(dev, "Waiting for FPMCU to boot\n");
> > > +               msleep(2000);
> > > +       }
> >
> > You added the regulator to the bindings. On herobrine I know that the
> > regulator is a bit of a dummy (at least on herobrine), but I wonder if
> > you should still get/enable it here? In the device tree bindings you
> > listed it as not-optional so, in theory, you could use this to give an
> > error if someone didn't provide the regulator.
>
> Won't the regulator framework introduce a dummy supply if there isn't a
> supply in DT but this driver calls regulator_get()? Getting and enabling
> it here will make this even more independent though so it sounds like a
> good idea. That way we can make it a real regulator in the DTS as long
> as the firmware isn't controlling it.

I was thinking of regulator_get_optional(). You know the call you use
when your regulator isn't "optional"? (Sorry, it always cracks me up
that "optional" is exactly opposite the meaning for regulator compared
to everyone else).


> > BTW: it seems like it wouldn't be a _crazy_ amount of extra work to:
> >
> > 1. Add a sysfs hook for turning the regulator on/off
> >
> > 2. Change the Chrome OS userspace to actually use the sysfs hook if it's there.
> >
> > 3. Actually have the kernel in charge of turning the regulator off/on
> >
> > Doing this at the same time as the transition over to the more real
> > "cros-ec-fp" would be nice so we don't have to figure out how to
> > transition later. Said another way: If we don't transition now then I
> > guess later we'd have to find some way to detect that the regulator
> > specified in the kernel was actually a dummy and didn't really control
> > the power?
>
> I'd rather not expose regulator control to userspace through some other
> sysfs attribute. Instead I'd prefer the flashing logic that twiddles
> gpios and power live all in the kernel and have userspace interact with
> a character device to program the firmware.

Yeah, that would be even better, you're right.

Hmmm, so maybe the answer is to just delay adding the regulator until
we're actually ready to specify it correctly and have the flashing
happen in the kernel?

-Doug
