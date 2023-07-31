Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5863363
	for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 02:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4B4C433C8;
	Mon, 31 Jul 2023 02:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690771752;
	bh=93mjwjWS+5eippvaNeLVIO9fWFBV3HLFIT0GQf3sQ+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OL0virMqBtH3YfYWAvCYF+XBgvacTe7hW77zWfy5W4VJQAPkMIt5mtllp7GYFUkoR
	 9ZhSihoOhnDzoTX+6Z7hZfRvWPcrmuFGPCxJyZ700NzYNHTP/7lbwFjdE66pm47XSy
	 AVZJp3yhBu5kli5MZPDPaKcYCq0Je/jiJItGnHA1yCeW1OGumamY6RKRVrz9cg+sNT
	 3BeaWdfv7vm3oPZ0uuXegBRVM0nQyI92T6lkcDhwr5k4GMkMKfDpYX6n3X7/yFH7nC
	 TsBxYYosYpzgMTFaJQygwM5TmtamU6faofBnOwkQDfuHZH2cRUqycj/oOgscUFt51q
	 AZdxSYfbcdDgQ==
Date: Mon, 31 Jul 2023 10:49:08 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: rafael@kernel.org, lenb@kernel.org, bleung@chromium.org,
	groeck@chromium.org, chrome-platform@lists.linux.dev,
	linux-acpi@vger.kernel.org, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: support official HID
 GOOG0016
Message-ID: <ZMchJBy7zlzP1KMN@google.com>
References: <20230728065438.4026629-1-tzungbi@kernel.org>
 <2b36d93d-16d5-9780-d292-a7d06b6c8e55@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b36d93d-16d5-9780-d292-a7d06b6c8e55@collabora.com>

On Fri, Jul 28, 2023 at 12:49:07PM +0500, Muhammad Usama Anjum wrote:
> On 7/28/23 11:54 AM, Tzung-Bi Shih wrote:
> > Support official HID GOOG0016 for ChromeOS ACPI (see [1]).
> > 
> > [1]: https://crrev.com/c/2266713
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Looks good other than the documentation.
> 
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

I didn't attach the R-b tag in v3
(https://patchwork.kernel.org/project/chrome-platform/patch/20230731024214.908235-1-tzungbi@kernel.org/).
Please review the documentation again.

> > --- a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> > +++ b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> > @@ -1,4 +1,4 @@
> > -What:		/sys/bus/platform/devices/GGL0001:*/BINF.2
> > +What:		/sys/bus/platform/devices/GOOG0016:*/BINF.2
> Probably just replace the GGL0001:* with G* here and define the G* can be
> GGL0001:* or GOOG0016:*.

Fix it in v3 by appending a new line for "GOOG0016".

> > --- a/Documentation/firmware-guide/acpi/chromeos-acpi-device.rst
> > +++ b/Documentation/firmware-guide/acpi/chromeos-acpi-device.rst
> > @@ -5,9 +5,8 @@ Chrome OS ACPI Device
> >  =====================
> >  
> >  Hardware functionality specific to Chrome OS is exposed through a Chrome OS ACPI device.
> > -The plug and play ID of a Chrome OS ACPI device is GGL0001. GGL is a valid PNP ID of Google.
> > -PNP ID can be used with the ACPI devices according to the guidelines. The following ACPI
> > -objects are supported:
> > +The plug and play ID of a Chrome OS ACPI device is GGL0001 and the hardware ID is
> > +GOOG0016.  The following ACPI objects are supported:
> Looks good. Probably GOOG0016 is HID which has higher preference over
> GGL0001 which is CID if both are defined in firmware?

Yes, I also guess so.
