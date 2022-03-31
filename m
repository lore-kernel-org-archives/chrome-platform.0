Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B77F6
	for <chrome-platform@lists.linux.dev>; Thu, 31 Mar 2022 16:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0017C3410F;
	Thu, 31 Mar 2022 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648745411;
	bh=I5/FdXtaOja+uvX1suaQm56n/ZLaVva4TPDEKdudEtY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HZfyVtsE/whbVkP1ltYaFqfHMb8P6L71G5aTKB++4af+RfOOCijMQ4CBwocDXAGAg
	 4RDT6nE+CJ9Vogeq68yQPxyXYexLSBTlpNSNIezzgya373HMv6wey7qa4CytSqdPQy
	 wfsOy30NmADPkpKlII9yoim+QZIQIr6xoPD6Id59+rsWevtfrrk2QF254hnNg3lLw7
	 h64ppDZinbIZE7aOI/oNbeZU7wYoG0kHyP7FuGJHK/qLsHZpyURgJU1AN7elUH1rsf
	 cEP30j/b2MuxhNZuvyZeNPQAXgKz0Wh13/+TUdtdKWdqg8QFG8mTrqotqQfM+PaHcd
	 EaLZU8YbwUz5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84898EAC09B;
	Thu, 31 Mar 2022 16:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v2] platform/chrome: cros_ec_debugfs: detach log reader
 wq from devm
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <164874541153.10400.1381918250182288340.git-patchwork-notify@kernel.org>
Date: Thu, 31 Mar 2022 16:50:11 +0000
References: <20220209051130.386175-1-tzungbi@google.com>
In-Reply-To: <20220209051130.386175-1-tzungbi@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Benson Leung <bleung@chromium.org>:

On Wed,  9 Feb 2022 13:11:30 +0800 you wrote:
> Debugfs console_log uses devm memory (e.g. debug_info in
> cros_ec_console_log_poll()).  However, lifecycles of device and debugfs
> are independent.  An use-after-free issue is observed if userland
> program operates the debugfs after the memory has been freed.
> 
> The call trace:
>  do_raw_spin_lock
>  _raw_spin_lock_irqsave
>  remove_wait_queue
>  ep_unregister_pollwait
>  ep_remove
>  do_epoll_ctl
> 
> [...]

Here is the summary with links:
  - [RESEND,v2] platform/chrome: cros_ec_debugfs: detach log reader wq from devm
    https://git.kernel.org/chrome-platform/c/a9e896f70fbe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


