Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509C15B98B
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 05:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716960032; cv=none; b=qtzGmuPI4f/wGMXtkgD32bjCYt0Su68JotFkjRWOQaAHCkhOWXxqhZw3+t0bm3kyLB1KSrMG9myb1oLgsqJgKcW3vB0AW6rFZDxPsGDji/7QM9o4+HDgCgjMA1BVTRP3bEr/Lihu9eDZaN7mAX6CIXY6+wEpVzSrLueSUaVjoUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716960032; c=relaxed/simple;
	bh=fG7A03NfMqCtlPZ6wuBqFuFOLnEdeVuX1hUvRLsj6Ow=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eV4c1mffxXdVG0ztAhPdQOllWQcEE5Yt1ozgixbtGiSXeVQPqAaBfrZ+ojiwblpZnmOTKysoEHFuA9brD47AJFBi+nb3kTh3j58KnYe9xoTr/8hvdTKeQOT5vh0zgG3vj/9Q5BcJL6RQAHscvBYetunFDiiYXEZpWoi2yF8o1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQBHhJC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQBHhJC6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08E56C4AF11;
	Wed, 29 May 2024 05:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716960032;
	bh=fG7A03NfMqCtlPZ6wuBqFuFOLnEdeVuX1hUvRLsj6Ow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uQBHhJC6Fk6s80l5i8WQg88k1bP2tR/ZdZ8JLrLFLNNB7nuRz/JWKaz+vvxmxs/yK
	 P1dP9rEzH81I9CWDEf0WRyzrgDbUVQZfA4k5n8RqUf858YqJZEp+XvK+xa//IOlm0U
	 9Q4JRb7FKkde4WWgcJGNHMs/rPEGVQS2ckrbdrOVrHRavfdaCuvwe5j0Nzhgsh6ykk
	 6gj68OgWOuxWlnD0NB/rxbqHsdlqDcdola8aBsfbKpnTgt19v8Hijkm/SVLdTD7osj
	 JW1+xV1fMufaSyhxXdd4cHfLAcNnwltyuTetjt2HkkYlaYoesYVnDliw6WAbwH0OZG
	 nah9p8MIgp95w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2077CF21FC;
	Wed, 29 May 2024 05:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drivers/cros_ec: Make log polling period a parameter
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171696003198.24832.8283842621558461875.git-patchwork-notify@kernel.org>
Date: Wed, 29 May 2024 05:20:31 +0000
References: <20240507155809.525701-1-robbarnes@google.com>
In-Reply-To: <20240507155809.525701-1-robbarnes@google.com>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, tzungbi@kernel.org, gwendal@chromium.org,
 groweck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  7 May 2024 15:58:09 +0000 you wrote:
> Make EC log polling period a module parameter. This allows the polling
> period to be set via the kernel command line. Keeping the default at
> the current 10 second period. The optimal polling period will differ by
> board.
> 
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> 
> [...]

Here is the summary with links:
  - drivers/cros_ec: Make log polling period a parameter
    https://git.kernel.org/chrome-platform/c/7b44d5381e54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


