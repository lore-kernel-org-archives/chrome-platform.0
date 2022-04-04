Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5E7C
	for <chrome-platform@lists.linux.dev>; Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58778C34112;
	Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649091720;
	bh=YISYXXxoAD17WcxlmzCJ3mnM23WX0zpwVW60yCzPmQ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=poeecA4hteXyJG8MbL8NaV8xPS6O9EBoqfosWl2v2yZzD3Ub46yIKsQrytD0nf1Bj
	 Dti7YqFLKqjgJcG4BWhL8aXymFqNJfRGj51R8sgcZRuktbkMT+WZRywEAhbm3nc5/Y
	 VgWVVNHy8IyzwHnY2tbbTaEVs8+f3mhHQlv28veJ+VdRM9Y48Ao4KrK4kSGL01fz4U
	 TW3+dKpSbEzdLkA70vYLGqChUAYyv7+rzOGpuzBQlvro8ZcljRxrsBRLypZQiIHNHB
	 YfAVJXbrW87UdIKuHnV9wqtFnyExrX9I6AN+ykHoSVmHjgGnmSgCDNN3WMiPausy8g
	 uoKm+XzJ9h2nQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3820FE85D53;
	Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] chrome-platform changes for v5.18
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <164909172022.14329.16783451358670227711.git-patchwork-notify@kernel.org>
Date: Mon, 04 Apr 2022 17:02:00 +0000
References: <YkekVRh9Ixdfa5qL@google.com>
In-Reply-To: <YkekVRh9Ixdfa5qL@google.com>
To: Benson Leung <bleung@google.com>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org,
 bleung@kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, tzungbi@kernel.org

Hello:

This pull request was applied to chrome-platform/linux.git (for-kernelci)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 1 Apr 2022 18:18:13 -0700 you wrote:
> Hi Linus,
> 
> Here's chrome-platform's changes for v5.18-rc1.
> 
> Of note, the last two commits of this PR had to be reworded (actually just
> the second to last one) since it hit linux-next for a minor commit message
> fixup. Content wise, the two are the same as they are on linux-next right now.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] chrome-platform changes for v5.18
    https://git.kernel.org/chrome-platform/c/02d4f8a3e05b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


