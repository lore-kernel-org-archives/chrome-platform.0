Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D428E2
	for <chrome-platform@lists.linux.dev>; Tue, 23 Aug 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73DF1C433D7;
	Tue, 23 Aug 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661289616;
	bh=0IEc3dJSCMwcJNTuPCY1LvpVZl6Rhk1s3mH6EWq+tvU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KYmR+ZVi/eIs1SzyCHqtP0DfoyR0fK9xJwingAB0zwOQ2kl6kkgPiVhKiBke/rlw1
	 HFlaLm+3DdLhcyc+wMVGQav4dAsa5XdNaSYHhnifQn1SSICuZJnD0hDEEDpQ0p3PSq
	 FfpQnHmeo5OIMZH9nwCI2VXiV/CzbR3KxNlydC9CWsQy/QAfb9qDgsPgDB9q2Hp6nB
	 mBt/t+ks4ojhMAkwsYq8cFiLEpWwICSFed5GG1urdyvTZToYUZBvxxhWOY8YwKf+u8
	 oDPL3h9RVWUZtuH54IvNKrWQxo091AIG38Vn4RriKDcyk8cmdesqB0QdgkJb++TCyd
	 y0QSM3XXHY5NQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C464E1CF31;
	Tue, 23 Aug 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/7] platform/chrome: Type-C switch driver
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166128961630.1235.10498223435613947270.git-patchwork-notify@kernel.org>
Date: Tue, 23 Aug 2022 21:20:16 +0000
References: <20220816214857.2088914-1-pmalani@chromium.org>
In-Reply-To: <20220816214857.2088914-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org, dnojiri@chromium.org, dustin@howett.net,
 gregkh@linuxfoundation.org, groeck@chromium.org, gustavoars@kernel.org,
 keescook@chromium.org, tinghan.shen@mediatek.com, tzungbi@kernel.org,
 wangxiang@cdjrlc.com

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Tue, 16 Aug 2022 21:48:28 +0000 you wrote:
> v4 of this series was originally merged to the USB maintainer tree, but
> there were dependencies from the chrome-platform tree which caused
> conflicts in the merge tree, so the chrome specific parts were
> reverted [1].
> 
> v5 is a resubmission of the series with the Chrome-only parts (since the
> USB framework parts were merged successfully).
> 
> [...]

Here is the summary with links:
  - [v6,1/7] platform/chrome: Add Type-C mux set command definitions
    https://git.kernel.org/chrome-platform/c/77947238dad3
  - [v6,2/7] platform/chrome: cros_typec_switch: Add switch driver
    https://git.kernel.org/chrome-platform/c/affc804c44c8
  - [v6,3/7] platform/chrome: cros_typec_switch: Set EC retimer
    https://git.kernel.org/chrome-platform/c/d4536a216c3f
  - [v6,4/7] platform/chrome: cros_typec_switch: Add event check
    https://git.kernel.org/chrome-platform/c/cf6c767244ed
  - [v6,5/7] platform/chrome: cros_typec_switch: Register mode switches
    https://git.kernel.org/chrome-platform/c/9e6e05169980
  - [v6,6/7] platform/chrome: cros_ec_typec: Cleanup switch handle return paths
    https://git.kernel.org/chrome-platform/c/d5f66527db9e
  - [v6,7/7] platform/chrome: cros_ec_typec: Get retimer handle
    https://git.kernel.org/chrome-platform/c/1a8912caba02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


