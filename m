Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C107C
	for <chrome-platform@lists.linux.dev>; Mon, 29 May 2023 00:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C2AAC4339B;
	Mon, 29 May 2023 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685320818;
	bh=669ZnZ/vN6FBrvasodceyQJbsz/SO6JtYmMeKCMhUp8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jZSma3Gs5scv3q3628afcQIRx+y/apVV+U0sLZS1NU7dL33Ib1HhTFnPSLtqSBteX
	 jgyAB19ah8o5D5ALMJM72r7XYkZujP+0hReanNJxoe+GTJzYhdK2+kEKYE8VQ5tpIP
	 d0dL8xRatXfFmLMH21xm3vvfOY64ORkglJCUAqWhZ1LbPDwhMAyHIFB83YQ2hZVRPl
	 E8SPvK2WW68MELEuV42kNhgvFGL64fcwoyMuvWV4zGKVU/er3XxPNj3bCYZDsv3enx
	 JKkZ69ip9qLSu0fRX9/7AubxjAJpmQpEklbdhGN+AZxEVXNbFCKJJq/ko4LmzHkW5G
	 at+3T7hqLHWSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71775E52BF4;
	Mon, 29 May 2023 00:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: Switch i2c drivers back to use .probe()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168532081845.24186.12756227770692686361.git-patchwork-notify@kernel.org>
Date: Mon, 29 May 2023 00:40:18 +0000
References: <20230526214703.2135137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230526214703.2135137-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: bleung@chromium.org, dcallagh@chromium.org, groeck@chromium.org,
 skyostil@chromium.org, chrome-platform@lists.linux.dev, kernel@pengutronix.de

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 26 May 2023 23:47:03 +0200 you wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> [...]

Here is the summary with links:
  - platform/chrome: Switch i2c drivers back to use .probe()
    https://git.kernel.org/chrome-platform/c/f5bb4e381290

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


