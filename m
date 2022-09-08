Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EBF376
	for <chrome-platform@lists.linux.dev>; Thu,  8 Sep 2022 00:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89902C433D7;
	Thu,  8 Sep 2022 00:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662597617;
	bh=0Pf6q/fyxL6TJrj515eWTO9KreL5UCAVLSKnmrj0WSw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mWkNV0AaDMEGK36fK7Sd6wtqW6leJm3PAW9762kdQVjRHqTewyQm3YeCcPeM2J0+5
	 XhW2RvTRq1R7PQtia3MPiY/w76MvLicxELdYYfT8cEPXqA6SKdxxiSe6Wwdiui3RPA
	 kfHWAP0uMMVKhxQk3DDAAXRESut/7GtxqwaeTXSh2bSckjRA2OU6v8K652p5Jnpm6N
	 xCwq6BxfSoLI72Yp93rXf84UpVxER5SWz3vN+aY57ry+TbdpYRylX61DnXzKtwlB7M
	 Y7xV2oo7o3yf8HgEC0Bk7EOtpsIsfhpsQxakN97ATkjfDI3xqSUNH7ide9Rfu+XChX
	 5XeJTMm9ddbug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67B70E1CABD;
	Thu,  8 Sep 2022 00:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] platform/chrome: cros_ec_typec: Altmode fixes
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166259761742.4687.8678554201426962952.git-patchwork-notify@kernel.org>
Date: Thu, 08 Sep 2022 00:40:17 +0000
References: <20220819190807.1275937-1-pmalani@chromium.org>
In-Reply-To: <20220819190807.1275937-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org, enric.balletbo@collabora.com, groeck@chromium.org,
 heikki.krogerus@linux.intel.com

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Fri, 19 Aug 2022 19:08:01 +0000 you wrote:
> This is a short series of minor fixes and changes to prepare the
> ChromeOS Type-C driver to better support alternate mode drivers.
> 
> Prashant Malani (4):
>   platform/chrome: cros_ec_typec: Add bit offset for DP VDO
>   platform/chrome: cros_ec_typec: Correct alt mode index
>   platform/chrome: cros_ec_typec: Stash port driver info
>   platform/chrome: cros_ec_typec: Use Type-C driver data
> 
> [...]

Here is the summary with links:
  - [1/4] platform/chrome: cros_ec_typec: Add bit offset for DP VDO
    https://git.kernel.org/chrome-platform/c/1903adae0464
  - [2/4] platform/chrome: cros_ec_typec: Correct alt mode index
    https://git.kernel.org/chrome-platform/c/4e477663e396
  - [3/4] platform/chrome: cros_ec_typec: Stash port driver info
    (no matching commit)
  - [4/4] platform/chrome: cros_ec_typec: Use Type-C driver data
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


