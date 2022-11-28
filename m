Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49DA461
	for <chrome-platform@lists.linux.dev>; Mon, 28 Nov 2022 20:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E4F1C433B5;
	Mon, 28 Nov 2022 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669665617;
	bh=CI8mtJWjr+Kxbf0SY7tVMFPCsI5Pep5YEwki+4g24RM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E5y9h92xrsabOEbGMa5qb0p59kVpUm+ngGk910TsbZoJ1Kx2YtHnh6XGHi39Q3nHv
	 AacQ4mhPwC+tsaGt73ujfS2JGTZSd4EFCrxstzKpSmo/1ATSaJqdXUPWv5qqbz/jS5
	 cOG7CFg9eqSatcV2Y5j8dER57BB1XDMD5hTIdDsbwcs28t7dnXQhGRpuIT+25aMP5i
	 XOr7HlkgVCgFX4baynxtSOsJZOrDGCoSifjocZDvbHEvqGmttBhBL4Wue5vsSWwbXC
	 xqYjd0FcQpN0JEbwWRdyKryW4Lzve/t99ZLiksTK33kBISmyXl2n8NYwQbNLh7FECp
	 LTJn/q4B+w+RQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1875E21EF6;
	Mon, 28 Nov 2022 20:00:16 +0000 (UTC)
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
 <166966561698.11611.4134873993450346997.git-patchwork-notify@kernel.org>
Date: Mon, 28 Nov 2022 20:00:16 +0000
References: <20221117080823.77549-1-yuancan@huawei.com>
In-Reply-To: <20221117080823.77549-1-yuancan@huawei.com>
To: Yuan Can <yuancan@huawei.com>
Cc: pmalani@chromium.org, bleung@chromium.org, gwendal@chromium.org,
 jflat@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


