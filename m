Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCE1360
	for <chrome-platform@lists.linux.dev>; Wed, 22 Feb 2023 01:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C891BC433D2;
	Wed, 22 Feb 2023 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677030195;
	bh=iRH7CuH4LLS+GMAoECYirtUBziLhryQqo4VFSlOR5iQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H8F2Sc94dhucOJpzpiNpCJsHhH/s4d8cNVZqCaD+j7Z7m/R4gdTmfZiU1T96Z3nVA
	 c63d1rN/fdAMV7aABYeIcasEpdxsvld3oMyvpD0qyJE3esu9Lsf11Jprg/1NPoctIf
	 MCrbqx7ByiRAlN4aV0fbi1o8CyFfMFVbYpAEPA2WVHPfmcCgqyCgtb2BYH1hmFzIhy
	 G5xjFpBz8lcHLNjH6Y2SPusl5NDbgzpdzx+uSoCuzELD0MZBHn6KnBUTQuXnzfPzqW
	 H6ra6QKy0pbq58pE5rsuqrUMbs24zXGv36am3SZl5NV5+L6AysUCPqQzLOxEg5OMGv
	 R35yeQedbDGGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B5C40C43158;
	Wed, 22 Feb 2023 01:43:15 +0000 (UTC)
Subject: Re: [GIT,PULL] chrome-platform changes for v6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y/LRh21+yCg0Qh9x@google.com>
References: <Y/LRh21+yCg0Qh9x@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <Y/LRh21+yCg0Qh9x@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.3
X-PR-Tracked-Commit-Id: b0d8a67715dae445c065c83a40a581d6563a341f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f5ce6bcfcc3abbaf690fca30a22d0dcf6f36d32
Message-Id: <167703019573.10177.17716514567995460728.pr-tracker-bot@kernel.org>
Date: Wed, 22 Feb 2023 01:43:15 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 20 Feb 2023 09:48:55 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f5ce6bcfcc3abbaf690fca30a22d0dcf6f36d32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
