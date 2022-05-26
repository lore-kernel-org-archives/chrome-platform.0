Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F51875
	for <chrome-platform@lists.linux.dev>; Thu, 26 May 2022 22:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE3B5C385B8;
	Thu, 26 May 2022 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653602686;
	bh=3YahBxcqwrlACESTCA7z3PCyV1FncahlTuC/rwvUouY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h7wXT+9Bzx7WMvqlD48DS1I4bIyr4yG0YsvlcweLxq34AiCbwlbYGiBSQR5D1QOWr
	 LlHm40N1wSRXKqv3JunoIsVzc3qvH9ao8VVzLYKxN72f3yTuhjS2BD2E+8ahk4zMrW
	 0VnNnypgfqFDsuuKlbXrCIv7Uw9kVw+29gehWR/E6ISj9yOsGf1H7nbClxR5RyWFid
	 +1kq0FBLu32MbfNCIYgdkvCKva22pH2QwXuVZI9pfLKWPQfOY7MyJCHLQQ0IbW7oGK
	 r6GD8unSAaQqwsDuGnA1HsDsq11+UPt/8I7eg/f0YrJkf3JoWwu/0MJB11gxnuQcGu
	 OGCuhZJZycycQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB1A4F03938;
	Thu, 26 May 2022 22:04:45 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <Yo7YztZklByTINZp@google.com>
References: <Yo7YztZklByTINZp@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <Yo7YztZklByTINZp@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/ tags/tag-chrome-platform-for-v5.19
X-PR-Tracked-Commit-Id: abd4fd43f2af03e2e852e6b1b98faeee9e3eae55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1f88bb51f1ae9d7eec9ef871355dea033bac02d
Message-Id: <165360268589.24340.12642622200377938586.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 22:04:45 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, linux-kernel@vger.kernel.org, groeck@chromium.org, tzungbi@kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 26 May 2022 09:33:02 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/ tags/tag-chrome-platform-for-v5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1f88bb51f1ae9d7eec9ef871355dea033bac02d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
