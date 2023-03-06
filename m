Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8C15A2
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 02:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 962C2C4339B;
	Mon,  6 Mar 2023 02:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678070616;
	bh=Y2qaLUUhqYXtAV06LtKJTSd1NYlNOd5OCdF12v5jGV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tNPIvsB9McRAcbxYbJgH6imi6lSidkMo2SOiWM9BO9kD/12CgW2vvchpgB+E57qln
	 te+McLnKMz5U9dHza0aQw0dVu5UhiOIOXSylEvdtKgdMCK6dwLh5Cfj9cQ+T5KM+xm
	 FAi4DxvtcFblfi4HqvV/YLk1JZxcUwuvbUZ+TmPORLs95rw5MMam4RP6dcNbZOxGgt
	 deGp098+BiyscjxpncRJNgczsuSv4OATg5vRUCMLmHWZxP6pOkrQ5WORXWfEMHvAcx
	 0OQe42sr7qSPwS6dBUlM58XuhP/W32rluhskLxDPovBEwmT3NKXublMxkVNbzUTNEU
	 WvCnI4d33x15Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7BFADE55B23;
	Mon,  6 Mar 2023 02:43:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: coreboot: Remove GOOGLE_COREBOOT_TABLE_ACPI/OF
 Kconfig entries
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167807061650.10312.8220995754030944031.git-patchwork-notify@kernel.org>
Date: Mon, 06 Mar 2023 02:43:36 +0000
References: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
In-Reply-To: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
To: Douglas Anderson <dianders@chromium.org>
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, jwerner@chromium.org,
 davidgow@google.com, jrosenth@chromium.org, chrome-platform@lists.linux.dev,
 swboyd@chromium.org, groeck@chromium.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Tue,  7 Feb 2023 08:12:00 -0800 you wrote:
> Ever since commit a28aad66da8b ("firmware: coreboot: Collapse platform
> drivers into bus core") the Kconfig entries GOOGLE_COREBOOT_TABLE_OF
> and GOOGLE_COREBOOT_TABLE_ACPI have been dead. They have no "help"
> text and thus aren't user choosable. They also aren't "select"ed by
> anything. They also control the compilation of no code.
> 
> Let's remove them.
> 
> [...]

Here is the summary with links:
  - firmware: coreboot: Remove GOOGLE_COREBOOT_TABLE_ACPI/OF Kconfig entries
    https://git.kernel.org/chrome-platform/c/e42af72223fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


