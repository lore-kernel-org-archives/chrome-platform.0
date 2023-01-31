Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAEEA922
	for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 18:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44FFAC4339C;
	Tue, 31 Jan 2023 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675189217;
	bh=/mXKCWIInMRQ1GcS3OYrRwL02rstqhASq/OgmzmHLEg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lXenDjx7KLIpQa64VqxKkakH5KJVRW+XcAg2iIXyoEwZvfFRYwzvNNApWBykRQK1a
	 GnLzeDS748BghVsa0k1FEUirhAbCbk3rlBxOplvPf1JDQhoCYi/MyfqVsXRHhcatNT
	 ibXRf/yiflVlMZMXYVG89VCuDXONiZA+kGmNKkW6z+Brp458ug+6h8qMEsZeX0mM0M
	 M0FOzVa9dM/uP+zl0hhgiMxirFancV+jX/0tj06IgWbC8nz9KRTmxluz3hLM2F61L6
	 Zr/VyxEQu7AAlcMrzZRo4/lGdpe083LkYEMp93whqAwa/CXyLkB220KQ1tGnhhWnvh
	 jk4UcGh7Otdbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24B6FE4D00A;
	Tue, 31 Jan 2023 18:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec: Add VDM attention headers
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167518921713.25730.1790476637549771457.git-patchwork-notify@kernel.org>
Date: Tue, 31 Jan 2023 18:20:17 +0000
References: <20230126205620.3714994-1-pmalani@chromium.org>
In-Reply-To: <20230126205620.3714994-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 bleung@chromium.org, heikki.krogerus@linux.intel.com, dnojiri@chromium.org,
 dustin@howett.net, gregkh@linuxfoundation.org, groeck@chromium.org,
 gustavoars@kernel.org, lee@kernel.org, tinghan.shen@mediatek.com,
 tzungbi@kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Prashant Malani <pmalani@chromium.org>:

On Thu, 26 Jan 2023 20:55:45 +0000 you wrote:
> Incorporate updates to the EC headers to support the retrieval of VDM
> Attention messages from port partners. These headers are already present
> in the ChromeOS EC codebase. [1]
> 
> [1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> [...]

Here is the summary with links:
  - [1/2] platform/chrome: cros_ec: Add VDM attention headers
    https://git.kernel.org/chrome-platform/c/4b1936cd0814
  - [2/2] platform/chrome: cros_typec_vdm: Add Attention support
    https://git.kernel.org/chrome-platform/c/f54c013e7eef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


