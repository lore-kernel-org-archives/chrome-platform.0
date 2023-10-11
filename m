Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFA2115
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiSmRsMX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 788CDC433C7;
	Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696990822;
	bh=3XjViZULbZkRKuKCMJuRiQv3f7kXhDXdsh2oCbhnRoc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GiSmRsMXnPQfkkWXtqnR+rybp0JZoUfje8sQG80P8YmsyhTbDeHaQeWXARVoWIobu
	 0d+FDSrq1gF7bj8xSNbxHzgtz5/i0PaGuAm7KOvMo2ow+SzFDcIkWYeMtcd8f4A/HE
	 kIOgVxCTbQZ47G4HwLIx762sgD95IpAUPzwcXKX/iBHHFt/BTw5KzhIMe9rcOkfrSF
	 HrwmRgSe8j/2hX0LeZdsq6eTOcFktJxaqxfbuVU1hN0qYWs7VmdU8qybgg7pnsyMId
	 9+L3+E67tGn1DqZh55wGJxpNxC5znhUl6VfbF1NNYwG1kdX1XbCs3DwKYC4f4ZoQR2
	 aHQrjbfCNVvGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5DB8DE11F43;
	Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: kunit: make EC protocol tests independent
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169699082237.9318.7672925341638531288.git-patchwork-notify@kernel.org>
Date: Wed, 11 Oct 2023 02:20:22 +0000
References: <20231003080515.4011374-1-tzungbi@kernel.org>
In-Reply-To: <20231003080515.4011374-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  3 Oct 2023 08:05:15 +0000 you wrote:
> Remove CONFIG_CROS_KUNIT and common code concept for ChromeOS Kunit but
> make it bundle to ChromeOS EC protocol tests.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/Kconfig                             | 6 +++---
>  drivers/platform/chrome/Makefile                            | 5 ++---
>  drivers/platform/chrome/cros_ec_proto_test.c                | 2 +-
>  .../chrome/{cros_kunit_util.c => cros_ec_proto_test_util.c} | 4 +---
>  .../chrome/{cros_kunit_util.h => cros_ec_proto_test_util.h} | 0
>  5 files changed, 7 insertions(+), 10 deletions(-)
>  rename drivers/platform/chrome/{cros_kunit_util.c => cros_ec_proto_test_util.c} (98%)
>  rename drivers/platform/chrome/{cros_kunit_util.h => cros_ec_proto_test_util.h} (100%)

Here is the summary with links:
  - platform/chrome: kunit: make EC protocol tests independent
    https://git.kernel.org/chrome-platform/c/466f70fb1b10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


