Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41824138D
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 08:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8678C433D2;
	Tue,  3 Jan 2023 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672733417;
	bh=LolvR45bNcm2BYtFtQaYYMb+JUQ3sNkR7wCRw3sNySw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YOlsz9Bq9Wedm8F4vuQpQUPWew2mMmJ0XFANS6D/ODepD1XvW6EWuaKdfXY0xsgh5
	 cdXq/yA7CNC53InOLF8oMEV3Z9yHturnstgdBpNigTjSblXlP0rMIGgF33bqLPmbv0
	 gXp7W8c54eC3Q3bZUCK5CkhKQNwkxjJuRjiZ0FNQsljEACsSIsFG1z+mhfLWB1YdB8
	 lycwuHYDB9LjCRN/334V/SvR3feZ6Rt4SnBoOhqIYzs5MqcWu2da7oFChNDWa5X/bT
	 RSy/via2/8f5s9KKnD2hb1t/BH9hMLIzJIcVkHYIXJyeY2zNf8LYUAjpogn91Zz6O8
	 mjRHBg+mEO09w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE280C395DF;
	Tue,  3 Jan 2023 08:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix race condition
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167273341683.4841.3660002681019817981.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jan 2023 08:10:16 +0000
References: <20221229094738.2304044-1-tzungbi@kernel.org>
In-Reply-To: <20221229094738.2304044-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 robertzieba@google.com, markhas@chromium.org, bhanumaiya@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Thu, 29 Dec 2022 17:47:38 +0800 you wrote:
> From: Robert Zieba <robertzieba@google.com>
> 
> serdev_device_set_client_ops() is called before `ec_dev` is fully
> initialized.  This can result in cros_ec_uart_rx_bytes() being called
> while `ec_dev` is still not initialized, resulting in a kernel panic.
> 
> Call serdev_device_set_client_ops() after `ec_dev` is initialized.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_uart: fix race condition
    https://git.kernel.org/chrome-platform/c/56d4b33d45e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


