Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5701FD2
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 03:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00B5FC3411F;
	Mon,  6 Jun 2022 03:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654486430;
	bh=Z1pePjgcN1IgrpbJsD0/+cmu5rnSefmSEhf+TUR/2f8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UDfMVyxlMJzzDE1U+gqyzxD7JwMea7qrAh7bO+GEfwZxE/nt53JQheED/OClgMR6z
	 kmbbggwsruNxMkYh/vGf6Vi3ydeHOvD+xemdZvX1AypsCXihdM0uJVLwFZiX922lw5
	 irbFiIs1VdtTjXnmeHwHvbSgCY7hWbZVp3QVOFZ6oRO9tv+a3SIZv1XTTt+qZRDbnC
	 /y5uIVa4bl1awvFwAnwalS96qa8AqTzihni5za3Y10UMTmVq4DVIOOxh5CgJNTfwWo
	 o/0F8i0MMdPEcHGqSv732AJLTO2Ijm9k/IIvRrE2HWj5HlFQVq8FaRk4RSJBg+Mbpf
	 lg2q1AQp4xpdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D88EBE737EE;
	Mon,  6 Jun 2022 03:33:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] chrome-platform changes for v5.19
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165448642988.20111.15410420940660314102.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jun 2022 03:33:49 +0000
References: <Yo7YztZklByTINZp@google.com>
In-Reply-To: <Yo7YztZklByTINZp@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, pmalani@chromium.org, bleung@chromium.org,
 linux-kernel@vger.kernel.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev

Hello:

This pull request was applied to chrome-platform/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 26 May 2022 09:33:02 +0800 you wrote:
> Linus,
> 
> Please pull chrome-platform updates for v5.19.
> 
> Thanks,
> TzungBi
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] chrome-platform changes for v5.19
    https://git.kernel.org/chrome-platform/c/f1f88bb51f1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


