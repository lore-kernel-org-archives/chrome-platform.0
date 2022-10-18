Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50A7F
	for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 05:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B885C433D6;
	Tue, 18 Oct 2022 05:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666069217;
	bh=w7QphWyjGK/WYfbY/3FSQAteBAcnMbqJVv9qbe1FMmc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HmSm0HUUFEcl58PP8GbMK8oAhJpHD1bplW46/ttCr15gAwc1lm3kO2Mty+rr/qG6e
	 nfvCvl7OhLZON4tLmGA1R4RvH0DO9dPtAyegtq93WBzxnbQG3wFXwmM9NH//CldgYE
	 kJInZVN4j6GqcimlLpqzSbCqlprGvRJPYmMOSFrwjACW+Gm/vY2bvPhl3pex9T96BL
	 8zCI3ddOIldVfJyqNvsNaKR6QCnAx6VdmWNlk4BevyCFlpMQClqcE0bmuPz6j+OkYo
	 qhOEz50O6tMwV7PpBN+crqMDP+QbD2ecGbMnAPaWlOvc1Z/Jrz2ZML0Bmb4R3h680N
	 EyOehrRZi8g7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C0B1E270E9;
	Tue, 18 Oct 2022 05:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] platform/chrome: add a driver for HPS
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166606921704.4690.3565166154461436779.git-patchwork-notify@kernel.org>
Date: Tue, 18 Oct 2022 05:00:17 +0000
References: <20221018040623.2173441-1-dcallagh@chromium.org>
In-Reply-To: <20221018040623.2173441-1-dcallagh@chromium.org>
To: Dan Callaghan <dcallagh@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 skyostil@chromium.org, bleung@chromium.org, tzungbi@kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 18 Oct 2022 15:06:23 +1100 you wrote:
> This patch introduces a driver for the ChromeOS human presence
> sensor (aka. HPS). The driver supports a sensor connected to the I2C bus
> and identified as "GOOG0020" in the ACPI tables.
> 
> When loaded, the driver exports the sensor to userspace through a
> character device. This device only supports power management, i.e.,
> communication with the sensor must be done through regular I2C
> transmissions from userspace.
> 
> [...]

Here is the summary with links:
  - [v6] platform/chrome: add a driver for HPS
    https://git.kernel.org/chrome-platform/c/5f9952548d91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


