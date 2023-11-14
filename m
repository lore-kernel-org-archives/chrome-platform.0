Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8E101CB
	for <chrome-platform@lists.linux.dev>; Tue, 14 Nov 2023 06:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qI64EoQy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16B1AC433C8;
	Tue, 14 Nov 2023 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699941624;
	bh=R/8VR60svHhdl4xeNE6ZIwCEE/MiEGrJ2q9pzDRWa2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qI64EoQypP3GzCKNkExTHQ7lIbxdV8sM+LwRCYFynfezs+ibMXnlCyv8mpRXZa2Pw
	 Sg6AfRQsJkuSAv9sBvnK3msIJSviYAi9zdGtrCFXVQo4Jf/w0FsqXWlizuf+hhLdgF
	 dnlpc4+JKuy4TJ6cQsQYvBPoYlzFhf+2EtZWxZzu99Ev/hsO3+a+haJWOKpVQ0YfdP
	 LChaqZgpvATM632HwCh2OAqwinHOyApnCUhLG7GJHttMUm8HwkBJHA6thiHrX0Rqgy
	 Bhfv5fYT8Rld3a02zcWAYUUdWywBI8pSrXhWz67jvbK6IHN0wxSMgLLzFLzLAaxERL
	 OB/2Kbzgs8R/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F11C0E1F675;
	Tue, 14 Nov 2023 06:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix typos
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169994162398.30294.7431100273285958893.git-patchwork-notify@kernel.org>
Date: Tue, 14 Nov 2023 06:00:23 +0000
References: <20231110165239.1559109-1-visitorckw@gmail.com>
In-Reply-To: <20231110165239.1559109-1-visitorckw@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: bleung@chromium.org, tzungbi@kernel.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Sat, 11 Nov 2023 00:52:39 +0800 you wrote:
> Replace 'preceeds' with 'precedes' in the comment.
> Replace 'porod' with 'period' in the comment.
> Replace 'noone' with 'no one' in the comment.
> Replace 'lantency' with 'latency' in the comment.
> Replace 'kifo' with 'kfifo' in the comment.
> Replace 'change' with 'chance' in the comment.
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: sensorhub: Fix typos
    https://git.kernel.org/chrome-platform/c/49e380795414

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


