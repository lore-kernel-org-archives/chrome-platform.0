Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D8C7F5
	for <chrome-platform@lists.linux.dev>; Sat, 28 Oct 2023 03:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZdHAUWr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40EA5C433C9;
	Sat, 28 Oct 2023 03:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698463224;
	bh=Kr7yJXUIDToG74C8kVVwerWZwhZJxg6NVTbOLCgfzNA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lZdHAUWrsJy1B5KeF3QH0YYAprqPtVHGTkGAG//TnyLEyUpeLqD0yQuU1ZyjH/KEV
	 m8jw6ays/i1QuQydJuw2pdP7DfcxMJMkIEJbHHClyuAkPdXFG2s1BJazIavfjoPMyB
	 bJZU3X8AmDboLo/LLz2FCYOJsxR3eksJxkWO2ZMMo7IcoauLdYBKNjHboVtaN65PjL
	 kAvoYDwALZafDWR61+6521FXR9GAFUw7rwvOwur6g7M3ePsROI7W3B9ZruB75WZVFT
	 Oympqqp2DyDmXAcnVC96y45faNieV03hpHzOxSlvd/c2lxgM4V+KoetlNzQWItg8Kd
	 hdREfXmIE6qpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24832C00446;
	Sat, 28 Oct 2023 03:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] platform/chrome: cros_ec_lpc: Separate host command and
 irq disable
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169846322414.18254.4887437778079549748.git-patchwork-notify@kernel.org>
Date: Sat, 28 Oct 2023 03:20:24 +0000
References: <20231027160221.v4.1.I1725c3ed27eb7cd9836904e49e8bfa9fb0200a97@changeid>
In-Reply-To: <20231027160221.v4.1.I1725c3ed27eb7cd9836904e49e8bfa9fb0200a97@changeid>
To: Lalith Rajendran <lalithkraj@chromium.org>
Cc: linux-kernel@vger.kernel.org, bleung@chromium.org, groeck@chromium.org,
 rrangel@chromium.org, timvp@chromium.org, tzungbi@kernel.org,
 chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 27 Oct 2023 16:02:22 -0500 you wrote:
> From: Lalith Rajendran <lalithkraj@chromium.org>
> 
> Both cros host command and irq disable were moved to suspend
> prepare stage from late suspend recently. This is causing EC
> to report MKBP event timeouts during suspend stress testing.
> When the MKBP event timeouts happen during suspend, subsequent
> wakeup of AP by EC using MKBP doesn't happen properly. Move the
> irq disabling part back to late suspend stage which is a general
> suggestion from the suspend kernel documentaiton to do irq
> disable as late as possible.
> 
> [...]

Here is the summary with links:
  - [v4] platform/chrome: cros_ec_lpc: Separate host command and irq disable
    https://git.kernel.org/chrome-platform/c/47ea0ddb1f56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


