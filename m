Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A028EC
	for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 08:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10101C341CE;
	Thu, 21 Jul 2022 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658393416;
	bh=fJEbxj/rLvARqpZfUp6BagahrLnkUsF2v0RN86pTDVE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FgqOVNjdr3+5kUXtlfmfgR2ts/rl/UP5B0lSbv5uqKFCNbuRtsb7eRIbzZYIl4tYm
	 Wpi0SZbUL3SiXPyG+wjXsUriIfyzXiAlLLRzLiuJfXIRoJntN3zpw62GP24NsF+AuQ
	 xOGoeVszdxGby9ocbXQ/0eOUcjH8IOrQJkXxfCRNhWac+azi5AABOsGPtW2doAevyG
	 52AlvsgmWvXxZr2PrJ1GAMH/f58RByerTt5heLAn+Pkg0U9pYSRrjGLrqPGDuDGNBh
	 x1ct4xjIp4NaBM1xhI2ttknt6jJYqsSmN8ADglHsNCMME+6Ef1dwxuAfl/X7j4a4LW
	 51Z54gi1op2vQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8DCCE451BD;
	Thu, 21 Jul 2022 08:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: cros_kbd_led_backlight: fix build warning
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165839341595.29073.14151139321094625998.git-patchwork-notify@kernel.org>
Date: Thu, 21 Jul 2022 08:50:15 +0000
References: <20220718105047.2356542-1-tzungbi@kernel.org>
In-Reply-To: <20220718105047.2356542-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 18 Jul 2022 10:50:47 +0000 you wrote:
> drivers/platform/chrome/cros_kbd_led_backlight.c got a new build warning
> when using the randconfig in [1]:
> >>> warning: unused variable 'keyboard_led_drvdata_ec_pwm'
> 
> The warning happens when CONFIG_CROS_EC is set but CONFIG_OF is not set.
> Reproduce:
> - mkdir build_dir
> - wget [1] -O build_dir/.config
> - COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 \
>   O=build_dir ARCH=s390 SHELL=/bin/bash drivers/platform/chrome/
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: cros_kbd_led_backlight: fix build warning
    https://git.kernel.org/chrome-platform/c/7e76e4bc0099

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


