Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE32563
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 16:28:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a6so12096964ejk.0
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Vv5wRMLm7eAUwbieA9P9R0i+n/Nx3ujFLOcNigvPcM=;
        b=Nh9bB1KB4S3CAncBLCOeNhoQBW4BpFg7ZxBEKFPIdrPjYLLIXTykS08+eEDZhFWyZ8
         Thpi+P0aSF7sVwTnCRHfToCT9gHhhfKUTdrju+t5E7uyVVjlUwgssiadvrQKU9v4qNGE
         UGaJC8AOLzUArHajp1eLxKaJ3Si9FAGFRr300FrLTKdRBLX62d7XQVrFh69vwxlKtd2C
         WxnNkYIZtoWVODJra1ZHi7tF1gH3RYCAfr02mNt988D5DFXmHfcUd4rFetFQle6MGTMj
         Ci6AYLRrWkvEwU37AQ9XJIDCkWAEFa0AQGz/XDUlpe355EzgRwDt0SJo0W1IsGoPS7Kn
         a4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Vv5wRMLm7eAUwbieA9P9R0i+n/Nx3ujFLOcNigvPcM=;
        b=jUcFHkKfaJJB2ZrPTz80qU3V/NvTZhdiH7mjXnxcNh+Jq3VRpz4ZBZlNwoLz1V+lxE
         dsSHRhBlW5VkX4ndBtA6NLfSo22UMISC1+VjM72lJL92uqtwxo6K3hQbzldVURlJNhJj
         i86xT7EmK7oSfmHs1V6c5FEzt4o94z2H0OublEIcdw7ZF2AgYpYRyPfLCmdo7SlIHzSx
         FxYvNsNr2+rhqetD0EJh5b/mcDkl8zE+CGdvUlg5KnhO2bbMgnoyh0j6fnyO89NIT1RW
         sfw+/VCRxFNqmDkb48xlDOG51vG5WH8FrrCSbs4yb4zcf91R+pkYkH6VkEREes+Yjv5X
         pelw==
X-Gm-Message-State: AOAM530JxtncowaXhQf7a5f/TyC0Kr+9j8YNHMVWbl+j1xhyuAMHyZwQ
	pdgAHmAQpRSaD6lqbeRX7px9bWXTy2nk/0r2ft4dvw==
X-Google-Smtp-Source: ABdhPJySuUD0Vc5Fggv3BJDcImC7/nHme84hjtmjDS8hx74rIZfA/aVAQ1ZlYO8FDlK29GQs74zzLvfuZR+3cWp4Nvs=
X-Received: by 2002:a17:906:300f:b0:6e0:b38d:777d with SMTP id
 15-20020a170906300f00b006e0b38d777dmr14328595ejz.189.1649348933215; Thu, 07
 Apr 2022 09:28:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
 <Yk4DGZfpYbK8dofL@chromium.org> <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
 <033c1ec4-4bee-a689-140c-9694dfee435b@gmail.com>
In-Reply-To: <033c1ec4-4bee-a689-140c-9694dfee435b@gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 7 Apr 2022 09:28:41 -0700
Message-ID: <CABXOdTet5ynSXf94qMimobJF4LLzHc89cVbwJ5NuAz8G6jmVdQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Prashant Malani <pmalani@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 6:16 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
[ ... ]
> >>>        ec_dev = dev_get_drvdata(&typec->ec->ec->dev);

I completely missed the part that this is not on the parent.

> >>> +     if (!ec_dev)
> >>> +             return -EPROBE_DEFER;
[ ... ]
>
> 1. The parent exists and dev_get_drvdata(pdev->dev.parent) returns
> non-NULL value. However, dev_get_drvdata(&typec->ec->ec->dev) returns
> NULL. (Yes, that is confusing.) I'm wondering

I am actually surprised that typec->ec->ec is not NULL. Underlying
problem (or, one underlying problem) is that it is set in
cros_ec_register():

        /* Register a platform device for the main EC instance */
        ec_dev->ec = platform_device_register_data(ec_dev->dev, "cros-ec-dev",
                                        PLATFORM_DEVID_AUTO, &ec_p,
                                        sizeof(struct cros_ec_platform));

"cros-ec-dev" is the mfd device which instantiates the character
device. On devicetree (arm64) systems, the typec device is registered
as child of google,cros-ec-spi and thus should be instantiated only
after the spi device has been instantiated. The same should happen on
ACPI systems, but I don't know if that is really correct.

I don't know what exactly is happening, but apparently typec
registration happens in parallel with cros-ec-dev registration, which
is delayed because the character device is not loaded. As mentioned, I
don't understand why typec->ec->ec is not NULL. Can you check what it
points to ?

Thanks,
Guenter

> dev_get_drvdata(pdev->dev.parent) returned NULL in the following crash
> log but it would be a problem distinct from what is handled with my patch:
> https://lore.kernel.org/lkml/CABXOdTe9u_DW=NZM1-J120Gu1gibDy8SsgHP3bJwwLsE_iuLAQ@mail.gmail.com/
>
> 2. My patch returns -EPROBE_DEFER instead of -ENODEV and I confirmed it
> will eventually be instantiated.
>
> Regards,
> Akihiko Odaki
>
> >
> > Guenter
> >
> >> Thanks,
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/chrome?id=ffebd90532728086007038986900426544e3df4e
>
