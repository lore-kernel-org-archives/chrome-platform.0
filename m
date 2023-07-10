Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E223CC
	for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BD98C433C7;
	Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688968399;
	bh=8Rtzr2bgCsFLaSEyFR5Arhv8ANrKH57SdGC6I+92IvI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ovQhpQl9nT6kh9ewUFsyFQzJj5YANTT3AgZIRdpAOwBy0/IS1wMM+IszJtknylT3H
	 n+Tc923a2XlbiljT06GCK7+8K72L9EeeUuN/9kaCqAo5fhfPMdVb2sz5hr4ui1cpyL
	 eyECfz0odx9e6SlNHukexXZ1Nlw3U8Vfoa0rjuni8LOqrGHJWq5hNNhY60FRbHl+qI
	 WClyzVt0C9uDms60XeAnVJdkc/se2dzkOcF619E8htek9v1Tzl7Q1RYwstx3GPRY1o
	 X1/hYC/XKABk4PMDWqY9WFFVGJWrUfrqy7ORROhhIl+mib9Z3HL4bzmvfyJ9tl9y7l
	 CSOGl2+lwzUTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09D21C395F8;
	Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] usb: typec: mux: Remove the "svid" device property
 checks
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168896839903.3413.16844292204313046489.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jul 2023 05:53:19 +0000
References: <20230526131434.46920-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230526131434.46920-1-heikki.krogerus@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org, andersson@kernel.org,
 chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Fri, 26 May 2023 16:14:32 +0300 you wrote:
> Hi,
> 
> The comment in the first patch is now fixed as requested by Bjorn. No
> other changes compared to v1.
> 
> Original message:
> 
> [...]

Here is the summary with links:
  - [v2,1/2] usb: typec: mux: Clean up mux_fwnode_match()
    https://git.kernel.org/chrome-platform/c/4aebc4f89f00
  - [v2,2/2] usb: typec: mux: Remove alt mode parameters from the API
    https://git.kernel.org/chrome-platform/c/3524fe31538c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


