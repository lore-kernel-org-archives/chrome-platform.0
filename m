Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D541366
	for <chrome-platform@lists.linux.dev>; Sun, 15 Jan 2023 12:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF6FC433F1;
	Sun, 15 Jan 2023 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673787016;
	bh=oQPjHzPeXEjsOkF6tDs2VQsOgln3FQJ79HKCqEmaDoI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TlQflLoygYr6Ej8d7htAarcWmDH8WI14donDzSoENVHz8PVOmab8l3lGveUNEbLSK
	 lwxZNkrxFQmmCfOBbLF8MWrhE7/manrM7yn+dUHo9WTDBGyafamg00fJkp7QEXbnCN
	 1V8fr0Safhm6QdX9y791T5vHCteN7inU6NRzEju7HSZ8Z3Aw+SCTB79SnGULIxKVo/
	 G6TTXB8AH+dQpscpI2txfPwwU6Tv4tVqs61slzXkBhiB/38SMMWy8fIs4BLLjRtw8N
	 BXcdYVBqsJY9ThhOCeHOlIdG53CANo1PJlbUrvPQW4D6IZxQDCzEPtPjOHTlcpyyfR
	 kxv+0Rnv7f+Ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71451E451BC;
	Sun, 15 Jan 2023 12:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Use per-device lockdep key
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167378701646.8704.18327455670891800657.git-patchwork-notify@kernel.org>
Date: Sun, 15 Jan 2023 12:50:16 +0000
References: <20230111074146.2624496-1-wenst@chromium.org>
In-Reply-To: <20230111074146.2624496-1-wenst@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 angelogioacchino.delregno@collabora.com, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 11 Jan 2023 15:41:46 +0800 you wrote:
> Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> the following lock sequences:
> 
> 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> 2. lock(&ec_dev->lock); lock(prepare_lock);
> 
> The actual dependency chains are much longer. The shortened version
> looks somewhat like:
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: cros_ec: Use per-device lockdep key
    https://git.kernel.org/chrome-platform/c/961a325becd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


