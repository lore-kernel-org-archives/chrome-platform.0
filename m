Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B520E0
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 02:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E6FCC385B0;
	Wed,  4 May 2022 02:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651630812;
	bh=TveM4cwJ0Mrhm+yj6i8pVYzT0TppA2xxy6aY4XERK5o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b5lj7dhO72MyFjYg3Ac82ERhtxrv17WRDCJ5FXkV5671IP+H+9gP4qvJPLyifNfSt
	 vHyMCXhByOtdnfYQtTU7ejOaV02pj2cLtCa0SiFxqcmZvyDxsBM/oIz6XjJFaOfAqL
	 URSMIUlgXB5vFfB2gbRH+U52jB3r22EEAt1k/99aYfUETUXKaCVdiFHTJceU4T4Pue
	 V2ve2oWPsHKpxlXekm4B1G70Q+qCZ7T/TCcpd7qCenuWmtRRDT5ZuewqHZIHalPthY
	 Ki1kEcP4tuv2ynVBrSkWiITyFtVRMEo15Vx2AC5TyYsN1l3Do1zuLeY2pK9KFdE3wo
	 X1B1bGRvn2SbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 651DAF03847;
	Wed,  4 May 2022 02:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] platform/chrome: add support for the Framework Laptop
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165163081239.11347.7235043874756058820.git-patchwork-notify@kernel.org>
Date: Wed, 04 May 2022 02:20:12 +0000
References: <20220217165930.15081-1-dustin@howett.net>
In-Reply-To: <20220217165930.15081-1-dustin@howett.net>
To: Dustin L. Howett <dustin@howett.net>
Cc: chrome-platform@lists.linux.dev, bleung@chromium.org,
 aaboagye@chromium.org, tzungbi@google.com, michael.niksa@live.com

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Thu, 17 Feb 2022 10:59:28 -0600 you wrote:
> This series adds support for the Framework Laptop to the cros_ec LPC
> driver.
> 
> The Framework Laptop is a non-Chromebook laptop that uses the ChromeOS
> Embedded Controller. Since the machine was designed to present a more
> normal device profile, it does not report all 512 I/O ports that are
> typically used by cros_ec_lpcs. Because of this, changes to the driver's
> port reservation scheme were required.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] platform/chrome: cros_ec_lpcs: detect the Framework Laptop
    https://git.kernel.org/chrome-platform/c/6a5d778edaa3
  - [v3,2/2] platform/chrome: cros_ec_lpcs: reserve the MEC LPC I/O ports first
    https://git.kernel.org/chrome-platform/c/c9bc1a0ef9f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


