Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B2184A
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 07:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E54B2C341C4;
	Tue, 14 Jun 2022 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655190612;
	bh=a+jljbykEK1/cv1zJmGA3xTVFZeB8bGpDaitAJUbIXM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XYKewKzHe7SzKLB88pbO3MTStTlEelGormP1XvSk6MCfRRyajWHqdd7n6a7SL55nW
	 HG3hl2XFprPoHCX3vZC6oGAaqCXMJSJ4GGMD5OerMQ8VXSBtYWaihjh7xiQ5s6oO24
	 sNgfZaPGCMum8AgM12J8Lv7l2FLmgyCAhA4h8HzV9r4XFSH+EQ1x6ey8gnzKmZY9xl
	 pd0k9ClVjS8VV9SQ6+dzcU4iAFWzt6vSTnCiadI4TGIgzBjxDQFJDblRyI6BuiGwnD
	 xMRgSrOTFvjmrmtafTJ0Ihp5aj4irrg9vv+NcGilM/dONaFhiyMd76N8oAhk1EDAfv
	 WuBB9vgYheuLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE93DE6D482;
	Tue, 14 Jun 2022 07:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "unknwon" ->
 "unknown"
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165519061284.15395.5656439783900073779.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 07:10:12 +0000
References: <20220614064909.47804-1-colin.i.king@gmail.com>
In-Reply-To: <20220614064909.47804-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 14 Jun 2022 07:49:09 +0100 you wrote:
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_proto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] platform/chrome: Fix spelling mistake "unknwon" -> "unknown"
    https://git.kernel.org/chrome-platform/c/203b2aff4786

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


