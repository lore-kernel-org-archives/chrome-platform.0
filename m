Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A78636
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 839F2C433F2;
	Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672026091;
	bh=qUZEN6W7y7OuPntU93SjMLBdCDZTk+7Ju05902v72Lg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=icxUaio29DepW/UNWwEHJyKi5srX5Qi+bViML+50CCHvteLNM8QGKWMuWBoYZcQY7
	 j3md/7VT07vjANsWCq5ZovwCmNNG+zQ3M/bTFkVlJ0sq1Xd0uJGiOKFpsBthdkcaGi
	 qrk4fUO7LnA7iH2u/wIAlkuUv+3YXREiDQSrJlUTL4WRWAYc50RYNJdtKPk+bF71eK
	 u0UvfoXOibKjyBEdlJxROIep0SDNgOnBvymNnIEU7rE1ag7NZrU5SzLXdfMFSbEG0X
	 jqXIx6PPES+G5jidawpN5qNhIjDRDnJ5dYQwdp/1MF3Jt0x11oqs38TL73zRsmZV8C
	 yYWInE1J78z6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67F45E5250A;
	Mon, 26 Dec 2022 03:41:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v13] firmware: google: Implement cbmem in sysfs driver
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167202609142.9518.10226408413168947580.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:41:31 +0000
References: <20221104161528.531248-1-jrosenth@chromium.org>
In-Reply-To: <20221104161528.531248-1-jrosenth@chromium.org>
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 gregkh@linuxfoundation.org, swboyd@chromium.org, tzungbi@kernel.org,
 groeck@chromium.org, jwerner@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Fri,  4 Nov 2022 10:15:28 -0600 you wrote:
> The CBMEM area is a downward-growing memory region used by coreboot to
> dynamically allocate tagged data structures ("CBMEM entries") that
> remain resident during boot.
> 
> This implements a driver which exports access to the CBMEM entries
> via sysfs under /sys/bus/coreboot/devices/cbmem-<id>.
> 
> [...]

Here is the summary with links:
  - [RESEND,v13] firmware: google: Implement cbmem in sysfs driver
    https://git.kernel.org/chrome-platform/c/19d54020883c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


