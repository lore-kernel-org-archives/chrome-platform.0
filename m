Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96797659
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 07:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 458F9C433C1;
	Mon, 22 Aug 2022 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661151615;
	bh=GM0/nH6Y1mx/boMsnRZHYdSE5Zc2T1SoWyaoIz9p1u0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bZ5+mn/0bi9T7jbd8VqxAvhFAnXJrEY76K2/jc3GthZmV5Ij67TWH28SsIPVgD/3X
	 Pun6xo0XfQJSdDu3GcFmK1IciaO65g2SpCLN5uUgCOLFFcZ2Ew4agZEPffXlMW+Qay
	 ARcrodUSY/C/w9nfAp+Rb2Y3D1r2/pbNbylS4rT23+83mUYrbyPyVi3R2M5XAuVWdW
	 zkZQuZ0EoAS6QDeXjDQ4bGKq7i2YghWNzWMTLnKd3iIpXpYNB/7TG1ipc047eNahP4
	 c+lzQ/fz3mcodsZK6vB1LMzZi075VSwjLdkcKS8eTtmh8eX4a1UVjIbJsTXG9AkW0f
	 1J8xklf6LgKDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29A6FC4166F;
	Mon, 22 Aug 2022 07:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: fix double-free in chromeos_laptop_prepare()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166115161516.13978.12007993909417445952.git-patchwork-notify@kernel.org>
Date: Mon, 22 Aug 2022 07:00:15 +0000
References: <20220813220843.2373004-1-subkhankulov@ispras.ru>
In-Reply-To: <20220813220843.2373004-1-subkhankulov@ispras.ru>
To: Rustam Subkhankulov <subkhankulov@ispras.ru>
Cc: bleung@chromium.org, dmitry.torokhov@gmail.com,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 khoroshilov@ispras.ru, ldv-project@linuxtesting.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Sun, 14 Aug 2022 01:08:43 +0300 you wrote:
> If chromeos_laptop_prepare_i2c_peripherals() fails after allocating memory
> for 'cros_laptop->i2c_peripherals', this memory is freed at 'err_out' label
> and nonzero value is returned. Then chromeos_laptop_destroy() is called,
> resulting in double-free error.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]

Here is the summary with links:
  - platform/chrome: fix double-free in chromeos_laptop_prepare()
    https://git.kernel.org/chrome-platform/c/6ad4194d6a1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


