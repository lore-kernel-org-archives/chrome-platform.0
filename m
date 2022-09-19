Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4386FA2C
	for <chrome-platform@lists.linux.dev>; Mon, 19 Sep 2022 05:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3517C433D7;
	Mon, 19 Sep 2022 05:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663563615;
	bh=+DCEMpaMdnaYqiMZpq0fjxyahfdsk4bJFiF78SlX0g0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L3mhGYeDZqGIjrTWfTKEUaIA3wL8wZyCsybiWRyI39jRkUoSASXeuu/SArGVYXM4e
	 SG2bYFS18daWb/9Bq80tbMJHjgMfYuStkZuGPFY7jsP09QG/aAFuNAXL9+jLwigtGs
	 d55URuXkbvh1NZPgyFZuRenIRWCmjknTeme7Irs4a9l7+igXtaMEcPwqu8GZXTW+kW
	 TF8EMhT4MTOITEJoH8FN8gPwOUAhfMgaDceNWAIU/iW7rHhLrnymexnq6bWQ7Mn9IS
	 mAsETDbFmzxAKg4C+/u8WartdneHfk2YLjtp85eCjt7KN2kSxwOlVQVSUxaZRBa0vK
	 TcbJmSsIywUrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE3E2E21ED4;
	Mon, 19 Sep 2022 05:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] platform/chrome: cros_ec: Notify the PM of wake events
 during resume
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166356361570.17778.16769404823889593571.git-patchwork-notify@kernel.org>
Date: Mon, 19 Sep 2022 05:00:15 +0000
References: <20220913204954.2931042-1-jthies@google.com>
In-Reply-To: <20220913204954.2931042-1-jthies@google.com>
To: Jameson Thies <jthies@google.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org,
 tzungbi@kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 13 Sep 2022 20:49:54 +0000 you wrote:
> cros_ec_handle_event in the cros_ec driver can notify the PM of wake
> events. When a device is suspended, cros_ec_handle_event will not check
> MKBP events. Instead, received MKBP events are checked during resume by
> cros_ec_report_events_during_suspend. But
> cros_ec_report_events_during_suspend cannot notify the PM if received
> events are wake events, causing wake events to not be reported if
> received while the device is suspended.
> 
> [...]

Here is the summary with links:
  - [v4] platform/chrome: cros_ec: Notify the PM of wake events during resume
    https://git.kernel.org/chrome-platform/c/8edd2752b0aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


