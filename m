Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DC4629
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 00:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97144C385A9;
	Tue, 24 May 2022 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653353412;
	bh=sIp6djcrJ2pYPQ4fWtehEfwz6Acwa99SXz25tU5Ybq0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JqB70igHpu9tVw5iItH/3qBJabFLpFmkX+okdUv5kk4zcPNsyHTuWDnmtjCZaHeIg
	 SvAfOfWQhuMlUFiJh2prc82gXvlY8KsVN0Lbzv85CiuBKrmrPXZ9PCNvnSaB+/nhoa
	 UWDexZKvzZ0oiJKgypXtMiEn4dff60u8bhM4gcLMCjmII1rSvco8U+pJuVxLtoiJb0
	 j3qgbIbE+0DzmY5zIjL6pD6+k3UESM0ECopvL2eT0OJApcwKLOBYCojvhnmep8aUlf
	 giPGLI1CaPWxPHpbjyrFAXZCDqNrBxEkzXEtaoPhrl8lCzRMB1OTZfLQ3AN5n4vpbr
	 I4qSXIu/Qd/Aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79E2EF03943;
	Tue, 24 May 2022 00:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/5] platform/chrome: cros_kbd_led_backlight: add EC PWM
 backend
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165335341249.17704.13803710194044994542.git-patchwork-notify@kernel.org>
Date: Tue, 24 May 2022 00:50:12 +0000
References: <20220523090822.3035189-1-tzungbi@kernel.org>
In-Reply-To: <20220523090822.3035189-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 mka@chromium.org, devicetree@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 23 May 2022 17:08:17 +0800 you wrote:
> The series adds EC PWM as an backend option for ChromeOS keyboard LED
> backlight.
> 
> The 1st patch reorder the headers alphabetically.
> 
> The 2nd patch separates the ACPI backend.
> 
> [...]

Here is the summary with links:
  - [v4,1/5] platform/chrome: cros_kbd_led_backlight: sort headers alphabetically
    https://git.kernel.org/chrome-platform/c/a4da30150ab4
  - [v4,2/5] platform/chrome: cros_kbd_led_backlight: separate ACPI backend
    (no matching commit)
  - [v4,3/5] dt-bindings: add google,cros-kbd-led-backlight
    (no matching commit)
  - [v4,4/5] platform/chrome: cros_kbd_led_backlight: support OF match
    (no matching commit)
  - [v4,5/5] platform/chrome: cros_kbd_led_backlight: support EC PWM backend
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


