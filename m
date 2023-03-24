Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F1017DB
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 03:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40836C433EF;
	Fri, 24 Mar 2023 03:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679629220;
	bh=WWxb9xUaSGBTPNmqTdxqjnILX5d8BFdripeuekY2Oig=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DQqb4Uz/4nE2dFThBvIV01GW/DfJMWpurByA/5No8tTxxK1lp0e2oBOPf/l7/PM3s
	 NRtrOU3vmN0mzPXWO3xB6h3rdOhq7IA635STJrfOxhm4u71fZFw/UwRYI6h8g98m9F
	 sFopVMq5uX6LyUl+lviIVb/U6slaqJOV3xkthhClbIQMupFK0n1mr6CtFM7Uc8yRzi
	 GidL5M1+SkTnenK63r6BoKuYCvpTgnc1VD2RXiwoa+Y04qxq/+BTU3HwsTOmYLZoIx
	 cktIFZuNMTWVrlsY7w+JBJNTPKMq1WERjPRkYpib/cRDdOUBabDajztaaVstwwd2me
	 NhohlH+NVy/Cw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 19D57E52511;
	Fri, 24 Mar 2023 03:40:20 +0000 (UTC)
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
 <167962922009.21451.15607534407092248015.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 03:40:20 +0000
References: <20230324010658.1082361-1-tzungbi@kernel.org>
In-Reply-To: <20230324010658.1082361-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


