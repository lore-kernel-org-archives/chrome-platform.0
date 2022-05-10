Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5D23C2
	for <chrome-platform@lists.linux.dev>; Tue, 10 May 2022 10:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F4EC385C6;
	Tue, 10 May 2022 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652177425;
	bh=DdPFsUVSv7R67frGX61raO5JCCbtyzeekzE/nESThhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoJjIXCCfHHivO8X0PqX8WAbWdVeWOcgJe8Pw2cjWC1GJNQAqEp3rb2SBqvEZYo3A
	 XzGOdszW5aH8i4v65YuDO5qKM7reUe3SXBCfxbkTWuJoHQnk9TbbTphisu9pAA2fEf
	 3o8rkTmLwm6xUODtE5n/3P+/dOrtV26GhDBGS5UQ=
Date: Tue, 10 May 2022 12:10:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Collabora Kernel ML <kernel@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dtor@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>, vbendeb@chromium.org,
	Andy Shevchenko <andy@infradead.org>,
	Ayman Bagabas <ayman.bagabas@gmail.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
	Darren Hart <dvhart@infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Platform Driver <platform-driver-x86@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH RESEND v11] platform/chrome: Add ChromeOS ACPI device
 driver
Message-ID: <Yno6DtwL+Mhic2ek@kroah.com>
References: <YnoJ0k6eIUiwjXSZ@debian-BULLSEYE-live-builder-AMD64>
 <CAHp75Vd574LCnEq-KX=WHnnDyrjZgGu6W9wNEbnw79FBpyx=Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd574LCnEq-KX=WHnnDyrjZgGu6W9wNEbnw79FBpyx=Lw@mail.gmail.com>

On Tue, May 10, 2022 at 11:33:19AM +0200, Andy Shevchenko wrote:
> On Tue, May 10, 2022 at 8:44 AM Muhammad Usama Anjum
> <usama.anjum@collabora.com> wrote:
> >
> > From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >
> > The x86 Chromebooks have the ChromeOS ACPI device. This driver attaches
> > to the ChromeOS ACPI device and exports the values reported by ACPI in a
> > sysfs directory. This data isn't present in ACPI tables when read
> > through ACPI tools, hence a driver is needed to do it. The driver gets
> > data from firmware using the ACPI component of the kernel. The ACPI values
> > are presented in string form (numbers as decimal values) or binary
> > blobs, and can be accessed as the contents of the appropriate read only
> > files in the standard ACPI device's sysfs directory tree. This data is
> > consumed by the ChromeOS user space.
> 
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> 
> You can use --cc parameter to `git send-email` instead of putting
> these lines in the commit message.
> 
> ...
> 
> > +#define DEV_ATTR(_var, _name)                                  \
> > +       static struct device_attribute dev_attr_##_var =        \
> > +               __ATTR(_name, 0444, chromeos_first_level_attr_show, NULL);
> > +
> 
> Why not ATTR_RO()?

Try it and see, that will not work here.

thanks,

greg k-h
