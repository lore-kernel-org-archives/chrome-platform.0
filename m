Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926562B
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 12:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC6A0C433D7;
	Wed,  2 Nov 2022 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667392220;
	bh=YHdwvSSp31rpaVUu1IPs5fZGMAK4yyiJLufmWI6wSHM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kusuR8MAO7EdIAJQkbteWEDXEZ2UJW9R4EnDf/yLgTTriEytXKtXeeRuxdtHnPfi8
	 VJoSy9byZiJ0X5YpF4TR5Mk5vaZCqszK+UR8tFHigPioKMBN4n9Gmdx1e45wPWDgzE
	 +pavTpbNU6FtRY3EgzwkoOKhJkPKqKiAu1+a8Td6Zda7l61Y/Bfw4KjH5JJ14ewjzu
	 6ALwfMr90mY4IB8GyqnesBOYJpVE2K7t4umYDfz+AJeAPwa3Ab0an5NzUu6kPBW0LR
	 gZBVZk11KGtdVFT2vTtN8LFPXWIzgprCnC/c6bhlV+8brwhK6y0qJaQxYQlvOp4bBi
	 DV32ZNHZ1Pj7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CCC4DE270D5;
	Wed,  2 Nov 2022 12:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/5] platform/chrome: cros_ec_lpc: Move mec_init to device
 probe
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166739221982.25408.16940321573128545413.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 12:30:19 +0000
References: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
In-Reply-To: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
To: Brian Norris <briannorris@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  1 Nov 2022 15:22:06 -0700 you wrote:
> Disregarding the weird global state hiding in this cros_ec_lpc_mec_*()
> stuff, it belongs in device probe. We shouldn't assume we can access
> hardware resources when the device isn't attached to the driver.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v2,1/5] platform/chrome: cros_ec_lpc: Move mec_init to device probe
    https://git.kernel.org/chrome-platform/c/fdf84f9ae30b
  - [v2,2/5] platform/chrome: cros_ec_lpc: Mark PROBE_PREFER_ASYNCHRONOUS
    https://git.kernel.org/chrome-platform/c/bd88b965ae8c
  - [v2,3/5] platform/chrome: cros_ec_debugfs: Set PROBE_PREFER_ASYNCHRONOUS
    https://git.kernel.org/chrome-platform/c/692a68ad7f3c
  - [v2,4/5] platform/chrome: cros_ec_lightbar: Set PROBE_PREFER_ASYNCHRONOUS
    https://git.kernel.org/chrome-platform/c/873ab3e886b5
  - [v2,5/5] platform/chrome: cros_ec_spi: Set PROBE_PREFER_ASYNCHRONOUS
    https://git.kernel.org/chrome-platform/c/015e4b05c377

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


