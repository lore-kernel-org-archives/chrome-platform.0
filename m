Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444D1857
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 01:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44B2EC385A5;
	Wed, 20 Jul 2022 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658280617;
	bh=k8mqhcRN2cRT2ClXpt8k31RAq8l06tUFWOfrpK1kGP4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fw980rRgYTl//FHXQyzxu8racjYjW1sz9PziswDVqq/YByGGl9KO8g7tcYkJFUpOv
	 4Be6llj1kYn2JQs0AIsttcxLnO9KDSBc3N1AHTHTaARcz6RLIlXxKzJ2mwx7zOyQNr
	 gxUhNsO/7Xjw1Sm9w3rsbPhIomxxMIMHVpDgJvKH6a/51wSQP4ydd73K1b4JdrVcZO
	 AcwuoSE7UmyLlmQJBZo33WN8HMyP4yXJREXDhrZwNK+lR2A59PRRnlYxhvPC3KncUo
	 1oGl1D6hmk4ydjmAb000mBG1ZRnoFvchrbbRzD5c2spFn8SHmNaWH3Drtpuq4D8AsJ
	 xEUyGGkZkFVzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D686E451BC;
	Wed, 20 Jul 2022 01:30:17 +0000 (UTC)
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
 <165828061711.6388.4176432873151279713.git-patchwork-notify@kernel.org>
Date: Wed, 20 Jul 2022 01:30:17 +0000
References: <20220718105047.2356542-1-tzungbi@kernel.org>
In-Reply-To: <20220718105047.2356542-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


