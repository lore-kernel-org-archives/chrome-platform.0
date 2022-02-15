Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373067C
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2518C340F0;
	Tue, 15 Feb 2022 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644955210;
	bh=LFNzfqzNtzmGiRgBnQ4XF12E9lVTAhw8nlzOmkh3Rms=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gHbl0Y3buX8jPK+Ti8Z/BGnMI6GM8YTNDxc0BdK9QVdBRHWoMNhqgI6hwcylUu+Mo
	 aBXCoCCKCUYUAedlXfVvMPSQWLJ0nMMpM3j6HVaRuYKThUcL/QACupZhkarftQ+EbV
	 hD+PiJfvkfWHVHAUUx7CVytQeFN7cgc6V0E6dHDm2oIFJU74AeOgIrSvQnvOBuQESg
	 nLZg402uU3Sga4Bq4L90PcGKVpxQ9XZD7lvSCeCEQW0aWOpvm56HSnaHkZr3YVPCFZ
	 pWdWAT9zB188OAyukYFERcJER73WKIsSouoiOEiQt9B6iCoa8JlFpkiZJopJZAXBh4
	 uJ14FShcN5LFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8B07E6D458;
	Tue, 15 Feb 2022 20:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] platform/chrome: cros_ec_typec: Reorganize mux
 configuration
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <164495521075.19688.3105207399888394248.git-patchwork-notify@kernel.org>
Date: Tue, 15 Feb 2022 20:00:10 +0000
References: <20220208184721.1697194-1-pmalani@chromium.org>
In-Reply-To: <20220208184721.1697194-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, bleung@chromium.org,
 chrome-platform@lists.linux.dev, groeck@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Tue,  8 Feb 2022 18:47:16 +0000 you wrote:
> This is a short series that reorganizes when mux configuration occurs
> during Type C port updates. The first 2 patches are minor refactors
> which move some of the mux update logic to within
> cros_typec_configure_mux(). The third patch moves
> cros_typec_configure_mux() itself to be earlier in
> cros_typec_port_update().
> 
> [...]

Here is the summary with links:
  - [v2,1/4] platform/chrome: cros_ec_typec: Move mux flag checks
    https://git.kernel.org/chrome-platform/c/53a0023c6450
  - [v2,2/4] platform/chrome: cros_ec_typec: Get mux state inside configure_mux
    https://git.kernel.org/chrome-platform/c/0d8495dc0321
  - [v2,3/4] platform/chrome: cros_ec_typec: Configure muxes at start of port update
    https://git.kernel.org/chrome-platform/c/af34f115b3b7
  - [v2,4/4] platform/chrome: cros_ec_typec: Update mux flags during partner removal
    https://git.kernel.org/chrome-platform/c/b579f139e470

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


