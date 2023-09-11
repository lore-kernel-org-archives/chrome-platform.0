Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4771FC1
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51BC0C433D9;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694406700;
	bh=ywORlSj6GawSPv5eeF8Ck78YbvBWA+yd3aHPWXh01aE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E4vWW9rQGpr5iIGRFaIks4zKgUPJrcb2rHLFzJRulpqQmsOQPwebkk9KyR4Texjgp
	 wYiEldoVDaeKfNpTyyeu32Y52oUIpx400fmbuU02GHMbThEb6V7+r1sZEv4Y7hDZGn
	 +S3/YH0iLTiqFxjbcxJTIgv7nvYxeWWBJLpHvhTuAJxpHD7oOesPupEUvoKfe+lJl/
	 iSbAqpjmHNbDOqWJUkRxyIPzuDjwipbkH5K0Rex7Z45OGUFexEvpP8AzHrsyt4nJqF
	 2bZwc3fpbMt+WbH4JMJJKXIvme9D4UBwakqr+gikhlFaaab5bte191XGjv0rojeHiv
	 yMAEm1h3a6w6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B939E1F67D;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] MAINTAINERS: Add drivers/firmware/google/ entry
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169440670024.22573.3964370937656058383.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:31:40 +0000
References: <20230724081247.678784-1-tzungbi@kernel.org>
In-Reply-To: <20230724081247.678784-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, gregkh@linuxfoundation.org,
 chrome-platform@lists.linux.dev, jwerner@chromium.org, swboyd@chromium.org,
 briannorris@chromium.org, dianders@chromium.org, sjg@chromium.org,
 dossym@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Mon, 24 Jul 2023 16:12:47 +0800 you wrote:
> From: Brian Norris <briannorris@chromium.org>
> 
> These are mostly used for Chrome platforms, so group it in with the same
> mailing list, repo, and (one) committer.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Acked-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] MAINTAINERS: Add drivers/firmware/google/ entry
    https://git.kernel.org/chrome-platform/c/350170cc4cab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


