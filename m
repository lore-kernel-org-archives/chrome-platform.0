Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B634361
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jun 2023 04:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74E11C433D2;
	Tue, 13 Jun 2023 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686630620;
	bh=3Upkbk78RnWCWTUOh1brAeXyaxKfWIHLIVC+3iNAk74=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BqA2m9Zx4FEhwshAkHiXSD+pfHpiHJlIohjOP6C4LzV2tJ+UBCEboGyaGlG8l5e0U
	 FHVavOCnum1+SJZjZ1n9k4WPim1HLokkOjVpfEBrJ/6L8NPPYrUej549bwrymT2yUu
	 6tm3O8iY9NECd/8ORqo1znnIozKnDQYZ7IhB9yJePQTkFuTLd0zs0xQEdO3yUY8HrW
	 JeG15KD7PoRNp2mgEz32PixNbxJRB5Q267C6jjgJYP+LrjEB/XSTqVVrzXLOayoX0E
	 M1eBLtK7MyWWVp+6MouLfWQh6CFC5kRn0SdjoCvG9geD4d53R3WTWLw5VV4xIVRgyY
	 osl2c5GfIkByA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5914BE21EC0;
	Tue, 13 Jun 2023 04:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 1/1] platform/chrome: cros_ec_spi: Use %*ph for printing
 hexdump of a small buffer
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168663062036.801.9347920578627986681.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jun 2023 04:30:20 +0000
References: <20230612212336.4961-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230612212336.4961-1-andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 bleung@chromium.org, groeck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 13 Jun 2023 00:23:36 +0300 you wrote:
> The kernel already has a helper to print a hexdump of a small
> buffer via pointer extension. Use that instead of open coded
> variant.
> 
> In long term it helps to kill pr_cont() or at least narrow down
> its use.
> 
> [...]

Here is the summary with links:
  - [v1,1/1] platform/chrome: cros_ec_spi: Use %*ph for printing hexdump of a small buffer
    https://git.kernel.org/chrome-platform/c/2b8cc5858a07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


