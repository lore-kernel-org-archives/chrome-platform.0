Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F933C3D
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 18:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18144C433D2;
	Wed,  8 Feb 2023 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675881018;
	bh=3YOFdKnAwzqh0eCNoXvPPLYHZOdMnpSXzcOAzCSwheY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SdUIHnNswCvU6EWW/DqDwaGUFjDorjoJI7XuZ1yWPE/j64k/eQLyQ7LkzCYa78OUD
	 m+Rrne2+gcGKpeXj5dx2sL5WH6D2B2cT5CROAPeLGvuY4hH8+lAsozNYTI6HrvaoNC
	 /wg1/RhyYWA9vShiShfsNL2TqQqxBSiU0AkOuIMt6W536mbvcHeCji9uqyxyLYyiYN
	 un8rm8LFkhPl5KbT9Gbq1QQXoFfgyvZwpvL6FOFnipzNpCUljKCRiHZl6vkpuCJtq7
	 uh/755ooa4+kCy4mwBmLHz2VOZPN1O1BDkavwLkIMQqnlFzEunRITzxczbn7DR25/t
	 bdrKV7yQMa3UA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F23AFE4D032;
	Wed,  8 Feb 2023 18:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion" ->
 "attention"
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167588101798.25749.5056097806112911445.git-patchwork-notify@kernel.org>
Date: Wed, 08 Feb 2023 18:30:17 +0000
References: <20230207091443.143995-1-colin.i.king@gmail.com>
In-Reply-To: <20230207091443.143995-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Tue,  7 Feb 2023 09:14:43 +0000 you wrote:
> There is a spelling mistake in a dev_warn message, make it lower case
> and fix the spelling.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] platform/chrome: Fix spelling mistake "Attenetion" -> "attention"
    https://git.kernel.org/chrome-platform/c/b0d8a67715da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


