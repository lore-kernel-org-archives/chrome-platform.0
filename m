Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77017D1
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 01:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA301C433B0;
	Thu, 20 Apr 2023 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681955419;
	bh=qk31dwrfX46YB9iviBEeASLWir4iz3d8VCYXEUgDRGA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Sz8cNN5ihXAuaCPjHAevrMeGKQLDEO/xTY9TqhyBXiTFlNzoUEdQa5+6aaHRv/rq8
	 CIn6iKxeN4MyteBPWPpMPI6NILVokSxOCL55bACyfeNn2zpDX2Bc8fj+EqSTYdVD0/
	 TbjVpQxaFMKboAnWTQH5W3svNZmBILHLMueYb5lC+45QQrdrspHt9ALiL76oIT5aoM
	 durE3ZUZadsV+AhVr5o/D1cwoK2YALIdfI6tJzc1Wk1VOtW6pi0VEkUVUVWl7diuq4
	 yBsi/te3pnlKFFIandIldt/WJWLMJIWhCMwuTnwTmr7S83h/08dvTSGM3ExSq1jaA1
	 M9Goyy7JT2Zgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C70FBE4D033;
	Thu, 20 Apr 2023 01:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform: chrome: wilco_ec: remove return value check of
 debugfs_create_dir()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168195541981.13596.15384198794726481044.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 01:50:19 +0000
References: <20230419100303.343379-1-zkhuang@hust.edu.cn>
In-Reply-To: <20230419100303.343379-1-zkhuang@hust.edu.cn>
To: Zhengkang Huang <zkhuang@hust.edu.cn>
Cc: bleung@chromium.org, dzm91@hust.edu.cn, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 19 Apr 2023 18:03:03 +0800 you wrote:
> Smatch complains that:
> wilco_ec_debugfs_probe() warn: 'debug_info->dir' is an error
> pointer or valid
> 
> Debugfs checks are generally not supposed to be checked
> for errors and it is not necessary here.
> 
> [...]

Here is the summary with links:
  - platform: chrome: wilco_ec: remove return value check of debugfs_create_dir()
    https://git.kernel.org/chrome-platform/c/0ad5ce8407db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


