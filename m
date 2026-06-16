Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932C3AE71F;
	Tue, 16 Jun 2026 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575906; cv=none; b=RMZhzGcJgHCp4LYljwv0lvPGSJ59OoPjXlC9KTvaoZZWaAGzLl7VDyEpS3ZYW+4OV7vEJsu5jPYF2oRKnOuGinOW3rjyA9y6NGEaRda7j3o8C3CeHnlaE+IXQvI0bPO+Ed/kfiA1qmsM23uueqpjLBn77C+V5XPTFSLVFflZYzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575906; c=relaxed/simple;
	bh=mWNg4sHQncRnOONNHODRMWAkpteNadIg2oLIf4sbOXM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cfYq5azYWkajKpT2mEdzOkjvUiPwoPQEIODFKwImTFEeSaeuKABFrxGAk+vgetdCsVWDoPbCyr8q2j20NLUWNooKT7j7uRNJnexaM9R3vvqOhaKTneTV51LSMzAfCnbTtjHMejTe3rZPbOyq9PEpGV+THr3i9z9wA4KLA9O/jjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiUAs1TK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiUAs1TK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7A81F000E9;
	Tue, 16 Jun 2026 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781575905;
	bh=NbR78u5VN8Msp/Cp5z6raDhUoB9OurrVishZIU5FXJ8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jiUAs1TKh0yYdPmy5PWXZVlRbDyRq60hQalAg1WbBphHxOXs/HQ6U4vTu8K14xmPh
	 ZbagpdyyRPBt0+eMnRs7qiPawiOKpTqp2uIGOwF5ETP3eEciLc7Lal6cAIWpCwjgEs
	 Kt0/1Xh4tjbFV4+tWtrOtp1iSxArkFaFjAN58jKBEF5m6RQSQpLyIZQlc9NfMZMVJo
	 h8GU5xgbC8WcfE5DfVZz0kadjC5ee4iUQivyEn75ISZwi00l2vJ3G/ysRpkroAEAzG
	 oaQw4h/36t4oe4U+P51SvDRIVLda6zas/je1HITWXKp1Q78n1Buz3/BHu23coe2dat
	 IMUFVy3ElyC4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5684C3839A26;
	Tue, 16 Jun 2026 02:11:41 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform-firmware updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ai9vR1dGoZXL7mMj@google.com>
References: <ai9vR1dGoZXL7mMj@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <ai9vR1dGoZXL7mMj@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.2
X-PR-Tracked-Commit-Id: 86e3bbc716332600e9e087f8a4889f4d9714a99c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd1878584db2f0ab3fe8f2b3d8d59316fffa47fa
Message-Id: <178157589981.390807.592686276006615444.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 02:11:39 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 15 Jun 2026 03:19:35 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd1878584db2f0ab3fe8f2b3d8d59316fffa47fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
