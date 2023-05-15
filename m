Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BB10E6
	for <chrome-platform@lists.linux.dev>; Mon, 15 May 2023 05:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C935AC4339B;
	Mon, 15 May 2023 05:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684128018;
	bh=Hq02Own6Z3+xb+cSok6ZHz2h0F1S4H0iO4Q2p0XMYw0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XAMMqMrFdTmCpqEv5yqU/aGl8jL5SQ/2rGK4+2M7DH3WGc4vsMxkJLh+uDF8ait91
	 a1cq9nWzpsT+AdfbZonJs7rdw0/YL7PPcNxg1R9Z0h7verK845O/UHrZD5EfN0FOys
	 8hC3XOjIvtI2CsZQH4/LP9/GHrk82yCzQ5DV2B94DOlVeSmkwJgdBmqV3IRmnJ7q9i
	 TsBk5m6o9b2eWQUMK8AEUbPflUSQnJAQ9J4FzlFNb33xW2V7iLdhjwVBk12io3vi6v
	 LPobovweTTUa4P7L+sODGGuUJCgsUhVGVyjMpNRZcnG+1HevSF4LOj6ZCQIfNAvISx
	 WipNVCXFMmT+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF060E270C1;
	Mon, 15 May 2023 05:20:18 +0000 (UTC)
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
 <168412801871.16595.14801750952836079496.git-patchwork-notify@kernel.org>
Date: Mon, 15 May 2023 05:20:18 +0000
References: <20230509232624.3120347-1-robbarnes@google.com>
In-Reply-To: <20230509232624.3120347-1-robbarnes@google.com>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org, tzungbi@kernel.org,
 pmalani@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


