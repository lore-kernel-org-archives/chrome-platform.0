Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73611366
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 02:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01FC0C433C1;
	Tue,  1 Nov 2022 02:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667270416;
	bh=K5qEYMF8thaU2wk5xiW2a70D6Gm3TthHqJw68uPolAM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OmeqnVTkqEvSiUjkKeE0i1uIFuc1cbxO89gQF4deaPL1/4Zzraay+RJRLmJ0ktHJB
	 vqTmCQtNL2/Vb23gOWhqz8kxAYmj/TCLzGA3WcfACwtdyu4HRWPYqXYIODLU9Co5Qt
	 uIr8VVD893bjlUJOdJ46C33/TLBW8Hf8jHUw/OShhuF/m4qfqc+enPdauw5NV9XPlp
	 3ljfF4T/yH/qx+emnjM2U2g73Rsh4UwdxPK0B+7wwA+YW9i3I6yuN5D0pjpe3M/RdR
	 wymZwitZGssw8e9Je1IYSbZMF9ylCgBW/Q0AGA3XTUw69oXqOMvxaQkg0lBv9kKE4g
	 +E9ANh6BzFX/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D925BC41621;
	Tue,  1 Nov 2022 02:40:15 +0000 (UTC)
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
 <166727041588.19186.740702086902165398.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 02:40:15 +0000
References: <20221031050657.3899359-1-tzungbi@kernel.org>
In-Reply-To: <20221031050657.3899359-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 briannorris@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


