Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF3A6DCE1;
	Thu,  7 May 2026 05:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130527; cv=none; b=s4iaBRgA+Fqw5IlHVkb9fiJ8n9GRV/yvviCadALdnxNQm8RukSUXf0M3kDNbVuSitGORWdmreXv13zHe/QnH/TFbRwbdwQqu0LVsJA4+L8ZVDqMOFEjkgOIy0QtjrI0fAuNEmbrhx64N4zK2hLnV90yHGlop73Esug1ebZ6TyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130527; c=relaxed/simple;
	bh=U18VVBFGiNennRFZEf6ejcmYeWwtfk4ahUQv7rjrd1w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bxbQ6eZHaEa/dESFZpXz2+Z2lY3kv/5QyE7yzkW2R98Lez2BgFJ3FO5jfBNKiDaxMGCepklzFhynvqxxwB5Zu8UxIr5hjCNwU14plVawqo80PhXDoooYZq2xambigeaNdi7hffrrLctwFbLKMLFBAvGjCZQm9owWMT3Ag25wqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEhiZ5/a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEhiZ5/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE70C2BCB8;
	Thu,  7 May 2026 05:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778130527;
	bh=U18VVBFGiNennRFZEf6ejcmYeWwtfk4ahUQv7rjrd1w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OEhiZ5/aWJc7nqJJhXB6xG+3d25r0ftSFCB0tVx0vKiMla0LNmIDf9EUE5ywgm/BR
	 /REVyLAmeZ3BTpiFrLk5cobBxnwyZ1vaHRxC4oihOQy0Hl0D0tD/FL6bvLl4qghnk7
	 YXYviSbXqapffiTYAcSlxYttw1HE+2DQrJHRv07g45ywl6jDLoGOxStGjVC75Xr7C0
	 2N8O1fGyf6/aw3s3rk8mVDhJeyP8XG2NtWzpnf78U2RAtdgZUZqk8eFG4r3q/RU0YN
	 MwBPKh/pt4oKngesCx/9uBazf5P62aerY47tPuyPuPIf3d8+jsSHPaDu2nL52Kx0lJ
	 gmme7a+7Y25zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E9739308A0;
	Thu,  7 May 2026 05:07:58 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform fixes for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <afv9YX5moYvK6w63@google.com>
References: <afv9YX5moYvK6w63@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <afv9YX5moYvK6w63@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-fixes-v7.1-rc3
X-PR-Tracked-Commit-Id: 525cb7ba6661074c1c5cc3772bccc6afab6791ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b625e47f04274538e32e99fe6d3dc01edc93d280
Message-Id: <177813047643.3342676.8441073527165282281.pr-tracker-bot@kernel.org>
Date: Thu, 07 May 2026 05:07:56 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 7 May 2026 02:48:01 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-fixes-v7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b625e47f04274538e32e99fe6d3dc01edc93d280

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
