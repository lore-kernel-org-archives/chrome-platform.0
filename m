Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF814405
	for <chrome-platform@lists.linux.dev>; Tue,  4 Oct 2022 17:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7EAC433D7;
	Tue,  4 Oct 2022 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664904382;
	bh=b4vDS1cfOtzBJ1Onjersmj68vUlXcU0XfHH6VT+SKdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3ufTjFh2GqLgdYsBrRDyAEVvPXs8aQZ3TDl1fxUuzT9aQhJkBLplwrVjDKmPyecw
	 CRrviPdcL84KqXn8ZEAlVwqytCjxnP/2q6RueWCglPgAMe94jMdKx8HGigAQYde478
	 SROeBnASkgIkapRokop4nmdAa3HlMsfd6fpPZN/4=
Date: Tue, 4 Oct 2022 19:26:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Yzxsu2Ms43eTfOYR@kroah.com>
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com>
 <Yzxl2oczTtwEvIqt@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yzxl2oczTtwEvIqt@chromium.org>

On Tue, Oct 04, 2022 at 10:56:58AM -0600, Jack Rosenthal wrote:
> On 2022-10-04 at 10:51 +0200, Greg KH wrote:
> > > +		A list of ids known to Coreboot can be found in the coreboot
> > > +		source tree at
> > > +		``src/commonlib/bsd/include/commonlib/bsd/cbmem_id.h``.
> > 
> > That will not age well, why not point to the reference in the kernel
> > tree instead?
> 
> There is no copy in the kernel tree.

Then how does the kernel know what to print out?  Why not add such a
reference somewhere?

> > >  config GOOGLE_COREBOOT_TABLE
> > >  	tristate "Coreboot Table Access"
> > >  	depends on HAS_IOMEM && (ACPI || OF)
> > > diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
> > > index d17caded5d88..8151e323cc43 100644
> > > --- a/drivers/firmware/google/Makefile
> > > +++ b/drivers/firmware/google/Makefile
> > > @@ -7,5 +7,8 @@ obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
> > >  obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
> > >  obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
> > >  
> > > +# Must come after coreboot_table.o, as this driver depends on that bus type.
> > 
> > Doesn't the linker handle this for us?
> 
> Not in the case of compiling as a built-in module: I observed in this
> scenario the order in the Makefile deterimined the module initialization
> order, and, if this were to be listed alphabetically, the coreboot_table
> module would not have been loaded before the cbmem module.

So is this a runtime dependancy or a symbol/link dependancy?

link one is easy, we always go off of the Makefile order, and if you
move it and it breaks, well obviously move it back.  If it's a runtime
order, then how will you handle one being a module and the other not?

thanks,

greg k-h
