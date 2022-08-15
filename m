Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555C10F5
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4DC2C43470;
	Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660535728;
	bh=Vx25ahkT7ReKmBbFzek0zpHkCrN+s7kbUGG8w9rRCiY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kEq77R36zbKSA2qL6r186mf8eU0oanZrICw6YYbO3rN5umL2VCmTI2PCNyNTVbiuH
	 AyyGvhB41jqCI20lL0C8EGBuHY0MVzbgT+0PHSWhZCSo6JpwNnsSMK4+obQg4CPtJs
	 36WSSe7GiXadaEuTfZCc8c5k4VY9F+zJdd3U0ad+TfuCHe8DxQOfHbkbWf2Msm9600
	 6HFqvYmG2HfT0GlCcKMs6Jut9TxyupCFpyhytPOViOUmddgYDHDAhDkEykEBIFjMw4
	 shwKeddiMrPJC6bqd5+SzjfNYJGrUIspUAVrTt7I8jRhltc77tRPGxXafvYU7I3UYM
	 Vpo5edvJrVngw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98C8FE2A04D;
	Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] chrome-platform changes for v5.20
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166053572862.30867.2875149894587725461.git-patchwork-notify@kernel.org>
Date: Mon, 15 Aug 2022 03:55:28 +0000
References: <Yun1yFEsqpF59Tdy@google.com>
In-Reply-To: <Yun1yFEsqpF59Tdy@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org,
 groeck@chromium.org, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev

Hello:

This pull request was applied to chrome-platform/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 3 Aug 2022 04:12:56 +0000 you wrote:
> Linus,
> 
> Please pull chrome-platform updates for v5.20.
> 
> Thanks,
> TzungBi
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] chrome-platform changes for v5.20
    https://git.kernel.org/chrome-platform/c/5bb3bf24b0aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


