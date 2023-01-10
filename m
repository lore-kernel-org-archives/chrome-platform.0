Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335E2F2F
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 20:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38268C43396;
	Tue, 10 Jan 2023 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673383816;
	bh=t7/KsN8UA7oJ1Ihpg/WlNGyIqxd10nZ2ffj0YcM4s4k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UV07uPud0II2hbp5xo/VMD0R3/UmaDxgBnxQKr+Bgl083yWO6jh3EF6Ru+Tc2SXUr
	 via/VvD60WBH/XnQILiZPX7J61Q0t664iYfP9beNmKQ1WuiZprs/dLLA7887zyloRv
	 Fovbl1yEwGKyqH0KYRlTBkVVMUGHw6lV7vurF0HdyPj38JsX2k9rB+WcXYE2EDRsYE
	 c7Ls4GqCfyMR/untxXPNI2M21k5CV9a7bvZcslhl+2iYzfaCotctHwTrU5uUKam1Py
	 hxxFS04DkzOFpZja4VhR/ntYy/Lhp2v7gwoZGLIQYrJyd6WiRb7fsa18jipeFjMPv/
	 j3npWdf0cAjyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D9FBE524ED;
	Tue, 10 Jan 2023 20:50:16 +0000 (UTC)
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
 <167338381611.24576.509540803392908324.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 20:50:16 +0000
References: <20230104060846.112216-1-pmalani@chromium.org>
In-Reply-To: <20230104060846.112216-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
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


