Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D5101FD
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 03:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB283C433D2;
	Mon,  8 May 2023 03:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683518161;
	bh=HYMao/VV+DNw3yoZ1/SAY3oulWQRGxabBJ87rUG0m18=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OVz/0UidLKqF3SJm5FLtXH5qtEUZUTFmshQP3KT/E6Zi0fEfmwEzp/7N4+nqv1YQR
	 UHG9MyOZSF8DUkOXSlQUaKl2wdWvO9hBOhPggIZ9PJl312ckzqzhf5ai2q571RHiw+
	 fE61qFzxFI4EiGaEh38XEoKE0uL96ychqBJihINgm3sJuMAkHh0hdpfykHarHKjuJF
	 HLG3CZKMHnPdtCZDWpLU50VZvrEVYNpaVGlLgxf6EAPbzjHZKX559tgrYfGmrhpsA2
	 +6t0Yun07+s9/FblecZKEFPAik4jRlWRu8EytWHuxDZLCX8IfxeDArcBbDhLVZPhOL
	 MKXx5Yyt81HOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B14B0E26D25;
	Mon,  8 May 2023 03:56:01 +0000 (UTC)
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
 <168351816172.5651.4021809655388820945.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:56:01 +0000
References: <20230220135531.1987351-1-linus.walleij@linaro.org>
In-Reply-To: <20230220135531.1987351-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
 bleung@chromium.org, groeck@chromium.org, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


