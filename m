Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40E3CB2C6;
	Thu,  5 Mar 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728532; cv=none; b=AVUtuq8s8Q+JVOv/eF0QJZE23aVdPMFteWThXKkct8YfL4hGAzkw38q2PVud3jtUEis2c5x1Ug8hOQph/xD7aUCyCSG857pmCWd+jYuQhIoCnaETSvaE3zzxIRsvslBSJ//FTv/8I8MFP0Unk1oLSlB1nJdY9c68qk8fch8AwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728532; c=relaxed/simple;
	bh=A39dx8IgDbBDMWu+k5CnSsJrn8XahSFGo7Cfk/Z3zvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fz+sczIjCgRi5bPWvNGWP6bwxgtF2KE4cRGkXKQGZMLI5OTecFhBiq4mwPFerenVtysLJhDEQLPcMaM0dXBtI+7U46k+m5wtyWoC3TgZgsC49driuzUAIe+oiiLktdAKXAGuMtgDoLHX2jXuKfDiR/TLEwkBtXyGmsU2CbhnBVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aceg6+Iz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aceg6+Iz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57315C116C6;
	Thu,  5 Mar 2026 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772728532;
	bh=A39dx8IgDbBDMWu+k5CnSsJrn8XahSFGo7Cfk/Z3zvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aceg6+Iz3njUgOfKW5omTk5BcUkrtAp0bCZb0SJutzILFymJkQZdEuDiBISkHbnh2
	 fkJAAQYEKaPIu28chz/bqCR44+biaeBHq8gd5lbpz8WMuYCCvVh91h/X1kUAysUwqg
	 wvZT9XE5f8+OotS1HEQnmp6h62szxrhSSxvXEnsi49Bs9Np16nnTDQ19Rn73LFIwYU
	 K31AmZdNalFeyUWpe68mip31wglG4Qoi2L4PkKxiYHhVdC0wp/AJtNkiWuKGeTUvhd
	 /MFR9DqcoF3QSVBF9Y6GvD4WcdGn7RoDk8mXNsmJBTs8NvRJeakUWpt9o/dy0on15E
	 JfYkv62iehIoQ==
Date: Fri, 6 Mar 2026 00:35:29 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Aaron Burton <aaron@infinitelytimeless.tech>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: cros_ec_lpcs breaking sleep mode on HP Elite Dragonfly
Message-ID: <aamw0RnurTAZeN9l@tzungbi-laptop>
References: <1015ded1-c3f2-4b0d-92b8-15f413d1242b@infinitelytimeless.tech>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1015ded1-c3f2-4b0d-92b8-15f413d1242b@infinitelytimeless.tech>

On Tue, Mar 03, 2026 at 07:15:03PM -0800, Aaron Burton wrote:
> I'm reaching out in regards to an issue I've been trying to troubleshoot
> running Fedora (6.18.13-200.fc43.x86_64) on a HP Elite Dragonfly Chromebook.
> I'm aware this is not relevant to ChromeOS, but I was hoping maybe I could
> get some insight on this sleep mode issue I've been experiencing. This
> affects basically every Linux distro I've tested thus far, where if I put
> this Chromebook to sleep, it will immediately wake up. dmesg output when
> attempting sleep mode:

AFAIK, the EC drivers used in ChromeOS shouldn't diverge significantly from
the upstream kernel.

> 
> 
> [ 1478.853982] PM: suspend entry (s2idle)
> [ 1478.876379] Filesystems sync: 0.022 seconds
> [ 1478.877848] Freezing user space processes
> [ 1478.885201] Freezing user space processes completed (elapsed 0.007
> seconds)
> [ 1478.885217] OOM killer disabled.
> [ 1478.885220] Freezing remaining freezable tasks
> [ 1478.886503] Freezing remaining freezable tasks completed (elapsed 0.001
> seconds)
> [ 1478.933986] PM: Some devices failed to suspend, or early wake event
> detected
> [ 1478.961519] PM: resume devices took 0.027 seconds
> [ 1478.961978] OOM killer enabled.
> [ 1478.961980] Restarting tasks: Starting
> [ 1478.963295] Restarting tasks: Done
> [ 1478.963339] random: crng reseeded on system resumption
> [ 1478.965350] PM: suspend exit
> 
> I've tried troubleshooting via /proc/acpi/wakeup by disabling each device
> enabled one by one, then eventually everything listed, and putting it to
> sleep via systemctl suspend, the machine still wakes up instantly without
> any user input. I eventually stumbled across what was causing the issue and
> it's related to the cros_ec_lpcs kernel driver as unloading the driver
> allowed it to sleep properly, though this also has unwanted side effects
> like the power LED no longer working and some issues with USB-C ports. I'd
> like to find a proper fix for this Chromebook EC in the kernel driver,
> though I don't have much experience debugging low-level kernel drivers. I'd
> be more than happy to provide any debugging data to try to fix this issue if
> possible.

I'm not sure if this helps, but a few ideas:
- You could increase the kernel log verbosity (e.g., print DEBUG level
  messages) to identify exactly which device failed to suspend.  It's likely
  one of the cros_ec_lpc subdevices.
- Have you checked if there are any relevant logs from the EC side (e.g.,
  via ectool)?
