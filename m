Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C9A31
	for <chrome-platform@lists.linux.dev>; Mon, 22 May 2023 02:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E82D8C433EF;
	Mon, 22 May 2023 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684720818;
	bh=vgp6hJm/vWyMHVXhpxYTvE7f5RkA1ojsj0SsD5EZq5Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IibpE/ooD9OqBtOEJI9X5R/5gqond8J8amebc/0tXn2fxgDo8mS36h0YhGuMl/i31
	 pB8oTI7SbsA7GCB1ppgFhFM7vdS5ognwJuxgm6umHDi5HBcCl6wlXWKrqI568KtqIQ
	 UmUkoxHKWPMwzKwcKgQ86BLgkSf6TiwFHR8VW1dlNbPJptG7j0kWCfztw5C273QCTZ
	 51AJFRUIKLKkNfMxKalnCYxBK76skh/dFJQPLzUaEP9fR8H9EMCm73dPDBaN8q23kc
	 290Py5NRm3XBWkgoDeX69qyLw1aTiw19IQ6xAdcbyp4yvKT45rHlKHY2evs7Scs9lp
	 akVhG1g86VYHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1149E22AEA;
	Mon, 22 May 2023 02:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to
 prepare/complete
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168472081877.13165.9276729939712953401.git-patchwork-notify@kernel.org>
Date: Mon, 22 May 2023 02:00:18 +0000
References: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
In-Reply-To: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
To: Tim Van Patten <timvp@chromium.org>
Cc: linux-kernel@vger.kernel.org, robbarnes@google.com, lalithkraj@google.com,
 rrangel@chromium.org, bleung@chromium.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 15 May 2023 14:25:52 -0600 you wrote:
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> host command that the AP sends and allows the EC to log entry/exit of
> AP's suspend/resume more accurately.
> 
> Changes in v9:
> - Remove log statements.
> - Ignore return value from cros_ec_resume().
> 
> [...]

Here is the summary with links:
  - [v9] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
    https://git.kernel.org/chrome-platform/c/4b9abbc132b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


