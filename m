Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B1D186B
	for <chrome-platform@lists.linux.dev>; Sat,  2 Apr 2022 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92552C340EC;
	Sat,  2 Apr 2022 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648923042;
	bh=WpNqyFOqyBiFNnWAg3vAHgSDi48Ads2iTRKIlnmMmIU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fVUKt7Mg72XVEa2fksqCFtGICZVHg8Pvra1QDruqb0AM4Zrtz/N90l2RjL8kpUv0f
	 gvOwsvl4WY2yvBt1xcroitSKoLhuCos34DeIQxUE9mPd93G5y3Q+Dyp2/17WLFPKZ3
	 4595BF+FCYxHXgLokHNYwDSe1pUoPvUAOGuwGKWoVBMQk3C2hUUhfRJ4dQiYyj7t9N
	 c97uM9feTMI0nRwQBs84riRNd+BriAVK5uCYJJpa1oUUqB8I6I2qQskhVS53mx1ESc
	 4u5pmxEcQmjHTdyNlmNY5BWac145IZKta2VCUBVy6cJKwZDsa0Q4fhzh1nQ9ZO02WY
	 nKq7dvFYWGdMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F512E6BBCA;
	Sat,  2 Apr 2022 18:10:42 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <YkekVRh9Ixdfa5qL@google.com>
References: <YkekVRh9Ixdfa5qL@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YkekVRh9Ixdfa5qL@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v5.18
X-PR-Tracked-Commit-Id: 0e8eb5e8acbad19ac2e1856b2fb2320184299b33
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02d4f8a3e05b4d09fcd20bd7dbe4046757e151e2
Message-Id: <164892304251.15050.10163111732751999015.pr-tracker-bot@kernel.org>
Date: Sat, 02 Apr 2022 18:10:42 +0000
To: Benson Leung <bleung@google.com>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, bleung@google.com, bleung@kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, tzungbi@kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 1 Apr 2022 18:18:13 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02d4f8a3e05b4d09fcd20bd7dbe4046757e151e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
