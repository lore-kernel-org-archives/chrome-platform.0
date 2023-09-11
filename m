Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15931FB8
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 381B6C433C9;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694407740;
	bh=k/bNi/wtdyxwTWNBDji8wt1vn0oeEotNhCNoMtybfaQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YV/ZXBdXjcjmEC3+xTUZmJVdpi9v3HzazWfeMfa0JuauXfk99Ox0gNDAZFnEZx678
	 XyH5HQhZ5ClXhwqhVPgUWdPYgfnfDsQRbg7J27e24Cbql5wx4S27UhjMD5KvTS5b36
	 6mvlvWppdOXqwa44EIHaQdMp1+6MgRa9IVcheIlaMTYGN1Tpk7RxUqSzEpGYElwkMd
	 A4q3qkTp6rK+xv1vuOU216pMEwTQKbQkpJPYT7n5kXK/F6SJ0fWq+IOHecTORUm1Vg
	 +m/ZDpt38pc+H3x+O5EBJIuJCA7TqJa7zbhGBkc5X7q3ZSiy0T0iDSZPVsSvIvJbL6
	 mrVWq7r9Q2A9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F080C64459;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] iio: cros_ec: Fix the allocation size for cros_ec_command
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169440774012.22573.2546469868468555437.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:49:00 +0000
References: <20230630143719.1513906-1-yguoaz@gmail.com>
In-Reply-To: <20230630143719.1513906-1-yguoaz@gmail.com>
To: yguoaz <yguoaz@gmail.com>
Cc: tzungbi@kernel.org, jic23@kernel.org, lars@metafoo.de,
 bleung@chromium.org, groeck@google.com, dianders@chromium.org,
 mazziesaccount@gmail.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Jonathan Cameron <Jonathan.Cameron@huawei.com>:

On Fri, 30 Jun 2023 22:37:19 +0800 you wrote:
> The struct cros_ec_command contains several integer fields and a
> trailing array. An allocation size neglecting the integer fields can
> lead to buffer overrun.
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v3] iio: cros_ec: Fix the allocation size for cros_ec_command
    https://git.kernel.org/chrome-platform/c/8a4629055ef5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


