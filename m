Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9EA184E
	for <chrome-platform@lists.linux.dev>; Fri, 25 Jul 2025 04:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753419509; cv=none; b=ltmp03KvmDA9twvzf9vTyhyFk2Y3n3SUUbNWMluO7G85+fSV0DwZLLb0Ls1j4vTY/xjIYRLBEJvTsI5e8kNZeSl8xW4NHW9w3WJDhojY3gexYnauUOvApiExjCpXFX5P3DeOfX3bc4qrKu6D/cP0vuIlhj94+sKwp9nVpqd4dcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753419509; c=relaxed/simple;
	bh=NxciUWON/506FgC20s2/goHNidI3C652BAoT6aX9DBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TE7HDHWlt3fcNnj+PD1Ir/eKZK+pu8l3bI3/9u63wEkKWYmsXAabWWX7zkb4E4W1VJstvi7QjdO/9fDlypvcPlgzdvpw7PvFgG4yYRA8jqSEvGkKp5xUMK/oVtyxg8qvBatHTzZHUSQHCEr8swWECRc9Xg8Bm4pxfB1Xt08OhdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pplBPA+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pplBPA+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AD6C4CEE7;
	Fri, 25 Jul 2025 04:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753419508;
	bh=NxciUWON/506FgC20s2/goHNidI3C652BAoT6aX9DBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pplBPA+Q5ylHm5/LFqbDKk+ugL2IDat0kqD5P1Po7QLGGxZ0wkaFWBJuZbSVsxjIy
	 pX91ZJsZuiDUk3Hr2mhYQYJGksiuYL7H7M1j4iDeZA79WAWLqGnSz/BriUnpWCvfl5
	 TYjOzFoYUVLjoypWPZ8KLDb0LXRcK2EutQr375Tg=
Date: Fri, 25 Jul 2025 06:58:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <2025072537-sanction-overload-8acd@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
 <aII10fnhJRDeGSHI@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aII10fnhJRDeGSHI@google.com>

On Thu, Jul 24, 2025 at 01:32:01PM +0000, Tzung-Bi Shih wrote:
> On Thu, Jul 24, 2025 at 12:36:18PM +0200, Greg KH wrote:
> > On Thu, Jul 24, 2025 at 09:58:39AM +0000, Tzung-Bi Shih wrote:
> > > On Mon, Jul 21, 2025 at 08:15:07AM +0200, Greg KH wrote:
> > > > On Mon, Jul 21, 2025 at 04:44:53AM +0000, Tzung-Bi Shih wrote:
> > > > > Prepare to decouple the lifecycle of struct cros_ec_device from specific
> > > > > device by introducing a kref.
> > > > 
> > > > Ick, are you sure?  This is a device, so use struct device for it.
> > > > That's what it is there for.
> > > > 
> > > > So shouldn't this be its own 'struct device' and let the driver core
> > > > handle it correctly instead of trying to have a "child" structure with a
> > > > reference count that is not shown in sysfs at all?
> > > 
> > > Thanks for the review.
> > > 
> > > To make sure I understand, do the following patches (draft and simplified) make
> > > sense?  Short summary:
> > > - cros_ec_device_alloc() allocates resources and setup the destructor.
> > > - cros_ec_register() adds the device to the device hierarchy.
> > > - cros_ec_unregister() removes the device.
> > > - cros_ec_chardev_open() gets a refcount of the device.
> > > - cros_ec_chardev_release() puts the refcount.
> > 
> > NEVER attempt to increment/decrement refcounts on open/release.  That
> > way lies madness and should not be needed at all, the underlying
> > infrastructure should keep things working properly here, right?
> 
> Pardon me, but I don't really understand.  If it doesn't hold a refcount when
> the file opening, how could it make sure the userland program accesses valid
> memory after the underlying device has been removed?
> 
> Imagining the scenario (without holding a refcount):
> 
> Refcount    Event
> --------------------------------------------------------------------
> N/A         An USB device connected.
> 
>             The usb_driver's probe() called:
>             - cros_ec_device_alloc()
>                 -> kzalloc() the struct cros_ec_device
> 1               -> device_initialize()
>             - cros_ec_register()
> 1+N             -> device_add()
> 
>             An userland program opened a FD.
> 
>             The USB device disconnected.
> 
>             The usb_driver's disconnect() called:
>             - cros_ec_unregister()
>                   -> device_unregister()
> 1                     -> device_del()
> 0                     -> put_device().  The final reference count.
>                           -> release()
>                           -> kfree() the struct cros_ec_device
> 
>             The userland program accesses the struct cros_ec_device.

You are attempting to have one reference count for one object that has
different lifecycles.  That doesn't work well, if at all.  See the
numerous talks at the Linux Plumbers conference over the past few years
about why this is a "bad idea" and for ideas on how to redesign it to
fix the issue.

Hint, 2 objects, different reference counts :)

thanks,

greg k-h
