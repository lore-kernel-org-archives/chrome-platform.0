Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821B174D0
	for <chrome-platform@lists.linux.dev>; Thu, 11 May 2023 21:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A78F7C433A4;
	Thu, 11 May 2023 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683840021;
	bh=+kWr5awvblWfg9fmIl9fQAxXnQ755fWIGoy115uhLvc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JNdXmZrzlobvY3A0SSrtgq9+5kWRIwCVKW5FRAIIEk1X8H6GQB6dgmNIexiHNu+67
	 +d3xF0EwwSNYpcbykcxiHQ1IqMvdQj14gTOj14cObYfTHK56DXYokS1NYGsTUPna2s
	 fEc/IWHnkpPW11bQxGbcokQLoB8ri4RZILSRkDabuZEr71j6xzwIqWyqmX05hDKUR0
	 My25Q9BNyvtQQ3YWv862j9IFZp9XTJeBBlueNS/Vz+CUc+piHU2/xdB6KTyzPotpr9
	 kanO97Tum4gc+YiweG2USe8kaE7btxnDjzTiKVoyKfS+LJaQCWB2Up18U33w+NDu1Q
	 k2nVCw0KnLREA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95F36E49F61;
	Thu, 11 May 2023 21:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_typec_switch: Add Pin D support
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168384002161.32472.7878216768221766007.git-patchwork-notify@kernel.org>
Date: Thu, 11 May 2023 21:20:21 +0000
References: <20230508183428.1893357-1-pmalani@chromium.org>
In-Reply-To: <20230508183428.1893357-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org, heikki.krogerus@linux.intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Mon,  8 May 2023 18:34:27 +0000 you wrote:
> The ChromeOS EC's mux interface allows us to specify whether the port
> should be configured for Pin Assignment D in DisplayPort alternate mode
> (i.e 2 lanes USB + 2 lanes DP). Update the function that determines mux
> state to account for Pin Assignment D and return the appropriate mux
> setting.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_typec_switch: Add Pin D support
    https://git.kernel.org/chrome-platform/c/c9f9c6c875d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


