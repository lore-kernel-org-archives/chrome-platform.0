Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0925EBB
	for <chrome-platform@lists.linux.dev>; Fri,  7 Apr 2023 18:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70A9EC4339B;
	Fri,  7 Apr 2023 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680893423;
	bh=ZiYEKsqOI0pOUlUcoEiV/9lrkZr71nCRzoLQGsYGPBk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=njfIoS95/71qXkxNPrHdF+g167rl8Xw1fMH+/JEr/wGuLb5emO/0m+82BPcHMUhRH
	 XyqFpCCPRtSYwQ6UWcivysJ1hKNBAIMRA04CwwLND2gY2OBPHxMy2Ax0YxqAJB8lGa
	 02Co0RtDHlzDh1LZE6JNVYkDGRdLgi8exOqqR+bcTcQQNPLlZdbIw0b7OXkoGhF33c
	 egII7uS1q9k+q9YR1ALt5pOE95SHzeVTFn5lRobOxzVotIG7/x9CBZW/FT3DzQZJ6a
	 4KQhJTMxbvpTcf2wmfXcKHVngSlb3oHJAz4FsYjACiXfbZjNjlORC8IumZ6YP82jRv
	 KX2bC/XelhZZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 591B8C395C5;
	Fri,  7 Apr 2023 18:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_typec_switch: Add missing
 fwnode_handle_put()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168089342336.26662.11598953499500535538.git-patchwork-notify@kernel.org>
Date: Fri, 07 Apr 2023 18:50:23 +0000
References: <20230322041657.1857001-1-windhl@126.com>
In-Reply-To: <20230322041657.1857001-1-windhl@126.com>
To: Liang He <windhl@126.com>
Cc: pmalani@chromium.org, bleung@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Wed, 22 Mar 2023 12:16:57 +0800 you wrote:
> In cros_typec_register_switches(), we should add fwnode_handle_put()
> when break out of the iteration device_for_each_child_node()
> as it will automatically increase and decrease the refcounter.
> 
> Fixes: affc804c44c8 ("platform/chrome: cros_typec_switch: Add switch driver")
> Signed-off-by: Liang He <windhl@126.com>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_typec_switch: Add missing fwnode_handle_put()
    https://git.kernel.org/chrome-platform/c/d946c9118047

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


