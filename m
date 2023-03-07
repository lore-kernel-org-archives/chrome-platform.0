Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D118D
	for <chrome-platform@lists.linux.dev>; Tue,  7 Mar 2023 04:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB18BC433A8;
	Tue,  7 Mar 2023 04:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678163721;
	bh=bYsBua0pjKedKGneJy6bpLB4oahYtG5886EV32NhAK0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GXpuNR1CSE5rugoBZ3uKBUPoRGftZHeHLOIjNEeFsnyHB+42+jO736N4T9cQ/IlN8
	 mqDyjjnrVZAzd5Bm1ddMVYgPrk9Uqq7TlA/0oRyUxK4ubNOV0C+AWZDfTeXENEhz5H
	 PunxZVETe9IPWm37wwZh7FGo2VORh/pYzoMsZ8k78xlMEB9YGTyQmHVIPiMnkhcujB
	 0E6pRUtRt5xabZWxuARAGrl7eBjOTWvo2ptNz4KxlhM5/5o/d0TIg/Ke+pAJnJ+cnk
	 Gm/vvJjS8JptJHudUL0YTQS+Q6bQnRpSMmw7dq5QQzFldAn8pWefaroKo3RNA5/uvO
	 dutzeHXtY675w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC8A4E61B64;
	Tue,  7 Mar 2023 04:35:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] platform/chrome: Replace fake flexible arrays with
 flexible-array member
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167816372089.12713.621043652269066823.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 04:35:20 +0000
References: <ZAZUGBmSLc5wg7AK@work>
In-Reply-To: <ZAZUGBmSLc5wg7AK@work>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 6 Mar 2023 14:59:04 -0600 you wrote:
> Zero-length arrays as fake flexible arrays are deprecated and we are
> moving towards adopting C99 flexible-array members instead.
> 
> Use the DECLARE_FLEX_ARRAY() helper macro to transform zero-length
> arrays in unions with flexible-array members.
> 
> Address the following warning found with GCC-13 and
> -fstrict-flex-arrays=3 enabled:
> drivers/iio/accel/cros_ec_accel_legacy.c:66:46: warning: array subscript <unknown> is outside array bounds of ‘struct ec_response_motion_sensor_data[0]’ [-Warray-bounds=]
> 
> [...]

Here is the summary with links:
  - [next] platform/chrome: Replace fake flexible arrays with flexible-array member
    https://git.kernel.org/chrome-platform/c/22181069e867

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


