Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E22F4E
	for <chrome-platform@lists.linux.dev>; Tue, 10 May 2022 23:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7988EC385D1;
	Tue, 10 May 2022 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652223613;
	bh=vQk/tlyARgZHNELY8paWFui+GUv2OmVVZzpuEgTWJnc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CvOFhFdtbwbVJsUZnLyB/7+BH6OtsL8E8KNHsFimZFtdAxzYCipupRdZnkW773Gj2
	 70IV8O2UBIbcGREO7PCvdoNUls8voZSMm0KBUNWJ0xMVP289EVl6fD6TvujdETc4Po
	 3uZrDt5B7DWHWGihZFM9smuie9CHt/E4GlyaE7OJZyQWwIay+o2bbfk9G0dY49sOPW
	 1aDxhCh1ehX2oUSOtbU/3K7AjCjksKbvIKuMylnfmjx6D0Sx9Vp+77mGZkoQ1wfoii
	 BeSubHAN5mv+8jzjLVoZN+GJMThCsMK2q+aTnMmSWAVRw+hMExI3ez7YZ+Ad2VWhGT
	 wc4j1g2oAn3mQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5BBC0F03930;
	Tue, 10 May 2022 23:00:13 +0000 (UTC)
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
 <165222361336.23551.5993886315130688709.git-patchwork-notify@kernel.org>
Date: Tue, 10 May 2022 23:00:13 +0000
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220404041101.6276-1-akihiko.odaki@gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

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
    https://git.kernel.org/chrome-platform/c/7464ff8bf2d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


