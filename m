Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207C10F0
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E511C433D6;
	Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660535094;
	bh=QmW6TZ05gI7wLhWNPi4o2fOw3zdY7DdawLkSRpSyaU4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ve5VsOEA+wK0Tp6uUr84kkWwifrkUFRtqfBM4loMTP+3/LIqcAKvgSu3d3zKZj8MY
	 QLKrhYTm2hVkdH9jPvjKunLzzior4RVIdNMPHdScSeNtQCLdTYId94tWHQDziP6CuR
	 XxODg6gyhmdxfpWaZQ/Xo3+QD7Kp9KFylG2aCflHmAoUTGRvhhbVABn3lIUFxKxLgd
	 Ix2JiG6PamQCET2m+0N+BmKajfeW7NKLkBA6OngcMiOMTzbZf9I5dalbU8tQApwtye
	 fM8vhetLyjppmXwSpVefiQ6kqI28BQzEmTdUGB5TFy7awmP4tEFxKZHuL6tShSGCrc
	 XVoUFnS1Lt+3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4303DC4166F;
	Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166053509426.30867.1002265857567976624.git-patchwork-notify@kernel.org>
Date: Mon, 15 Aug 2022 03:44:54 +0000
References: <20220711072333.2064341-1-pmalani@chromium.org>
In-Reply-To: <20220711072333.2064341-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 chrome-platform@lists.linux.dev, bleung@chromium.org,
 heikki.krogerus@linux.intel.com, dnojiri@chromium.org, dustin@howett.net,
 gregkh@linuxfoundation.org, groeck@chromium.org, gustavoars@kernel.org,
 keescook@chromium.org, sebastian.reichel@collabora.com

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Mon, 11 Jul 2022 07:22:54 +0000 you wrote:
> This series introduces a retimer class to the USB Type-C framework,
> It also introduces a Chrome EC (Embedded Controller) switch driver which
> registers the aforementioned retimer switches as well as mode-switches.
> 
> Patch 1 and 2 introduce the retimer class and associated functions to
> the Type-C common code.
> 
> [...]

Here is the summary with links:
  - [v4,1/9] usb: typec: Add support for retimers
    https://git.kernel.org/chrome-platform/c/ddaf8d96f93b
  - [v4,2/9] usb: typec: Add retimer handle to port
    https://git.kernel.org/chrome-platform/c/f31a8702cd36
  - [v4,3/9] platform/chrome: Add Type-C mux set command definitions
    https://git.kernel.org/chrome-platform/c/28a6ed8e39f7
  - [v4,4/9] platform/chrome: cros_typec_switch: Add switch driver
    https://git.kernel.org/chrome-platform/c/e54369058f3d
  - [v4,5/9] platform/chrome: cros_typec_switch: Set EC retimer
    https://git.kernel.org/chrome-platform/c/34f375f0fdf6
  - [v4,6/9] platform/chrome: cros_typec_switch: Add event check
    https://git.kernel.org/chrome-platform/c/bb53ad958012
  - [v4,7/9] platform/chrome: cros_typec_switch: Register mode switches
    https://git.kernel.org/chrome-platform/c/f5434e30011e
  - [v4,8/9] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
    https://git.kernel.org/chrome-platform/c/66fe238a9bcc
  - [v4,9/9] platform/chrome: cros_ec_typec: Get retimer handle
    https://git.kernel.org/chrome-platform/c/c76d09da77d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


