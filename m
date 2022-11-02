Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3EB62D
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 04:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59278C433D7;
	Wed,  2 Nov 2022 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667363420;
	bh=SxcFiNNlESZYmu8HD6awz4+sxFK8D7D4b4vaLc6b+jY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V5wQx3tjESP46X8N5iYm+4ZZ1UdainoHjc/+5G2VTnDNSdjbILPrUaJIcL2g7b35M
	 dtxOZTMLEGDRDN9fkSQHBsDuRCtF8wKEPxDMBltOQ9HxRxh1YbcjKGYlD5AIm6Wo1I
	 JcS6UF1rQViEPN1FM6MdrY+rFxCVtRGZkzuRoofIviZlwhQEH6pNZJAZBDn9YPOGGj
	 5GVKVkcVg9ZWJPSDEKnloe3+cP8oaoAmQhOSVKGdeGsp08jd8etOtDLbp8gZG3HmF/
	 tFk0URyO2zRjJYcEJUpkv4EKoFrMRRpMHzssCjugFmYvj9pOL90QO1WjVtL6OBq1o1
	 wYZw9GAy6GrGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45885E270D5;
	Wed,  2 Nov 2022 04:30:20 +0000 (UTC)
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
 <166736342028.16570.10158503441705914946.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 04:30:20 +0000
References: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
In-Reply-To: <20221101152132.v2.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid>
To: Brian Norris <briannorris@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
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


