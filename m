Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664017D4
	for <chrome-platform@lists.linux.dev>; Tue, 18 Jul 2023 02:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3414C433C9;
	Tue, 18 Jul 2023 02:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689648620;
	bh=//UjpPrgiPz5IXQsErsTFUNcM7ADZcuhJBueOSsjc3A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A+n1J4nHWBpS4FDeEfQN8fxRoFim4SxvO0Z6CjTMRMwfhOtTfuSK2gH/hY3p3uEkc
	 V/sh2DLlhEGg2n304wGpPeoaemrGlFRy5KXkmK+R789fKXG6rE1SxL4AGEIoBtIwLQ
	 yjSLyyZlfazbBuk2EpF2DwYIL3MN4JYFPtn0jLBHKtCWE9Bzi3QO3EToiAGz7zIMsg
	 b8O356Y1fS5/SW7PmP6ppyAGm6h6EywQzDorzEwbwnGVqXAjubP3VhjLFVckQyd3ui
	 DsBx1HTpkLObTbjZHVIHv9jfEJqqKVapFE2mDElt2JHnDQxH5WuniOfRY4bhp7pDh2
	 WZdfXw/+aeseA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92D18E270F6;
	Tue, 18 Jul 2023 02:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drivers/cros_ec: Emergency sync filesystem on EC panic
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168964862059.22798.7903916785315170003.git-patchwork-notify@kernel.org>
Date: Tue, 18 Jul 2023 02:50:20 +0000
References: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
In-Reply-To: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
To: Rob Barnes <robbarnes@google.com>
Cc: pmalani@chromium.org, chrome-platform@lists.linux.dev,
 briannorris@chromium.org, bleung@chromium.org, groeck@chromium.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 17 Jul 2023 23:29:32 +0000 you wrote:
> Perform an emergency filesystem sync when an EC panic is reported. An
> emergency sync actually performs two syncs internally in case some
> inodes or pages are temporarily locked.
> 
> hw_protection_shutdown is replaced for a few reasons. It is unnecessary
> because the EC will force reset either way. hw_protection_shutdown does
> not reliably sync filesystem before shutting down. emergency_sync is not
> synchronous so hw_protection_shutdown may interrupt emergency_sync.
> 
> [...]

Here is the summary with links:
  - drivers/cros_ec: Emergency sync filesystem on EC panic
    https://git.kernel.org/chrome-platform/c/a6edd5f5d9cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


