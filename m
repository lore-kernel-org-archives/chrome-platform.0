Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABC7B
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 08:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6A08C433D2;
	Mon, 26 Dec 2022 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672042815;
	bh=QNOZ3scdC6lxNhIACN6q10kZJLzCnzeG0zUHBQasThw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BottQ0Ih6/XZdlH1a2cnMIc73SgDFJq/P+UZDrqAQUZEY17dxns4rV5jRpQJhdqqS
	 egDme3JvQ4d/q5D17xpKFjUWZD0i46pKHfHXWWAMXCACGw1BwJmQh5SZkS7sEduC0Z
	 S2G/fT37PbKdFpxQ+Uti4VmYyXYBCd3rUAP6EQkCndLodA+/Q7ux13Q1CTSnroi++1
	 LltZoXQlB50r198FvTOBp913CX01molLU8GkNpveCjuPzgFsMo8/1MxAxdrhew8Hrf
	 DJsfP20FNB9dqV4XmUwDvEESYQrXGo5z5zVTi0FwXpKnavqOLJSRShR4IkHWL3IEZC
	 jxwr4+utH/0xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA578F82DEA;
	Mon, 26 Dec 2022 08:20:15 +0000 (UTC)
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
 <167204281575.4047.6552187974600189000.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 08:20:15 +0000
References: <20221205061042.1774769-1-tzungbi@kernel.org>
In-Reply-To: <20221205061042.1774769-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


