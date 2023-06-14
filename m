Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1885642
	for <chrome-platform@lists.linux.dev>; Wed, 14 Jun 2023 05:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BE63C433C0;
	Wed, 14 Jun 2023 05:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686719430;
	bh=rrpNv/C6go2MmpKX0o57SzGsrFboftdRPFh4qo2BObQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mO5acHYklFAkKHz2XpDuxJUf/x3IwHf2NIMcmfnupkIplogsIwt6JRpoOzGcAs9Oq
	 bt18sF8oDThVT6MIAzRlJyxUCKwKlV+XTvkxjyZtEHngWzcT9ieXqsEWuEKhRnVlPT
	 0ojMKy+zIk+b8vTy0JkKg4ILhHmksKHu1WvpOdb7Ft91vKCGwwVEbDYFiXrNWv/45A
	 sT+sNsWXqZD2U6w8PuNYTOUWCWHuS8TrqJx5fJ5cgT5/p1FKHnKl5frqsi/Bfkzm1o
	 VEhHV1XQxT166HQlJcFyO1NW/qkxF/DBCooFv1DVofuLFDiuN5ZpWXD+FwjP69ilyR
	 amz8BSHJMqJxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E850FC395F3;
	Wed, 14 Jun 2023 05:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 1/1] platform/chrome: cros_ec_spi: Use %*ph for printing
 hexdump of a small buffer
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168671942993.26522.11776127296036534588.git-patchwork-notify@kernel.org>
Date: Wed, 14 Jun 2023 05:10:29 +0000
References: <20230612212336.4961-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230612212336.4961-1-andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 bleung@chromium.org, groeck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 13 Jun 2023 00:23:36 +0300 you wrote:
> The kernel already has a helper to print a hexdump of a small
> buffer via pointer extension. Use that instead of open coded
> variant.
> 
> In long term it helps to kill pr_cont() or at least narrow down
> its use.
> 
> [...]

Here is the summary with links:
  - [v1,1/1] platform/chrome: cros_ec_spi: Use %*ph for printing hexdump of a small buffer
    https://git.kernel.org/chrome-platform/c/2b8cc5858a07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


