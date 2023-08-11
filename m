Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C64524D
	for <chrome-platform@lists.linux.dev>; Fri, 11 Aug 2023 04:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CF1CC433C7;
	Fri, 11 Aug 2023 04:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691728221;
	bh=ZD8545GDYMbTKuOXTDEfbQovfgmUDaHIWLyFY5u9K+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PL+ViRLMlz1dyWSGVgRknTEVttas50FfzIkSkvdSsLoJMUZvAPS+M0xlJ+ut7yV9W
	 2s9koZrHjqRuv3sI2P6F0AvzrsaLTO/5ijdmhUOr3YoOYfU4xdyuEEOS1Z7SeAp0MB
	 jx4bt9fXwH4mnEd7VQaOIhep7uk4jjCB99Ebizx17Iw8Dxs3vK8khI45S4P25V6GsN
	 MpRib0GnDqrFSuocSG35X+yQy0pYK27ak1wHEpYVWT64rTHyms4QJdelgPepBcCnhE
	 9Tib/0xKS2/UlW/tfOrtlo5LEaGDz5vtiL8Wt2DEmRZ4BffAeX2x0mYQbvBqe2Ym7d
	 6RnQTdjf00dBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63470C395C5;
	Fri, 11 Aug 2023 04:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169172822140.5824.16592248517407164496.git-patchwork-notify@kernel.org>
Date: Fri, 11 Aug 2023 04:30:21 +0000
References: <20230803011245.3773756-1-tzungbi@kernel.org>
In-Reply-To: <20230803011245.3773756-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 guillaume.tucker@collabora.com, denys.f@collabora.com,
 ricardo.canuelo@collabora.com, usama.anjum@collabora.com,
 briannorris@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Thu,  3 Aug 2023 09:12:45 +0800 you wrote:
> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> perfect for them.
> 
> Print hex string for ACPI_TYPE_BUFFER.  Also update the documentation
> to reflect this.
> 
> Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v3] platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
    https://git.kernel.org/chrome-platform/c/0820debb7d48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


