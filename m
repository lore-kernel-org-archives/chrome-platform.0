Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969D62B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 03:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB107C4339B;
	Wed,  8 Mar 2023 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678245017;
	bh=Nid5QbZWb9mzcScw89Glj2sMNnY7FhBQ6wPaXbRgytM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GQVmVSGfrqhHXCvRu2su6qOiFWnX+EKJbH1Xfm1rIckk1gWwyu/w+MDRZfbf0YRKN
	 dAGt4BpB8cufiWUFJ+LEuJMCDLgdlzKbluiGjsbIZd2G3Zwtx0rC7r3zrWZSB3ftsG
	 wsVCppK1mvSDipNzxuuyrFjmVZ7l0gGS0+aBIkesiGXi4mPRZ5PYDHxXLogba8hNjC
	 pfuUGmMA8jw+sLY2j2J31el1RZO5ary7PNWtRWP3Gl2o+FFW263BztKC5gxfXGFG3O
	 zzoslgSeXi2d6XZhMd6Fy8IN5jZWyV4LDIQEe1yMwddvH6B2aOVKu7d5FzzheIRUnG
	 BKCy3jWVAcK0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92051C39563;
	Wed,  8 Mar 2023 03:10:17 +0000 (UTC)
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
 <167824501759.31292.12580184454376355756.git-patchwork-notify@kernel.org>
Date: Wed, 08 Mar 2023 03:10:17 +0000
References: <ZAZUGBmSLc5wg7AK@work>
In-Reply-To: <ZAZUGBmSLc5wg7AK@work>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


