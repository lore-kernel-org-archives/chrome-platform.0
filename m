Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0719067C;
	Thu, 26 Dec 2024 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735248246; cv=none; b=MAmGZkhJqgQYcu3j5oUdohbdJhzNFThSkDHbYuxGFxa+MdR1/TWw6yunKguWGgHCemdVlRwdEMrxgWeIQdJVmVT7KN9UmzMc/CIB/e7AP5ujR258Xvmp+/X2+M5ztUSI9nGWU3qP52NhuMGjrPJNn656DdErdw+Mz09+BS58Q8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735248246; c=relaxed/simple;
	bh=KxzvicPv6ToScE5jhzJug3jenJtGqv+gynnIL8EaDTg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=otdMAHUqpTJTwGMNg5mEtTsdtTAFXQ2gyv4NCOuFmBFOsnVbLMFhJUTMXV/ypQNV+KuRgfHjsCMfDDn0uNNdClZauELt2q6K6gYCVhFjhyAymVu4HYhNHAoKvGA4XzWjCBAEsxyQcc7dPiIDLO3UwnRU5Neqpy1nVxpgOPjAJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8iwOEm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8iwOEm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23930C4CED3;
	Thu, 26 Dec 2024 21:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735248246;
	bh=KxzvicPv6ToScE5jhzJug3jenJtGqv+gynnIL8EaDTg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q8iwOEm+vrW4g8c2vHZzuarLS8pjdfEDE5nYUZsS8C4QYHlzGdApTWml0VbjyMk9Z
	 kUzsaAu6fMqAxkXpnhuUuiDxvwaIb5HoncXJmYklpdulKrE2e5hWM/arNunhJZkmAc
	 9j6wb9Rk7uvhk0I6Fu2lAEp9y4Ycyj35RPdEd/r7wk6L8Xw38WxtIZEn7mgmg1EV5q
	 H1CCqh1V/ddpS8kUfod66liFJhgta+9nmf28PE2Vd9BwTBC6iQkF8iavrQyL+lG+QP
	 ZqGzcfouUI4t9GT/gRwg5xKibj+7Fmo1L2dscLRCmCAW05wq1Inx8dAg2VUvA5lcQF
	 r1fSg+lDRTdqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7107D380A955;
	Thu, 26 Dec 2024 21:24:26 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform fixes for v6.13-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z2twq2LlnCfYQPAc@google.com>
References: <Z2twq2LlnCfYQPAc@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z2twq2LlnCfYQPAc@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-for-6.13-rc5
X-PR-Tracked-Commit-Id: dcd59d0d7d51b2a4b768fc132b0d74a97dfd6d6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab8beb204723d5eff978614160cc5efc78c31ffb
Message-Id: <173524826528.378045.15855117944974188230.pr-tracker-bot@kernel.org>
Date: Thu, 26 Dec 2024 21:24:25 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, bleung@chromium.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 25 Dec 2024 02:40:43 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-for-6.13-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab8beb204723d5eff978614160cc5efc78c31ffb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
