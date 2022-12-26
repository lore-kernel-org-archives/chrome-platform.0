Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D883A371
	for <chrome-platform@lists.linux.dev>; Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CEBDC433F0;
	Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672025549;
	bh=a47xJUGD7vrt0AjZ0kNeUKKiGBj+wuGGktZD5yVgTGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s7qY7fnmqvhX+qBopdA4LtP8nYj9W8CKN4UnD0kqJ01xb2c7of6uImV+y2i67yl0d
	 I0cCUMZlh7KFkzinx3kLpWfMpaXQgwavt9XcDXN0LXKU9NNN5y9QOrnNm/a9qmuyMV
	 BvD532wgiQxHeRFcXiu8vneXZ43O2EmiegVphJpDHQpc8dLpnSLT7YXK5IlsiWXpqs
	 CPg6JWXZwwYgl38D2qQc2eGz77tg36Y7WPbUa/6w0FBP+eca1cZwCWOwQurkR8oThV
	 VvU20oZ0seUG0BLe7KPszFFSPP8wF95oI2RUhn3psVuysIpuEA0OEalDZphtdwxrw9
	 2nBVHEsq1g7Xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7CA0EE50D66;
	Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: coreboot: Register bus in module init
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167202554950.9518.17220967657026708606.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:32:29 +0000
References: <20221019180934.1.If29e167d8a4771b0bf4a39c89c6946ed764817b9@changeid>
In-Reply-To: <20221019180934.1.If29e167d8a4771b0bf4a39c89c6946ed764817b9@changeid>
To: Brian Norris <briannorris@chromium.org>
Cc: gregkh@linuxfoundation.org, bleung@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 samuel@sholland.org, jwerner@chromium.org, swboyd@chromium.org,
 linux@roeck-us.net, stable@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Wed, 19 Oct 2022 18:10:53 -0700 you wrote:
> The coreboot_table driver registers a coreboot bus while probing a
> "coreboot_table" device representing the coreboot table memory region.
> Probing this device (i.e., registering the bus) is a dependency for the
> module_init() functions of any driver for this bus (e.g.,
> memconsole-coreboot.c / memconsole_driver_init()).
> 
> With synchronous probe, this dependency works OK, as the link order in
> the Makefile ensures coreboot_table_driver_init() (and thus,
> coreboot_table_probe()) completes before a coreboot device driver tries
> to add itself to the bus.
> 
> [...]

Here is the summary with links:
  - firmware: coreboot: Register bus in module init
    https://git.kernel.org/chrome-platform/c/65946690ed8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


