Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EFEBA42
	for <chrome-platform@lists.linux.dev>; Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 764A3C433A1;
	Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673644856;
	bh=P3p4lAttGXWK5Zjf3Dzui7xxuzBuF9vEYkXO8RNMgzQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TuSIhAJVsf01EDO8WwwH+oZd9j6C4yXJ4KVPCPeCK5FnJCttPPynOdIpEkW7e14h2
	 hN4hh1GCOn0F0BrfsbBVtekFmTe4AaJgqc7rLHaTvhyVRvM5iPy4/yXYPYK+DR6H+a
	 vRy+QZhGK61KURBKvtQPq/M1e9NoPiUSxh2isDmu0hUL/HPd3nr8eYMkDDkoIoWiaY
	 pbsf4lv8pMM79Vx0iRMXzVF//6iTIpkMNMnhB3c7W2upSSmVVNI2XAsR/AZ92gG2R6
	 ROihJ3dYwDrKVqbkrqIRwKlc00ibJPCCE9jfktZPJWtnfpLfubVgKP1F7n67vtPapp
	 OnMUcixKVcYFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61A6EE270DD;
	Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] platform/chrome: cros_typec_switch: Use fwnode* prop
 check
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167364485639.21086.3086760523982737286.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jan 2023 21:20:56 +0000
References: <20230104060846.112216-1-pmalani@chromium.org>
In-Reply-To: <20230104060846.112216-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Wed,  4 Jan 2023 06:08:44 +0000 you wrote:
> Using device_property_present() multiple times on an ACPI device
> leads to kernel panics on Chromebook systems. This happens when there
> is > 1 boolean property in an ACPI device which is created dynamically
> by the BIOS as part of SSDT[1] on Chromebook systems
> 
> Since fwnode_* can handle simple device tree properties equally
> well, switch to using the fwnode_property_present() function
> version. This will avoid panics and make the usage consistent
> when we introduce a check for the 2nd property in a subsequent patch.
> 
> [...]

Here is the summary with links:
  - [1/2] platform/chrome: cros_typec_switch: Use fwnode* prop check
    https://git.kernel.org/chrome-platform/c/ef9c00dbd383
  - [2/2] platform/chrome: cros_typec_switch: Check for retimer flag
    https://git.kernel.org/chrome-platform/c/441529bed41c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


