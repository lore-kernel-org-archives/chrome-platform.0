Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB44C8B
	for <chrome-platform@lists.linux.dev>; Mon, 27 May 2024 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716779431; cv=none; b=FXBAEPvKNTnc4xsj2QJU1gP4kI7Y3LQ61UCInoBV/6NxFxJw8NKBOy3eGrcGJd7dQQOZGnvKP7bg+0eetHmylZd8FNyT4z9LcgBW2MNXDo77OiT9FgAePnhQdzRFasSmhuztXwk62mJU2FRv6SnDvdzbZuVj/Emw9y1Fb5j7CP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716779431; c=relaxed/simple;
	bh=VsP4XJRDumNbEVcpSTKuxbktJFkrTZ8xBUs5llv75Oo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qGUDWuTckLtGaV8G0ZIc39tmddCbED1hzHcaHDGbp1iinnVQL1GmqhrBCuUYKzkKVldMvXaJOWu+uJ5b7vwFPcRhlpjDCPoQa6O4NpY1R2t8S5mYTzNIE12aTvt0iJyIJPq5Q/Rjh3PbjHrb6njoLSCeJMQ5TwM6Ek2+r5S7Qtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFo0WB2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFo0WB2x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C3CBC4AF08;
	Mon, 27 May 2024 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716779430;
	bh=VsP4XJRDumNbEVcpSTKuxbktJFkrTZ8xBUs5llv75Oo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gFo0WB2xw2h5ab7xUOtO41z46C2ik6otwhfVr/NJqJ8UB6BJ9k1VmKko+00q/GB5t
	 UZUXWQVuLuJiENb79ZaTNonjN4W3vk0tdLHw72yFuUoV4rnMWC8EnHseTBYZ54MAB6
	 OOHAG1SyK7VjKIklkI+SCm/7qZGTfMTPgM3YkALYB1rcID7R5CYsenIPE+ZCyeNWNA
	 +gbgcLlEQTxrFeED5UQNYaf2pfSjY7bJiJzaBw8W4wo8qcrkXJw1EU9PjmCx8eQ2lF
	 W8a5MwdAt5w7VHvj6N34IqWERAbWLGJMBZ0X+UalTF7BDMhtVdCFd4bLr6NgomzL5A
	 PJlsasW6DdYLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90B8FC54BB3;
	Mon, 27 May 2024 03:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec: let cros_ec_suspend() call
 cros_ec_suspend_*
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171677943058.24851.11741261136543430690.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 03:10:30 +0000
References: <20240430020924.610724-1-tzungbi@kernel.org>
In-Reply-To: <20240430020924.610724-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 30 Apr 2024 10:09:24 +0800 you wrote:
> After commit 2fbe479c0024 ("platform/chrome: cros_ec: Handle events
> during suspend after resume completion"), cros_ec_resume() starts to
> call cros_ec_resume_early() and cros_ec_resume_complete().
> 
> To be neat, let cros_ec_suspend() call cros_ec_suspend_prepare() and
> cros_ec_suspend_late().
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec: let cros_ec_suspend() call cros_ec_suspend_*
    https://git.kernel.org/chrome-platform/c/47ef58cdbd7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


