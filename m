Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9107538D
	for <chrome-platform@lists.linux.dev>; Mon,  7 Aug 2023 02:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1396AC433C7;
	Mon,  7 Aug 2023 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691376021;
	bh=jw1Wj1p0MQ1TrJEwyOuOLcaXPizFgsYrIPZqhs48ryA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Occqy/ylRN3ek4TTZDPBe6K2AWUsN9Se3Zt7RaK0qL/i4WZBM5bHVgNp7yJmXqyRZ
	 amVDE0UBtCn2KGolHvbKz4p/EjPjW9OK+FwPBvQlzi0QpwWdZ/pbwziEwIab3GX5nb
	 g5UDRLVkmhSTqTdbc3BBNz58er7Aq3MhIy47nEZ6KzE70I0k8OzrsndiGNz/cIoOfZ
	 UtzjIBKXqJ+u2ws8bT6gBg/RrKVEP9QXAbOZGFJmbVgtycqI93RvgJcO1f7nFiNPlz
	 q62s48IbOqafBybU/KQEtP0oQKXQlE3i5UJhsZ8ka57BLNwezS5/ti/UPgxWMNMRfF
	 I56Y2VI080dPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EAF20E505D2;
	Mon,  7 Aug 2023 02:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: update maintainers of chrome-platform
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169137602095.16990.10710398905325522988.git-patchwork-notify@kernel.org>
Date: Mon, 07 Aug 2023 02:40:20 +0000
References: <20230803100846.3223564-1-tzungbi@kernel.org>
In-Reply-To: <20230803100846.3223564-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Thu,  3 Aug 2023 18:08:46 +0800 you wrote:
> Add Tzung-Bi as a maintainer of chrome-platform.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: update maintainers of chrome-platform
    https://git.kernel.org/chrome-platform/c/5008b864b6a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


