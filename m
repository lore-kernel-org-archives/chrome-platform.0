Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3291373
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10D7CC385A8;
	Wed, 20 Apr 2022 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650451812;
	bh=lDXrcIhmwRkt0SoBQSq31ilCNPvYUV3Ka7JEeaJkBYQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b8P+jObYZqjxupBrlHKoHEx2qtERNAh5plgNRJggXSWWfBJwv2E3wzWKeUQZJRO83
	 EKCMKgX6gQ+2Rhw087fg/MlKjfFBK0E4tJNVYxtfdM0qLGr5NUm8LhYg3gFKV6k7l0
	 wdSkIYtILMtQ6VYjsAFxOoAuwHUzCbgQmUyuTJ+x4WGZVtiHsrx2uzIxMr3fxIrY8P
	 fbnUe48fEBhAr8cwUF6ZC3jX/ixdwm+Dr2/afaoYx2O4WHJynktovsj+lCHh4R1HW0
	 XcqNVOYT396n/636JeOF2Is36SvDMZls45fBwfwgTp15xCkFtYTI7sppFvhHKrWS/g
	 bGsXTH4gJOOGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9F89E8DD85;
	Wed, 20 Apr 2022 10:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165045181194.29490.17184763637444609886.git-patchwork-notify@kernel.org>
Date: Wed, 20 Apr 2022 10:50:11 +0000
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220404041101.6276-1-akihiko.odaki@gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon,  4 Apr 2022 13:11:01 +0900 you wrote:
> The EC driver may not be initialized when cros_typec_probe is called,
> particulary when CONFIG_CROS_EC_CHARDEV=m.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - platform/chrome: cros_ec_typec: Check for EC driver
    https://git.kernel.org/chrome-platform/c/cce465a867bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


