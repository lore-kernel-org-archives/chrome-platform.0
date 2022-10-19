Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238E1FA8
	for <chrome-platform@lists.linux.dev>; Wed, 19 Oct 2022 01:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E179C433D7;
	Wed, 19 Oct 2022 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666144217;
	bh=iA+0UTnHubjHv70TvtVBLlqfAvlKlB6f3mSpE5H4yOc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zzif1Uo5ARKLWnqGFFkm+X9em8RVLBAm4rSrAhNaXPR5SM5GHaoQ3ooA67s3E3wSu
	 XIcLY/+cx2+krvOGuO1mKiY23bUi0bF1CrJu44Nd/sMN3s4GccMRInIlkCdgazqKPZ
	 XV9lIcTq41aqSZAEVjqMT2zXRNZqd46J36psa+JgLRixWuc3+hOQC6floMbT19iQtz
	 utBlhKXhnYuqRjeQKLX6RjBoLhrDySRJxavAS+kFp+GSwTlipK9pPtT6AQbBvMKNcn
	 wgr3f3uAMW3/nd5WxaM96zq8Y0eaL2MEIpcdy6ufOXDNV8yLW67pe8sJxP7sE9DJet
	 6xQ2qOJlfcYGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06F08E21ED4;
	Wed, 19 Oct 2022 01:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] platform/chrome: add a driver for HPS
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166614421702.19283.4844691783232222695.git-patchwork-notify@kernel.org>
Date: Wed, 19 Oct 2022 01:50:17 +0000
References: <20221018040623.2173441-1-dcallagh@chromium.org>
In-Reply-To: <20221018040623.2173441-1-dcallagh@chromium.org>
To: Dan Callaghan <dcallagh@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 skyostil@chromium.org, bleung@chromium.org, tzungbi@kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 18 Oct 2022 15:06:23 +1100 you wrote:
> This patch introduces a driver for the ChromeOS human presence
> sensor (aka. HPS). The driver supports a sensor connected to the I2C bus
> and identified as "GOOG0020" in the ACPI tables.
> 
> When loaded, the driver exports the sensor to userspace through a
> character device. This device only supports power management, i.e.,
> communication with the sensor must be done through regular I2C
> transmissions from userspace.
> 
> [...]

Here is the summary with links:
  - [v6] platform/chrome: add a driver for HPS
    https://git.kernel.org/chrome-platform/c/5f9952548d91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


