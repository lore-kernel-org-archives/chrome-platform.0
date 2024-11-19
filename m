Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6E1448DC;
	Tue, 19 Nov 2024 19:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732043181; cv=none; b=ApEdkWKC8xPPTAuMx1YDMUy3E8NvuuvJWTfZvbmJt+YbIEruSGSeZTYsn9ljlK/9pTxI2aVSS8zU4lX3aWXY7Lt39kj3hv+FUE2h3cMv5lGurdy89yXpFrnnNpNtMrUWaf7pu32zfazhpMcMpe+TCCoKe5vujP8O9Luw72O556g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732043181; c=relaxed/simple;
	bh=LA8Ak7H2nGzpe2rXm5lB3uvhIo1Z3o91f4GSB189rQs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uW4tvrTmm7H+7rjV3R782wk46Q26n3lxcZaGTMl5IQqETMuj7STRxLEFWd80jF12XD2d4blgmVDYb7fGbSTPWZi08MJWijqR/QVjZVJUOfE2g+k2vNV7CLhalD6T6wL0UkNtejNL/V+YbyK0j18OgUG6So6XNn4Wiwh4mhbFg7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ki/ZECPb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ki/ZECPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70C2C4CECF;
	Tue, 19 Nov 2024 19:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732043181;
	bh=LA8Ak7H2nGzpe2rXm5lB3uvhIo1Z3o91f4GSB189rQs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ki/ZECPbpfp5qSZ9zSfE4RJyv+EPAS1rdL3cK3BX+Hc6hglaQjJg3rxYkywL4L4LH
	 m32DEo59lkPEmtCyZvD7dowesAKVCcGm8S8JxCfABrRI4Ypu9OQq9nKTHI1CD50Ceg
	 Kjtfe13StUTtYirBHAJq0TAbrQTC0jJ3jWqNyTDn/E//iPdaDiKvYf+U7H1MQcQz+E
	 spNHWtoPQIzX0Jefko1KyDTe8wTd86fnUUIaAAh+B95DsQJaI6uiNHBRoa4U7mMG+9
	 Qe4DO3sv8bu1buu/pQBMtzaaFlt6MSwTAH9rTfOcKo1yjGEltsimG6Wl+NplTN3wQJ
	 BVJ9XYiQu8dbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE47C3809A80;
	Tue, 19 Nov 2024 19:06:33 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform changes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZzqLCvx94JhkBmEP@google.com>
References: <ZzqLCvx94JhkBmEP@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZzqLCvx94JhkBmEP@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-for-6.13
X-PR-Tracked-Commit-Id: ea45f3f46734a47bdbcfb31f41748484219d2ea6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 78516f4aefff408bdc2e867b996065279c5dc89a
Message-Id: <173204319234.653509.1783402739716067882.pr-tracker-bot@kernel.org>
Date: Tue, 19 Nov 2024 19:06:32 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 18 Nov 2024 00:32:10 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-for-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/78516f4aefff408bdc2e867b996065279c5dc89a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
