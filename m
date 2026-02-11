Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E668357A37;
	Wed, 11 Feb 2026 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841709; cv=none; b=Kfsqdc9eZYedJBviqfZrQVpiq4d/rxe+kQfd8maUDp34V1No+V29RZNqQFaN+5747Ak7Jv/MHiVWs6xCKoiSWUQWuodBlGBpOSjJZi6P/oS6s4ihOTdwK4dHprlsN1i9BF3dioyz4UjYNrzwuFGKZhXXPmjAVGS1Y95os1YZ1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841709; c=relaxed/simple;
	bh=u/6RUgmZtQSqZX0lVAJ6FPTHVqVg8lHQ51eAq353XBA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gmFbEB1WYZ7WTN+2+L7XFseMUi7U/BgOltC2rbJP8qlGj7S240oDhtGNK1+ZJj4h7aBGW9x3YWSnwLhN8qbEF0yxEK3S3QeNPem39IYW/2xzpLfhKQqTjVtVbZ3fgSpdJOWRzFbWnzlHk7enj4DhbnD3S/I1g+GKf2ktpt0t2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gf935jp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gf935jp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CD7C4CEF7;
	Wed, 11 Feb 2026 20:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841709;
	bh=u/6RUgmZtQSqZX0lVAJ6FPTHVqVg8lHQ51eAq353XBA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gf935jp+zB7zm+xVaM/pz4rsZPl1k/Nam0k62b8L1bqgzlwd0Z3ZTfJHsrOt67j4J
	 dQWbdTc4rdcBqlfPX4EYdIePQhmk/IlHqNMN/RGd1odEm/2xQet8Og30bP0hs+Tln7
	 TFHpuzOUk9bSx/gv79K5nwUBrPBgjNFOlLnt6OycBdcT5keu3l6sDJgifHRUyFgkWh
	 6bDIrqKwF622xfD4pNuoogcE8ByZ3tYmdMyeOD4PpH+pTtX/nNG42d4zUD8upDGtjZ
	 J74SE+kE3Iub2hltt6G0x5mEDjtMOdBeM/7Dty/upm0I9xEEuSY/9b23RfO6aprxDY
	 YswqDHsHJq9aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B31439EF964;
	Wed, 11 Feb 2026 20:28:25 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <aYlTGG_NABjz3a-K@google.com>
References: <aYlTGG_NABjz3a-K@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <aYlTGG_NABjz3a-K@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.0
X-PR-Tracked-Commit-Id: 520e345dfdab89aed4a0ad98d5ec35086661a11a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be653d2d1f435218cf4b7abad96b42a20ce28451
Message-Id: <177084170371.710910.13219136892734783327.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:23 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 9 Feb 2026 03:23:04 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be653d2d1f435218cf4b7abad96b42a20ce28451

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
