Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D123C6
	for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 05:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED2A5C433C9;
	Mon, 10 Jul 2023 05:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688967590;
	bh=2uuv3SAKxaN3cTrhREKEPhCvyNumlhGiykmKg6Z5YeQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qt/IuAS8XIQOvwtV0patii4VqC8G0JhCzu5QTNQ1mtmsYR6sMn0Uy3i0U+1WQLCJD
	 ntYJOpQfIEP3AwTAq5ySFBqDLzv8oDb+PQhanKvtPuuasw7PxFLU8IFRY3JFJGECwf
	 ZShCR8oVsUdfF5yMagAxqNAfchE1c9nixjwe+mujzEzRg64m9ETLuyxpXN0fKemHKz
	 F/r8QwnIYnZbKCO9Waw4lwAehrOP0LZI9y5oUcKzsxO6zAt4a1H1URFwUAa/evRbjv
	 nDh4SR0Z0RjrKWqLfAYHHXIynqu5ZQZasMZNUFtg2Yf7nTO0lxA/E5iz96hpm18Dp+
	 HfwtOAE+Luc2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE7F8C0C40E;
	Mon, 10 Jul 2023 05:39:49 +0000 (UTC)
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
 <168896758984.3413.103690253008672819.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jul 2023 05:39:49 +0000
References: <20230526131434.46920-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230526131434.46920-1-heikki.krogerus@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org, andersson@kernel.org,
 chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
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


