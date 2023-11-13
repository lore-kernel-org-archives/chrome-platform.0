Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E948825
	for <chrome-platform@lists.linux.dev>; Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S78uDK8P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6862C433C8;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=VqlI6V6UDK+1aiZJekC3tQSbjeSQ5VfV9+YK49rsbMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S78uDK8PEcxXmhNF1+IUs9x1JiUfLWlrPNwnJRDmw+XcarralUkk+sM0dAR6rtIkj
	 0CAPuMEud1aJqD2yXHZwZ3H9LzuhgLhx+40OLjFq1urEZjmqIO3m2LY+fOdeHzdiSX
	 3w41e+hdNTQrPNlqQnn45EM1iMnziUCV6Nj0pAcewXZRq4qzxyBw2qniR3bZ4+25TP
	 qdqNwvIU5gJnHesP28nME5HO7Zj8rV7CaQZWB/8PeSlqvpfLBWDBGaF4OIzB+9VvTc
	 1JAbQEiovVkeKph9BI8XkAgUi+FVDLf7RbiP9uXyE9XMHFlJ0VwckVYYkQSl4Ke1B8
	 FN02IYTYDCzgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9F6EE21ECC;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix typos
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984583482.27851.14687037747834659717.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:54 +0000
References: <20231110165239.1559109-1-visitorckw@gmail.com>
In-Reply-To: <20231110165239.1559109-1-visitorckw@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: bleung@chromium.org, tzungbi@kernel.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Sat, 11 Nov 2023 00:52:39 +0800 you wrote:
> Replace 'preceeds' with 'precedes' in the comment.
> Replace 'porod' with 'period' in the comment.
> Replace 'noone' with 'no one' in the comment.
> Replace 'lantency' with 'latency' in the comment.
> Replace 'kifo' with 'kfifo' in the comment.
> Replace 'change' with 'chance' in the comment.
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: sensorhub: Fix typos
    https://git.kernel.org/chrome-platform/c/49e380795414

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


