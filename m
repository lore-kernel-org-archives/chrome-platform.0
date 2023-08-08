Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE11EC1
	for <chrome-platform@lists.linux.dev>; Tue,  8 Aug 2023 02:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA80BC433CB;
	Tue,  8 Aug 2023 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691462421;
	bh=BN9+ePxVNwK7cqg1QyCXov5dgrH8UzbVwNEQziN+fww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WR+961DXUuIYtN04mxMrhm9ujAQc+OEc3EyWYFhzD5QgteD0Vwd2qUsNVl1+rn2TH
	 AoTZipABI8JVjaSm9ZYMJp1PwinKMam30nGOpxAT7XMsrkwwMva0mBcRppkPUOU2DP
	 SXEO6xTfJIAcQncORtJvgPMxOkxi6c8FOnRzRz7pVH9Lj09HYtMo1HUaCzRShTOgtt
	 bgsh56J7adUdh2wGgU4TKkS5ensBiRY7/fGHkV+xwrnF95ByMoTXW0aK4hdqCVIFRX
	 CampdgyZJssjwima0QSCpO4qcRHJJbiyZZvWdEuQP7Z94on0LjQqkn1Pt3MjB6Q7mh
	 i/jt2eNZ7E5WQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B01F4E270C3;
	Tue,  8 Aug 2023 02:40:21 +0000 (UTC)
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
 <169146242171.22152.16707437625793558172.git-patchwork-notify@kernel.org>
Date: Tue, 08 Aug 2023 02:40:21 +0000
References: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
In-Reply-To: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 dtor@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


