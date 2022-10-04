Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FC33D9
	for <chrome-platform@lists.linux.dev>; Tue,  4 Oct 2022 16:57:01 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id d14so7127382ilf.2
        for <chrome-platform@lists.linux.dev>; Tue, 04 Oct 2022 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+lxrtVmYP2d38P1SdALs4rrUTawssSz9RKxR6kOlUc=;
        b=jyR4LtfRzvLZui//vYHZIKALA4cMdIiGdfojpITegWWlvFIQSaSap+N3mbcIUyRA81
         tN0HPWH+rl422NBxc4ODVxhh0FufxIXTKjwHLe0N73Hzm6sYkUoa9vDwhyo3HC3s/La9
         l7xKhyZHzcKl3pKrcVkIEv+/QWhV9CZ7pdkeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+lxrtVmYP2d38P1SdALs4rrUTawssSz9RKxR6kOlUc=;
        b=doBIGzWcMpRwXQ6qrdmnx18WtIs97Ce0qJTZbMIoPiNlaAZeNFQ01JSOefjhqsfn9e
         eQzwUKf/aac7NeMEBo0ZPyX29jVBQsqqbQKwm1CoNcZBITxVhiM1scnNyyyww9AIRzp/
         vn7d4EkCmB8xsZ5GZRlQvHT/Ki+r5oH0WbwrQY42rEIU0VOxx2r8CbhpgSIY5sHoccED
         2OZ8u71dKqF0+aXnpgaSxlF9U8Yb5fGu069J3O2mxb0RzF7vl1DiOvzCaBOwHRplYnKM
         8OMPZdfYUOWz94mtmxBovCuUKNCvhsgAtiUxm+E4BP7z72s2NqK1wX7E1DC9bcM7+y4b
         3YKg==
X-Gm-Message-State: ACrzQf0XpI7AWqIbwfgOq1OkNOOI+R7knbjljKCkW9T1pv1uUnOnBsFe
	MeoHFUN/RfbCccrHXQvzKc7/hHP/BmOIs9++
X-Google-Smtp-Source: AMsMyM48IFcKHxg+s1j2qhJ7PaQkBuYus2BtblotwI9gOl/qgWtJETmMU6HgxwoYP6O0hfgPX9KacQ==
X-Received: by 2002:a05:6e02:1aaa:b0:2f8:1908:7099 with SMTP id l10-20020a056e021aaa00b002f819087099mr12178915ilv.166.1664902620369;
        Tue, 04 Oct 2022 09:57:00 -0700 (PDT)
Received: from chromium.org (c-73-217-34-248.hsd1.co.comcast.net. [73.217.34.248])
        by smtp.gmail.com with ESMTPSA id w1-20020a056638030100b0036338050cb7sm2166108jap.108.2022.10.04.09.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 09:57:00 -0700 (PDT)
Date: Tue, 4 Oct 2022 10:56:58 -0600
From: Jack Rosenthal <jrosenth@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Yzxl2oczTtwEvIqt@chromium.org>
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yzvz9hn1G8rU4VaO@kroah.com>

On 2022-10-04 at 10:51 +0200, Greg KH wrote:
> > +		A list of ids known to Coreboot can be found in the coreboot
> > +		source tree at
> > +		``src/commonlib/bsd/include/commonlib/bsd/cbmem_id.h``.
> 
> That will not age well, why not point to the reference in the kernel
> tree instead?

There is no copy in the kernel tree.

> > +What:		/sys/bus/coreboot/devices/cbmem-<id>/address
> > +Date:		August 2022
> > +Contact:	Jack Rosenthal <jrosenth@chromium.org>
> > +Description:
> > +		This is the pyhsical memory address that the CBMEM entry's data
> > +		begins at.
> 
> In hex?  Decimal?
> 
> > +
> > +What:		/sys/bus/coreboot/devices/cbmem-<id>/size
> > +Date:		August 2022
> > +Contact:	Jack Rosenthal <jrosenth@chromium.org>
> > +Description:
> > +		This is the size of the CBMEM entry's data.
> 
> In hex?  Decimal?  Octal?  Binary?  Be specific please :)

Added "hexadecimal" and an example for both in v13.

> > +What:		/sys/bus/coreboot/devices/cbmem-<id>/id
> > +Date:		August 2022
> > +Contact:	Jack Rosenthal <jrosenth@chromium.org>
> > +Description:
> > +		This is the CBMEM id corresponding to the entry.
> 
> so "id" is the same as "<id>" here?  Why is that needed?

Removed in v13, agreee it's reduntant with the device name now.

> > +	  Say Y here to enable the kernel to search for Coreboot CBMEM
> > +	  entries, and expose the memory for each entry in sysfs under
> > +	  /sys/bus/coreboot/devices/cbmem-<id>.
> 
> Module name?

Added in v13.

> 
> > +
> >  config GOOGLE_COREBOOT_TABLE
> >  	tristate "Coreboot Table Access"
> >  	depends on HAS_IOMEM && (ACPI || OF)
> > diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
> > index d17caded5d88..8151e323cc43 100644
> > --- a/drivers/firmware/google/Makefile
> > +++ b/drivers/firmware/google/Makefile
> > @@ -7,5 +7,8 @@ obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
> >  obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
> >  obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
> >  
> > +# Must come after coreboot_table.o, as this driver depends on that bus type.
> 
> Doesn't the linker handle this for us?

Not in the case of compiling as a built-in module: I observed in this
scenario the order in the Makefile deterimined the module initialization
order, and, if this were to be listed alphabetically, the coreboot_table
module would not have been loaded before the cbmem module.

> > +	entry->size = dev->cbmem_entry.entry_size;
> 
> Ah nevermind you set the size here.

The size that stat reports is still 0, as when creating this as a device
attribute, the size is not known until the driver is probed.  I observed
this in some other sysfs attributes, so I imagine it's a common pattern.

> > +/* Corresponds to LB_TAG_CBMEM_ENTRY */
> > +struct lb_cbmem_entry {
> > +	u32 tag;
> > +	u32 size;
> 
> little or big endian?

It's the native host endianness, as coreboot wrote these tables from the
same CPU that Linux is running on.
