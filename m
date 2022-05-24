Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697A62A
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 00:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D17DC36AE3;
	Tue, 24 May 2022 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653353412;
	bh=q+4XuDYRYjXM+ddv/G67liUYwdhEEPIpIxaOB/s9ggg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l1ilgWcjBpcPDzJBL0Se68C4bjdAlcZQD0fpABTAETSMvq2WjG31BxwuxG0XkeRZF
	 5D2jgHQ8NKt3CTMwShRF4nnCgQ8duB6QZp45P2PMm0nbsdjN0eO7/0rmWrGeDbWJsj
	 InLn5drVWOXIU8/m7AzAS60bifI48wwJIu+lrI/BS/K0zTSlQMLr+u4f28zZfFLsTN
	 M6ANUNzrgSPMOe4B0BsCja7Wi22VoOjO0u1iqtNvVJlfcEDlB8//t+nXSgbvzEzvJN
	 myhZw0DQgdOpnaYUmKQygXSUgPupHhQ7gRM+1JVCDCCAG0dWpOM6M1sDYQP+aYnWXp
	 mygBJkvv/5duA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81FACF03938;
	Tue, 24 May 2022 00:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] platform/chrome: cros_ec_proto: add initial Kunit tests
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165335341252.17704.18068101076229868652.git-patchwork-notify@kernel.org>
Date: Tue, 24 May 2022 00:50:12 +0000
References: <20220518091814.2028579-1-tzungbi@kernel.org>
In-Reply-To: <20220518091814.2028579-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, dianders@chromium.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 18 May 2022 17:18:10 +0800 you wrote:
> The series adds some early Kunit tests for ChromeOS EC protocol.
> 
> The 2nd patch is a refactor.
> 
> The 3rd patch updates code comment.
> 
> The 1st and 4th patches add Kunit tests.
> 
> [...]

Here is the summary with links:
  - [1/4] platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_prepare_tx()
    https://git.kernel.org/chrome-platform/c/c185ba01c945
  - [2/4] platform/chrome: cros_ec_proto: factor legacy out from cros_ec_prepare_tx()
    https://git.kernel.org/chrome-platform/c/103c883f4ace
  - [3/4] platform/chrome: cros_ec_proto: update cros_ec_check_result() comment
    https://git.kernel.org/chrome-platform/c/3cd0cacd4b64
  - [4/4] platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_check_result()
    https://git.kernel.org/chrome-platform/c/3c470e42dd47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


