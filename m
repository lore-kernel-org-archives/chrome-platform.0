Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF128F9
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A62AC385CB;
	Thu, 12 May 2022 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652350932;
	bh=MwEdIPt8V7IcGJwcblLAwmE2i5Lh/8BkDawpPULT2II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaC4Ro+XrApotYdCJoxHvramF2ezR+O1E0eYlTMMjWtxZfspVKTMSqdhNgqa2PoSt
	 24TK/sqR8iJkV1q6I0626qlpJb2xtMk8LcDR2jwXRoIPlUkPMclaoNAQH7Jjk+nFcO
	 HeoQmg8OyKK0QDaOt+Sb8HlNE3Nh2sl5aDg+zH3s=
Date: Thu, 12 May 2022 12:22:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
	dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org,
	andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
	Darren Hart <dvhart@infradead.org>,
	Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v12] platform/chrome: Add ChromeOS ACPI device driver
Message-ID: <YnzfzRhGwtO9RtNi@kroah.com>
References: <YnycZaoBPF89t/qF@debian-BULLSEYE-live-builder-AMD64>
 <YnzdDMPR3qZ1waJW@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnzdDMPR3qZ1waJW@google.com>

On Thu, May 12, 2022 at 03:10:20AM -0700, Dmitry Torokhov wrote:
> Hi Muhammad,
> 
> On Thu, May 12, 2022 at 10:34:29AM +0500, Muhammad Usama Anjum wrote:
> > +static int chromeos_acpi_device_probe(struct platform_device *pdev)
> > +{
> > +	chromeos_acpi_gpio_groups = get_gpio_pkg_num(&pdev->dev);
> > +
> > +	/*
> > +	 * If the platform has more GPIO attribute groups than the number of
> > +	 * groups this driver supports, give out a warning message.
> > +	 */
> > +	if (chromeos_acpi_gpio_groups > ARRAY_SIZE(chromeos_acpi_all_groups) - 2)
> > +		dev_warn(&pdev->dev, "Only %zu GPIO attr groups supported by the driver out of total %u.\n",
> > +			 ARRAY_SIZE(chromeos_acpi_all_groups) - 2, chromeos_acpi_gpio_groups);
> 
> I know that we can bikeshed this until dawn of time, but we are dealing
> here with data coming from the system firmware and a singleton device,
> so it should be all available pretty early in boot sequence. I
> understand we want to solve the "race" even though it is purely
> theoretical, but we should be able to figure out what gpios are
> supported and construct the groups array(s) before registering the
> platform driver. Or do we see that runtime costs of constricting groups
> dynamically outweigh space wasted by unused groups?

I really really do not like dynamically created groups as it's more
complex and fragile.  This is much simpler code overall.

thanks,

greg k-h
