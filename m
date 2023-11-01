Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F6D1841
	for <chrome-platform@lists.linux.dev>; Wed,  1 Nov 2023 04:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ah7M4G4F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36363C433C9;
	Wed,  1 Nov 2023 04:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698812571;
	bh=K8Tb0j7ol4dMhZerv8aYOBjtHMrHZmEjGiFpsVwk3/A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ah7M4G4Fn93acLT2r5eoyHBTvkTL7H/n+ann8wYjOZG+zcsV4I9dRlwimr7ubHube
	 5puWarR8N9g3CdVXKkxA6aPkTqXBJKrBemH6bXdhJvvCvSWtuajtvcA9grR2aVwJsE
	 yBnSW8/eF5PzsMHKLujNXvFRyjAE89mwyA1SZJnPk4GGWBnBEdj6n9k7RT2Jl+0FUQ
	 4jaqysFUJxfaw6hTQ+oDgcMeg9KKaN6PXedzbuZRpuxqajl5tbYJXH85+wNpnR7Gbw
	 vQRChQGm35C6MsymqgnfM0bL90v+Bfv2lZQbDYy9vnx9U5NjFvT2mnW656QXYNX3oD
	 9NFI4qbyiplLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25458C3959F;
	Wed,  1 Nov 2023 04:22:51 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZT9VlLol-dGK5JtE@google.com>
References: <ZT9VlLol-dGK5JtE@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZT9VlLol-dGK5JtE@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.7
X-PR-Tracked-Commit-Id: 47ea0ddb1f5604ba3496baa19110aec6a3151f2e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3475b91ff258b998b891964e8c263cff48384c01
Message-Id: <169881257114.5224.10300952805057999114.pr-tracker-bot@kernel.org>
Date: Wed, 01 Nov 2023 04:22:51 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 30 Oct 2023 15:04:52 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-for-v6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3475b91ff258b998b891964e8c263cff48384c01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
