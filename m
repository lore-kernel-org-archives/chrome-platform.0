Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112CC2F2D
	for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 19:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0472C340ED;
	Fri, 18 Feb 2022 19:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645212609;
	bh=Aor+yYrpVk3I4zOVu/bpcm/TiPLQSK9dpX3rCNBGhn8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=slcNaMxl5M8mQNWRsxZtY6ptZIPbXbmq77XWI4DNNUjfj7uOtEUijxCHK/2XRKNzs
	 X9+JHD/0EiSG1jknZbGnx4s7mE9LA3kxfIH2raL2AJMc1pzcOe9u2dtrCYcANe3Rj6
	 oQfz7dJ0MjpYSIqDiZMxQoY3vwZA0QnLWzZDFwf9J/mmawZWKa2vAa5BDNuB+YoXJS
	 A9jZLJ250Vif4ll8WT4ySkPqzpesgs4O1UIN+0BlxAsvE6Hm9v5KVf5ewUjwVdVvWW
	 xnZG9zy8R7LLz4uM+SgOn+zqCbPra71qb9ilEK5eBEiK1LBL8j7ySJuv2qJoTE4er+
	 3Z5f2SfHaABQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 967FAE6BBD2;
	Fri, 18 Feb 2022 19:30:09 +0000 (UTC)
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
 <164521260961.10361.104642923690216470.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 19:30:09 +0000
References: <20220209051130.386175-1-tzungbi@google.com>
In-Reply-To: <20220209051130.386175-1-tzungbi@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


