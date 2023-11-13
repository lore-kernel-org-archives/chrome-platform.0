Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A7BE74
	for <chrome-platform@lists.linux.dev>; Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bR1Jq+W7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46C41C433B7;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=sTORHFHs64nriYPghaE5on9s96E8KHDcO2AObOHSmYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bR1Jq+W7c7tQOEqWMzeeY8RXV+14qqgrDGSEnoFOBf3JAOnMTf6CT7qCg10U0nR0P
	 zQzr1cxfpGj+A1f3T5pDsHW2cIgf0D/bSgWVEWXkH5ohWPzIH/9/iepkE9PjSyz9gC
	 jmrDMsciwX/JQ++Cd1yKWAiMyva+22B8Y4Nyr6Al8AZDNmkcmBMrZwHy8agT7BH3V4
	 GxqmlHUYQz2BxWBYea9u+wF8bm5G/JXACqmX1paJ8AaaB7kKKHFIIUai0XBiz+m0Nc
	 JTNijb89KFoGOaIW3f/8C167H5XzHY21wha3qfX4tQgh+vXZdYdYLzaXrSGv25CNfh
	 31jNlqn+wLybg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26A71C04DD9;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] pwm: Some random cleanups
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984583515.27851.15324455433917462968.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:55 +0000
References: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: thierry.reding@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 florian.fainelli@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, bleung@chromium.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri, 29 Sep 2023 18:19:07 +0200 you wrote:
> Hello,
> 
> this is a set of patches I based my efforts for closing a race condition
> in the pwm core on. I thought I already sent them out, but it seems I
> didn't. So here they come!
> 
> Best regards
> Uwe
> 
> [...]

Here is the summary with links:
  - [11/11] pwm: cros-ec: Simplify using devm_pwmchip_add() and dev_err_probe()
    https://git.kernel.org/chrome-platform/c/896c450960f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


