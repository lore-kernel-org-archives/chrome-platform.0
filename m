Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE32560
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 08:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFFB5C433D7;
	Fri, 25 Nov 2022 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669365616;
	bh=pzgvt8+CLMgiBBMkiZFOdJ3rS9QZG3vhtumSvPDCnsg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qkLXBW2NXHKry7zUz088hOZ+8dK6bdlxSHqHOENOzIuUl5GHgsv469NIUKPKT5D5A
	 ZrOv6xZi/zcXvtdqMOY+aMQPWzV8f8WQsrPmNzSR8mEytFKQDyCx3m3q55dCIJ9bNc
	 dXy1g/gupfIoR5rE15moq+ZSdHalHh3ST2VhaTJHJ8QzNMuclkJk3Gla/oSrItpPMI
	 jr2p006YEkwViQQsolD+sZaH4hiI+euC4iNQ1f5EA7PiYDR9hAt4U+Be3F6dWeDBx0
	 qx7ejAQH/EOkOKALd1srN/XqiOSJnuqydOpnLWFNipwr+GDH84rYhyaQbZqhW1hKYV
	 VeTiMfgKkiV4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3AC7E29F3C;
	Fri, 25 Nov 2022 08:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Fix error handling in
 cros_usbpd_notify_init()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166936561586.18119.16091669462756224026.git-patchwork-notify@kernel.org>
Date: Fri, 25 Nov 2022 08:40:15 +0000
References: <20221117080823.77549-1-yuancan@huawei.com>
In-Reply-To: <20221117080823.77549-1-yuancan@huawei.com>
To: Yuan Can <yuancan@huawei.com>
Cc: pmalani@chromium.org, bleung@chromium.org, gwendal@chromium.org,
 jflat@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Thu, 17 Nov 2022 08:08:23 +0000 you wrote:
> The following WARNING message was given when rmmod cros_usbpd_notify:
> 
>  Unexpected driver unregister!
>  WARNING: CPU: 0 PID: 253 at drivers/base/driver.c:270 driver_unregister+0x8a/0xb0
>  Modules linked in: cros_usbpd_notify(-)
>  CPU: 0 PID: 253 Comm: rmmod Not tainted 6.1.0-rc3 #24
>  ...
>  Call Trace:
>   <TASK>
>   cros_usbpd_notify_exit+0x11/0x1e [cros_usbpd_notify]
>   __x64_sys_delete_module+0x3c7/0x570
>   ? __ia32_sys_delete_module+0x570/0x570
>   ? lock_is_held_type+0xe3/0x140
>   ? syscall_enter_from_user_mode+0x17/0x50
>   ? rcu_read_lock_sched_held+0xa0/0xd0
>   ? syscall_enter_from_user_mode+0x1c/0x50
>   do_syscall_64+0x37/0x90
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
>  RIP: 0033:0x7f333fe9b1b7
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
    https://git.kernel.org/chrome-platform/c/5a2d96623670

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


