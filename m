Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0A15CF
	for <chrome-platform@lists.linux.dev>; Wed, 18 Jan 2023 03:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28FEDC433D2;
	Wed, 18 Jan 2023 03:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674010818;
	bh=dhYNUGfgAUuzke7ncAdclomX5aWA2G6NSVKk0LqQ5z4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XIQreBEEh3GD/lptulfB7WnDAs5IDa+IaHkCQNeUno5NVk44QO5w3bujwltWBZ6PC
	 B5dWmw5lGYenyLHg1wcq7xR0l+Zh2Ti5CUEbxxd6Pm4v3lAWz6m/+atoXlasFMkKnn
	 El8rl6oga46lJp8EQrK8K8LqNg3pSjF/PbuTjwitRUgDu4396/jFvIzP5ix2+l3vQY
	 S26FBhhZQpS/OFsVjmoHzlXD4S+J52EkIqRl2T+MNvtKRLC9Mc7yNa1yyISGVm0+tq
	 +e4GKMpJpv2aFC3P4e+hLDpnkYMLy9N2JPZWDFANf8bPyPMBAmmvhP1Hs+Vx1QV/dv
	 C+4zk58RAZXCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EE7FC43159;
	Wed, 18 Jan 2023 03:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix negative type promoted to
 high
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167401081805.470.10087598903854185198.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jan 2023 03:00:18 +0000
References: <20230109081554.3792547-1-tzungbi@kernel.org>
In-Reply-To: <20230109081554.3792547-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 markhas@chromium.org, bhanumaiya@chromium.org, error27@gmail.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon,  9 Jan 2023 16:15:54 +0800 you wrote:
> serdev_device_write_buf() returns negative numbers on errors.  When
> the return value compares to unsigned integer `len`, it promotes to
> quite large positive number.
> 
> Fix it.
> 
> Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_uart: fix negative type promoted to high
    https://git.kernel.org/chrome-platform/c/8bb233b27fb7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


