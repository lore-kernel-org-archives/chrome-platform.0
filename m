Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703BA19B
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 16:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 386BBC433A0;
	Fri, 24 Mar 2023 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679675468;
	bh=nYwqoSdM0p+YBcfrNrawjeOYMaLErwUJzT1sCp1/ZTA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iNbRP8EJuf6+8G60QkRm3QsGAm59HaKM2l098wVGTgIiiJ9rEPXGLboyBM1XSp6HI
	 5zcmxgUCg9ADoMhB2u3qbuHoi2g3Wxr32DvfZsSwignYIIKbsd91kkf3ZaFN86syET
	 T/k/LzCvcZXxoCeOXIPxf0FOcLj8rGicvpG0QN/L+jytF6gzQCCuvNXS5wanzjmOJy
	 1JKzhQjNUuXgdoCqKNS+p1jHHv06JT6a4ocLfCvmn27TKOoqk0jL4zWorRwE/GwRXd
	 4yGiPuvcj9/C46W7984gwlWbWbHHlfpXnwf+1//belmNwBOtWnhesCXFpvZi5/gnGM
	 LBQ9/fEcKivdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24600E2A039;
	Fri, 24 Mar 2023 16:31:08 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform fixes for v6.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZB0bphQcL7KLRuV6@google.com>
References: <ZB0bphQcL7KLRuV6@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZB0bphQcL7KLRuV6@google.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-fixes-for-v6.3-rc4
X-PR-Tracked-Commit-Id: b20cf3f89c56b5f6a38b7f76a8128bf9f291bbd3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4bae0ad148f41904dd4e5857bdc2e3e31b950b3d
Message-Id: <167967546814.8924.11093683484440209193.pr-tracker-bot@kernel.org>
Date: Fri, 24 Mar 2023 16:31:08 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Mar 2023 11:40:22 +0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/tag-chrome-platform-fixes-for-v6.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4bae0ad148f41904dd4e5857bdc2e3e31b950b3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
