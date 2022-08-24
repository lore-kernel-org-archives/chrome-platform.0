Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD604EA8
	for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 02:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BA2FC433D6;
	Wed, 24 Aug 2022 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661307615;
	bh=jAcac9oQXJO1kUVKMNNwinXLn1KG+5V1YehmxlzKAp8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IVBBx/QmCDMVxUX7FyeNUN1n2KG8aLpFheiX9uodfwD6sYozZus+CJ/ge+v54vxTI
	 B4sxGePeMltMQ71/kl9F+iW21DLbkijyotP4nmyKxGowZozNUEuvfKMmMdJlvlQOwF
	 +ticxtCSQq5lFrKrEg5GirT5w4aSqfrMQzICrrf9blgT2jVR4s+uHb7QW5Sw6s9lQc
	 zJYSbYy4WFXINvQmkZPf3EX2Ck03uK120UQX//Bk6hOwXWy3i3Or1vcSqMRZbAMea4
	 cqtsbcInVHwTnrE9ItJqYFLrBBef61x3vP0MP4Czhig9lxyu1braFzqpWCm/TIYV1i
	 cGk9THRU6pSUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 706B2E2A042;
	Wed, 24 Aug 2022 02:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: fix memory corruption in ioctl
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166130761545.28253.5958376745153935683.git-patchwork-notify@kernel.org>
Date: Wed, 24 Aug 2022 02:20:15 +0000
References: <Yv8dpCFZJdbUT5ye@kili>
In-Reply-To: <Yv8dpCFZJdbUT5ye@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: bleung@chromium.org, enric.balletbo@collabora.com, groeck@chromium.org,
 andriy.shevchenko@linux.intel.com, lee.jones@linaro.org,
 gwendal@chromium.org, chrome-platform@lists.linux.dev,
 kernel-janitors@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 19 Aug 2022 08:20:36 +0300 you wrote:
> If "s_mem.bytes" is larger than the buffer size it leads to memory
> corruption.
> 
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - platform/chrome: fix memory corruption in ioctl
    https://git.kernel.org/chrome-platform/c/8a07b45fd3c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


