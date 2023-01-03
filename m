Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D810374
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 05:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99766C433F1;
	Tue,  3 Jan 2023 05:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672724416;
	bh=mlwVKRPK433ETPffGx58bPMaJGLraVwTg0op8+aVntQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=StH2QbW5Vop8hPlHHn2w3Pg6uVtCfPD19uFFQvYeljLsYywvcBT2nbDSDcwCND7hK
	 JDIh6D3Rvp8T5FE+OFEvCvhs8q2ImmvH2LndT6LiFfn3J8XW7XDYleEl1joF3rIV2Y
	 Ki9vJxy4gXkgH/LZ9aSurKu/ksY95kuoG9YTY4Sld3GPlvz799RytKwv0moriHlhTt
	 8T5z7lyDGhLtHp2qH6+/RZY0tAq7yFpJ7UHRwRrOAvq51OZcUs8dbtOqA/GVHWWqU0
	 ZOzdfFyNn6NJKQHf8B3yLjSYT4NcoyajDxVffRheCpIu0ZbvEi0Okpb9O7nzPF339I
	 rzDz01FTYYB2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A03BC395EA;
	Tue,  3 Jan 2023 05:40:16 +0000 (UTC)
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
 <167272441649.10584.9545890058713452896.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jan 2023 05:40:16 +0000
References: <20221229094738.2304044-1-tzungbi@kernel.org>
In-Reply-To: <20221229094738.2304044-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 robertzieba@google.com, markhas@chromium.org, bhanumaiya@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


