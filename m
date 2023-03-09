Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E4628
	for <chrome-platform@lists.linux.dev>; Thu,  9 Mar 2023 01:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCADDC433D2;
	Thu,  9 Mar 2023 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678325418;
	bh=MP7Zqjm2AUr1ffMj24FGTPNygUrIISGxpTo/XUDYwxY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Yah7l9GifTQDs2/Aez3BAbfdJDCLBqd2h18uEsvYIIs7nyawP8UG3MvJvxYaO9KL6
	 zPQ9omOerymfqgbGmVQnhpBTx20PLefz7WEzaDD8lXCp9f4c/cpOPdM6vvyF9O9DK7
	 b1bHNJJQke9VLW/bKEB3oKXO4OpImoacqmOsvC51n5YufOkOAUIxXz9NbsLgPg8seX
	 p+Oyh8lrEVzEMC8SRxiItrKbSUUebQfTy0os0+XaanhJpkyp1ia2P1ynIJlQFBgALL
	 F/5lHwL4GWywF7rhij9BGgqUglCHjPs4d0864mAQbF0wat15ZGC4Mbf1zSI+1jLMJh
	 CEhEqrvIt9cVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C31A2E61B64;
	Thu,  9 Mar 2023 01:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec: remove unneeded label and
 if-condition
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167832541879.22861.10976555332530466352.git-patchwork-notify@kernel.org>
Date: Thu, 09 Mar 2023 01:30:18 +0000
References: <20230308031247.2866401-1-tzungbi@kernel.org>
In-Reply-To: <20230308031247.2866401-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed,  8 Mar 2023 11:12:47 +0800 you wrote:
> Both `ec_dev->ec` and `ec_dev->pd` are initialized to NULL at the
> beginning of cros_ec_register().  Also, platform_device_unregister()
> takes care if the given platform_device is NULL.
> 
> Remove the unneeded goto-label and if-condition.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec: remove unneeded label and if-condition
    https://git.kernel.org/chrome-platform/c/db7df0cfaff3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


