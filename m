Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970528EB
	for <chrome-platform@lists.linux.dev>; Thu, 21 Jul 2022 08:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 092CAC341CB;
	Thu, 21 Jul 2022 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658393416;
	bh=2hebJRVnSw8a/+tmnCngeqcM68rilnEA7AZzAQBYsEU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GB91xZa0MC2Ehrr2OypFTTPEH2WNHiuF7Ik+bzbOUK6G4FSDuzcnDEHC62TDkHubT
	 3w+MLrV10rJlr430d/Muz2hOVtiCtDuKfdNIgJ50bLazK6DPADUbUkIcmjAfAXwU1S
	 UQ5Xs2w36zle7dUnqCqunBFGB69jTfj6I+5lhMuT1S3A455de73xf4uUpygGJNUQHH
	 DOkFmIhT0vczNFOXt42hDcXg4RXAf5NTX2ayV0vjUIJSJlDUFdBLVi2IrM7yYCOhBr
	 Hk1SF/oQrrCKsCTc0GtI+c0vW5KJlxzO85dfqpgLoyH/wK9CD+RfUnl8Fecya4UKoP
	 0BnUD6exKY6og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1C32D9DDDD;
	Thu, 21 Jul 2022 08:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] platform/chrome: cros_ec_proto: add Kunit tests
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <165839341592.29073.1350523720863689608.git-patchwork-notify@kernel.org>
Date: Thu, 21 Jul 2022 08:50:15 +0000
References: <20220622041040.202737-1-tzungbi@kernel.org>
In-Reply-To: <20220622041040.202737-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Wed, 22 Jun 2022 04:10:33 +0000 you wrote:
> The series add Kunit tests for the rest of exported functions.
> 
> The series applies after
> https://patchwork.kernel.org/project/chrome-platform/cover/20220615051248.1628156-1-tzungbi@kernel.org/.
> 
> Tzung-Bi Shih (7):
>   platform/chrome: cros_ec_proto: add Kunit tests for cmd_xfer_status
>   platform/chrome: cros_ec_proto: add Kunit test for cros_ec_map_error()
>   platform/chrome: cros_ec_proto: add Kunit tests for get_next_event
>   platform/chrome: cros_ec_proto: add Kunit tests for get_host_event
>   platform/chrome: cros_ec_proto: add Kunit tests for check_features
>   platform/chrome: cros_ec_proto: add Kunit tests for get_sensor_count
>   platform/chrome: cros_ec_proto: add Kunit test for cros_ec_cmd()
> 
> [...]

Here is the summary with links:
  - [1/7] platform/chrome: cros_ec_proto: add Kunit tests for cmd_xfer_status
    https://git.kernel.org/chrome-platform/c/74bed42fd5fa
  - [2/7] platform/chrome: cros_ec_proto: add Kunit test for cros_ec_map_error()
    https://git.kernel.org/chrome-platform/c/1242688fc2f0
  - [3/7] platform/chrome: cros_ec_proto: add Kunit tests for get_next_event
    https://git.kernel.org/chrome-platform/c/2b7ed927953f
  - [4/7] platform/chrome: cros_ec_proto: add Kunit tests for get_host_event
    https://git.kernel.org/chrome-platform/c/7cb1eb82642b
  - [5/7] platform/chrome: cros_ec_proto: add Kunit tests for check_features
    https://git.kernel.org/chrome-platform/c/00238864435f
  - [6/7] platform/chrome: cros_ec_proto: add Kunit tests for get_sensor_count
    https://git.kernel.org/chrome-platform/c/33f0fdba6066
  - [7/7] platform/chrome: cros_ec_proto: add Kunit test for cros_ec_cmd()
    https://git.kernel.org/chrome-platform/c/9399b2cb2070

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


