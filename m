Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF68F4F
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 19:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 664C1C433D2;
	Tue, 24 Jan 2023 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674587417;
	bh=z8WUK+HPL2awbGmddUVcrNGnZmbDk79rNx9Mp87xnUA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=asnJDSWFMSHKyR2NeqMm59iju/xUwGZvnBWdMpOPjvD/qT01PTFoyC8aBsLVLl14i
	 7EyqBz0Vt75r5AjSsQ9e18ebQkqM4YolawDqQHhkgOum20bvnf0ezTEbkKIAErmfpM
	 j3Saw2iqXAVOtT8M6X3Osg9WZBvbRDgqzJsMpPlx2ZNj551nTC7/ZNcf1i2SJ1oknN
	 KJ/qWycGdzAX4YB2WNKdLstZ6XXTskXxWSMIwuitrPvmygoW7lctg8F7TFrW1KBhLQ
	 xcT+syxI6VsY+FCj79rukUqTSBAc7zOIU709gP8hrJWgKo29hR9+UUKdbDEwicsTwz
	 8Nk7eNo4bct2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 449F4E5250F;
	Tue, 24 Jan 2023 19:10:17 +0000 (UTC)
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
 <167458741726.8497.18044467079478030041.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 19:10:17 +0000
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


