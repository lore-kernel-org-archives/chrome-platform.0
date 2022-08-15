Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348710F4
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 03:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C25DEC4347C;
	Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660535728;
	bh=Dj4C9v9BiKHIFxUBo5AnrjZ/fOkwzcoGV1W1NQa2mpw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=StJMPwdrLweLB8Zzvew3UyzzleVv4o2CoGHk0OuTpChFdihKaK7Bq3rl1DeLANxNE
	 T8flEcheTdrInAgqW8C4DxrViS8zefYQTugoDtW+BLI8i9iQXvi1qibP5lKCjw9iQO
	 NXxKxvy02x3x9IXdAwmAzgHM/ajOIj3qmYSjPMEGkte5chX8dP+72jsEGlK/KIkgh5
	 m7qsIKg47smO+h/GIdIFDxpIURgDWZBdosbDqVWexXtwgrZ6IWiKQS6vNi2YbO9yge
	 n+jC+1LPVQd/1GfHdO9uuuf0RSkyYOLE/jxG7iXw/LVVNHRzcKFXSBWnvW8UG2TR/Z
	 rT9JGFoywvpWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A22E5E2A051;
	Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
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
 <166053572866.30867.5546564903380814690.git-patchwork-notify@kernel.org>
Date: Mon, 15 Aug 2022 03:55:28 +0000
References: <20220718212754.1129257-1-pmalani@chromium.org>
In-Reply-To: <20220718212754.1129257-1-pmalani@chromium.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 chrome-platform@lists.linux.dev, bleung@chromium.org,
 gregkh@linuxfoundation.org, lkp@intel.com

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


