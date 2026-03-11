Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58467248873;
	Wed, 11 Mar 2026 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210317; cv=none; b=J80jlqJ3qM17xjMDW5X8YjghsLJ5UU7zFAnDy3+lG6/df1lmIpxNQ0kDJ5SHDspdd4C27ACBzrV0OMC8y4rdV5UonaTnN+u0NX4JY73RDFAOyiODGB2xS5onKxtwzibSR2+3e8UkxlG7GvrSMepb0i87JzzLtE9LZXAnvKoz6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210317; c=relaxed/simple;
	bh=BqVvjLCMR66m/PYrwwAtJUeu1Zb1lt8ndENlRW4hBw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQXqpq3U+ZkRsdjEr2WBrZ9oFX0VXeRBlyN0t1b2cN8Qbkn9O3vZTYIGKLANfOm60N7JIwp2GhGY0lRUS7lx7nSey1noWo86aQLtZ5Q8Y7Ty7UphGMKHKZZUq/YrC0tkfICu50WhLHoe1DyzOysBuiYUaghM2qCkXsFk/NkPkS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPVMpW3x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPVMpW3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDE3C4CEF7;
	Wed, 11 Mar 2026 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210317;
	bh=BqVvjLCMR66m/PYrwwAtJUeu1Zb1lt8ndENlRW4hBw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPVMpW3x5lbucffamBe8z7SSoEPHgbCUEGH41LoNjQuOM+8KgyYde4bWL+l9PEXip
	 1TVznLJ+PwCR2qB/zRU0CEsU46NsX9fSbRQ3ty7u+hknrgs+y35emv6z8swTi2MOTL
	 dqd+Yf9PVNw7JrWAdTPJWLnqj/8pSsISe1OCEYAygJLhnrBcHfORtidHJL+G9st1FZ
	 Uk5sbj2pDmK1dCHdj3itJK6gws/LluKae00sE1xbYARnN8Rn7nXY9INSJtbNOHX41i
	 6BNdLJDbUNv83UszbUD0V3ujFHuL6P+3yCIYUSg9DUU8raPhie1Hsjy8B0vUc0bLTB
	 Ndgmp1JeRJqpQ==
Date: Wed, 11 Mar 2026 06:25:14 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Aaron Burton <aaron@infinitelytimeless.tech>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: cros_ec_lpcs breaking sleep mode on HP Elite Dragonfly
Message-ID: <abEKyqmZ51Ew-jNm@google.com>
References: <1015ded1-c3f2-4b0d-92b8-15f413d1242b@infinitelytimeless.tech>
 <aamw0RnurTAZeN9l@tzungbi-laptop>
 <97301467-d7c1-411a-8575-ec3fa303d91d@infinitelytimeless.tech>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97301467-d7c1-411a-8575-ec3fa303d91d@infinitelytimeless.tech>

On Tue, Mar 10, 2026 at 08:12:04AM -0700, Aaron Burton wrote:
> Apologies for the late reply. I haven't tried using ectool, though I think
> someone may have found a solution in the driver code on a Github issue
> thread I started regarding this issue using MrChromebox's firmware, so I
> wanted to relay this to you to get your thoughts.
> 
> https://github.com/MrChromebox/firmware/issues/851#issuecomment-4029188293
> 
> They claim the cros_ec_lpcs driver sends a sleep event with a sleep timeout
> of 0ms while the EC interprets it as a 10-second timeout window, which seems
> to wake the machine due to the timeout being, well, 0ms. They have posted an
> example of an out-of-tree module that adjusts this timer as the adjustment
> had been removed from debugfs in kernel 6.12. I will be testing this soon
> and report back on results.

Thanks for providing the context.

To clarify:

- The EC_HOST_SLEEP_TIMEOUT_DEFAULT (i.e. 0ms) is to tell EC to use a
  default timeout value (i.e. 10ms).

- e8bf17d58a4d ("platform/chrome: cros_ec: Expose suspend_timeout_ms in
  debugfs") opens a door for tuning the value for debug or test purpose.
  It doesn't change the behavior.

- The debugfs "suspend_timeout_ms" is still in upstream linux.

Maybe it's worth checking if your firmware interprets
EC_HOST_SLEEP_TIMEOUT_DEFAULT the same way as ChromeOS EC firmware.

> 
> On 3/5/26 8:35 AM, Tzung-Bi Shih wrote:
> > On Tue, Mar 03, 2026 at 07:15:03PM -0800, Aaron Burton wrote:
> > > I'm reaching out in regards to an issue I've been trying to troubleshoot
> > > running Fedora (6.18.13-200.fc43.x86_64) on a HP Elite Dragonfly Chromebook.
> > > I'm aware this is not relevant to ChromeOS, but I was hoping maybe I could
> > > get some insight on this sleep mode issue I've been experiencing. This
> > > affects basically every Linux distro I've tested thus far, where if I put
> > > this Chromebook to sleep, it will immediately wake up. dmesg output when
> > > attempting sleep mode:
> > AFAIK, the EC drivers used in ChromeOS shouldn't diverge significantly from
> > the upstream kernel.
> > 
> > > 
> > > [ 1478.853982] PM: suspend entry (s2idle)
> > > [ 1478.876379] Filesystems sync: 0.022 seconds
> > > [ 1478.877848] Freezing user space processes
> > > [ 1478.885201] Freezing user space processes completed (elapsed 0.007
> > > seconds)
> > > [ 1478.885217] OOM killer disabled.
> > > [ 1478.885220] Freezing remaining freezable tasks
> > > [ 1478.886503] Freezing remaining freezable tasks completed (elapsed 0.001
> > > seconds)
> > > [ 1478.933986] PM: Some devices failed to suspend, or early wake event
> > > detected
> > > [ 1478.961519] PM: resume devices took 0.027 seconds
> > > [ 1478.961978] OOM killer enabled.
> > > [ 1478.961980] Restarting tasks: Starting
> > > [ 1478.963295] Restarting tasks: Done
> > > [ 1478.963339] random: crng reseeded on system resumption
> > > [ 1478.965350] PM: suspend exit
> > > 
> > > I've tried troubleshooting via /proc/acpi/wakeup by disabling each device
> > > enabled one by one, then eventually everything listed, and putting it to
> > > sleep via systemctl suspend, the machine still wakes up instantly without
> > > any user input. I eventually stumbled across what was causing the issue and
> > > it's related to the cros_ec_lpcs kernel driver as unloading the driver
> > > allowed it to sleep properly, though this also has unwanted side effects
> > > like the power LED no longer working and some issues with USB-C ports. I'd
> > > like to find a proper fix for this Chromebook EC in the kernel driver,
> > > though I don't have much experience debugging low-level kernel drivers. I'd
> > > be more than happy to provide any debugging data to try to fix this issue if
> > > possible.
> > I'm not sure if this helps, but a few ideas:
> > - You could increase the kernel log verbosity (e.g., print DEBUG level
> >    messages) to identify exactly which device failed to suspend.  It's likely
> >    one of the cros_ec_lpc subdevices.
> > - Have you checked if there are any relevant logs from the EC side (e.g.,
> >    via ectool)?
