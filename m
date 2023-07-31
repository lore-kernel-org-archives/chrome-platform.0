Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC017744
	for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 10:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C6E8C433C9;
	Mon, 31 Jul 2023 10:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690798221;
	bh=bTHJ9VChM2m57vgnBWAk42nSD+NFdt8fXYORrSzZ8gY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KGraYiNtgjbIE4YvL7OoFzuO4NBNPWqHlLHyXoT2W8qQJ/PbtTyrKlnC+nmXLWHzD
	 UOpmT5RPnjW+fCcT1lsrZBNHfF2epqi1wDDvXWHqS0OBcTYIEggwShZ6PyUggoyqB3
	 vDNXKEuQi8+/aN8N28ycni00UK0Z1sygg0W8OuPwS6wND/nWKL7qaPVk2tnEow4TZX
	 o/YyRAJ/8yNUGk0gG+0zDmg8/e2jp3H9cO67A4Gi+EbEhS/HhoarMSyfJiOfjaVKvO
	 jXnIWn0wN0jmaBQ/lVrS8qFecuRCzUIvBVRwBNjhFVnOjnd1aCQoyC0TgxDak0doQA
	 IkGqay4YDHI1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 593A4E96AD7;
	Mon, 31 Jul 2023 10:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169079822136.24246.16960757983645261559.git-patchwork-notify@kernel.org>
Date: Mon, 31 Jul 2023 10:10:21 +0000
References: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
In-Reply-To: <20230726181738.1.Ic6b8e25120b2aec95e3d0f4ac92c2a35fc7a40e8@changeid>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 dtor@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 26 Jul 2023 18:17:39 +0000 you wrote:
> Perform a filesystem sync when an EC panic is reported. The
> sync is performed twice in case some inodes or pages are
> temporarily locked. Testing showed syncing twice significantly
> improved reliability.
> 
> hw_protection_shutdown is replaced for a couple reasons. It is
> unnecessary because the EC will force reset either way.
> hw_protection_shutdown does not reliably sync filesystem
> before shutting down.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc: Sync filesystem on EC panic
    https://git.kernel.org/chrome-platform/c/0a329167220a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


