Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56FB17E0
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 08:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F844C433D7;
	Mon,  5 Dec 2022 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670229616;
	bh=Py7U0J9lhyhMmERlESNqJ/l87ZCQ8dpAgBdNRMRcqGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PJyocrVDKyVYKt9w4LONlrFDWTeUDGTNJgovQ9yzyF/WWKk2MO0fLjXYOFEuv7kaU
	 ZauGeRi5g4r1tIZV6+V0UTzYnbhS/xSiJVbeXK6OyJgJlWdMMTgMaZ8gzI/gNNpPeO
	 WL/bg2cp4Z7XYZlghgpixWfySue5GUu99J/pG2GN0ckRXCaITVXFk0wFxC4pyFt0YM
	 ew6qHJ+FODJtpGWUriVpqwLjZ4v2zSdloXtQb4JuN6hX9umIS9wkRPArpDb4ynDIHO
	 tKO07OVeHJxt94CpsLA/Lh/dM9KXcgt7P81FNz02ytlGSFzlb6V7DpAoU12P9wwx6N
	 nRuiQsXJMyVgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2EFF9C5C7C6;
	Mon,  5 Dec 2022 08:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: =?utf-8?q?=5BPATCH=5D_platform/chrome=3A_use_sysfs=5Femit=28=29_to_?=
	=?utf-8?q?instead_of_scnprintf=28=29?=
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167022961618.18204.6417258868175494719.git-patchwork-notify@kernel.org>
Date: Mon, 05 Dec 2022 08:40:16 +0000
References: <202212021656040995199@zte.com.cn>
In-Reply-To: <202212021656040995199@zte.com.cn>
To:  <ye.xingchen@zte.com.cn>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 2 Dec 2022 16:56:04 +0800 (CST) you wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> 
> [...]

Here is the summary with links:
  - platform/chrome: use sysfs_emit() to instead of scnprintf()
    https://git.kernel.org/chrome-platform/c/7af6ee18ad6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


