Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147F33F7
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 19:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 849A1C341CA;
	Mon, 18 Jul 2022 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658172013;
	bh=q31es4yug37a1oj6y8ZOIwKqb46nw98BTRqL2/enzA8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X/eJgIHDH/YY8epXs2SsMRU0BcNnbO9am5EI3IngEoy2y1e3AT7MuTYw6fNK9cMbr
	 z1Goy7ClGvfcff1+0hkVWOawGuraFVPAUUMMkHTD4aGBXEhRJn63OeOzLAybqsZp9n
	 lWOTTF/5yuhduPD1TShRee7bIdgSmLKznD+ngdYCbgtydMjPhP0kQIz1QB7ViE3vbY
	 yq0L2Kqs5I3ZkwmLwFH0HHIC1cboLjGs6vTT4whIQiWeWOrvuSQ8Oidxgx5nvknED0
	 ZMdC/XFd/P7LnfeEQI2BPuFgLUj38mvaHab0hRHuAuWD/6d9Ubjwa+DhKnr/o5Gyua
	 y12Q0AV+Kyuaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67A80E451AD;
	Mon, 18 Jul 2022 19:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Rename port altmode array
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165817201341.12485.17039097052041184784.git-patchwork-notify@kernel.org>
Date: Mon, 18 Jul 2022 19:20:13 +0000
References: <20220712210318.2671292-1-pmalani@chromium.org>
In-Reply-To: <20220712210318.2671292-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org, heikki.krogerus@linux.intel.com, groeck@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Tue, 12 Jul 2022 21:03:17 +0000 you wrote:
> Rename "p_altmode" to "port_altmode" which is a less ambiguous name for
> the port_altmode struct array.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Here is the summary with links:
  - [1/2] platform/chrome: cros_ec_typec: Rename port altmode array
    https://git.kernel.org/chrome-platform/c/a47bc5a0c4c0
  - [2/2] platform/chrome: cros_ec_typec: Register port altmodes
    https://git.kernel.org/chrome-platform/c/1ff5d97f070c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


