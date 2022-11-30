Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD736ADB
	for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 16:52:42 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b21so17260398plc.9
        for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 08:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6c57TrNa1xcClHezph2gUK6a15ufM6LCFiURMV8YWow=;
        b=K3t8SVWbj+moagBOegxEUsIQJhDnMJ/D7UsKpI1mWjxW+DfbSupIAJqmuyXLYyz1m9
         gKgKF45AG17pHAWhJNkmbcV0fznVGtHkJoVp9J3ZH1zhIVGBcl3GVkZsIkBYM92zTW6v
         H8GEZY3SwtR3/xoD+Gw/VHVcjonhAzUnONUhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c57TrNa1xcClHezph2gUK6a15ufM6LCFiURMV8YWow=;
        b=2U8kz63QR+pXKL0e0iGrCgD4GSzZ3Pb9p472IEVhMxiZj7Xss2CCGqqbb2zsvHxN0s
         QFIUGZ4S7HkpfFVg+PDabjAKiPT3Rg2gmlYyBYMZR8FNGY8QRS71DGa0hS8YxVI+sMc2
         1DDbF5Ja6O+pXY1RNfimMfRnBsuduoTzQ2WNtJe/UmxfW0iLAYd6F1kJ6QEcokpf0PrE
         e4MTEm6ZagMaPgs27fW7RURLjBXWl5DHrNfWfV11EGknF7iBhPG5fzoQhIv3yQuqG3W1
         TBOL3io8yqB0Hbcbdkiy2uRGetZrQFxk3f7aRR2E2JS+nUY07q34Glb2Y966z8KBI1nK
         3ibA==
X-Gm-Message-State: ANoB5pl0I99f+cWRhwLjoohWlI1NzNXgOun+y4tv7GNkyOCHnviq8xMQ
	maeLC63EamLvFTQjGwPmGNZYmBpvT1aNAA==
X-Google-Smtp-Source: AA0mqf5jKxPLWuodbUZbKuFPYkvDyS2ZOFQqn9f++O16wH8pUKvuamNfEteisdtFJCFRa1oJ6Rkypw==
X-Received: by 2002:a17:90b:3d03:b0:213:1e05:f991 with SMTP id pt3-20020a17090b3d0300b002131e05f991mr73109694pjb.216.1669827162306;
        Wed, 30 Nov 2022 08:52:42 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id ij27-20020a170902ab5b00b00188f7ad561asm1696797plb.249.2022.11.30.08.52.41
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:52:41 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so2374223pjt.0
        for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 08:52:41 -0800 (PST)
X-Received: by 2002:a17:90a:2b44:b0:213:d66b:4973 with SMTP id
 y4-20020a17090a2b4400b00213d66b4973mr72186366pjc.85.1669827160411; Wed, 30
 Nov 2022 08:52:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
 <Y3cbswXxTKWhMjKT@google.com> <CANg-bXAxeL_N53umfeoYjAyDfw5EeHmcniZusPo+bb-BE1R4Ow@mail.gmail.com>
 <Y4cBwft2EMT4boPc@google.com>
In-Reply-To: <Y4cBwft2EMT4boPc@google.com>
From: Raul Rangel <rrangel@chromium.org>
Date: Wed, 30 Nov 2022 09:52:29 -0700
X-Gmail-Original-Message-ID: <CAHQZ30Dm1XbcQXjKXAfWUimL7NzYS8tkfwANpnB8kVRORsAjzw@mail.gmail.com>
Message-ID: <CAHQZ30Dm1XbcQXjKXAfWUimL7NzYS8tkfwANpnB8kVRORsAjzw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 30, 2022 at 12:10 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Tue, Nov 29, 2022 at 11:13:04AM -0700, Mark Hasemeyer wrote:
> > > > @@ -392,6 +393,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
> > > >  static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
> > > >                        cros_ec_uart_resume);
> > > >
> > > > +static const struct of_device_id cros_ec_uart_of_match[] = {
> > > > +     { .compatible = "google,cros-ec-uart" },
> > > > +     {}
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);
> > >
> > > It would need a guard for checking CONFIG_OF.  Similar to what
> > > `cros_ec_uart_acpi_id` does.
> > >
> > > > @@ -405,6 +412,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
> > > >       .driver = {
> > > >               .name   = "cros-ec-uart",
> > > >               .acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
> > > > +             .of_match_table = cros_ec_uart_of_match,
> > >
> > > It would need be wrapped by `of_match_ptr()`.  Similar to what
> > > `ACPI_PTR()` does.
> >
> > I'm not sure we want a guard in this case because we compile the kernel without
> > CONFIG_OF enabled for (most?) x86 platforms. Yet we still need the device
> > tree code to enumerate using the PRP0001 _HID method.
>

> I'm not familiar to ACPI.  However, I thought it should add the compatible
> string in the _DSD instead of using of_match for the case.  See example
> in [1].
>
> [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id

Correct, we need to add the compatible string inside the _DSD. This is
what we currently do for all of our released devices:
```
    Device (CRFP)
    {
        Name (_HID, "PRP0001")  // _HID: Hardware ID
        Name (_UID, Zero)  // _UID: Unique ID
        Name (_DDN, "Fingerprint Reader")  // _DDN: DOS Device Name
        Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
        {
            ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device
Properties for _DSD */,
            Package (0x03)
            {
                Package (0x02)
                {
                    "compatible",
                    "google,cros-ec-uart"
                },
                ...
            }
        }
    }
```

Since we define our `_HID` as `PRP0001` we need the `of_match_table`
so the ACPI node can bind.
