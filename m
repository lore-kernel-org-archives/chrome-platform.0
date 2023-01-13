Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3DABA3F
	for <chrome-platform@lists.linux.dev>; Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5126C433D2;
	Fri, 13 Jan 2023 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673644855;
	bh=GAZxOelkcmOC7KZI0m/aRMgTASzbDzQFZVQeYJDfI1E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bQf+Aiu02ExVuXm+Eg54DQQDE9UOU0Nl5M949zd/Y8nfreHtSna9s7X+GlGU/1/LW
	 7oQ+D3xcTsiTjzyzvBvRX6kXtVeB9SzeYKsLFr9NJ5NlJ5pXmzSpbZgf36jN6Cyiof
	 dbMMCPaAUA2cgkUbHqlAyivhE12OjiBf5sHszAYkJ8MM0EiLXSegB/b+fWOiN42YbS
	 MdC1uXfUs74cf51s/C0XwrCC8OQDmynE7A0nT9FQKgpqaJvePYs4cptms8RGWSZNff
	 GcR80A5QtB1iPGhQOV9IoLR9a1PPntqR/HFxIxWYnhaZsrhDG+rQ0ArwlahK89d7AA
	 20GYqsw6LZGEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2D4BE270DC;
	Fri, 13 Jan 2023 21:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] platform/chrome: fix kernel-doc warnings
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167364485579.21086.10146696175738479548.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jan 2023 21:20:55 +0000
References: <20230111055728.708990-1-tzungbi@kernel.org>
In-Reply-To: <20230111055728.708990-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 robbarnes@google.com, evgreen@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 11 Jan 2023 13:57:24 +0800 you wrote:
> The series fixes kernel-doc warnings in various places.
> 
> All of them can be squashed into 1 fix actually.  However, I think it would
> be more clear to separate the first 2 commits as the patches introduced
> the warnings are quite new.
> 
> For the 3rd patch, I am not sure if it makes sense to have the Fixes tag.
> It is a little bit old (~2019).
> 
> [...]

Here is the summary with links:
  - [1/4] platform/chrome: fix kernel-doc warnings for panic notifier
    https://git.kernel.org/chrome-platform/c/16d73129f1fd
  - [2/4] platform/chrome: fix kernel-doc warning for suspend_timeout_ms
    https://git.kernel.org/chrome-platform/c/20eb556dac27
  - [3/4] platform/chrome: fix kernel-doc warning for last_resume_result
    https://git.kernel.org/chrome-platform/c/212c9b9c395f
  - [4/4] platform/chrome: fix kernel-doc warnings for cros_ec_command
    https://git.kernel.org/chrome-platform/c/5fa1dd818fb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


