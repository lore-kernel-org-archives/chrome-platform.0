Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C73211
	for <chrome-platform@lists.linux.dev>; Fri, 15 Jul 2022 19:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2551EC341CD;
	Fri, 15 Jul 2022 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657911615;
	bh=bV6fjVH3Ww1z+2h4N07V4RdxlTmKgMBZ9vWZar4eZSE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IMro5uied36+7P991NTGMehlq0zfI/V967gNZN4A2RcX8FKt7nGA2yIzsmjsD5btT
	 HTRezDKkS2gcjLFZKkGsFO16HgA3bErGCxxN6a9cKgXqhV3jV0g3SOnt5IQO4p2VD2
	 RqnfdJ+38dyYw+uKNwlcH/AqLl5B0R3vWjk0JO51LTI/46RQwKIow9mlcKySLwDJix
	 J4/ngjePdH0no7WZYGgqUDhOMuFxHEj/1c4dFA74mHeQ3B4XIUBJGWsqWuDqU8u7F9
	 OS88SOcTXWEDymaR1Ip9oODq+x00FOBec2YQGbWKKnzPlao6F7Skdw60EdchSAI+7K
	 pkIoiwJCiVw0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3333E4522E;
	Fri, 15 Jul 2022 19:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Use dev_err_probe on port
 register fail
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165791161498.31351.5395252927709441391.git-patchwork-notify@kernel.org>
Date: Fri, 15 Jul 2022 19:00:14 +0000
References: <20220712214554.545035-1-nfraprado@collabora.com>
In-Reply-To: <20220712214554.545035-1-nfraprado@collabora.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@ci.codeaurora.org,
	=?utf-8?q?=3E?=@ci.codeaurora.org
Cc: pmalani@chromium.org, angelogioacchino.delregno@collabora.com,
 kernel@collabora.com, bleung@chromium.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Tue, 12 Jul 2022 17:45:54 -0400 you wrote:
> The typec_register_port() can fail with EPROBE_DEFER if the endpoint
> node hasn't probed yet. In order to avoid spamming the log with errors
> in that case, log using dev_err_probe().
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_typec: Use dev_err_probe on port register fail
    https://git.kernel.org/chrome-platform/c/ce838f7dc795

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


