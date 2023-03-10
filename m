Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE927E6
	for <chrome-platform@lists.linux.dev>; Fri, 10 Mar 2023 01:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDEA6C433EF;
	Fri, 10 Mar 2023 01:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678412417;
	bh=P5PxRmpgV+l3QiAZd8FMNfp2vjNxtXSBMTUrOrOjzm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mxDhM89xXL02BHW0v+HBUVa+0bPN4iXQgfwcF/cCRMtV3qeWxUx8PUQOGcu9f6ciR
	 Wht63j5c5XfqeqAuTUVpnqIFImTF/tOCTpRoZxd7Xk/SBkGzwA+ReQPo2VoRMpasZn
	 y9W41IzEq7Z7BekisnbNp8DgTmnMbSVCt81DXN+OS2iViq7TgrMDTvmu5+qYs1ruup
	 F/LxQkmVWsz8Q7uXN9Ki9I2LBHqsYtqrIyRuEl0fld1IcEBXVSe5riEKZvJk+IQiK6
	 iKmvR1utLsNwH4fuhq1BoKV/ibiJ/tpW81/td6bCU7ul4Jrd/0dVCnQS9TVF+RgOYo
	 8gpwj8h8pFq6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CAEA4E61B61;
	Fri, 10 Mar 2023 01:40:16 +0000 (UTC)
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
 <167841241682.28694.18429488311539163872.git-patchwork-notify@kernel.org>
Date: Fri, 10 Mar 2023 01:40:16 +0000
References: <20230308031247.2866401-1-tzungbi@kernel.org>
In-Reply-To: <20230308031247.2866401-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


