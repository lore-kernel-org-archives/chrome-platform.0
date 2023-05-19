Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E5C362
	for <chrome-platform@lists.linux.dev>; Fri, 19 May 2023 02:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA108C4339C;
	Fri, 19 May 2023 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684461620;
	bh=QVp8yuO2Ef07hk05UOyIGkuUpovkT0Mu1BfFX/oBqF0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UEyIQrnWrBm/IYhMml2USv2JEizUTYKEJ8et0iSxErtsGNFOBGGcQHC+4fTxnlutl
	 /xO0lJvZtPFm3vE9yEmbE9pzHPpzL/9rbF3ygsYEnIwo19bOkT6z2M7QSzolu1Reho
	 q0X6CFhaEm8q1GM2JpYaYJBvjIIKn+LYGyuKzhItiZFEzmQFzPzuQiyaH8DFu1zvrb
	 IUSnk3JwkhhVsP0wN7Arg+6dP4HkD3WlnVphYXN2EhpexaXMR5iLULK6I4TH2EFs7P
	 FMBJTSgZSK68O5+iPzH/RRcj92HBKWwU9CJMGSyOE5q5/OZlMyjwxoYTjCI+ar9rlV
	 x+tDRx70+mMdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1F4EC41672;
	Fri, 19 May 2023 02:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] platform/chrome: cros_ec: Report EC panic as uevent
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168446161985.25987.6393780351541262895.git-patchwork-notify@kernel.org>
Date: Fri, 19 May 2023 02:00:19 +0000
References: <20230509232624.3120347-1-robbarnes@google.com>
In-Reply-To: <20230509232624.3120347-1-robbarnes@google.com>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org, tzungbi@kernel.org,
 pmalani@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  9 May 2023 23:26:24 +0000 you wrote:
> Create a uevent when an EC panic is detected. This will allow udev rules
> to trigger when a panic occurs. For example, a udev rule could be added to
> capture an EC coredump. This approach avoids the need to stuff all the
> processing into the driver.
> 
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> Reviewed-by: Prashant Malani <pmalani@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v4] platform/chrome: cros_ec: Report EC panic as uevent
    https://git.kernel.org/chrome-platform/c/2cbf475a04b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


