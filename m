Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA52F3F
	for <chrome-platform@lists.linux.dev>; Mon, 10 Apr 2023 20:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80720C4339B;
	Mon, 10 Apr 2023 20:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681158617;
	bh=dvMuJmUYKXkFOnj5mdVrJ5yuAXCP9wbGh2vaknGyWDU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gyqouiolDnn9WMMMBoMpZQn0X71GUlSaRgOD+XLWvUmTflXmP3aWNXAunMxANsDVI
	 CKud3OynsdL2DxRL1N1qOs1Lg7FoktDiHOJ4NL+2sxRGE9HIgxZvo6OOkxoEktJZaz
	 3e22FYNP3S485+A1prqw1e9JWwo+H73I6ISKkv/4fPbLJuPR5jV7gBpNqnTBfoaa9Z
	 9PgABr7/uG/WEOwo1U86c7kVysHlL/KeaAuR8pq7gMa7kgNapo8r5LZTHs900ydGWS
	 Kqo4NakR0+WakGgPrSinfpqfcak88cmRS956Np3U9ZFUPYLtkpCsoXV3Pdqh/EjHyc
	 tOZztlHy8DK1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6785DC395C5;
	Mon, 10 Apr 2023 20:30:17 +0000 (UTC)
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
 <168115861742.7015.13033618065240895011.git-patchwork-notify@kernel.org>
Date: Mon, 10 Apr 2023 20:30:17 +0000
References: <20230322041657.1857001-1-windhl@126.com>
In-Reply-To: <20230322041657.1857001-1-windhl@126.com>
To: Liang He <windhl@126.com>
Cc: pmalani@chromium.org, bleung@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


