Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8554B1FA9
	for <chrome-platform@lists.linux.dev>; Wed, 21 Jun 2023 04:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14B1C433C8;
	Wed, 21 Jun 2023 04:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687323465;
	bh=CGwCiesM4ETXNpNT+luKgqaRQWn3Fuaia0exEfnUIXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/CqEG08i1qKgNsW+3ytFe6rBKX6C2E0hXsXq2ZWFBLSDw7S7RvmlHKcG5wtIauMG
	 36Ni7U65mrnQy3tgAGN8uD4A3ertEoSSdP+p31+7dY1Lmhk1+uLl3o0U7hffpjQ11l
	 CMwVWgurx6VA8bAzJhCOuHov33mdXfDlGsbWe/NCe4tomaIIpdID+Tjwpe8SzqvPh6
	 S5NPLaRtb1gkyE+UCrI/Pzn1UJZmLqqpjoWUsaVnWGlbZQIAtyL+oR3eF+UAXgQoT4
	 0haswjFioTJBt3QWtL1AEyZXeklfq68keqpLkboLoLzhd9MBtl/zPvFnh1G0PRDZtz
	 DXoe6HOfC/jdw==
Date: Wed, 21 Jun 2023 12:57:42 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: David Rheinsberg <david@readahead.eu>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: cros_ec_lpcs on framework: packet too long (4 bytes, expected 0)
Message-ID: <ZJKDRkNrju92QzsZ@google.com>
References: <33c2d66a-84ad-48dd-b8ba-f88a7a68a0fd@app.fastmail.com>
 <ZJF3EocB7DX/ULxT@google.com>
 <cf191201-b6b9-4ded-8d32-c77f3d27e38d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf191201-b6b9-4ded-8d32-c77f3d27e38d@app.fastmail.com>

On Tue, Jun 20, 2023 at 12:33:35PM +0200, David Rheinsberg wrote:
> On Tue, Jun 20, 2023, at 11:53 AM, Tzung-Bi Shih wrote:
> > On Tue, Jun 20, 2023 at 10:12:34AM +0200, David Rheinsberg wrote:
> >> Using the cros-ec over lpc device on the Framework-13, I occasionally get:
> >> 
> >>     cros_ec_lpcs cros_ec_lpcs.0: packet too long (4 bytes, expected 0)
> >> 
> >> Afterwards, the entire EC seems to be inactive and none of its controllers work, anymore (temperature sensors are stale, keyboard defunct, etc.). A reboot fixes the issues.
> >
> > To be clear, does an AP reboot fix the issue?  Or does it need an EC reboot?
> > Will it trigger some watchdog mechanisms and thus a reboot after waiting for
> > a specific duration (e.g. 30 seconds)?
> 
> A linux system reboot fixed the issue. I did *NOT* perform a cold-boot or explicitly rebooted the EC. If the EC is not automatically rebooted with the AP, then no EC-reboot was necessary to fix the issue.
> 
> No watchdog mechanism was triggered. Logs show I waited for 30min.

My intention was to simply bisect between AP vs. EC.  From the description
you provided, it sounds like someone was waiting for some events forever.
However, the system was still running so that it didn't trigger any watchdogs
or lockup detectors.

> >> I cannot trigger this issue reliably, yet it seems to happen exclusively under heavy load. Do you have any recommendations how to debug this further?
> >> 
> >> I failed tracing where the error happens and why any further functionality of the EC is disabled thereafter. Does the driver end communication on an error? Or is this likely a firmware issue and just indicative of the firmware failing?
> >> 
> >> If you have any recommendations how to enabled the cros-tracing/debug features, I'd gladly run a custom kernel for a while to see where the failure originates.
> >
> > Could you get the AP and EC console log?  AFAIK, the "packet too long" is only
> > indicating an error of the EC command.  There should be some other error
> > messages directly related to the system becomes inactive.
> 
> There is nothing in the kernel logs besides the mentioned message +-30min of the occurrence. I did not enable debug-level messages, though.

The issue you encountered should be at least an error.  I don't think it needs
to enable debug-level messages to see other hints.

Could you get EC console log?  Maybe there are some more hint messages.

> > Try to get the consoles would be the most directly helpful.  Except the logs,
> > ramoops, and stacktraces, for example, if the console is still available when
> > the issue happens, you could use SysRq to get all stack backtraces.
> 
> The system is (almost) fully operational when the issue happens. It is just that some hardware features do not work, anymore. I noticed the temperature sensors reporting stale data and the `fn`-key having no effect anymore.
> 
> The kernel log was quiet around the time the issue started, except for the mentioned message.
> 
> Is there a particular kernel thread you would like to see the stacktrace for? I can dump the full system stack trace and see whether anything looks particularly weird. But given that normal system operation was not interrupted, I am unsure that I will find anything.

No.  I thought kernel was stucked from your previous message but it wasn't per
your further comments.

> I am unsure which device driver triggered the ec-lpc transaction, but it did not show any further error message. I am not even sure whether it is pkg-xfer or cmd-xfer, since both use the same error message. I can try placing an ftrace marker in the error-path and hopefully get a kernel stacktrace of the error?

`pkg_xfer` for protocol version 3; `cmd_xfer` for legacy.  In most cases, it
should fall into protocol version 3.  I'm not sure if finding the device
driver would be helpful.  The driver didn't print error messages as the driver
doesn't think it was an error.

> Can I use the chardev to test whether the ec-driver is still responsive?

You can send hello message to EC via the chardev.  See [1] for reference.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git/tree/cros/tests/cros_ec_mcu.py?h=main#n48

> If you insist, I can provide the full kernel-log. I will also try to fetch a sysrq stacktrace dump next time I trigger it.

No.  As I replied above, the kernel doesn't look like stucked.  The sysrq
is unneeded in the case.
