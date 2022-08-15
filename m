Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79610F3
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BE0BC43470;
	Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660535094;
	bh=r/x3vZ3Q7kN3eSNpeyQVl4c+2bbKKii9y8fY1wImfUw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NlcekeVBt29OCuEshgw/AxbBWR9b9HScfll6DfK5hJy/grj/8I3HxSmqHofn6CnAN
	 fyq7NiFRGy70YZP63Kgsyja7MWfw0Ss919lK1+xSMPynL/cGKoKueKlOvXIArg2QpV
	 EamRsQdCJv/X4WaDrckNheQYLkT0YT1BBkM+xaMvCNrcQuqRHXFfkyNTtimgyaqv0O
	 HKaToMml4hjt1ncS/vFyYPB65bwj6kifSw9h39KFQM4NyOrGnjWSTwxn7pUVvXSWZ9
	 S3un7RflPH+SxcczLl9nM/IlyNk61YWQLrZPdlIXQSqbrrb8+kq+wcAM0yU0vCr0rQ
	 g1QoeO2K1rQHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5FB77E2A04C;
	Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
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
 <166053509438.30867.8572544538142335376.git-patchwork-notify@kernel.org>
Date: Mon, 15 Aug 2022 03:44:54 +0000
References: <Yun1yFEsqpF59Tdy@google.com>
In-Reply-To: <Yun1yFEsqpF59Tdy@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org,
 groeck@chromium.org, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev

Hello:

This pull request was applied to chrome-platform/linux.git (for-kernelci)
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


