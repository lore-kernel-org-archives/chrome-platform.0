Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A94C85
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 18:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69497C433D6;
	Tue, 13 Sep 2022 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663092615;
	bh=/jUcxsnBG6ojLgSY9IvrUoXi0rLcgT0GFy0jVz1K32E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HXRJ9nzjNR+1aUoxLMAlmMGktKd3+oQlf/ObWUjNY3WybWN3r1NVRTG2/HpuQh4Jh
	 wjGUujTTbzr1mHRPE2qLYz3hUMbOCLvGyF9xJCbyEsUJNfUcyYJ6sKTGLzoJwRWsqG
	 8QZ6EzffKIh7JKwfMh4M41L+weXC5dwsarhctNCNd8b/pyqcygDkHnn1c9q8UoR5ds
	 YEBDForzahUD9B0YyPu/dFcoLrKafsKD36H43crITBX9Mf01Iy54hCqsAt5Zj9dQAW
	 d1jx+l3y5jTR9lL6yPeUL2VhwOxGFwql1Yzgjzx8Y0en0fy+vjPnIE8g4NPYL8kFp6
	 BtI8ZJBinOOqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DCA4C73FEB;
	Tue, 13 Sep 2022 18:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Register partner PDOs
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166309261522.5740.16523628631752014962.git-patchwork-notify@kernel.org>
Date: Tue, 13 Sep 2022 18:10:15 +0000
References: <20220830202018.1884851-1-pmalani@chromium.org>
In-Reply-To: <20220830202018.1884851-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org, heikki.krogerus@linux.intel.com, groeck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Tue, 30 Aug 2022 20:20:18 +0000 you wrote:
> The ChromeOS EC exports partner source/sink cap PDOs (Power Data
> Objects) to the application processor (AP). Use this information
> to register USB PD (Power Delivery) capabilities with the
> USB Type-C Power Delivery device class.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_typec: Register partner PDOs
    https://git.kernel.org/chrome-platform/c/348a2e8c93d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


