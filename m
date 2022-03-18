Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1426444
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 23:36:33 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id q189so10418502oia.9
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 16:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9510QlOxQvZ3nhopdTAXfUeaDVrn5TXlOAghoZpABDc=;
        b=bLw+H1mUjkxQ5SZ5DN/+e74d5PKWXX6Zfr9EEhXwp2u2e4E6Y2z5avLxYH5kIw9Yfh
         RdPw7yiMyyqp3C5MkBXxLWkQ/DYxlS6o3hboyYoaAFHVT1fssDwIuUApuSXfX73uZH/h
         CE1yZWbsIFrR/kQvcLJTSxlk48QoaMZbDk7T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9510QlOxQvZ3nhopdTAXfUeaDVrn5TXlOAghoZpABDc=;
        b=PFkKd69SLhii7pg36PFeiC/xKaAdh9hKGo7plDFCM6X/sGnlfouN3QhZFmlH1IjYSF
         +jHyqZNG14RrE1eBAmF1pVoQH80iwyO2BEgu073rozjJqux6HvKkNdSkTgWu9fdXxYHg
         tWwCsrbrCKs7jhalb/vw7sL6lM2HSAlZXX5BdVVCfgFmGVfCMAkbEvcDR1YCyRz3fMK6
         5MOgdpIo8SZK19ZHyCVW5Dh/dNmmlNXVZN4ZyVI3swK2m/6Z8kkSVTjmYSwqtBJkrG3a
         PaZ6Jfn6pGRMT++h+G/+AJK59GYVX5xSkvWnSA0Pt3ZTLWcpvBqrzoGsrDeI82PUVO2f
         73gg==
X-Gm-Message-State: AOAM532TNDrF+g2XI2Roh64GaXwIYaDEYG4+H2mtDn/HoPmHVNINsjtX
	wfgfbYE0WF/zDbxsSWolWgPypS4YiWo8P4HWb9uWdg==
X-Google-Smtp-Source: ABdhPJy7QbZ146Qy3U7WG9hK2aKW6Y4gfc9cFivoiww8VoFuLCNFF5uB9X+AFqCpc0IXGJSkTaHE8rAqOEgnqeaN6RE=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5062201oie.193.1647646592659; Fri, 18
 Mar 2022 16:36:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Mar 2022 16:36:32 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V9U-zzpYNLKxqg1xh+W-RXLzV6BxaO4ZVF0GVXBVujUQ@mail.gmail.com>
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-4-swboyd@chromium.org>
 <CAD=FV=VJFoNgfMUHE5mUY6Uq2Jj5cyQVyW0osUm6jyHRE1no=w@mail.gmail.com>
 <CAE-0n50HcLLUUDgiMc7u4Gx5gb-bcpO22iD9emHrnM8sx8nbOQ@mail.gmail.com> <CAD=FV=V9U-zzpYNLKxqg1xh+W-RXLzV6BxaO4ZVF0GVXBVujUQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Mar 2022 16:36:32 -0700
Message-ID: <CAE-0n534-bDXrGUPMxs9qb0F26mO7XyegSt+c4GXKR7ywegcqw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
To: Doug Anderson <dianders@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Doug Anderson (2022-03-18 15:06:59)
> Hi,
>
> On Fri, Mar 18, 2022 at 3:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > > > @@ -703,6 +706,37 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
> > > >         ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
> > > >         if (!ret)
> > > >                 ec_spi->end_of_msg_delay = val;
> > > > +
> > > > +       if (!of_device_is_compatible(np, "google,cros-ec-fp"))
> > > > +               return 0;
> > >
> > > I noticed in your previous patch that you not only added a device-tree
> > > match for this device but also a "spi_device_id". ...but won't you
> > > fail to do all this important GPIO work in that case?
> >
> > I don't know when the spi_device_id path will be used. Never? I can
> > simply drop it from the spi_device_id list for now and we can take up
> > this problem later or never.
>
> That's fine with me. I was guessing it was relevant for x86 but my
> experience with the way x86 does things is pretty minimal.
>

