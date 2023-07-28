Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB57C
	for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 02:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBA49C433C9;
	Fri, 28 Jul 2023 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690509619;
	bh=dqrBr3LGlxHks7/U5bcjxzrJD9lsAaXyTek6qcarDc4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bUypoGRNlE4tizoKu59uFnqrrTXk5kXGGIApqyzuPuX3Kbokm8AQqmVJl+Gc74GXN
	 vQ+FBur3H359iEc6dzXedgArCiOJXpr8+E1N4NuRnHurPutFUjIYRnHeNRv7fDfWI7
	 sB+ietWsthK8WDs0dIeDTIXrGjnEokNAkrT2yCPETXG4z5WtjJqANyAMb8HRpKcUi7
	 9Qlc2HJG38m0XRbk7C2PFVEBAxkaZlN68bgey+UaEB5+aze7MwxPWVJ7E3sLwLZ1k4
	 HOGFwN0EkeGfnYf6ncBh9VHujoBFA+yHIGj66jrnOK4b7dlt/wDjU3Sud7h5u5eL/1
	 hGsFhIs0yloiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1643C595D0;
	Fri, 28 Jul 2023 02:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169050961965.7430.17069420658023468694.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jul 2023 02:00:19 +0000
References: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
In-Reply-To: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 dtor@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 26 Jul 2023 18:17:39 +0000 you wrote:
> Perform a filesystem sync when an EC panic is reported. The
> sync is performed twice in case some inodes or pages are
> temporarily locked. Testing showed syncing twice significantly
> improved reliability.
> 
> hw_protection_shutdown is replaced for a couple reasons. It is
> unnecessary because the EC will force reset either way.
> hw_protection_shutdown does not reliably sync filesystem
> before shutting down.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
    https://git.kernel.org/chrome-platform/c/0a329167220a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


