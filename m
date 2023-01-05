Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1A7B
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 01:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE827C433EF;
	Thu,  5 Jan 2023 01:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672881016;
	bh=EQnH3G0XvZjs2TvFMGyLEXemBXSyUr6azWz61+S4h/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JZY7/Xp62gxP24DGWj18aZu9vY3VLTRCVSPcdsvRXM54SJe4hcIWJovyLUshvmTTu
	 6MFFtqVUHUtVtyt1ACIs7BHn6NjrX4PLPgdD7NHCrgmWyLp0YRCFSWHW/ng8cIWgaT
	 Y+PRN0opddA5ZaAIm0LFslqJ6q8rU1tbWohjhmanhM7f0oXSD1++se3pXgHTp8MxfB
	 pVSVl3vjIqIuH9NH9g7ibFeNlDYNFEwXbA1MXxrFwbwLaNUb0KOhV3UlzQeqcrzIE5
	 liRzh3aDtfVuxs6HxAEtxO6SgUfzItCBDXtOy5ADeqhaH2CAf+AtbnTOSJwfC6yJYY
	 ngHNrDfcIhHzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B64DFE57249;
	Thu,  5 Jan 2023 01:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 1/1] platform/chrome: cros_ec_proto: Use asm intead of
 asm-generic
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167288101674.23539.17067589936495353010.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jan 2023 01:10:16 +0000
References: <20230103145023.40055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230103145023.40055-1-andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: tzungbi@kernel.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, bleung@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  3 Jan 2023 16:50:23 +0200 you wrote:
> There is no point to specify asm-generic for the unaligned.h.
> Drop the 'generic' suffix.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [v1,1/1] platform/chrome: cros_ec_proto: Use asm intead of asm-generic
    https://git.kernel.org/chrome-platform/c/4c7cf5f290e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


