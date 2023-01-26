Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74A4C9B
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 19:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE4A0C4339B;
	Thu, 26 Jan 2023 19:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674762616;
	bh=kUJy/y9iRFtiWWJgoHU6wDqG16Th7B9H6olXKbHU+WY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q+TcdLtKqN/biuJhdT0A5b8eK6klucuG4EXXBr/6GUdwugS4tynBJOgThchR6sr6v
	 5ZWg6qD1PgR94l95NurG7uIzkObXvIXEYyNSjvkRtGKBlykVm+Zf3bpuw6CwkOPu48
	 +5dJ57uCeXF2pINsn27/G16DnTJfG1046gEmWiuWsTce8GgAFP6sBvtpAVOZYJCYlw
	 lZyODo33P5cKuCrfjjT5rKaXfXFhlUtxc8GZKYsV6xftHXiVVhHdxooGsLnbl0jnsE
	 yv0pU32by17MRR4mTAy3I89hnq4XsRpbMrzdDd4Il+ScvB6QwpsN0Z1c6S/7a9Wqbf
	 UBgjESuuIb7gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4EC0E54D2D;
	Thu, 26 Jan 2023 19:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] platform/chrome: cros_ec_typec: allow deferred probe of
 switch handles
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167476261680.7258.4736559242747511129.git-patchwork-notify@kernel.org>
Date: Thu, 26 Jan 2023 19:50:16 +0000
References: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
In-Reply-To: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 heikki.krogerus@linux.intel.com, lee.jones@linaro.org, groeck@chromium.org,
 enric.balletbo@collabora.com, tzungbi@kernel.org,
 sebastian.reichel@collabora.com, gregkh@linuxfoundation.org,
 gustavoars@kernel.org, bleung@chromium.org, dustin@howett.net,
 dnojiri@chromium.org, tinghan.shen@mediatek.com, pmalani@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Tue, 24 Jan 2023 07:56:32 +0000 you wrote:
> `fwnode_typec_{retimer,mux,switch}_get()` could return `-EPROBE_DEFER`,
> which is called from `cros_typec_get_switch_handles`. When this happens,
> it does not indicate absence of switches; instead, it only hints that
> probing of switches should occur at a later time.
> 
> Progagate `-EPROBE_DEFER` to upper layer logic so that they can re-try
> probing switches as a better time.
> 
> [...]

Here is the summary with links:
  - [v3] platform/chrome: cros_ec_typec: allow deferred probe of switch handles
    https://git.kernel.org/chrome-platform/c/13aba1e532f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


