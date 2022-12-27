Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D76C803
	for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 05:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4C10C433EF;
	Tue, 27 Dec 2022 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672120215;
	bh=W9OUJI/Fm9AG3grOj2VHuWR+5RDShrNqSPHYTg9+uKo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qqkxibD9oz6V55h9Sz1A4fqlmQJoKwIVk8CA9a+6L1qwx2KoNsIzutBPK6Kag1UQv
	 OrXXF6gS4cag+14F5UgltIlwjsYYGM9OrssjM6T+Nac/R0gtC0WHHq0m1FwHWedcee
	 eC1AroAVK7dhOkZhiftmwksID3/sHHWJ8sdAffiJAh7/7TzIFs4ZCrUgb2tte2NDkE
	 zKDnIzmsf49tZzxoNbgQ7lDoYKWTBSIeIi9rwTWHhvxp9TpWX8VUQurzUhT46p98qc
	 nekjZmQN8yTDC3IOEZz2A73eu2hOhHjkJf0O4DyJH4o8mzhntZtd6FckFCk1OAKSvI
	 BuCPD2junYLZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB23BE50D70;
	Tue, 27 Dec 2022 05:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: use sysfs_emit_at() instead of scnprintf()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167212021482.32112.17891189572140692879.git-patchwork-notify@kernel.org>
Date: Tue, 27 Dec 2022 05:50:14 +0000
References: <20221205061042.1774769-1-tzungbi@kernel.org>
In-Reply-To: <20221205061042.1774769-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon,  5 Dec 2022 14:10:42 +0800 you wrote:
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Inspired by https://patchwork.kernel.org/project/chrome-platform/patch/202212021656040995199@zte.com.cn/
> 
> [...]

Here is the summary with links:
  - platform/chrome: use sysfs_emit_at() instead of scnprintf()
    https://git.kernel.org/chrome-platform/c/b251c0e7ea5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


