Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE6ED1
	for <chrome-platform@lists.linux.dev>; Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99120C4339E;
	Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682470179;
	bh=0KsW6/e0i/ufNPyH+VFFHzXLXLeuV5MankvIOKuDH3g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NHXq0tiRmxyESzLfOAPDT0NNUNiMfJlxadlAKSIM3KU97zWgLmI3Ngc0jAoejsZ7J
	 DUcnnoznPNxSY0sCElDmopzmSWZG92d8z29VNPsjn0XXH6QfnLGSkCnmpCFgFSpBxU
	 hfA+6zr4xoPp5Y5YKs58D5iDAw3/Mv6EsofShBHP7mVneQrTkc7Y5R8ZcxGtYiZN30
	 1vqOQwGp2/R/A/bVd9uZx5kS/wAg4TXE+u9HFkkF8L1G9e8HJJKCValwPX2ifgDF9o
	 1oaXdsPg5+i3scMck6gaz+RUhPFvu+KMYKQvMrpgET2vwPpTmNdBbAW9pcHjIAbO0N
	 Dto1nL6qRogpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86536E5FFC5;
	Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZEYYhltzTDUzAV0q@google.com>
References: <ZEYYhltzTDUzAV0q@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZEYYhltzTDUzAV0q@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.4
X-PR-Tracked-Commit-Id: d184d60aa301e424cd0cf7de90b40744710a2417
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 07d971abf436f78962ad95faafce04582b5b833a
Message-Id: <168247017954.10866.7518015992668230182.pr-tracker-bot@kernel.org>
Date: Wed, 26 Apr 2023 00:49:39 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 24 Apr 2023 13:49:58 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/07d971abf436f78962ad95faafce04582b5b833a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
