Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D817D1
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 06:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02211C433C1;
	Mon,  5 Dec 2022 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670220616;
	bh=MCSkWHh5w1t9QGfMv6URi+brUeo2tZ38HYmvocG5Rrc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jkrLkfCYUiHwJa3ASut8ZZmCAgEBbybFtXCmuplt3Y7Ib1ef7tpn5cAKrfGpSzjpw
	 VAYOedPWnUkmDPFNf8pLxjdmPKqIapExbUIIKdv4niohCWZr46DRCqfkGbsyIFAW0v
	 KWpYVnAgy1xqZ+csVkd09cC7hsUVGrpbn2MBL3iUE8AjOgzJPFE4+o6UX5QeTCFSsD
	 BaKjK9wkae82QfIA3AfhxP1Pz9skO2tBEUfrA3QrXecLIoKLPMCcbV+vqMgtIoQQkp
	 mA4evRWznGhmaaT2TqMQLXt+EwGL/ZCW2IKmTwVnxxcICYE1xGNRYrKs02frKzVFHW
	 x+1A5TOuqHHlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D07DAC395EA;
	Mon,  5 Dec 2022 06:10:15 +0000 (UTC)
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
 <167022061584.5741.17401847079295640907.git-patchwork-notify@kernel.org>
Date: Mon, 05 Dec 2022 06:10:15 +0000
References: <202212021656040995199@zte.com.cn>
In-Reply-To: <202212021656040995199@zte.com.cn>
To:  <ye.xingchen@zte.com.cn>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


