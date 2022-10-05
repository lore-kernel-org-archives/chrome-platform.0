Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702372F2F
	for <chrome-platform@lists.linux.dev>; Wed,  5 Oct 2022 18:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E3FBC433D7;
	Wed,  5 Oct 2022 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664995209;
	bh=RAT1Yj6E1km2vQWW4BnJqPnofoF8xGXe84kM7yBDsk0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eEnIJoq30H5c9FtdMvQrMavs4sgR1TjwbCvGPcUzdJZJjKslZYGAoBunrFV0FAPzl
	 EfqMuK8BjiwmQ3YxiqE9QEBs80rjLG2y7dG3W7pAyiDSZO1GBJo5HCGnlTDJVGMHAM
	 prRkOJEPej+cxLnEulkONEgCdZNCdQwtQXcOClXWI5iU65DzEXkIdcHcYeqEvOJsXX
	 cGCwxc7QKxtcraP8anb7b7apD4AMOhIBtpyMBD3bZesMxsIjIv3t9B4gjPHxr9uS4B
	 9CUbi+jSlvc3A9Lc84UVc4BpP+jWfwTttk9ooOt0UUcE+FyzYhf/GYhr/8U10QV8Nf
	 pikz/gDpo83Jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08708E21EC2;
	Wed,  5 Oct 2022 18:40:09 +0000 (UTC)
Subject: Re: [GIT,PULL] chrome-platform changes for v6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YzuzMpp5SfvgpXzm@google.com>
References: <YzuzMpp5SfvgpXzm@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <YzuzMpp5SfvgpXzm@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.1
X-PR-Tracked-Commit-Id: 8edd2752b0aa498b3a61f3caee8f79f7e0567fad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c2daf52185bbc91421f0e84e6bf2706bb350cce
Message-Id: <166499520900.1673.8770957560319510469.pr-tracker-bot@kernel.org>
Date: Wed, 05 Oct 2022 18:40:09 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 4 Oct 2022 12:14:42 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c2daf52185bbc91421f0e84e6bf2706bb350cce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
