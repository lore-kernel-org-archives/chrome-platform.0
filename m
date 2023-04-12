Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35470362
	for <chrome-platform@lists.linux.dev>; Wed, 12 Apr 2023 02:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA2B4C433D2;
	Wed, 12 Apr 2023 02:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681267217;
	bh=OqTBqC26F+4YtXcaU38waBPrK9KXoStlbgRM1ZdCWjE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IDHxnnTgrC4Fdh7BkOv6eAwwMxcKT4HcUXxK0/vWAfWJxTss/rnldV2QFRdS6fQ5F
	 f32AiJLX53wxgiJrj5t3h8rW2VdOydkM+Yk/mcjRGmjzhlFHCljVwAO3FGP/3PGTkx
	 ZhUAmAASneXjgd6E+9+mKRPUVQyq8vp5I12vPVS90Z0ZzSUnDlLXE15fKG1D/xcaez
	 284fY8PMjBGdDABbVuve4AQjKMKsRs9YHfTvu+CG1Fzdvx1ldcOSfG/qWf9qAn3LIP
	 GHRfvoKfGWga43Z9h4riGKEvtr+Amt54IksyqL230ckDB2FEK5Gpx6HD1t0Dz5crR2
	 kPuQpUahYKWKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF23EE52445;
	Wed, 12 Apr 2023 02:40:17 +0000 (UTC)
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
 <168126721771.25991.1823844366883716893.git-patchwork-notify@kernel.org>
Date: Wed, 12 Apr 2023 02:40:17 +0000
References: <20230411053308.1572493-1-tzungbi@kernel.org>
In-Reply-To: <20230411053308.1572493-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 robbarnes@google.com, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


