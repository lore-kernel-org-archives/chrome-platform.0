Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769EB3FE352;
	Wed, 19 Aug 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154785; cv=none; b=KrZGiy3luJiomS3U2eaMiRMyRIWs5C1nOV8990lok4HTEYGymbMe60tzP+iQk8p2MqjKn+2wbhyKxzvnWabSEVjGk+1ks6O7RHypzNMaL0kjlYR6tJgDVb4N1ZjqPwnMblpEXhSDjgY6WN9a+PHxmJz4YsYgBL9nZLiBujGEY/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154785; c=relaxed/simple;
	bh=oaQyT9GoEkdXfWTOvtwHiD9uCalTHP6VlA6+qhfq+JI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=u2mrvND3aLgQOAssNp1HWFKV5oxVIAD7Zi18/DCvuPp6hUFv8kcdrdCFIINKkGG20EX2n99Br08MsAv786ZZX9KWC3CtwaI8SspmNv+6staM4Q0zfndXmthBNIorRsbsA2U+5fAAnbjLSrNG8r5bncMbpIVCQGqJumZdW6j5zKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ps8/AyIg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ps8/AyIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8681F00A3A;
	Wed, 19 Aug 2026 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787154784;
	bh=Np6wcYO9Ihre4ty4Vj/OhU6tNQ0nzvD/iNyVu5Ey/s0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Ps8/AyIg8SwVU5/SHxbSwtOmchNfX7Q/uIIm/nW2NUeF4EWdQKRL2zYP95ukoTcye
	 Ky5rKs44YEM+tnhtreceIRL+gUlpA+uFuv5hwDKFjbumTBr0vNhaNX7ZQwFF13dc95
	 HhvSCLvve0xTbVonife8VL/NkYIw32DwgHg7k/KanBL5OA7XZgQT3Eq9PPXN/8gQrh
	 19nCsZ4mutQxDKjvDrttPjvek8Fz+dkZ+WUWcJKfo3++jYELXnVdO4kZczmxJZsyTJ
	 Fb/+5ylbs3Ys6OSeILjEZEj7nc7Rx5QfKLLQIy5CvbPRb6qXbXHcxXZqx9DuxtKn04
	 uU1h36BMyGtKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B4438119E0;
	Wed, 19 Aug 2026 15:52:16 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aoJ77ebtbrPbFbD4@google.com>
References: <aoJ77ebtbrPbFbD4@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aoJ77ebtbrPbFbD4@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.3
X-PR-Tracked-Commit-Id: 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c36a4991e231242c04141536718d47255ec80887
Message-Id: <178715473508.3549109.9670118418811014648.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 15:52:15 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 17 Aug 2026 03:11:41 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c36a4991e231242c04141536718d47255ec80887

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
