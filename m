Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3490A29
	for <chrome-platform@lists.linux.dev>; Wed, 30 Nov 2022 07:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E09C433C1;
	Wed, 30 Nov 2022 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669792197;
	bh=S3FN4k08D0pVB5coWg5If0vJGIdhlpGBNTiGve4ONFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nzuzez4A6tT9e/VfybwB6cLZDu37zCJIRRrf8IF1lDOV+6yeKq8VVFB/trOs2/l8v
	 n1PZ3otmZBGmsvEtIRkr+vax/5CZxosVAA/m6uC3Qeo1uaJI/9DwQXDmQGQcwXdF7H
	 2xkdnX/tDRhd3zCSWkcoQzDbw7DUGEaZvDjwrbZF1bayvycXYLsyaFfcVBEGi9vJK0
	 NkRQ2VBkila15M2CG+XizlpArSeR4eGWVX0NEM9OScaxkQTGtzGt9mWB4E//g/mi1X
	 98BUAXK2LrTeIeK5ZG1V5j+QMYrz+lvMc+kdskoakT9zXQOouA0MX7QDl/M4W1FAWA
	 zlS/pxuW6OPBg==
Date: Wed, 30 Nov 2022 15:09:53 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 3/3] platform/chrome: cros_ec_uart: Add DT enumeration
 support
Message-ID: <Y4cBwft2EMT4boPc@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
 <Y3cbswXxTKWhMjKT@google.com>
 <CANg-bXAxeL_N53umfeoYjAyDfw5EeHmcniZusPo+bb-BE1R4Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANg-bXAxeL_N53umfeoYjAyDfw5EeHmcniZusPo+bb-BE1R4Ow@mail.gmail.com>

On Tue, Nov 29, 2022 at 11:13:04AM -0700, Mark Hasemeyer wrote:
> > > @@ -392,6 +393,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
> > >  static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
> > >                        cros_ec_uart_resume);
> > >
> > > +static const struct of_device_id cros_ec_uart_of_match[] = {
> > > +     { .compatible = "google,cros-ec-uart" },
> > > +     {}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);
> >
> > It would need a guard for checking CONFIG_OF.  Similar to what
> > `cros_ec_uart_acpi_id` does.
> >
> > > @@ -405,6 +412,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
> > >       .driver = {
> > >               .name   = "cros-ec-uart",
> > >               .acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
> > > +             .of_match_table = cros_ec_uart_of_match,
> >
> > It would need be wrapped by `of_match_ptr()`.  Similar to what
> > `ACPI_PTR()` does.
> 
> I'm not sure we want a guard in this case because we compile the kernel without
> CONFIG_OF enabled for (most?) x86 platforms. Yet we still need the device
> tree code to enumerate using the PRP0001 _HID method.

I'm not familiar to ACPI.  However, I thought it should add the compatible
string in the _DSD instead of using of_match for the case.  See example
in [1].

[1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id
