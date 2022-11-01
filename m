Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDB365
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 04:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6DB8C43142;
	Tue,  1 Nov 2022 04:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667277615;
	bh=a2HbP9jegVrPXYKAGB1tFfS/URtRaQLVGPaa5WrT/1g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=acfbep6XL9svA/NkQ0UTe7D8Xhrc4YJcKHlsLK4SpQ3qwNLuJqoJa6lFzIX8rWJAY
	 WNG9kvlHLucDrRpe6LMvzoJV0jSCQAO3hgblcp2cUA8ySSpEVuXjNPuR1BmjzoZ1Wz
	 w/dAlE/p0zH/Lpt0CSyyNO8qHp0aUDyAtESA6zr5UYO+d3SgRDtedF3/Y1gyqNj4xD
	 1KMhmmlhk6C4M3OjpHJq8xLknKGN7UwRplFveFuheeSEISLx7U5hpBDwulC+MKOP7V
	 Oz7I68q+yS+p4RGK5HLyFH1gC+gUb4VrNDp0AVrH68OiRKB1PfUzxFvUaC++1B7Rqn
	 1B2iFCFyHmnqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B5FF5C4314C;
	Tue,  1 Nov 2022 04:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc_mec: remove
 cros_ec_lpc_mec_destroy()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166727761573.7730.10932870482894712594.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 04:40:15 +0000
References: <20221031050657.3899359-1-tzungbi@kernel.org>
In-Reply-To: <20221031050657.3899359-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 briannorris@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 31 Oct 2022 13:06:57 +0800 you wrote:
> It's pointless (and invalid) to destroy a statically allocated mutex in
> cros_ec_lpc_mec_destroy().
> 
> Let's remove it.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc_mec: remove cros_ec_lpc_mec_destroy()
    https://git.kernel.org/chrome-platform/c/9888feb9c68b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


