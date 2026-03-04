Received: from mail.infinitelytimeless.tech (mail.infinitelytimeless.tech [51.161.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34080280309
	for <chrome-platform@lists.linux.dev>; Wed,  4 Mar 2026 03:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.161.9.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595734; cv=none; b=kyWDs1GStduGSLG7/PkMXisnFbFcPwnnJcE7P+bziq/rfuuYHKD1xigXxdqGcsl5fyzxY41Xtcq+eJz7PTcX+UXms3r8R3wXoJy8RyFQN+MKX2gvvE2Fhi6tJuimDbg07qsASN+Xf0k+U7wHZT4m63IR48jSGZSohksQHxne84E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595734; c=relaxed/simple;
	bh=neHeZyfMO9x4wJeECH1IjqdFrHeMRFecPU3DQIooK0E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pHB7psN+J9EUDwArz9wkcA4yCxBSYA9FDVE6tgaQkQcr7W4qIUVyyMI3uIZavsHhOxJFxjjeihnoAtuZCCb04bGrtQaj/VTKS1b+jskAGyYKWZPMTD5102q0lJ74EURX9r+tkEnAYxCoovUZSgvRu6UxcEPvjVo/PV67YNXbioA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=infinitelytimeless.tech; spf=pass smtp.mailfrom=infinitelytimeless.tech; dkim=pass (2048-bit key) header.d=infinitelytimeless.tech header.i=@infinitelytimeless.tech header.b=YalU8t6+; arc=none smtp.client-ip=51.161.9.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=infinitelytimeless.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infinitelytimeless.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infinitelytimeless.tech header.i=@infinitelytimeless.tech header.b="YalU8t6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinitelytimeless.tech;
	s=dkim; t=1772594132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PiQakduKmvE19CsxAA4psYJmGjZhOFdykpupah/VQ1g=;
	b=YalU8t6+xInVHOeZvswVod1BVaV8tpODEZSjC2tridRz7llagjnc1//cnCj8OlKhIvnWqQ
	Lsvchirm+wA9Cd/ovNvP5YLrQTkfUnsJZ1TQ6qL+33aQ+xsuOxqfKtiUfXhCIXvUnW/GhK
	ZIc0lC9P6p78NavejvrGMwUe3zS8X6hEoIJu7jGduwIkSe8Rv0MUfL93Bm0kmVT9HGMRh7
	FS8ZHLDbgOstOz20kvFspJko7XHaOt5Ae+UQevRZdFbHzu/rskjzgwERsNEcQiW0RQRSxk
	AHwM5teaZSmrCDTKC5mD/NXMNN0TEvlqYmUSVTKBaX0e6BrZmLD0XG7yb+PUfw==
Received: 
	by mail.infinitelytimeless.tech (OpenSMTPD) with ESMTPSA id ac70f29b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 3 Mar 2026 22:15:32 -0500 (EST)
Message-ID: <1015ded1-c3f2-4b0d-92b8-15f413d1242b@infinitelytimeless.tech>
Date: Tue, 3 Mar 2026 19:15:03 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Cc: chrome-platform@lists.linux.dev
From: Aaron Burton <aaron@infinitelytimeless.tech>
Subject: cros_ec_lpcs breaking sleep mode on HP Elite Dragonfly
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm reaching out in regards to an issue I've been trying to troubleshoot 
running Fedora (6.18.13-200.fc43.x86_64) on a HP Elite Dragonfly 
Chromebook. I'm aware this is not relevant to ChromeOS, but I was hoping 
maybe I could get some insight on this sleep mode issue I've been 
experiencing. This affects basically every Linux distro I've tested thus 
far, where if I put this Chromebook to sleep, it will immediately wake 
up. dmesg output when attempting sleep mode:


[ 1478.853982] PM: suspend entry (s2idle)
[ 1478.876379] Filesystems sync: 0.022 seconds
[ 1478.877848] Freezing user space processes
[ 1478.885201] Freezing user space processes completed (elapsed 0.007 
seconds)
[ 1478.885217] OOM killer disabled.
[ 1478.885220] Freezing remaining freezable tasks
[ 1478.886503] Freezing remaining freezable tasks completed (elapsed 
0.001 seconds)
[ 1478.933986] PM: Some devices failed to suspend, or early wake event 
detected
[ 1478.961519] PM: resume devices took 0.027 seconds
[ 1478.961978] OOM killer enabled.
[ 1478.961980] Restarting tasks: Starting
[ 1478.963295] Restarting tasks: Done
[ 1478.963339] random: crng reseeded on system resumption
[ 1478.965350] PM: suspend exit

I've tried troubleshooting via /proc/acpi/wakeup by disabling each 
device enabled one by one, then eventually everything listed, and 
putting it to sleep via systemctl suspend, the machine still wakes up 
instantly without any user input. I eventually stumbled across what was 
causing the issue and it's related to the cros_ec_lpcs kernel driver as 
unloading the driver allowed it to sleep properly, though this also has 
unwanted side effects like the power LED no longer working and some 
issues with USB-C ports. I'd like to find a proper fix for this 
Chromebook EC in the kernel driver, though I don't have much experience 
debugging low-level kernel drivers. I'd be more than happy to provide 
any debugging data to try to fix this issue if possible.


Thanks

Aaron

