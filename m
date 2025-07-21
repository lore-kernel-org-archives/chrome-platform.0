Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369819E806
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753090268; cv=none; b=qSpWzPTyxSVHRoltkhWkCaOt2MGttXvkPn4o4BtPmblmHhQa8GfXnwxGs0ejmjcM8SeL0IjkIawREciFJwHe4hs3eo8llVNCtJqTMtZOFjw79JM+vQfB4xoytZ5aFkliiDB2RcFOiedopa+ZjsHS9TwgKS4tRNSWaUsZKzrowRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753090268; c=relaxed/simple;
	bh=gXYRQ2rfjN+yhZudZGkMj34kZcPoQdvZaIKOx6G9p08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/pQTIrTmgdiWxLBtjGFw7PZ/54c7jPHdvCO9qrfmHy6FaLUju+tg5mNfMGZLklGDyH1vofutqtDBiMRFBMX3/H3suwZ10DEdbBE+2Wo6J1ZVRmWyO4ciGJ0IekbXl0CJIQgN9jgbRRndcwYbKe0xCAl5Zbjjrv27hD/9Jzik2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqFRU+Za; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqFRU+Za"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896B1C4CEED;
	Mon, 21 Jul 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090268;
	bh=gXYRQ2rfjN+yhZudZGkMj34kZcPoQdvZaIKOx6G9p08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqFRU+Zax3KDh4UOirYUOpuftojB8g4fpEZCBm4A/inNi5zLKCwYQGe7l9SJ8ZFfz
	 OTdGubJU3PYj2v8vRyA7yGOaGDCcJzA5nZ/vONtRwNxuEnBpHoMZZC6U79VwjIlqjj
	 iYscX6TJ2ybfUDE6cUQPgdRZU4TyUlAorriq1ehVWnk3q6l3Tih2fERlE0UuK5z3KV
	 ZxoEmWkEc2PKgLReA+7qJJCK++GoACmhCWmpL29yjFAS89d6R3QAv5QYTBsdIsD+3b
	 dPJjqIvfUv3CFvBclLNccc5CZCAB9wkFZMFKQSsCJXTkl9k4822+EyNR2xhOyZHo5n
	 HdQe0NwRNLcvQ==
Date: Mon, 21 Jul 2025 09:31:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 4/8] platform/chrome: Disallow sending commands
 through unregistered ec_dev
Message-ID: <aH4I2T0zwJmZf9mN@google.com>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-5-tzungbi@kernel.org>
 <2025072109-grafting-exemption-6f59@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072109-grafting-exemption-6f59@gregkh>

On Mon, Jul 21, 2025 at 07:47:47AM +0200, Greg KH wrote:
> On Mon, Jul 21, 2025 at 04:44:52AM +0000, Tzung-Bi Shih wrote:
> > Return earlier if attempting to send commands through an unregistered
> > struct cros_ec_device.
> 
> Why would it ever be "uregistered"?

If the EC rebooted while a userland program opened a file of the
chardev in cros_ec_chardev, the struct cros_ec_device [1][2] may be
unregistered due to some drivers re-probe the device.

The issue mainly comes from the discussion of cros_ec_usb [3]: using a
`registered_list` vs. calling cros_ec_{un,}register() everytime in
usb_driver's .probe()/.disconnect().

[1] https://elixir.bootlin.com/linux/v6.15/source/drivers/platform/chrome/cros_ec_chardev.c#L241
[2] https://elixir.bootlin.com/linux/v6.15/source/drivers/platform/chrome/cros_ec_chardev.c#L71
[3] https://lore.kernel.org/chrome-platform/20250624110028.409318-1-dawidn@google.com/T/#u

> > +/**
> > + * cros_ec_device_registered - Check if the ec_dev is registered.
> > + *
> > + * @ec_dev: EC device
> > + */
> > +bool cros_ec_device_registered(struct cros_ec_device *ec_dev)
> > +{
> > +	return atomic_read(&ec_dev->registered) == 1;
> > +}
> > +EXPORT_SYMBOL_GPL(cros_ec_device_registered);
> 
> This isn't going to do what you think it does :(
> 
> Hint, the state can change right after you call this, making it
> pointless.

In current use cases, once it turns from "registered" to "unregistered", it
should never back to "registered".  The flag is more or less to let the
kernel know the struct cros_ec_device is stale.  The object is still valid
for accessing because an opening file instance is referencing.
