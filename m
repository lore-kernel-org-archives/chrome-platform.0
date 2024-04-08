Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07145957
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568628; cv=none; b=ETh4I0jiypHt8bbZcQRIM3aTGfWp6Hi+mTT6vUKYKiZnVAkATZOUJTIr5U/ImPh12KiFSHcZmvKxZbPLNYa0QdWqwFmMdlnJpGDxJLLu0CdyJQ2yFQFo7qicBxhAb0aAbuFifk6Cypc9Ua3Sv0YD5PcuWFQHoVMf5A4fLpWvkhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568628; c=relaxed/simple;
	bh=/l7mF/I/+k9auVy1d50Nn3rUZFyoei7woLmRpdl3fcU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UbrAavVn8+8OkVjHtilQGHz5/ht1ChwXSQQ5aMMP7uDNX5uksoyFuySqfNzCaUgVJWpVUPmJKuuXrWXhzUPXZ2u5CPiRQZfpCd6pbBKgDVc7N32bAkmYXy5xi8b0Jl2bHynmkpyDeN9TmcKlcuyIYLv/xMEomErg9Y6B5KD/l34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpY1NnHr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpY1NnHr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEA96C43394;
	Mon,  8 Apr 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712568628;
	bh=/l7mF/I/+k9auVy1d50Nn3rUZFyoei7woLmRpdl3fcU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XpY1NnHrD4HqUlCTYAp5olsTd6gMxzVz4b2u4VKrg5b+DiQSgSVulMnyCHictrOa7
	 hEcQ3luBlbCdIKukNmHrLhwWNk+m6xhND4YRoepVw62xMC6BdDYr6Huxf5FYO1wfnj
	 G8MIMRK4/nv6/M1KtHSSDA22Sq/F+O+gBbEPUXRLPOmBYk+pOO2MnSGN5gTQ7OVyKF
	 mj/Evum9mtTV1uYI7e4T+4Cqq1C+mhlI/VtACtblKj+7O7ZfnqF9YdEunyCN1hsAeW
	 4yCtVrfuN3r8FFcrFgXjALZDTSfF0EhrECVfoBf2N0I6dg8MH/ohzhYCnz02znZ92P
	 lO1HXJ8t4HeTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E68A6C54BD4;
	Mon,  8 Apr 2024 09:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171256862794.1734.3940454654342170565.git-patchwork-notify@kernel.org>
Date: Mon, 08 Apr 2024 09:30:27 +0000
References: <20240403004713.130365-1-dustin@howett.net>
In-Reply-To: <20240403004713.130365-1-dustin@howett.net>
To: Dustin Howett <dustin@howett.net>
Cc: tzungbi@kernel.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  2 Apr 2024 19:47:09 -0500 you wrote:
> This patch series adds support for the AMD models of the Framework
> Laptop (both 13" and 16").
> 
> These models of Framework Laptop have switched to an NPCX embedded
> controller, which uses the original Chrome EC linear memory-mapped I/O
> model.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc device
    https://git.kernel.org/chrome-platform/c/8ae8e4e694b1
  - [v3,2/4] platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
    https://git.kernel.org/chrome-platform/c/839720336e8c
  - [v3,3/4] platform/chrome: cros_ec_lpc: add a "quirks" system
    https://git.kernel.org/chrome-platform/c/6b0ab6de2d86
  - [v3,4/4] platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop (AMD)
    https://git.kernel.org/chrome-platform/c/3e8d1b5350e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


