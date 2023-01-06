Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41517B
	for <chrome-platform@lists.linux.dev>; Fri,  6 Jan 2023 03:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61ADBC433F0;
	Fri,  6 Jan 2023 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672977016;
	bh=YLBCMU0qGIRVCPLm2XBXA7u7w76LOC96MXjuaNbCmv0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JQ8ov2dyNjGkeaP9P5tENjKhUAuknRyKxwzI2sskkUlbm46n0CY6A8OQt0Ts+237O
	 AjbHU368NsFUrPz0oYBuZM006osu2QRp37Pfs+VYZMTEhDwI8WZxBYPw1fAK5tiNKO
	 Re6M48XjC0dBM/Cxp225prHYdpRk6mzbPvYCOK2k6qBaIqLbYtOwdGenGuVOsrXA8e
	 eRqZbM9fVHX1a5ppSQIxIag7YZo615JvuAhZGLkDycy0Gh0fhOF4cCOvA+lQhpVxJQ
	 mXSRksd1WMtb4X5XGqF51vnirrvMlCoLUcriJKtkS7LxAGEkef3oQda5xVVaBZ+0oq
	 z4mm5wrC9lqpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D4B8E5724D;
	Fri,  6 Jan 2023 03:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] Handle CrOS EC Panics
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167297701631.12088.14549595747542948276.git-patchwork-notify@kernel.org>
Date: Fri, 06 Jan 2023 03:50:16 +0000
References: <20230104011524.369764-1-robbarnes@google.com>
In-Reply-To: <20230104011524.369764-1-robbarnes@google.com>
To: Rob Barnes <robbarnes@google.com>
Cc: groeck@chromium.org, pmalani@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 dtor@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed,  4 Jan 2023 01:15:22 +0000 you wrote:
> Currently the OS ignores EC panics when they occur.
> After reporting a panic, the EC will force a hard reset,
> possibly after a short delay. This may cause loss of data.
> 
> These patches add a handler for CrOS EC panics. When
> a panic is detected the OS will attempt to flush critical
> data for debugging purposes and attempt an orderly shutdown.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] platform/chrome: cros_ec: Poll EC log on EC panic
    https://git.kernel.org/chrome-platform/c/d90fa2c64d59
  - [v3,2/2] platform/chrome: cros_ec: Shutdown on EC Panic
    https://git.kernel.org/chrome-platform/c/957445d730ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


