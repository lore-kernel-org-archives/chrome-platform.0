Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76BB621
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 02:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 726A3C433D7;
	Thu,  8 Dec 2022 02:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670464816;
	bh=lBmPgVdx+29O2X1GxlPg/a+W10VuFe3vsOiJCaGMKRw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q4Rg0nPo4UhqBTfJDnNCnBGvAR7suXYsRq8Q2m+lVOiu9ZXrIiOe6eU773MEHqsgv
	 XK93k948orajF010CaCt0qN3Q0i/v8OFWDudfcLy0xQ0WuBMkLykrW/+vstlhhe+Bp
	 AVftUxV+ChKYXJZ692+CoZJKe6HyHHy60nyF6UAxrIC8Mt3WCZwt5TTnXJSNHEuxrN
	 d1z95Hqj6Cimz7jZuWXZeAgX/L49+VGe+qqSnXSuc7cmAuSO5OEAz2V4ImOB+olxty
	 LLgohoTUsizTvYLNMzVj4kMoRuWAccsQxTGfUK/3ly5HrJzzXXX5pe9hXwVojde5rR
	 C/3lFd6VKfqsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58026E270CF;
	Thu,  8 Dec 2022 02:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: zero out stale pointers
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167046481635.18277.9896783990183695326.git-patchwork-notify@kernel.org>
Date: Thu, 08 Dec 2022 02:00:16 +0000
References: <20221207093924.v2.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
In-Reply-To: <20221207093924.v2.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 pmalani@chromium.org, groeck@chromium.org, dustin@howett.net,
 gustavoars@kernel.org, gregkh@linuxfoundation.org,
 sebastian.reichel@collabora.com, dnojiri@chromium.org, lee.jones@linaro.org,
 bleung@chromium.org, tinghan.shen@mediatek.com, tzungbi@kernel.org,
 enric.balletbo@collabora.com, heikki.krogerus@linux.intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed,  7 Dec 2022 09:39:40 +0000 you wrote:
> `cros_typec_get_switch_handles` allocates four pointers when obtaining
> type-c switch handles. These pointers are all freed if failing to obtain
> any of them; therefore, pointers in `port` become stale. The stale
> pointers eventually cause use-after-free or double free in later code
> paths. Zeroing out all pointer fields after freeing to eliminate these
> stale pointers.
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: cros_ec_typec: zero out stale pointers
    https://git.kernel.org/chrome-platform/c/9a8aadcf0b45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


