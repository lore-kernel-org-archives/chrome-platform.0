Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0572817DB
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 03:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1844C4339B;
	Fri, 24 Mar 2023 03:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679628019;
	bh=OM9dqDhLQ2jfMsRvvIlNwDdnbtOnP+djsB6V4ATxYUM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bjI0hFLyqXDXIc76XSgKjHPiU00Cl4nzIrhnK9ddpFm+lhlKWvPeknaqEdkgX+49q
	 H1Spasim6eAfc3e23n7iAwTRS0Ad6anGGfP083w8+X54OzQRAkxrEUcI+d0AYI387S
	 /qcz82YWqI4r28HatpwaSRGIM4ER8FNX1tfdkRSWOQABZ/mkhvd1LAOIHSKgklWwcU
	 GLdt4Y8DlHon2nz29nQGKZiNCa/mSmORvZ3t6tWu90TH7gToS/HEBVjs5UCJ3JymGW
	 b+3feJH15NBLB3SCIVjj5qI1WiNtUHf/hy1cAnd22UWT/oU7Ukn2kAvbiVf0kjTz5j
	 odm59/6Cj3xPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95666E4F0D7;
	Fri, 24 Mar 2023 03:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_chardev: fix kernel data leak from
 ioctl
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167962801959.12586.18013255795447539599.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 03:20:19 +0000
References: <20230324010658.1082361-1-tzungbi@kernel.org>
In-Reply-To: <20230324010658.1082361-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 24 Mar 2023 09:06:58 +0800 you wrote:
> It is possible to peep kernel page's data by providing larger `insize`
> in struct cros_ec_command[1] when invoking EC host commands.
> 
> Fix it by using zeroed memory.
> 
> [1]: https://elixir.bootlin.com/linux/v6.2/source/include/linux/platform_data/cros_ec_proto.h#L74
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl
    https://git.kernel.org/chrome-platform/c/b20cf3f89c56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


