Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2DC224F6
	for <chrome-platform@lists.linux.dev>; Thu, 24 Jul 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753363925; cv=none; b=XjQIbD4U2Ss3iyl0C3+43PN+P4ySfQN1IzwOvCtQChUrZ+5FuXf3Y62pQgEg7/xnqjZmn1ziHVdKwI3GIPC7Q6WVe7CGmMtKWeoiESpG3J1OwP2Prx2Aao7XiouRFYJ1Q5QuW+NJjqNe4Xte+FhwcVyLNJ4tzutELI+qJ3YmswY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753363925; c=relaxed/simple;
	bh=n9RFGackBp6kgY9t//B7re/PmG/SUyJUK9x1LvSJg/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qE5LdEgAtipe/31uvUBBpEcCIK4jEz7kCHFe4seH7EHTLPjKxWbdnlC7QUV9NezcsunCwtFE/nTTEyrHK3B59MYF+BkyQMcyG/ln0pF8Inki9qY5kYBWE3kntZqpI+3JABK6hL4xillw6RSaatvpj7R1imjMKEuKJXt8rjStRyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMkEqd0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMkEqd0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D118DC4CEED;
	Thu, 24 Jul 2025 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753363924;
	bh=n9RFGackBp6kgY9t//B7re/PmG/SUyJUK9x1LvSJg/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMkEqd0Q6yBVXaVcpbEh5lk6Uk7N3A9fVxvLaxktAxLnDR70fj9LjQVI/zAjkmpYF
	 3WpGdaBwDXj7KYTy4Frc0sIF/cSd8Bo8WL9PIBtrB76PvbCLMvVXsE2lNZYj74MRxg
	 kXg3Tpvo9e6iMzOJvnVBuD04KHogbgacZbr2LxU3Iu8L6ZIEqB5nNwsckMPjebaoGS
	 TUikJ+6zTNYZrEbgBp5UN4Zvr74mZGEcqCnjVxNNX9Enj4T7TL8T/wFkrhOpRKGyn1
	 qu2lyxLnbD+NRPYL+daG7EzayKOW8LjDTE32Lz9revJaitWKwTSDA2vqld/wqojMXx
	 dbKtBkt2so2hQ==
Date: Thu, 24 Jul 2025 13:32:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <aII10fnhJRDeGSHI@google.com>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
 <2025072428-marathon-anemia-c9f6@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072428-marathon-anemia-c9f6@gregkh>

On Thu, Jul 24, 2025 at 12:36:18PM +0200, Greg KH wrote:
> On Thu, Jul 24, 2025 at 09:58:39AM +0000, Tzung-Bi Shih wrote:
> > On Mon, Jul 21, 2025 at 08:15:07AM +0200, Greg KH wrote:
> > > On Mon, Jul 21, 2025 at 04:44:53AM +0000, Tzung-Bi Shih wrote:
> > > > Prepare to decouple the lifecycle of struct cros_ec_device from specific
> > > > device by introducing a kref.
> > > 
> > > Ick, are you sure?  This is a device, so use struct device for it.
> > > That's what it is there for.
> > > 
> > > So shouldn't this be its own 'struct device' and let the driver core
> > > handle it correctly instead of trying to have a "child" structure with a
> > > reference count that is not shown in sysfs at all?
> > 
> > Thanks for the review.
> > 
> > To make sure I understand, do the following patches (draft and simplified) make
> > sense?  Short summary:
> > - cros_ec_device_alloc() allocates resources and setup the destructor.
> > - cros_ec_register() adds the device to the device hierarchy.
> > - cros_ec_unregister() removes the device.
> > - cros_ec_chardev_open() gets a refcount of the device.
> > - cros_ec_chardev_release() puts the refcount.
> 
> NEVER attempt to increment/decrement refcounts on open/release.  That
> way lies madness and should not be needed at all, the underlying
> infrastructure should keep things working properly here, right?

Pardon me, but I don't really understand.  If it doesn't hold a refcount when
the file opening, how could it make sure the userland program accesses valid
memory after the underlying device has been removed?

Imagining the scenario (without holding a refcount):

Refcount    Event
--------------------------------------------------------------------
N/A         An USB device connected.

            The usb_driver's probe() called:
            - cros_ec_device_alloc()
                -> kzalloc() the struct cros_ec_device
1               -> device_initialize()
            - cros_ec_register()
1+N             -> device_add()

            An userland program opened a FD.

            The USB device disconnected.

            The usb_driver's disconnect() called:
            - cros_ec_unregister()
                  -> device_unregister()
1                     -> device_del()
0                     -> put_device().  The final reference count.
                          -> release()
                          -> kfree() the struct cros_ec_device

            The userland program accesses the struct cros_ec_device.
