Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED1113AC4
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 03:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A211C4339C;
	Mon,  8 May 2023 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683517514;
	bh=f2Av221AoBzvVpsH70Hd2B/gNLrcWY+8qXBN329HBxg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nEMBgVLhaQ/GoILqUrKV2WfNuBDu5mLPOOj9sViK68lLfyn6E0fZntmkvnEMNczw5
	 EbF5rNVhHN+XhMIfqzf1UNOJAvGLFf1PZVgzcgIPbPUE+EwIJWNZrxKVVu1yFZrOhf
	 s8S+L6xb14/7tsLMxJDA7y8wc3jJ9+7cIDk3pHrL6rtse3xqHds20s1LvdzMi69CX3
	 sD1NUw/iq+udiMYY3F7egaakUU8HvudVxijwt2VMDUN+uQboAs0MBTyeA+XTCUEqzf
	 NoXJ9Hu6Gkj4k8e+xl8irP1QcmcNT3m3V1HVwOj2I/NLdVEEvvhzuSZLo4r3peUdU6
	 9jGWM/RANoSkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B4C7C395C8;
	Mon,  8 May 2023 03:45:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: google,cros-ec-keyb: Fix spelling error
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168351751430.5651.15940266526657898557.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:45:14 +0000
References: <20230220135531.1987351-1-linus.walleij@linaro.org>
In-Reply-To: <20230220135531.1987351-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
 bleung@chromium.org, groeck@chromium.org, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Dmitry Torokhov <dmitry.torokhov@gmail.com>:

On Mon, 20 Feb 2023 14:55:31 +0100 you wrote:
> The dependency had an obvious spelling error. Fix it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - dt-bindings: google,cros-ec-keyb: Fix spelling error
    https://git.kernel.org/chrome-platform/c/c6f3b684c2c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


