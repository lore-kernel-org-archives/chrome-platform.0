Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7B63B
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 04:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72E49C433B5;
	Wed,  2 Nov 2022 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667363420;
	bh=KLpiTLhRbosV2KBZEwmavVAw4GWa0QLwvm+v4ICJr6s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XAmw947T/D+9lNX3AwHBq7BhL+/+JxIVw/UWA1wLFP9Ka1pYRafZRJKTg/pIHGNJK
	 XoeoavHin7kcSkOSgSuSP4a5lCzdbhVYv17d03VYNfS1YD8bnDA+U3+GESQGsQ3sNp
	 ih9vKlWQID/51KZ6QwMM6xvmPjFWSOCylGFs+S0uvpyRABKmhJHSNyFAubNeaWQaHb
	 aHBohEqKcV7Jd4U8jkzk5rStrpkJ3hTOKXl96f8rMnQPmtvlCsG0ylkOfvWHZHZ1ls
	 NPVhRwjZMxocuXo99yt69DPrgdJfowtkXIdmT24SFR7BvUDNCfDPFt1f0WKzFUvR8S
	 Yx13KVzbA7pCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59CA2E270F9;
	Wed,  2 Nov 2022 04:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 13/30] platform/chrome: Use kstrtobool() instead of
 strtobool()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166736342036.16570.18024323851962138501.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 04:30:20 +0000
References: <8d66b4688c05a44b592a4d20e2660e9067163276.1667336095.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <8d66b4688c05a44b592a4d20e2660e9067163276.1667336095.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: bleung@chromium.org, groeck@chromium.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  1 Nov 2022 22:14:01 +0100 you wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> [...]

Here is the summary with links:
  - [13/30] platform/chrome: Use kstrtobool() instead of strtobool()
    https://git.kernel.org/chrome-platform/c/58f23a6795a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


