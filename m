Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DB1101CC
	for <chrome-platform@lists.linux.dev>; Tue, 14 Nov 2023 06:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pt6hoMqe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EE2EC433C9;
	Tue, 14 Nov 2023 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699941624;
	bh=j4BPfU4JGML+eRFRsSqArgl/gmW3iNbf6MXiLOGvgDI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Pt6hoMqeTHrb5TKBx4eKgCP2/DBsIKGLD3HDl5DIUV0rJwDkeeLYLfsHj0aeV7j/M
	 sZYTUpD9a4g93FaafPshC9Qv64e11oVsoNsOoSMttanFUNeXQomj0GrG3zoR2uQCmf
	 DwyPFxPVSp+c5FsOuOtdpG+0RJAQk0CTS/I0UiMOtAvPy9eg3iw/69xle+ay9TpkRr
	 jq4Lpo+/uNwmyQefH6ENe2G7CJNBIO1JfgvpL7gkOYOXSRP5fMGs02n+fcFaf8KOoW
	 bFAjSqGRFUyM2GCJhTOgsvmuUCMTGARJV+AcuZt5eTosvf6gMD5T39FHA2xELf6iMU
	 /9FGk3MTwOSTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EABB5E1F660;
	Tue, 14 Nov 2023 06:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Implement quickselect for
 median calculation
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169994162395.30294.11655195968151519457.git-patchwork-notify@kernel.org>
Date: Tue, 14 Nov 2023 06:00:23 +0000
References: <20231110165314.1559285-1-visitorckw@gmail.com>
In-Reply-To: <20231110165314.1559285-1-visitorckw@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: bleung@chromium.org, tzungbi@kernel.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Sat, 11 Nov 2023 00:53:14 +0800 you wrote:
> The cros_ec_sensor_ring_median function currently uses an inefficient
> sorting algorithm (> O(n)) to find the median of an array. This patch
> replaces the sorting approach with the quickselect algorithm, which
> achieves an average time complexity of O(n).
> 
> The algorithm employs the median-of-three rule to select the pivot,
> mitigating worst-case scenarios and reducing the expected number of
> necessary comparisons. This strategy enhances the algorithm's
> efficiency and ensures a more balanced partitioning.
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: sensorhub: Implement quickselect for median calculation
    https://git.kernel.org/chrome-platform/c/d131f1f3b459

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


