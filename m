Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D61EA1
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jun 2023 03:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEAA3C433C8;
	Tue, 27 Jun 2023 03:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687835695;
	bh=HZyX3VGyr8HmjzkZK+EkZ6R/a20i8r5luDsdNY+AurU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cnAI4yMM4fFtupMnq9WJd8L1n5IJ4f2fm0V9y2kfEE2MKMaAkLJXM3l+JSVBBNtwP
	 kUM70iApA3JEAubwvjAGf+U4UHBwX4HrWfMO1XfswVVXh4uYRNxaLEu3NH3JGbPHBu
	 beLuAo255d1tVZgcBnS6CvrLDzi4OelVkt68tLutuWvtA+MdTVxZxy+Gnv2PtSthzV
	 ZA8bsWPwNb84egwwOxDtOVRQeD+8RBL2bz7LZjzQqiYVcpyXGm6BtX7r8PhNZJWwD+
	 y+rvotav8BiN8JeThDRfozQi4S6yXStdteWI7XZasFcmuVsr35HAAzLa+Ru27Gffyb
	 UMG8EseQqyA9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC21AE537FE;
	Tue, 27 Jun 2023 03:14:55 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZJko2ipBSy8eM/+2@google.com>
References: <ZJko2ipBSy8eM/+2@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZJko2ipBSy8eM/+2@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.5
X-PR-Tracked-Commit-Id: 2b8cc5858a07ab75ce98cae720e263e1c1b0d1d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1ef6663a587ba3e57dc5065a477db1c64481eedd
Message-Id: <168783569576.18094.6541808729976898231.pr-tracker-bot@kernel.org>
Date: Tue, 27 Jun 2023 03:14:55 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 26 Jun 2023 13:57:46 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1ef6663a587ba3e57dc5065a477db1c64481eedd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
