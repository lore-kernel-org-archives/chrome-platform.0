Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDE125B2
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7OVw9P5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54E5BC3277C;
	Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696501227;
	bh=kzX+zY2VzB+AZmk23/TIsrqmXwxezcYNsQz/OOH7dis=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S7OVw9P5hE91AAXEPh9+tsTLOAWv4kbdG+uPiIa7mmmS8LOaWq6vkYwKVMvw5teor
	 xJ2WMhsSkT+GIueBMJhdoZYO7dH984GWtYOYgrIlZGwQfKJ0c82nRqz32Tp37qfjIO
	 OEOxJCUmIPAAe8BVf/91z6Rb02hEs8bqDLz1yl7eRO8q5/tMBYDleKCBnEDAHn9Owu
	 sieoTnpSOjZbXH+x0Nq7xbWpY/6CLV8dc2mEocD0g9smqneTmElk/oWdd2kexMelek
	 JkdE20vOy7HmItXnZw2ih8M/fRR/K1RQh1MDn8UBNyBWHQ5sGATCxUjsuXu8yWdXXZ
	 NS8VI/u2kikTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A95FE632D8;
	Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec: fix compilation warning
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169650122723.4916.16659168499462438299.git-patchwork-notify@kernel.org>
Date: Thu, 05 Oct 2023 10:20:27 +0000
References: <20231003080453.4011301-1-tzungbi@kernel.org>
In-Reply-To: <20231003080453.4011301-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  3 Oct 2023 08:04:53 +0000 you wrote:
> When including cros_ec.h solely, the compiler emits the following
> warning:
> > 'struct cros_ec_device' declared inside parameter list
>   will not be visible outside of this definition or declaration
> 
> Fix it by forward declaration.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec: fix compilation warning
    https://git.kernel.org/chrome-platform/c/a7bad167bdc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


