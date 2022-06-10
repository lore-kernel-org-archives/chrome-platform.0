Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5677C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 02:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 099C1C34115;
	Fri, 10 Jun 2022 02:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654828214;
	bh=nVXqSXIUE6uohftT2RTBT4jAMak0WZLr0uQgewGCTxc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sjq/11OsPT4Uy28zUYUvwpdLhzQ82voU/A9ddhwRN2u5Jehi1Gm57+SsFFCYjPslF
	 iqu3n7q7B2hMZG5LtUVDRohRxO2T5+Ri7jBXnn31iVJSNxpPD7A2p3DrPVdZbUHIyE
	 4eRR9Y2AveYSd4aLhcf0T0B6mrHrloLajr+pZc8nnq/6/xEqPMm1Wgy6XlZGbg2RCz
	 HeDoJhQDskA62UwGXqOly0mj/CGIusDc0GciJ65uutnqcmJB9yBic8lRrq8mtYmorC
	 eKNK9NfHgPCyO7eg0iRu5roCdwgoJXSilfBrnaexosfOIzVSUA7YKAploZrGdtJr56
	 pxVNANzSJGUFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E20DEE737ED;
	Fri, 10 Jun 2022 02:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] platform/chrome: cros_ec_command() improvements
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165482821391.24385.187534597293564020.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jun 2022 02:30:13 +0000
References: <20220606201825.763788-1-pmalani@chromium.org>
In-Reply-To: <20220606201825.763788-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, bleung@chromium.org,
 briannorris@chromium.org, chrome-platform@lists.linux.dev,
 enric.balletbo@collabora.com, groeck@chromium.org, lee.jones@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, tzungbi@kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon,  6 Jun 2022 20:17:59 +0000 you wrote:
> This is a short series related to cros_ec_command(). The first patch
> updates a couple of Cros EC regulator callsites to use the common
> cros_ec_command(). The next couple of patches do a rename and argument
> type update.
> 
> Prashant Malani (3):
>   regulator: cros-ec: Use common cros_ec_command()
>   platform/chrome: cros_ec_proto: Rename cros_ec_command function
>   platform/chrome: cros_ec_proto: Update size arg types
> 
> [...]

Here is the summary with links:
  - [1/3] regulator: cros-ec: Use common cros_ec_command()
    https://git.kernel.org/chrome-platform/c/015cd0043503
  - [2/3] platform/chrome: cros_ec_proto: Rename cros_ec_command function
    https://git.kernel.org/chrome-platform/c/b1d288d9c3c5
  - [3/3] platform/chrome: cros_ec_proto: Update size arg types
    https://git.kernel.org/chrome-platform/c/f87e15fbf6d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


