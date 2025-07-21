Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DEE19DF62
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753093496; cv=none; b=X2xh3GSITbONOpQBZI4rrhirVJHyUmfXf4TCv0DHgbkpey5EvF40dXfP1D15bohFLQD97Vfx8RixrIGZAkawJXzluLps59+JBjpxWy1byGwVrEEGgbv5U+FuJB/8+X7bZlTurgvbbVppP6XNujgIW8nIm2BOim98YgRjqNeR3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753093496; c=relaxed/simple;
	bh=yjqdSBd0RE/AL6iYU9nqVwiwLUE15KQbUBud07iLHqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4EFZf4UNhWb/ZEAVR/xyGcpSlu4nhgaIeo1jsr8718lMW4No4E1PlQQNfAJ3vdbaHu391NN2PdcqKhSjGmBvlbDZiVwEkc4yCxxIdzHzlsWoTBy2gbxOdS5gKxPOg8IAbq68HXJyH0RkKPLCUZCI1O7cpVRLsH0Etx7EELRg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1gy5yZUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1gy5yZUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FBCC4CEF1;
	Mon, 21 Jul 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753093496;
	bh=yjqdSBd0RE/AL6iYU9nqVwiwLUE15KQbUBud07iLHqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1gy5yZUwU124tHLpO4I/4TjTiIKbj7fs8wg0dX7oJq8yULexiAg+PYIueszpToBab
	 Zrb8lHpUhLXNSFdG/nQb1ljWGeffK1Fiz0aN0trNUQrQOvI4K3oW2+wmOgb8iu+vJr
	 6Z19stS/3xooGCXjUKFUlByd2WiReTy2gr4rA74s=
Date: Mon, 21 Jul 2025 12:23:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 4/8] platform/chrome: Disallow sending commands
 through unregistered ec_dev
Message-ID: <2025072116-emission-accurate-a66e@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-5-tzungbi@kernel.org>
 <2025072109-grafting-exemption-6f59@gregkh>
 <aH4I2T0zwJmZf9mN@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH4I2T0zwJmZf9mN@google.com>

On Mon, Jul 21, 2025 at 09:31:05AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jul 21, 2025 at 07:47:47AM +0200, Greg KH wrote:
> > On Mon, Jul 21, 2025 at 04:44:52AM +0000, Tzung-Bi Shih wrote:
> > > Return earlier if attempting to send commands through an unregistered
> > > struct cros_ec_device.
> > 
> > Why would it ever be "uregistered"?
> 
> If the EC rebooted while a userland program opened a file of the
> chardev in cros_ec_chardev, the struct cros_ec_device [1][2] may be
> unregistered due to some drivers re-probe the device.

Ah, the fun "disconnect the device while the file is open" issue we have
in many subsystems :(

> The issue mainly comes from the discussion of cros_ec_usb [3]: using a
> `registered_list` vs. calling cros_ec_{un,}register() everytime in
> usb_driver's .probe()/.disconnect().
> 
> [1] https://elixir.bootlin.com/linux/v6.15/source/drivers/platform/chrome/cros_ec_chardev.c#L241
> [2] https://elixir.bootlin.com/linux/v6.15/source/drivers/platform/chrome/cros_ec_chardev.c#L71
> [3] https://lore.kernel.org/chrome-platform/20250624110028.409318-1-dawidn@google.com/T/#u
> 
> > > +/**
> > > + * cros_ec_device_registered - Check if the ec_dev is registered.
> > > + *
> > > + * @ec_dev: EC device
> > > + */
> > > +bool cros_ec_device_registered(struct cros_ec_device *ec_dev)
> > > +{
> > > +	return atomic_read(&ec_dev->registered) == 1;
> > > +}
> > > +EXPORT_SYMBOL_GPL(cros_ec_device_registered);
> > 
> > This isn't going to do what you think it does :(
> > 
> > Hint, the state can change right after you call this, making it
> > pointless.
> 
> In current use cases, once it turns from "registered" to "unregistered", it
> should never back to "registered".  The flag is more or less to let the
> kernel know the struct cros_ec_device is stale.  The object is still valid
> for accessing because an opening file instance is referencing.

But again, you don't know if it just went from "registered" ->
"unregistered" after calling this function and getting a return value of
"I am registered!".

Do it right, with a real lock, an atomic value provides nothing here
other than the potential to reduce a race window, not actually prevent
it from happening at all.

thanks,

greg k-h
