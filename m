Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DC4436
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 08:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BB0AC4339B;
	Tue, 11 Apr 2023 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681202417;
	bh=HbxdjJ8Rrt0v7Bt0HzG2zR30ytQ0iwj8HzMCOY15Qvo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q2bZM51+R9PMCHNYpjpQly2+bBYmZq1WSTdJBsfhqkRD7TAlQXqmp5df54/g8ZBJt
	 WI7zyxi/j51haEL4r9Jwsqd1sOsgeHY1NHTQT4VkrugYL9SnXd4ofj0kU4e5xln5Wg
	 UV1ru3vYa4PE0GXgfe+U1SNwIYd2lVx5roxcjKy3YbC2pyf8zkuSAQsANDjStw26G3
	 SRQQTTsWmk2/R3WVUaPbFVHcw443LG2C5Htm1Pw9eV3qa/pxFe+HRU/xT8QSW5V1GG
	 x1zhn8zfcK9ydYtHOJgcbcHr0sXoojQgfZMma3yt/a7I1kywLxvpUxBhp7iiNGJyEB
	 blWTHTNj3t0vw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50C79C395C3;
	Tue, 11 Apr 2023 08:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: fix kernel-doc warning
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168120241732.23280.12257763895560230097.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 08:40:17 +0000
References: <20230411053308.1572493-1-tzungbi@kernel.org>
In-Reply-To: <20230411053308.1572493-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 robbarnes@google.com, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 11 Apr 2023 13:33:08 +0800 you wrote:
> Fix the following kernel-doc warning:
> 
> $ ./scripts/kernel-doc -none drivers/platform/chrome/*
> [...]
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
> 
> Fixes: 14bb09b32f43 ("platform/chrome: cros_ec: Separate logic for getting panic info")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_debugfs: fix kernel-doc warning
    https://git.kernel.org/chrome-platform/c/419346a03810

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


