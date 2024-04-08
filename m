Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0CD45957
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568628; cv=none; b=F+d2O22JibThDz2WsnVRSyZF4qhhy6PYX/AmUiW73mt2wT9nDVWl0VXpAyyfPXw4+cx9sEa0pNz516QAmdqQXLDbiji9jCM3xExG9g3nLNwB6pPGmV/kwAT8L65wGzwYbkuEgF1B7a8fBNPjFbdnUU8MOhANbmTbOHqJgYvnX8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568628; c=relaxed/simple;
	bh=e7jUax7PNUaTO+GrU9UjRBPfYHehRDREuQAemE+sfgU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jJ2CXSU6hmsdCyQrHAxGIKbyY6rfCEEcPU3MpMt4IsYUDH1F3puWrWVZTO7g/IeCPq+NsAj2GS2mSWQD/J/KZzfmDGhjQLJFRR365IPFcFZIw3oPgNRilbOwn+8EFI8eihr1Qz0ibjDtJnwV7Bq+AhQ12Xm/r+0/fKaIxT7QO2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPG6NAiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPG6NAiA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 701D8C433F1;
	Mon,  8 Apr 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712568627;
	bh=e7jUax7PNUaTO+GrU9UjRBPfYHehRDREuQAemE+sfgU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dPG6NAiAt6hfspxnENR0SzN15OVkIBn2Lh2iPjSVnhDZe1jNwUFDmo1Pixhhi+3lX
	 3X/slnGAiOM8ArIQCG/AcYZlCFyFfY446sv1xvh+URDnfN7TxE3XCq78V361EwwXQk
	 fSCMwBgbukA4lwnVHzIdE+n0CPeFbr9VI3J2RyYiU+vt0vss+7LXu+64TltdiGZWGY
	 zJryn7mrB1qmQNxOyLzxy0IIOFppd+47atoJns8bcHlxnCc6aJfbX2vttzkYo2TH8+
	 ZTMwQvMHNrvA+D/ypI33hEAuzn30eHwYTx/cf7xdHiyFllU0G40b/fylpEzzY/1t+I
	 B2G4eJj5TOknw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67CF9C54BD4;
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
 <171256862742.1734.16237012013316450474.git-patchwork-notify@kernel.org>
Date: Mon, 08 Apr 2024 09:30:27 +0000
References: <20240403004713.130365-1-dustin@howett.net>
In-Reply-To: <20240403004713.130365-1-dustin@howett.net>
To: Dustin Howett <dustin@howett.net>
Cc: tzungbi@kernel.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
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


