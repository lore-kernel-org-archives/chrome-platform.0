Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C12F4A
	for <chrome-platform@lists.linux.dev>; Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51705C34110;
	Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649091720;
	bh=04frVOBorwVRLC9iR0TJrmOXUmgPLE7sifjv285UBqY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u4wKiB3cMuSr8X85DCWSAFYjooVhda9cApTtmkp7tZRxtQTB+pgUau+XD8HAdu9co
	 oxThbzXsle2iXHmd+iemZT0F0XHev26IPwYM4iI1hbroEUz17L+D8nm6vD0/CoCNIY
	 J/21dCexLvUqK0WwftAOMKgJpGSwNk7nglnDRs06SRyKGXGlM3OTFjNFbnDAlA2Q/g
	 WxrStf87q5tvCOcufEqKt9tTU4ATyPF2w4MTGfNeZBT5Ju1Na5o1C+nSOI4ojUtpe9
	 Z1fpj/klB5G7TabOuiLNZF9qS0Hw4zFloxHqr5WmL1IjlaRcg2esfmHuVUGF94Rzuq
	 tCqb83VI/qWcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2AAA7E85B8C;
	Mon,  4 Apr 2022 17:02:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] mfd/pwm: dt-bindings: google,cros-ec: include generic pwm
 schema
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <164909172016.14329.4245687704208123308.git-patchwork-notify@kernel.org>
Date: Mon, 04 Apr 2022 17:02:00 +0000
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, bleung@chromium.org,
 groeck@chromium.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, heiko@sntech.de, dianders@chromium.org,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Heiko Stuebner <heiko@sntech.de>:

On Mon, 14 Feb 2022 09:19:12 +0100 you wrote:
> Hi,
> 
> DTS patches are independent. Not tested, but I really hope no downstream kernel
> depends on pwm node naming... If it does, please change it to compatible. :)
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [1/4] dt-bindings: pwm: google,cros-ec: include generic pwm schema
    https://git.kernel.org/chrome-platform/c/6b94ee669e8a
  - [2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
    (no matching commit)
  - [3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
    https://git.kernel.org/chrome-platform/c/1e49defb8636
  - [4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
    https://git.kernel.org/chrome-platform/c/a0024f55eb5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


