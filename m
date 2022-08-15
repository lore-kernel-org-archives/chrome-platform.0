Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D662910F4
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C1FBC43140;
	Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660535094;
	bh=AEEr5CXyP/v/XoMiUSx/wTeBSZ97rwz/CGh0DLmMG2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZhM/QWjby2KXTwr8HzOxgJtOxcgaBn+FhpQCs6yKUmy+ll5aoL+fXuwvh7U7qcHbe
	 H0K7O4/06yViMcg625l4IArcFkMC3Qg/Q9NCIntC4v3xP+BQksiozDL0mg3DAi7lr/
	 5mR3AuGyysjAtJpUCCAxjnOIGqHhx4szFVMoC1JCYd1wQWoZ1Bot2kPPEN9EyVp0jT
	 1ymxy9di/a34SGNagWstv70mEZaMbi2D7J3sEgi4twoCs31vh64vxBArdqx8U68DdC
	 gyqbbIeA8oqEwooT/YurGmPjmvnsvdayGLEr8bT6gomGm341yGi946YmHTvBKADGaR
	 NSnZirT/DXnqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67620E2A050;
	Mon, 15 Aug 2022 03:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] platform/chrome: cros_typec_switch: Add ACPI Kconfig dep
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166053509442.30867.11814396259669096665.git-patchwork-notify@kernel.org>
Date: Mon, 15 Aug 2022 03:44:54 +0000
References: <20220718212754.1129257-1-pmalani@chromium.org>
In-Reply-To: <20220718212754.1129257-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 chrome-platform@lists.linux.dev, bleung@chromium.org,
 gregkh@linuxfoundation.org, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Mon, 18 Jul 2022 21:27:55 +0000 you wrote:
> Add the ACPI Kconfig dependency that was missed during the initial
> driver submission. Fixes the following compiler errors:
> 
> drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to
> undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not
> support implicit function declarations
>  [-Wimplicit-function-declaration]
>    ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> 
> [...]

Here is the summary with links:
  - [v2] platform/chrome: cros_typec_switch: Add ACPI Kconfig dep
    https://git.kernel.org/chrome-platform/c/88a15fbb47db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


