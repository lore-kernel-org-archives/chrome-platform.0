Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871CC17E3
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 03:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 260C8C433EF;
	Tue, 11 Apr 2023 03:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681182018;
	bh=5Fbluf0PPEPGYpJSHdgc1xfB0XcWNCzDZQpU++NU9HI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g3A+oeG0t9d+mCCudWtH0R3iO+JvtDMwk043K1SAY6XOu0LWRw22783wo6jn7zyhb
	 QDIwgPvBZkeH0QR6ZqyH5hdjessTOQoEuo6tkpwoFr1WtAMwV9S5RSloWVSYc/KSzn
	 V0TO+cyQFSFWsSppBTBqEyIt+Ea4FtmfrAe6EEWu1lVK5xRqQM8G1FzDIFDWG+QSk1
	 eR1FMwRtkGhtRGGZrv73NIQhjCmgtJtWptgZaCaFQzMArwLb1iEqRWXUOFJo4wDs/E
	 U3VOHYPJNIlbCTEZ6vkKtnjhgSm197YM4qd9fKtzub+JhRIZJXd+cOpVoRwdvGAEh7
	 vUc3EZBwAt/oQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0ACB9FE9B5F;
	Tue, 11 Apr 2023 03:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Separate logic for getting panic
 info
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168118201804.17651.14729045916454683515.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 03:00:18 +0000
References: <20230410165817.932449-1-robbarnes@google.com>
In-Reply-To: <20230410165817.932449-1-robbarnes@google.com>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org,
 gwendal@chromium.org, tzungbi@kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 10 Apr 2023 16:58:17 +0000 you wrote:
> Create a separate function called cros_ec_get_panicinfo for getting
> panic info from EC.
> 
> Currently cros_ec_create_panicinfo is the only caller.
> 
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: cros_ec: Separate logic for getting panic info
    https://git.kernel.org/chrome-platform/c/14bb09b32f43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


