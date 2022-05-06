Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD674811
	for <chrome-platform@lists.linux.dev>; Fri,  6 May 2022 14:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DAAC385A8;
	Fri,  6 May 2022 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651845794;
	bh=Emk1IbJ2UesPOraVK4BnXsCwa0LZVJhuV2lPmWaVRLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdh/rtV4MKgB8zkWvw/OwKlwFYoiCYKaG6WsLT4UCiz1oTt+O2CSEjMjUgPP5ZMXL
	 m2m3/hYIqEfh+vDN1jyoGhMaupgskJzP1PNv7RHmX2GuhGjXWuQweBk98X15HxfENF
	 DkaGiDJbd8iRFp7mBilcCA2uwPLo+ayZIhvduE8M=
Date: Fri, 6 May 2022 16:03:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
	dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org,
	andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
	Darren Hart <dvhart@infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v9] platform/chrome: Add ChromeOS ACPI device driver
Message-ID: <YnUqn9/4oQ+wHeQR@kroah.com>
References: <YnTw/iQ1Asjjmsb9@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnTw/iQ1Asjjmsb9@debian-BULLSEYE-live-builder-AMD64>

On Fri, May 06, 2022 at 02:57:18PM +0500, Muhammad Usama Anjum wrote:
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> The x86 Chromebooks have the ChromeOS ACPI device. This driver attaches
> to the ChromeOS ACPI device and exports the values reported by ACPI in a
> sysfs directory. This data isn't present in ACPI tables when read
> through ACPI tools, hence a driver is needed to do it. The driver gets
> data from firmware using the ACPI component of the kernel. The ACPI values
> are presented in string form (numbers as decimal values) or binary
> blobs, and can be accessed as the contents of the appropriate read only
> files in the standard ACPI device's sysfs directory tree. This data is
> consumed by the ChromeOS user space.
> 
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Co-developed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> The driver's implementation has been changed completely after Greg's
> comment. I've updated the authorship of the module to myself. Enric,
> Please let me know if yuo are comfortable with this.
> 
> Changes in v9:
> - Changed the implementation completely
> - Move the driver to drivers/platform/chrome
> - Remove Acked-by Rafael as driver has changed
> - Corrected some typos
> - Changed the author of the module

Looks like you need a v10 :(