Ah, I think the x86 path also uses the of_device_id, but it is still
google,cros-ec-spi so it won't be affected until conforming to the new
binding.

>
> > > > +       ec_spi->boot0 = devm_gpiod_get(dev, "boot0", 0);
> > > > +       if (IS_ERR(ec_spi->boot0))
> > > > +               return PTR_ERR(ec_spi->boot0);
> > >
> > > Right now these GPIOs don't actually need to be stored in the "ec_spi"
> > > structure. They could just be local variables. I guess you're trying
> > > to future proof?
> >
> > Sure I will drop them because they're not useful later and I can save on
> > the kernel-doc.
> >
> > >
> > >
> > > > +       ec_spi->reset = devm_gpiod_get(dev, "reset", 0);
> > > > +       if (IS_ERR(ec_spi->reset))
> > > > +               return PTR_ERR(ec_spi->reset);
> > > > +
> > > > +       /*
> > > > +        * Take the FPMCU out of reset and wait for it to boot if it's in
> > > > +        * bootloader mode or held in reset. This isn't the normal flow because
> > > > +        * typically the BIOS has already powered on the device to avoid the
> > > > +        * multi-second delay waiting for the FPMCU to boot and be responsive.
> > > > +        */
> > > > +       if (gpiod_get_value(ec_spi->boot0) || gpiod_get_value(ec_spi->reset)) {
> > > > +               /* Boot0 is sampled on reset deassertion */
> > > > +               gpiod_set_value(ec_spi->boot0, 0);
> > > > +               gpiod_set_value(ec_spi->reset, 1);
> > > > +               usleep_range(1000, 2000);
> > > > +               gpiod_set_value(ec_spi->reset, 0);
> > > > +
> > > > +               /* Wait for boot; there isn't a "boot done" signal */
> > > > +               dev_info(dev, "Waiting for FPMCU to boot\n");
> > > > +               msleep(2000);
> > > > +       }
> > >
> > > You added the regulator to the bindings. On herobrine I know that the
> > > regulator is a bit of a dummy (at least on herobrine), but I wonder if
> > > you should still get/enable it here? In the device tree bindings you
> > > listed it as not-optional so, in theory, you could use this to give an
> > > error if someone didn't provide the regulator.
> >
> > Won't the regulator framework introduce a dummy supply if there isn't a
> > supply in DT but this driver calls regulator_get()? Getting and enabling
> > it here will make this even more independent though so it sounds like a
> > good idea. That way we can make it a real regulator in the DTS as long
> > as the firmware isn't controlling it.
>
> I was thinking of regulator_get_optional(). You know the call you use
> when your regulator isn't "optional"? (Sorry, it always cracks me up
> that "optional" is exactly opposite the meaning for regulator compared
> to everyone else).

Oh my.

>
>
> > > BTW: it seems like it wouldn't be a _crazy_ amount of extra work to:
> > >
> > > 1. Add a sysfs hook for turning the regulator on/off
> > >
> > > 2. Change the Chrome OS userspace to actually use the sysfs hook if it's there.
> > >
> > > 3. Actually have the kernel in charge of turning the regulator off/on
> > >
> > > Doing this at the same time as the transition over to the more real
> > > "cros-ec-fp" would be nice so we don't have to figure out how to
> > > transition later. Said another way: If we don't transition now then I
> > > guess later we'd have to find some way to detect that the regulator
> > > specified in the kernel was actually a dummy and didn't really control
> > > the power?
> >
> > I'd rather not expose regulator control to userspace through some other
> > sysfs attribute. Instead I'd prefer the flashing logic that twiddles
> > gpios and power live all in the kernel and have userspace interact with
> > a character device to program the firmware.
>
> Yeah, that would be even better, you're right.
>
> Hmmm, so maybe the answer is to just delay adding the regulator until
> we're actually ready to specify it correctly and have the flashing
> happen in the kernel?
>

I can enable it during probe just so that if the BIOS isn't doing it
we'll have something that works assuming the DT is actually controlling
the regulator. Or do nothing. It doesn't matter right now.
