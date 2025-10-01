Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B592D780C;
	Wed,  1 Oct 2025 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759344164; cv=none; b=gyL30dKz3fCalAPuRnbYmToH7LEEP2KoMgrVZ9dhUtIErBAfGBDWtuumqO0oYcM94NCVGQkaFAXpkU2sdrRItcvkVtLACN7XLJ33tV2bIgX7VdzttMl2U0w2I2YjUEhwCeTShLOmjU4cxilXQAo5mFTnwxpXAwzjhOld4dfe1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759344164; c=relaxed/simple;
	bh=4V2vH7skNLp00PtuwfVvvZp3jGfJOcj5MJpfxbvbOwE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rjmziWfuEagFN7MhwtLCvS8APqbdU+Jey4P5uw7DIMWX74c1Fl+GWhBQc123QfH0tOvA04/R9fCJGfOxgZbhNOXfu/82ptLPMYgUdcVWsqUH5gXkrUneWblsY7QEHGv+zNGYBisLGHEXJU04CO0KiwmUxgnFW/K2QW42PifOKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqjdZgEs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqjdZgEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B156FC4CEF1;
	Wed,  1 Oct 2025 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759344164;
	bh=4V2vH7skNLp00PtuwfVvvZp3jGfJOcj5MJpfxbvbOwE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VqjdZgEso/xeuYa/v94n+AASV+/o+ErzNPMIeboVF0qROHwAoXj+w9s6Fw+MXAcuz
	 H7eEcVNptwBnUe2K+RYwbJ6aVHkBxIzm5/P14HoXf+Q9UcC+YQuFQn0TPR3MAtnuMK
	 ujA8cd5gZmbAxH1rx9QO3sqr4IFLUjM6KsicAsLDx1HMQ0kZgZ3V1WKFjaqHb/5/M5
	 upXWKCsKwvwJvhW+N6c7mFzUuCitNSopfj+iBTJx08eJEwJjiI8dv09O/nUqyS4pcq
	 DHLp04dsQyg1rws/EBvSurWg00OnCDln03Tw2D0BYwE8DR14YVESe2SdnKrUq5IBW7
	 cs43yRB32b0+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC539D0C3F;
	Wed,  1 Oct 2025 18:42:38 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <aNncAJHyW430v7ny@tzungbi-laptop>
References: <aNncAJHyW430v7ny@tzungbi-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aNncAJHyW430v7ny@tzungbi-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.18
X-PR-Tracked-Commit-Id: 48633acccf38d706d7b368400647bb9db9caf1ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57cf7a603b6d2524edffaa3068d9aa7a41641d93
Message-Id: <175934415694.2574344.15363866492485519207.pr-tracker-bot@kernel.org>
Date: Wed, 01 Oct 2025 18:42:36 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 29 Sep 2025 09:08:16 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57cf7a603b6d2524edffaa3068d9aa7a41641d93

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
