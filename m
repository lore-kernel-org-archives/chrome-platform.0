Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC21373
	for <chrome-platform@lists.linux.dev>; Sun, 15 Jan 2023 12:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B248C433F0;
	Sun, 15 Jan 2023 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673787016;
	bh=1XHCCY7lh/t+Dx2O3rC7FZpyJHI49pq0WuxsUSZwUV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cjF2uCscUaz2m4l8VRzQcW3ZKnMpTJ8ceHmSryE+sFs1TiJI93wdY44klXSGbY7D2
	 NabK+BO293D0QlJ+AnEDnBsLn0A+otmdiwPN7+QGRgi72YJUTLupRtquBLFkaUjv6o
	 dH3UycyBnPbwp+moMbJaT0mKSkO4VCNegdOrqDOVrqdfdl+n69/AVO/V/ZjsGuVkZf
	 VsTCPBc8/9Ci9sffHmbO1jodktE1YzPa9KPgaF60iLdi+nUYK5aKnEU5pMqo5y850k
	 6xjElkaGk5Nj3HSj9qMbn8+S4b9mPFEkWgHY9ChDoSKyQl2oz5x3gHh+C75NUQTwgf
	 f1+bcpMsIPQSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6AD94C395C8;
	Sun, 15 Jan 2023 12:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] platform/chrome: fix kernel-doc warnings
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167378701643.8704.4010366665262831454.git-patchwork-notify@kernel.org>
Date: Sun, 15 Jan 2023 12:50:16 +0000
References: <20230111055728.708990-1-tzungbi@kernel.org>
In-Reply-To: <20230111055728.708990-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 robbarnes@google.com, evgreen@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 11 Jan 2023 13:57:24 +0800 you wrote:
> The series fixes kernel-doc warnings in various places.
> 
> All of them can be squashed into 1 fix actually.  However, I think it would
> be more clear to separate the first 2 commits as the patches introduced
> the warnings are quite new.
> 
> For the 3rd patch, I am not sure if it makes sense to have the Fixes tag.
> It is a little bit old (~2019).
> 
> [...]

Here is the summary with links:
  - [1/4] platform/chrome: fix kernel-doc warnings for panic notifier
    https://git.kernel.org/chrome-platform/c/16d73129f1fd
  - [2/4] platform/chrome: fix kernel-doc warning for suspend_timeout_ms
    https://git.kernel.org/chrome-platform/c/20eb556dac27
  - [3/4] platform/chrome: fix kernel-doc warning for last_resume_result
    https://git.kernel.org/chrome-platform/c/212c9b9c395f
  - [4/4] platform/chrome: fix kernel-doc warnings for cros_ec_command
    https://git.kernel.org/chrome-platform/c/5fa1dd818fb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


