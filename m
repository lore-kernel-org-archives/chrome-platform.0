Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A00CA29
	for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 01:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A19E9C433C9;
	Tue, 29 Aug 2023 01:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693273623;
	bh=mKf794YVQMiy9EgDrDrUkjjyqF8tyizJNAaCgTjm+vU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DmDNotGnEIT/UI+Am51OwJPqG7VqPXL9H3gGv6PAUxJYwtZ+PlvCd//aUzrDv+8/z
	 CLYXtkTQhqslvywg+1txEdzJony73mWzEwGOmDHi5tpgkJJBFRsUBlmJBtmpJixVN3
	 RaHz9jVpxrSPDbHSutSULsHQQEHyWU4GeBbgZyOVomA7EGp02o6imDBLHGCHqN5XyD
	 mdBQSd508nimU9l/TduB9ydR2A+ORZwKLjeMeckG7/bkQU0cw4lCUGgpAF2Q59oNNs
	 oPZWvY+0BcyDyerq82iRIWwOiyZacu0IcQMV689fFpKk0fixZr8ZMKHGIJujMTarVs
	 cZ0CcsUPVQ/Aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8CD59E301F2;
	Tue, 29 Aug 2023 01:47:03 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform-firmware changes for v6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZOwaiFUu3BI+G8JA@google.com>
References: <ZOwaiFUu3BI+G8JA@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZOwaiFUu3BI+G8JA@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-firmware-for-v6.6
X-PR-Tracked-Commit-Id: 0979e7e3cfd7b479c34dc0f7217beb0c30f8028a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2927d2261b539834d0bd483088c116106b440de6
Message-Id: <169327362357.21367.17204662814389782609.pr-tracker-bot@kernel.org>
Date: Tue, 29 Aug 2023 01:47:03 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, briannorris@chromium.org, jwerner@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 28 Aug 2023 11:54:48 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-firmware-for-v6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2927d2261b539834d0bd483088c116106b440de6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
