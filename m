Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD517C2
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 01:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 083D5C433C1;
	Fri, 18 Nov 2022 01:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668735615;
	bh=iCbgOnNn/yVg5FX1hHmLBR0hboHD1/UUrrApiVRUky0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kKBqbaXgbD1ee6r3hSKGhBWQx6t1iNnup6UtWNDI6vfb03IY6/GVcsJEa3a8V2BPP
	 +sR79hDVEPQsSxxKfrBevYjoE92LLZMGNRU3YHVpkWfm/9J2qsDu5F1lz3vLDymd2d
	 3vi4tpS9yHTFfqpOXPzA6Qe5OPX3WXkLHGdY5oUxTCdTYhBnBCKtbZwt36d401/ru0
	 MbxvbXoCSOePZ8/Ej9TDsaApPgTwUbE0ubHgslZXQszYqNlz3LNoyKlibByxjWr4qe
	 wRk5Rcg5ypY89Lju2SGm/ul0PDcd/4kTUdM1Elo1HAa7y9edqA+sV5m4Bpc5IJw7vg
	 Guy+1GBd8nEGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8F26C395F0;
	Fri, 18 Nov 2022 01:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Force synchronous probe
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166873561488.28831.7438048035126651837.git-patchwork-notify@kernel.org>
Date: Fri, 18 Nov 2022 01:40:14 +0000
References: <20221111231302.3458191-1-briannorris@chromium.org>
In-Reply-To: <20221111231302.3458191-1-briannorris@chromium.org>
To: Brian Norris <briannorris@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 dmitry.torokhov@gmail.com, swboyd@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 11 Nov 2022 15:13:01 -0800 you wrote:
> This reverts commit bd88b965ae8c ("platform/chrome: cros_ec_lpc: Mark
> PROBE_PREFER_ASYNCHRONOUS"), and then some.
> 
> It has been reported that there are issues with 'cros-ec-keyb' devices
> that are children of this. As noted in the initial patch for its ACPI
> support (commit ba0f32141bc5 ("Input: cros_ec_keyb - handle x86
> detachable/convertible Chromebooks")), it's possible to probe an ACPI
> child device before its parent is probed -- hence the need for
> EPROBE_DEFER. Unfortunately, poking your parent's dev_get_drvdata()
> isn't safe with asynchronous probe, as there's no locking, and the
> ordering is all wrong anyway (drvdata is set before the device is
> *really* ready).
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc: Force synchronous probe
    https://git.kernel.org/chrome-platform/c/ca821c1f4ec1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


