Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B81642
	for <chrome-platform@lists.linux.dev>; Mon,  7 Aug 2023 03:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61FEEC433C9;
	Mon,  7 Aug 2023 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691377821;
	bh=mGgf2F0PdoAu01r3Q8tJAt7qo0xuhEP8Y43j4ySUSEU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ObJVWqjJax0qCB7Zqguj/MHJRSa2ZUa9mSN1qoUef7jDwP09bBvWmiTpZlVv4E6Yc
	 wXtni5d+Ioy5fKsOjhmRqB63wgQ+YLah2YLOPYMbucFb9RbN5Dtb4xaM5qeyIKX57t
	 togNAZMq2K4wPJB5TKsVxY3Iyt/UdL2l9Ni0XIuffYrdeMjSEQwgKA/RgGV0svL44J
	 ee3kuOzGNROslf4kNNuOswi9blvdK3DK5PGvC5IGZkUkaBP+bgfQen6EBJ+KVG4A4O
	 SstCA174WEH7LfAxNOXH1x5vdZnqHS1BorxaZsTMZMPVCqg11tsKrdzQuxb5dLeL4s
	 f0m8f1HiSqcoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47749E505D4;
	Mon,  7 Aug 2023 03:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] platform/chrome: chromeos_acpi: support official HID
 GOOG0016
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169137782128.31484.565951557345548988.git-patchwork-notify@kernel.org>
Date: Mon, 07 Aug 2023 03:10:21 +0000
References: <20230731024214.908235-1-tzungbi@kernel.org>
In-Reply-To: <20230731024214.908235-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, rafael@kernel.org,
 lenb@kernel.org, guillaume.tucker@collabora.com, denys.f@collabora.com,
 ricardo.canuelo@collabora.com, usama.anjum@collabora.com,
 chrome-platform@lists.linux.dev, linux-acpi@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Mon, 31 Jul 2023 10:42:14 +0800 you wrote:
> Support official HID GOOG0016 for ChromeOS ACPI (see [1]).
> 
> [1]: https://crrev.com/c/2266713
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v2[2]:
> - Instead of replacing, appending "GOOG0016" in sysfs-driver-chromeos-acpi.
> 
> [...]

Here is the summary with links:
  - [v3] platform/chrome: chromeos_acpi: support official HID GOOG0016
    https://git.kernel.org/chrome-platform/c/703e77134ebf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


