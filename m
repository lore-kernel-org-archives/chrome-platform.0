Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3315A2
	for <chrome-platform@lists.linux.dev>; Mon,  6 Mar 2023 02:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBAB0C4339B;
	Mon,  6 Mar 2023 02:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678071224;
	bh=UEhFA8dJmKIlxizlhNq5uXSU+WjBJR3dAHgwGwdyMIg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HHtURbOvDzz9IjS8ABX7OfQ88J3cuv7uXKHOtOsad/hIiKwpm2/MpuRZ2SQmCo6k9
	 P8P7ZqHlEqyevIIfeO9Y+ZAPsDR1yoFbU9kyfEunh3z9S4x4ajqGf1RnOnL7P2qCPr
	 mo7OLKLI7ssk9qecXfZ9LUwLnoTNj/Slhhy2X+VJ+E2tEeoTao0auKDCnamDXIM3mm
	 Usb2r6E3gCs0bw/cPWuZ5Kx+9ZqmS60dFBgW8Suk1FPpZiu1/tNQ7Br1wQ8SlTp3yF
	 6rBPiHe6LqhUK4MLYxA9R8f90/c7YO7rgDQ/2ijTsR+6+EmW7K48Iu2ElJJyzQghQT
	 Ex2jSOIB9vFEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2A45E55B14;
	Mon,  6 Mar 2023 02:53:44 +0000 (UTC)
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
 <167807122479.10312.14973528180299232858.git-patchwork-notify@kernel.org>
Date: Mon, 06 Mar 2023 02:53:44 +0000
References: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
In-Reply-To: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
To: Douglas Anderson <dianders@chromium.org>
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, jwerner@chromium.org,
 davidgow@google.com, jrosenth@chromium.org, chrome-platform@lists.linux.dev,
 swboyd@chromium.org, groeck@chromium.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


