Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1B1EEA55
	for <chrome-platform@lists.linux.dev>; Sun, 14 Sep 2025 01:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757812133; cv=none; b=ifNDaToVA3ALUlm8X12ZGNhMo/XMZNdZKuA4OFGYqszgerrzJtC/U/BLXCNbntAn6duYI5t7axLXouVTyZqikAm9IBB6ZrFfzuIkQgbYWrhpRN+0KrteSqRuJWls85ZxsIy0qS2+ldsyNQmyeDReNtZQ+3haR0CkeNxPIeTS1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757812133; c=relaxed/simple;
	bh=hgJHY4HXKWPcYNFn7GqdDSqEsVBrQ1LT0l8yuSdhhPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWlVzNdi43HdcB9VtK6AzLN6ESee3W4N34zJ+uK/n/EcEvdKhuaFbZISqVIeFXM6jO5VvHDIpQ35xB3B++p9IsHYbtZwJyrAOGkadIGIj5hUFBwpxhH0O0aUlVzxH8N084v8mZ8E9+EaluDHHiiPiLYA9KmV/SMslALHIVNXokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FawT/Dgf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FawT/Dgf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32e34f472d9so62377a91.3
        for <chrome-platform@lists.linux.dev>; Sat, 13 Sep 2025 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757812132; x=1758416932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGHMCvuH4zOHmVeqcJ1jMNNY6PE4UL0+eswFIMy02ao=;
        b=FawT/DgfWekG/SeWfWFYFEpHMAXr1Z55EtUXq4kXuvigVMWR5m899Z98uKdpzOqGcy
         cZcC6/O0Z1STYAgyUzTlCH6rjblvmvXxbTSaepXTSCTER0icTup51QwvrhGiT4t+TgcQ
         ddGwN3zHEAlari/7CE58i2/otj4zuem4szFHg4N7J4KLs3qkvVRY5k68u7pqvs1I+tzo
         vG3f4upAsOX7sTx94FGekD5WlP5EMLM4jdnUMzNYp559c5UA7o9Dd3KLz1N/Gpob3CqQ
         DVq2iPvmSBhOGcGCSjytrVCE4DEixg3xGNyXTDuBtcc2mLn/JijBAWBqEwfPf6gVEmy/
         nn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757812132; x=1758416932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGHMCvuH4zOHmVeqcJ1jMNNY6PE4UL0+eswFIMy02ao=;
        b=uJO8iQTAQLlNS2kd5SF8KXP9gEMf/fYDMHg+17g1sf2x/zzCyTEN2cgZGM0W7u9HVM
         8H70RbRl/VXSoD/DsqdUNDmM1Kod305MU1kHdkvztZa9vAZSzl+sPfdqlC1mgV8H/ibH
         ScGuqOSKaSfqOsxfk0RBDPnm7H6gHBn5LgrrkYfTaKe1v2rlnvD7NzGJkE3U12/Il2Vl
         66wllLYRrXYW1JiCoAgji6Xu4mT1fIc69TE1X2beN0GgNc5p7gMjJKb3rNRQiSkn4f9U
         uPHfjg6oQXmtCDjjUJSNE99K+F3pY4qCYvuI1PAvI00Z57tumqjpP4pUQP5QByPn62sz
         b/7w==
X-Forwarded-Encrypted: i=1; AJvYcCVruqIdiydvc9jf46nAn7kAqjRVgnJ8Ta3SbEPKMfeKe2DnIZ3sM9q1ZNUXuO7F8XNqIGBFoPVwWIZdk91m/fI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAZ2FAIS7fmHfwFFbjgkPWGQejrYRbnKLip5xSbqS2eWTCG3Mn
	Y2siEtWY2c3t4R35EG1Y9Cm2BI+OSphtmMXQF2BPu5WJhVtmuSeB/6E6
X-Gm-Gg: ASbGncv+bMs/fgYG8mnsydMeUvOYXs7+VYd/2yKbU6hheDSrlfJAYQk8GUynfq8FP1S
	7S2vzC6I9uA0CX55icinVr3yRlTuBbPsR3xKgzAFCuCpbAteJOO0UtRC0r1OqGAqzrSmYusplLq
	dTW0Jt4qQPQiIBJFborJsCao9Y9KNhW2UI1pBExeRqbflEE9tuTn0v0LfGQHVyPcCr8GvHlfupv
	mdLLvOsvECSP1lTihtMCe+23jybUEvHgdfhxQIralaicngWyedGFuz3xoUwRB1xa8+yHh1ZSG4G
	8y1xutUvJEvej01rLaVSQih9SXCkkeuQ1PIiiXJYdk4rgm7a6hHtA48/b2Tmu478WqXJ1oQw3Sb
	Uk/SV78wTDmYtaMUBQ9rwYhnzNQJvgPlC
