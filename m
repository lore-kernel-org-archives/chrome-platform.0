Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC903D60
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q825ZHNy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82AADC433CA;
	Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696990822;
	bh=TD9LTrk9BjIMJ3LxQAEEY4wQoiQ4fKtDWYGtorXdTcg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q825ZHNyzgIXgmORdWVJnv7EYQKHYB6d81VibIvVU9LnGXwNGdPhVNcR8sBHuc6B8
	 1B9Rzu0kFHMTSmJqckVyHumrvt+iIqV7Uoj3Vew4cjQQ02ugV3WMy7oqHCjCDgEP6C
	 EIHf4zL2z+9ZKpFcqqW20xHQVmbJTlDtTXHiJDPENyTPkaarZfqAUEITRWCZwB6+0j
	 GyyPHFoy4l28pPsU9PfxzxGK/DzY2xSh99aThCeR5aE+qN9OHuqV8oC/JdqVoRl8ni
	 4AGHcGWY6uVcR6HLUlbIkneUrlT2X5crlzhB1mX6ZApU7Hu0mTflrkiZQBcipPoFhW
	 sJGSNipTCVKrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65122C595C5;
	Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
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
 <169699082241.9318.15814535756844761936.git-patchwork-notify@kernel.org>
Date: Wed, 11 Oct 2023 02:20:22 +0000
References: <20231003080504.4011337-1-tzungbi@kernel.org>
In-Reply-To: <20231003080504.4011337-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


