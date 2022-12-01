Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF88C7C
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 03:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FEEC433C1;
	Thu,  1 Dec 2022 03:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669864041;
	bh=2cY4zaJ4s7Dtbw7itjf74pvQcjfkhz9LXxmZgGMMoMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZ5OHPbG4WOYoFe9YCrRoow2pkbh5nOWDHJgGAkmUKPMLpxpnTr77/0e6NYZ+ZQUk
	 SM/Vzt5vZNzUolro7aivLTmfCz8oxL3yTDwAJLC0/nKh8aQX468jlSHCuELusLRXF3
	 s89cdA+i4db38/3PxmHHipssBiq+PH/ktBTItrNkLxx8fkcm+jmonj9yg4m02H4Q6N
	 8G/R6Gr/i2OmbN+tDddv9vcbHWA+35g6jUARYjjdSH8rFbtP2wQfrW/Td/TkcHNHIM
	 13B+NRyxd2uwJNQ8X+6wPE9Qw181TkWD4LKgxjvVyVsOxnBKv6KoMj4cP0SIZcYcnX
	 TRb5BfK5NMgiw==
Date: Thu, 1 Dec 2022 11:07:17 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Raul Rangel <rrangel@chromium.org>
Cc: Mark Hasemeyer <markhas@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 3/3] platform/chrome: cros_ec_uart: Add DT enumeration
 support
Message-ID: <Y4gaZeqLj4RgLv6W@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
 <Y3cbswXxTKWhMjKT@google.com>
 <CANg-bXAxeL_N53umfeoYjAyDfw5EeHmcniZusPo+bb-BE1R4Ow@mail.gmail.com>
 <Y4cBwft2EMT4boPc@google.com>
 <CAHQZ30Dm1XbcQXjKXAfWUimL7NzYS8tkfwANpnB8kVRORsAjzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30Dm1XbcQXjKXAfWUimL7NzYS8tkfwANpnB8kVRORsAjzw@mail.gmail.com>

On Wed, Nov 30, 2022 at 09:52:29AM -0700, Raul Rangel wrote:
> On Wed, Nov 30, 2022 at 12:10 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Nov 29, 2022 at 11:13:04AM -0700, Mark Hasemeyer wrote:
> > > > > @@ -392,6 +393,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
> > > > >  static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
> > > > >                        cros_ec_uart_resume);
> > > > >
> > > > > +static const struct of_device_id cros_ec_uart_of_match[] = {
> > > > > +     { .compatible = "google,cros-ec-uart" },
> > > > > +     {}
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);
> > > >
> > > > It would need a guard for checking CONFIG_OF.  Similar to what
> > > > `cros_ec_uart_acpi_id` does.
> > > >
> > > > > @@ -405,6 +412,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
> > > > >       .driver = {
> > > > >               .name   = "cros-ec-uart",
> > > > >               .acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
> > > > > +             .of_match_table = cros_ec_uart_of_match,
> > > >
> > > > It would need be wrapped by `of_match_ptr()`.  Similar to what
> > > > `ACPI_PTR()` does.
> > >
> > > I'm not sure we want a guard in this case because we compile the kernel without
> > > CONFIG_OF enabled for (most?) x86 platforms. Yet we still need the device
> > > tree code to enumerate using the PRP0001 _HID method.
> >
> 
> > I'm not familiar to ACPI.  However, I thought it should add the compatible
> > string in the _DSD instead of using of_match for the case.  See example
> > in [1].
> >
> > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id
> 
> Correct, we need to add the compatible string inside the _DSD. This is
> what we currently do for all of our released devices:
> ```
>     Device (CRFP)
>     {
>         Name (_HID, "PRP0001")  // _HID: Hardware ID
>         Name (_UID, Zero)  // _UID: Unique ID
>         Name (_DDN, "Fingerprint Reader")  // _DDN: DOS Device Name
>         Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
>         {
>             ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device
> Properties for _DSD */,
>             Package (0x03)
>             {
>                 Package (0x02)
>                 {
>                     "compatible",
>                     "google,cros-ec-uart"
>                 },
>                 ...
>             }
>         }
>     }
> ```
> 
> Since we define our `_HID` as `PRP0001` we need the `of_match_table`
> so the ACPI node can bind.

I see.  I also found some more examples:
- 3c3969a0c99b ("iio:adc:ti-adc12138: Switch to generic firmware properties
                 and drop of_match_ptr")
- a70bbbe387d0 ("nfc: pn533: drop of_match_ptr from device ID table")
