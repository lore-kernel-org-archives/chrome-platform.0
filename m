Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C952D386C24;
	Tue, 16 Jun 2026 02:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575904; cv=none; b=FebDpap/FnbhPQ9u9X/Jee18FBRS7ZACAjLa4BNoMzb+wNHZWXbgDI+PZYrdOZDZJoOBoebVyoVDSmb3+lc8wCs8dLcUc9vb6E6kliIoYUIlWpWYYYYa2lkPk0ffhCv6G1zrsEWs426sqZ6D3ozvM4nN9gCH/a4YxWE+8RUBfGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575904; c=relaxed/simple;
	bh=xd80DAf8IHzwoPgOsunTFNo852ShXzlyrckrW25Q1a0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=owWAXX6Z1EsF23gy7uHc/Isiboj6CMPjlRLkDwtlOV+tvJhSH38LkGNr+aywmVz5yiiJK1gHLiCbqa51Yohm+RZLJHvfmCCF4hDMRWCciLqWKxunQww6dok6tZaUxqVFbbn8gg+BU6t8mSFNnyOk9sm1f3rgBfkUhyqtTmqRIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqkF+sj+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqkF+sj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB5A1F000E9;
	Tue, 16 Jun 2026 02:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781575903;
	bh=hlHMRdFi8ccvI3YOo5tORlb51pZemyd8Yj12iSsEGBQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hqkF+sj+z6do8GfC5bj94hhk4pfouRHlxHijD7Gl6Nh8L5jHyUiZwuXZk65ZZUtKW
	 wyQnxRZnUmZcvQb/QKs/h2q2w7qNaVsCcJKqlnGw+WmtrOwWZae9gBnDg5vLpCBhCC
	 8rac5n5AEGX9oUgENA4Vro/fZv3j/yFVyXXkCl5CVXLPHWgI1QDlxJWdDQS4MCNS/3
	 L0OQvPGdPcWES9gWpe8gsoCkYDi7jvkbqA53U1Ipjr3yp2Ev6gb5Z82Wx36Tt5UdRX
	 3o5l7RVeARkaBWEFEbkYSBZDcS0P3DNJuJnMm79R4Lb1ZYhRfndQY9UCsjirUQz0Bg
	 SyWyzuNd4ppiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939B13839A26;
	Tue, 16 Jun 2026 02:11:39 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ai9ud-vLUe2pj9M2@google.com>
References: <ai9ud-vLUe2pj9M2@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <ai9ud-vLUe2pj9M2@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.2
X-PR-Tracked-Commit-Id: 883f968dcbb08a155101e3a943557530d4ac0463
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2b5f5609ae9b218c9ee0cdb7f624ddb03d44cf84
Message-Id: <178157589822.390807.1516411749984332964.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 02:11:38 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 15 Jun 2026 03:16:07 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2b5f5609ae9b218c9ee0cdb7f624ddb03d44cf84

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
