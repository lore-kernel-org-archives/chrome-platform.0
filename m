Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F140635
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7078C433F1;
	Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672025549;
	bh=0vRdcfS77HMgJZr9nQ/Ecdns5Ruz71nCnSOYzAYpl/E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VSM0gabiwxhkpie4UBIp4gK4+3hNZwuGRY+FNNTiDxby4x25QDfsSJdlO/JR2Vl1L
	 wzrw1r6+Ir9s+Rtc+65WuDCjt4HCPCFFoWsYwJFKEUUk5gRuZqsMXrrSfFtwRT9fJj
	 TpR9or7itHNBeKs8qXWMMppO+7brDzl0vV1TqjeEoly8gJjsPZ24b3wi8IXIkaCH/P
	 VUtr71gAHM7rMwMvzd6Jsz0HLNqWXIeKXmNfvHx4eLFYAvykHxUB5T98V8vr0FL9Dg
	 bc13o7DCIlFici7qWYV6+xoD2/AwgZwzDXwrExYF3N9DsAfcA31j0Zeaftu8SvRd4O
	 qKfuvrl2kRsZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88220FE0854;
	Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
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
 <167202554954.9518.2396909720792326392.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:32:29 +0000
References: <20221104161528.531248-1-jrosenth@chromium.org>
In-Reply-To: <20221104161528.531248-1-jrosenth@chromium.org>
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 gregkh@linuxfoundation.org, swboyd@chromium.org, tzungbi@kernel.org,
 groeck@chromium.org, jwerner@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


