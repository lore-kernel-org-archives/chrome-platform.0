Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC517D2
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 06:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3C00C385A9;
	Tue,  3 May 2022 06:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651558211;
	bh=HXy4UD09FYE1pmDLrZ26LIwNp/UMgssrfKcPLZiY5rY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rw4Duu/PqY5cU789wC8k7rUbcsTvCP+DclJO5/S2UXXi1cwC/gOFARtWANX69b3QP
	 3LYHdkBvEfJT7fuUcyajfTKfdriJqr8kwdDbCYIIyXo+KYPYIM2OFA7YPYbWI4roLM
	 NgWzrBBFy/9PGw2TZUXIY0fcy4nYZe5fSh6dFxZOmeGIFVcfhjWzYomHYiFIab8RSM
	 IAWqj+QTahtl5Jts3F5PxIvC3Ggazim/yBv1dS5av3bqvg+Jktr5O0DXKU9dbFv7zw
	 UrB1QM7IufPNNS3UkI1iiuCT2PDdWFIYPq6gqtxaI9GUybq4A6Od1uK4qsE0V2r8GA
	 TpC8dulu/yzRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7D55E6D402;
	Tue,  3 May 2022 06:10:11 +0000 (UTC)
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
 <165155821181.3023.17779177591961421064.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 06:10:11 +0000
References: <20220217165930.15081-1-dustin@howett.net>
In-Reply-To: <20220217165930.15081-1-dustin@howett.net>
To: Dustin L. Howett <dustin@howett.net>
Cc: chrome-platform@lists.linux.dev, bleung@chromium.org,
 aaboagye@chromium.org, tzungbi@google.com, michael.niksa@live.com

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
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


