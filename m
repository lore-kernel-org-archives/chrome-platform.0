Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB61A392
	for <chrome-platform@lists.linux.dev>; Mon,  7 Aug 2023 02:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F173C433CA;
	Mon,  7 Aug 2023 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691376021;
	bh=FdKig/TFxdJ4eoxL+le5qYryqsBWn1IJw88foFdlxAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hsoRIYYNuYmnGaZFJj3dxKwVUakN4eIbTc6Ty9rj5Eu2FlvbICBn9V6tUSkqDNMmz
	 ONbmfCoEK4EnNOiKZ1k3Kd97TXC+YTbt71njcBO6wXQy0jPP5Ryqf7URC2j+xBnEJs
	 osIrv6tZYu/agDsYVsa24h4rwtgLbXQfuIF5a1bTIg7gSsQ1LGnZrB4UD/Za8buUe6
	 XGkJfoy4PPYbctcnEIz0x5J4GajkmCgJmJV6QLd1m2rvCVq2/CNDoiuBoj7QqD1q3r
	 LZ/gmg1cMU1ZhUSyTlPoKGUMLYaOuG70opL0QpmsX7kI4x2E4SY9yYGAnLCdawo3fB
	 0Qkt1q+M2uSCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2CE3E505D5;
	Mon,  7 Aug 2023 02:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Remove EC panic shutdown
 timeout
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169137602099.16990.6569232365086631640.git-patchwork-notify@kernel.org>
Date: Mon, 07 Aug 2023 02:40:20 +0000
References: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
In-Reply-To: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 dtor@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed,  2 Aug 2023 17:58:48 +0000 you wrote:
> Remove the 1 second timeout applied to hw_protection_shutdown after an
> EC panic. On some platforms this 1 second timeout is insufficient to
> allow the filesystem to fully sync. Independently the EC will force a
> full system reset after a short period. So this backup timeout is
> unnecessary.
> 
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc: Remove EC panic shutdown timeout
    https://git.kernel.org/chrome-platform/c/f2d4dced9a58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


