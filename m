Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B603BA3A
	for <chrome-platform@lists.linux.dev>; Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFC01C433F1;
	Fri, 13 Jan 2023 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673644855;
	bh=gZQB5Rr2EKLw5BonMhM/yCovKBuhaogmYvswMy1xP9w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oBrE0H3K371NXAfkbiN5sBdKxDvbddGPf2zFOd4EAIkikaO/zNHWNfil91D/QGlud
	 MlT0hW9qpx8n7VnQ+CCG8SbFvrJeTlqkVJ64Wqef8ZXEo0Xy1vC5yLUIewoCE+Q8Vb
	 uax/R7aDtbH9YxIhkiQop9HHHnV99suvJwWCOB2RB2LuQUmNoB6hyI17+fzv5bfkyq
	 UGAiMa695VIHdb5XASOqDLatNdIcA6T/E+ndeTyUtRvVOC5iDkLPS91KfNrp+8abAF
	 pF+I6Dd/lQDhAsPE6VZk1ozYDEUZBqyu9fl5zTiIhQDkYtL3b8+o7rYwip4hHQm2md
	 44y4UYAMTDX2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BCDE9C395CA;
	Fri, 13 Jan 2023 21:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Use per-device lockdep key
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167364485577.21086.1402903031972419181.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jan 2023 21:20:55 +0000
References: <20230111074146.2624496-1-wenst@chromium.org>
In-Reply-To: <20230111074146.2624496-1-wenst@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 angelogioacchino.delregno@collabora.com, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 11 Jan 2023 15:41:46 +0800 you wrote:
> Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
> the following lock sequences:
> 
> 1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
> 2. lock(&ec_dev->lock); lock(prepare_lock);
> 
> The actual dependency chains are much longer. The shortened version
> looks somewhat like:
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: cros_ec: Use per-device lockdep key
    https://git.kernel.org/chrome-platform/c/961a325becd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


