Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08306FDF
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjG6vKFi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49065C4163C;
	Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696501227;
	bh=rTfQB0Bjn70arEKrFoZoSg+lNNhKbd3e4ky8KDtytHo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CjG6vKFijKvpwSWuZIbYiO9GXBaZc9RK1mn6DqrDpqWdJe8n6lffT3TlbEFzASndx
	 ZmIZh8ocgGAZeOn19gzVBdnNNgwnXkvt+JLVdnUJDSLt0vJtTXsUWG07XCqY/BvBY/
	 5qrlcOQyJyp4UoFqrVF0AeI3s60pQIZHCY4v3hC4iZWFKRQXYsQMrVtiyockjpJuXS
	 deD7rz7owvIxCUk/Tdee2qsq38osvvJkrTYmLjAYb6iGyaK1SxrbrPTdaF/OrXqWPV
	 vQ0jsm6gH/bwtWD29khkgjKU0aGSjRCvTq/dhHd5W0GL1xlOkbe+dM8clIKePgXf1c
	 PseMsBPYjtENg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 313D5E11F52;
	Thu,  5 Oct 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: kunit: make EC protocol tests independent
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169650122719.4916.797492050359036254.git-patchwork-notify@kernel.org>
Date: Thu, 05 Oct 2023 10:20:27 +0000
References: <20231003080515.4011374-1-tzungbi@kernel.org>
In-Reply-To: <20231003080515.4011374-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  3 Oct 2023 08:05:15 +0000 you wrote:
> Remove CONFIG_CROS_KUNIT and common code concept for ChromeOS Kunit but
> make it bundle to ChromeOS EC protocol tests.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/Kconfig                             | 6 +++---
>  drivers/platform/chrome/Makefile                            | 5 ++---
>  drivers/platform/chrome/cros_ec_proto_test.c                | 2 +-
>  .../chrome/{cros_kunit_util.c => cros_ec_proto_test_util.c} | 4 +---
>  .../chrome/{cros_kunit_util.h => cros_ec_proto_test_util.h} | 0
>  5 files changed, 7 insertions(+), 10 deletions(-)
>  rename drivers/platform/chrome/{cros_kunit_util.c => cros_ec_proto_test_util.c} (98%)
>  rename drivers/platform/chrome/{cros_kunit_util.h => cros_ec_proto_test_util.h} (100%)

Here is the summary with links:
  - platform/chrome: kunit: make EC protocol tests independent
    https://git.kernel.org/chrome-platform/c/466f70fb1b10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


