Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F71FD9
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 03:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18083C341C0;
	Mon,  6 Jun 2022 03:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654486430;
	bh=TI4P18/3vyoUu1YoM1I93ZEGQv/UWUtMjgpV3is+1kU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tFJZusU1hxG2s1CJAu/uiv0E+bAvVegQhojDIoAHyJhGf2CpfQHdYfd63OYaXP0/3
	 tl9nzWxkaafABij8lqsZ5MrgoRiCJkmKhT6mUps3kQJJUcarzBWjvqhX+nnzU7KuuH
	 M1sITb9nLev16/CnmDOBLDR9sft1NqYa56mDK6TYh+XhuSxzBGaz00U17pkjsv1ykO
	 1xbqro3byn4WFq2ZXjDSp5Mx6gkf+iadKrRgaEInhfU6CUJOoXak/Exda99R6yHsRc
	 ZpeQ/WkQ7MtuWXRB2kZKovQ5cRR+ulL6ulkGtXTJWKxLQIUAMOP2Du9HlLMaTPj68u
	 6fltf6QTe+EWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9551E737F0;
	Mon,  6 Jun 2022 03:33:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165448642995.20111.10251737230487275413.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jun 2022 03:33:49 +0000
References: <20220519211411.2200720-1-robh@kernel.org>
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 dmitry.torokhov@gmail.com, bleung@chromium.org, groeck@chromium.org,
 mchehab@kernel.org, peda@axentia.se, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, kvalo@kernel.org, bhelgaas@google.com, sre@kernel.org,
 mpm@selenic.com, herbert@gondor.apana.org.au, gregkh@linuxfoundation.org,
 broonie@kernel.org, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Rob Herring <robh@kernel.org>:

On Thu, 19 May 2022 16:14:11 -0500 you wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
> 
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
> 
> [...]

Here is the summary with links:
  - dt-bindings: Fix properties without any type
    https://git.kernel.org/chrome-platform/c/4e71ed985389

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


