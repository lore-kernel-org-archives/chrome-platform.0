Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932EA15C1
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33F13C433CA;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694406700;
	bh=SIw+eSue1UFQn2baY3FEXr3ZjMwGMuRitqiE1h/CVaA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YpVSARz5QIelhij6aEq5scnc7jfGoaP7WDmjVISeBUbXXkQkQFFUWLwbqhmWiHAJH
	 n6HdbeQwk7BXLDwrFDwwjBncAFqZK9v9hxBmzRwY+r5OMlQREOTL6h8GCiDARITMEY
	 f94caQ2KGFV8qNsWkOQErc1dhETbB9+eDylGkT8+ihwub03elH904ko+TFzM0whqfR
	 NEvzwM4w/W77Tm+qVZbTNxHitdEhdQjXdwA+lEkQw9Cbd7a/VU0mrIKfgJ87Z+uqC0
	 iskML5clmVLaHG7J4zpT5yckb3gtuLTtf7drAD8hY1gNEK0mxNMj5OzBYKL1mrOwfu
	 ebfGyYxieqJpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A4CDE21EC0;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: usb: connector: disallow additional
 properties
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169440670010.22573.6344198116849570684.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:31:40 +0000
References: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, bleung@chromium.org, groeck@chromium.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 gregkh@linuxfoundation.org, pmalani@chromium.org, waynec@nvidia.com,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Rob Herring <robh@kernel.org>:

On Tue, 25 Jul 2023 12:23:25 +0200 you wrote:
> USB connector bindings is complete, thus no additional properties should
> be allowed.  Add missing 'reg' property and change additionalProperties
> to false, so the schema will check for anything not unexpected.  This
> also allows to drop the 'reg' from other bindings referencing the
> usb-connector.yaml and make it required.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: usb: connector: disallow additional properties
    https://git.kernel.org/chrome-platform/c/e251a4e28a27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


