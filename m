Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7D10E8
	for <chrome-platform@lists.linux.dev>; Tue,  8 Aug 2023 02:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA3CFC433CC;
	Tue,  8 Aug 2023 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691462421;
	bh=7x3qEmXK9q5bKwOZn4ZDdUKO7tO98ic8UE3riIcNxno=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=guO4Qdhzoo6fCoShSC/qdrjPf69dWGl0QoJFJSb8UT3ctnZhb/6DVLBicxXQO1+LU
	 2lnxbAjwOB3E0tYNVADAk7tUdAZxpCd+cDx5HeZrkhamzvoDI/QsC3sfUlCPDhXRSN
	 GgJEG9/tST+UK3pNFcPNHzE+DvmNKjRfyDoLjqrzIS6MocBjVE6OiRuPBXzufWZj56
	 kvsaoCSHVGEDt6vPvXLoUfE+lqmtjYHBgJCbR8xB00SOu26nEBsdg3ymGfLfnQXty3
	 rqjAF81yC2Zt/ANBaDP7ZcqwnxkL5nk/sgmXYPdI4UrwPM9/wLmWzCBGeRhowk4liv
	 ZOXH/nwG/Z4zQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7BDEE26D5F;
	Tue,  8 Aug 2023 02:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: update maintainers of chrome-platform
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169146242174.22152.5118223797034079857.git-patchwork-notify@kernel.org>
Date: Tue, 08 Aug 2023 02:40:21 +0000
References: <20230803100846.3223564-1-tzungbi@kernel.org>
In-Reply-To: <20230803100846.3223564-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Thu,  3 Aug 2023 18:08:46 +0800 you wrote:
> Add Tzung-Bi as a maintainer of chrome-platform.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: update maintainers of chrome-platform
    https://git.kernel.org/chrome-platform/c/5008b864b6a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


