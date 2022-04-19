Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C23A23
	for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 03:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 369B8C385A8;
	Tue, 19 Apr 2022 03:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650339012;
	bh=r//ufWO4fvNfizfxS4vuRz+uxWC37f5ihVH/4Y4xBAE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Xtc7k0+NbNf3WdkIynN4Xt+VJBtCOe1o+m2nWwP8M2VnfPZzVcxMhVLerZcThCfNs
	 h0uU9ti6oALFYdH5rbIpKFSECHSK7DuY5od+77aHaKAbmeWnZW6tizpEdzL4Ldeo7m
	 CPiT0iC7L5CW1vmFMvbtwNu0Hc6j1fdM3iIg7rqWBja9HugFgCtuQec9xAvFjufzjo
	 zt0aAWGKsgzo+NIP8JSqytPU2wTG6mL9uQPXFURnTEge9Q110En38IqtPWVuWkYQQw
	 xVnUKILVrXdunYHe+ZfQ9Z/zM3shej1+9zDrQVvT2sUDwQm61N/HQ1tn/sQpRglGMa
	 OHx7ke62GwOgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16B7AE8DD61;
	Tue, 19 Apr 2022 03:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: Re-introduce cros_ec_cmd_xfer and use it
 for ioctls
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165033901208.10174.13978945686641197234.git-patchwork-notify@kernel.org>
Date: Tue, 19 Apr 2022 03:30:12 +0000
References: <20220318165422.686848-1-linux@roeck-us.net>
In-Reply-To: <20220318165422.686848-1-linux@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, dnojiri@chromium.org, robbarnes@google.com,
 rajatja@google.com, briannorris@chromium.org, parthmalkan@google.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 18 Mar 2022 09:54:22 -0700 you wrote:
> Commit 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use
> cros_ec_cmd_xfer_status helper") inadvertendly changed the userspace ABI.
> Previously, cros_ec ioctls would only report errors if the EC communication
> failed, and otherwise return success and the result of the EC
> communication. An EC command execution failure was reported in the EC
> response field. The above mentioned commit changed this behavior, and the
> ioctl itself would fail. This breaks userspace commands trying to analyze
> the EC command execution error since the actual EC command response is no
> longer reported to userspace.
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: Re-introduce cros_ec_cmd_xfer and use it for ioctls
    https://git.kernel.org/chrome-platform/c/57b888ca2541

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


