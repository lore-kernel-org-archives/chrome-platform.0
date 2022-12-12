Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E1453A5
	for <chrome-platform@lists.linux.dev>; Mon, 12 Dec 2022 18:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58FC8C433D2;
	Mon, 12 Dec 2022 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670871372;
	bh=NsvJFvQmJVs3BKfjinqjpAX1Q6kIm+eM5VPOFJwMjuo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MUGcPu7ZMgWDMTbCVdRiH7iS6pJSJR0lM2QIws5s4KJ5MMaSLrd7IyN4n8+tIOb2u
	 QpVas1RpisFDYgd8hN2dDJQ+IN4tctRbQLrhJeN1fiyu/TOCAKe9QX9FD2/jz1l0Vj
	 Gl6bGkOjKY+OtU4RqCEqxN/3Y2eFwrVqoR3CaLyNsCPUyvUMKyUKd6cl/y6XneFlzI
	 u9sF4DdICLTGrQttK/CAlrAZ2k4n86JC0VcyTlPt7+89m+IEMS58/kpGQU/fQt+XYy
	 XPjsQLY2kkVWDWQ4001koMMdFxk9ZDAurGS+N0SZkTDTKuSdg6WrxgM0RmnGcTvw7B
	 d5sxFYa3QUcgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46F5AC00448;
	Mon, 12 Dec 2022 18:56:12 +0000 (UTC)
Subject: Re: [GIT,PULL] chrome-platform changes for v6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5aSPxsxWqmkstFb@google.com>
References: <Y5aSPxsxWqmkstFb@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <Y5aSPxsxWqmkstFb@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.2
X-PR-Tracked-Commit-Id: 9a8aadcf0b459c1257b9477fd6402e1d5952ae07
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0ec5a38bf8499f403f81cb81a0e3a60887d1993c
Message-Id: <167087137228.22870.1814595782332042358.pr-tracker-bot@kernel.org>
Date: Mon, 12 Dec 2022 18:56:12 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 12 Dec 2022 10:30:23 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0ec5a38bf8499f403f81cb81a0e3a60887d1993c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
