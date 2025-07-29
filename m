Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857D26B0B6;
	Tue, 29 Jul 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771804; cv=none; b=TdDWP6cgR1nF/GhqwjBor+UQjXMEEGif/MRE8W48n6tKA7+PdcaRY6BF3i0ynBnh7iTTdWB1hCzWeR5Oqf6eAgqKHrIqkw6HpsMf1gYxY0Nf0hAMcHsZanb5g5TVJDaj1VkeRtc89loHAFsWgttmKnrq+p6dB9DanvEugBk1zw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771804; c=relaxed/simple;
	bh=SSU+4fYNj/Lfml23j9AI5W+k/HZqxE20nsoM8hqjDPY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mszyhj1XXgHX7GGIy37bIK+nKsGVVpaC8bs6AV6aQHO9p8iePXVNUDFkJXpDs4nBczNBqo2p6P+tFSMRA1/ZEvrc2s7jHaW7qs1wO0BoCGlNXA3qJgckzu5xuGquOSvhSk6oe7nt4YTOTykzTqkXe1f1B+6//qdWqAqucoJtXC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNy0wGSN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNy0wGSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB84BC4CEF7;
	Tue, 29 Jul 2025 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753771803;
	bh=SSU+4fYNj/Lfml23j9AI5W+k/HZqxE20nsoM8hqjDPY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hNy0wGSNHea4OCIQ357/A4l01HzHL/dTsV3u8hwkEcT24a5KwhVGMJk2ApB6Z/cz7
	 gJTMd8ep2Jk9bq8HgOQ3oxmYhJo1+EXbA2pALdMWKYBUgmoQJ1AthY2OYcyAKqC5k0
	 qP8tJGjPbW8jzIZZtxmCriqExW5MiLMuGNiQFvlwyRKwDzqCRHran10W76hmbvTaK9
	 TRsvXryD8ijApwqni+xwgGbFZi9ZKg1HY4IS6Jn+MJ8w+gkvjaJCFz8qWwe+1PuSvb
	 WxuYgho0LBnR4Vy1YL3emOxEIuZz1hPa6SXh7DJvvCZcv0qT/TDSNEOgDnBKT8TNQE
	 E2ptjk9lV0wKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 86B3B383BF60;
	Tue, 29 Jul 2025 06:50:21 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <aIcXUHHgC8bm9tIn@google.com>
References: <aIcXUHHgC8bm9tIn@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aIcXUHHgC8bm9tIn@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.17
X-PR-Tracked-Commit-Id: cc2d5b72b13b3af2b9b4bed3d5dfd0de14414230
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86aa721820952b793a12fc6e5a01734186c0c238
Message-Id: <175377182040.1356386.8342206394485180526.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 06:50:20 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, tzungbi@kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 28 Jul 2025 06:23:12 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86aa721820952b793a12fc6e5a01734186c0c238

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
