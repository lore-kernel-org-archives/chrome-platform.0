Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA780211C
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go8NM0KT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E524C433C9;
	Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696990822;
	bh=yyfaTcF+z7xa5UK1LU45KWN7k2J6+LB+zVl4kl9FsGs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=go8NM0KTMsw8aSx80Ti8Ov33mLInObGkcUe7uOsNa/VADyX3Hq/I0yObrqe1oBcL+
	 PNfm6OHFkBfhtx10a6t58G1vv/5c0L3oSaU65Uq5ud5+XbJyj+SymCu4l8Pww0AcL7
	 Po3ojOKJB8gaig2RMj2vhu/Z4DLLDf9sHP8LRta6liXMm2KF5M+COEWsK+bTbb41W2
	 7YZA7qbs4C88p533VfS+qpbRCyS0JKPF8NKCkU8GalJeMKXVxmvqTTgAb4tgPcWf6h
	 8z0heD++J6cHIY58zqQb6Mnxkkowzh0qHFlLuEA9BhdwpjtybKjiydiqYDj/9T0xSg
	 nKZScnq/ARj4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54DA6C41671;
	Wed, 11 Oct 2023 02:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec: fix compilation warning
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169699082233.9318.12953360981604016018.git-patchwork-notify@kernel.org>
Date: Wed, 11 Oct 2023 02:20:22 +0000
References: <20231003080453.4011301-1-tzungbi@kernel.org>
In-Reply-To: <20231003080453.4011301-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  3 Oct 2023 08:04:53 +0000 you wrote:
> When including cros_ec.h solely, the compiler emits the following
> warning:
> > 'struct cros_ec_device' declared inside parameter list
>   will not be visible outside of this definition or declaration
> 
> Fix it by forward declaration.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec: fix compilation warning
    https://git.kernel.org/chrome-platform/c/a7bad167bdc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


