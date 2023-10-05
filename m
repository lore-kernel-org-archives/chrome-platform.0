Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1F125B1
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLpFKt7h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43DC2C3277B;
	Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696501227;
	bh=6Qv2+dmNuZx7rwAfNApPeWhG6cKypw0myWi1auNpNDA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MLpFKt7hR2Pm+iUQC3QtThXQM18YS0wTv0HV49AALxYoLsW8+SWyGzByqnF80OXrv
	 nkbRhlyxGtAnlaHjRU1/3ARzm5BoMGhJ3nKczL1fLSh3UCKf7cUeHx8XCj6tFyOySa
	 dJBN90/C5goqXIvzF05lUdOPpvHGchwrWI5bnNLVBLkG3zyK7wYigxIn0qPs4TiDld
	 ojpzHauWD60cFtg3C/hxlCDsmNCvYMxA1g3n2vmMMrniMrWjL6suJm+XAU8I9ebLsp
	 Vs2JvREcEKRRc42GGAs53db4aeEk5Wba1N2J26AMtV6l4yMxt1Jl62P3APNNjMcWle
	 RDHrHfgw5lROA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2682CE632D1;
	Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: kunit: initialize lock for fake ec_dev
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169650122715.4916.13598267275078105243.git-patchwork-notify@kernel.org>
Date: Thu, 05 Oct 2023 10:20:27 +0000
References: <20231003080504.4011337-1-tzungbi@kernel.org>
In-Reply-To: <20231003080504.4011337-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  3 Oct 2023 08:05:04 +0000 you wrote:
> cros_ec_cmd_xfer() uses ec_dev->lock.  Initialize it.
> 
> Otherwise, dmesg shows the following:
> > DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> > ...
> > Call Trace:
> >  ? __mutex_lock
> >  ? __warn
> >  ? __mutex_lock
> >  ...
> >  ? cros_ec_cmd_xfer
> 
> [...]

Here is the summary with links:
  - platform/chrome: kunit: initialize lock for fake ec_dev
    https://git.kernel.org/chrome-platform/c/e410b4ade83d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