X-Google-Smtp-Source: AGHT+IFL97kM3TaaKeksNS9Jbrgo+sfiDPUaWN9rzL8adPKJTZQ5LMrTbVcu8j2ZlunCSLPcdH9n5A==
X-Received: by 2002:a17:90a:d60d:b0:32a:e706:b7b6 with SMTP id 98e67ed59e1d1-32de4f895efmr8852090a91.11.1757812131523;
        Sat, 13 Sep 2025 18:08:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm9303308b3a.81.2025.09.13.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:08:51 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:08:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <vt2xibzzfbq2aq4kuyl3557kqazqusnxe75ps6idn6xpcxhous@u562qeztmaqb>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
 <aLbutygmfjV4AuhZ@tzungbi-laptop>
 <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>
 <aLqhcu-zjpyeYMly@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLqhcu-zjpyeYMly@google.com>

On Fri, Sep 05, 2025 at 08:38:10AM +0000, Tzung-Bi Shih wrote:
> On Thu, Sep 04, 2025 at 07:06:23AM -0700, Dmitry Torokhov wrote:
> > On Tue, Sep 02, 2025 at 09:18:47PM +0800, Tzung-Bi Shih wrote:
> > > On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> > > > On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > > > > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > > > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > > > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > > > > probed at the same time.
> > > > > > 
> > > > > > Example:
> > > > > > 
> > > > > > + -----------------------------------------------------------------+
> > > > > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > > > > + -----------------------------------------------------------------+
> > > > > > | Probe cros-ec-keyb.            |                                 |
> > > > > > | - Decide to defer[1].          |                                 |
> > > > > > |                                | A device bound to a driver[2].  |
> > > > > > | Probe cros_ec_lpc.             |                                 |
> > > > > > | - Init the struct[3].          |                                 |
> > > > > > |                                | Retry cros-ec-keyb from the     |
> > > > > > |                                | deferred list[4].               |
> > > > > > |                                | - Won't defer again as [3].     |
> > > > > > |                                | - Access uninitialized data in  |
> > > > > > |                                |   the struct.                   |
> > > > > > | - Register the device.         |                                 |
> > > > > > + -----------------------------------------------------------------+
> > > > > > 
> > > > > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > > > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > > > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > > > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > > > > 
> > > > > > Note that the device link[5] can't help as in the observed environment,
> > > > > > the devices are already added via device_add()[6].
> > > > > > 
> > > > > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > > > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > > > > 
> > > > > > The series fixes the issue by ensuring the struct is ready for accessing
> > > > > > before continuing to probe cros-ec-keyb.
> > > > > 
> > > > > Why is the keyboard platform device instantiated before the transport
> > > > > (cros_ec_lpc) is done initializing? I think this is the root of the
> > > > > issue...
> > > > 
> > > > I may misunderstand but it seems to me:
> > > > 
> > > > - The ACPI bus enumerated and instantiated the platform devices[6] first.
> > > > 
> > > > - The keyboard platform device was probed when `cros_ec_keyb_driver`
> > > >   registered.  It deferred as its parent's drvdata was NULL[1].
> > > > 
> > > > - The transport platform device was probed when `cros_ec_lpc_driver`
> > > >   registered.  It set the drvdata[3].
> > > > 
> > > > - The keyboard platform device was probed again from retrying the deferred
> > > >   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
> > > >   wasn't NULL and cros_ec_register() for the transport device weren't
> > > >   finished.  The race happened.
> > > 
> > > Hi Dmitry,
> > > 
> > > Does it make sense to you?
> > 
> > I'll have to research how MFD mixes up statically described and
> > DT-described platform devices and makes sure that children are not
> > probed before the parent is ready - I think we need to make cros_ec
> > behave the same way.
> 
> I may misunderstand but FWIW:
> 
> I failed to find relevant code in MFD [7] that guarantees the probe order.
> Also, I'm curious about wouldn't code at [7] results in duplicate platform
> devices?  E.g., 1 populated from OF; 1 created by MFD.
> 
> Note: current cros_ec_dev.c doesn't use `of_compatible` in struct mfd_cell.
> 
> If we're looking at how cros_ec_dev.c guarantees the order:
> 
> - The transport platfrom device is probed first.  It calls cros_ec_register().
> - In cros_ec_register(), it registers the MFD device "cros-ec-dev".  And the
>   children devices are added via mfd_add_devices().
> 
> 
> Back to the issue we observed:
> 
> - The platform devices are created when it scans the tree in ACPI[6].  We
>   probably have no way to prevent the devices from adding unless specifying
>   `enumeration_by_parent`[8].
> 
> - When some of them are modules, the driver registrations are tied to the
>   module insertion.  They can be arrived by anytime unless we use something
>   similar to soft dependency[9].  A Kconfig dependency will also
>   be needed to prevent cros_ec_lpcs=m but cros_ec_keyb=y.  However,
>   cros_ec_keyb would need to specify 2 possible dependencies "cros_ec_lpcs"
>   and "cros_ec_spi"[10].  I'm not sure what would be happening if a system
>   has no cros_ec_spi module at all.

Sorry for the delay. I think we need to figure out how to delay device
registration until after the transport device is registered and probed.
Unfortunately I have not had time to look at this properly so I acked
the changes to cros_ec_keyb so that we can close the hole for now and
later we can try to see if there is a reasonable better solution.

Thanks.

-- 
Dmitry
