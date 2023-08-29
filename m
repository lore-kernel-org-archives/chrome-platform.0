Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA337FF
	for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 01:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6939BC433C8;
	Tue, 29 Aug 2023 01:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693273623;
	bh=w/1in/SuvVBiDrDDSzO/VSGRfEJeNzrCBRdC2XUd7kk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=j0t99os5XcVBkxnJNDV/StiwY6pRQjg9Zpg7UbtFJ3wAkwjytmP9bD0FgwyPZWaQn
	 Gx59abtsTNJMChrHFa9rB3GV2le68MviLj3sQ8T4cNkOPHmIXL6Io8ahLAx6zsnX8W
	 nq26I57C10Q7j4q8wzF33V5SP4zHh75s07reZmNncfSfh6DIRGUnJPNOMowv+9e9Ye
	 5T/YZgom7CqfJUQhfTz24kxb+gZGEuu/qlC3/MSPpN3AbEzf+LBEnV5e/kelXvPD/6
	 8QOjVxMqDaWB9f5tEZek2qXWXu/czWgtjGrET4n5qCIrB2K0o1f7u5EwKmq4AkAe/J
	 +SJpMaVc7evAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55BF9C3274C;
	Tue, 29 Aug 2023 01:47:03 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZOwZVavwRm6PlsXG@google.com>
References: <ZOwZVavwRm6PlsXG@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZOwZVavwRm6PlsXG@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.6
X-PR-Tracked-Commit-Id: 0820debb7d489e9eb1f68b7bb69e6ae210699b3f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 670f08971c0635275b25756a25a5d0b8d1831536
Message-Id: <169327362334.21367.9298825278649488004.pr-tracker-bot@kernel.org>
Date: Tue, 29 Aug 2023 01:47:03 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 28 Aug 2023 11:49:41 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/670f08971c0635275b25756a25a5d0b8d1831536

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
