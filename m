Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C7815
	for <chrome-platform@lists.linux.dev>; Thu, 10 Aug 2023 03:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B18E3C433C9;
	Thu, 10 Aug 2023 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691637620;
	bh=zLS0bhfDcCUl8OFT0qbaazjptBHMRo6kJfLdamr9vfk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qUuSXRVRiguAFkkhW5J8t0kPrf+laiFFR5EKQMNtZ+bZYbtA1bYPwXnw8HOWx+axZ
	 v5sBZsC0s6MZaxjzQQNYWvrQ5mRiHSsb9zA9lWwrWXXUzhitS08iWjPdqm9arL6zNb
	 VRQjEwhnoZsTGu+fsojSqX2FXOrcM3O60iEzBHhC55dCZ6Xc1Jp/v9tmWZ/kcs31r+
	 DUb2Xj9WG3A+GYSoWY6N2jNMuh9D03vuBbBeUYxLn7WXzEETg830LYblfxnOT9Sik4
	 Q19m4Yfre3TFafzuY1MpfphoPonfPapJfJRFlXTenBnvMsjXL0Ztm4a/q7am+umZwv
	 s0rVwPUhbM51A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9742BC3274B;
	Thu, 10 Aug 2023 03:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169163762061.26318.2519751828944797589.git-patchwork-notify@kernel.org>
Date: Thu, 10 Aug 2023 03:20:20 +0000
References: <20230803011245.3773756-1-tzungbi@kernel.org>
In-Reply-To: <20230803011245.3773756-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 guillaume.tucker@collabora.com, denys.f@collabora.com,
 ricardo.canuelo@collabora.com, usama.anjum@collabora.com,
 briannorris@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Thu,  3 Aug 2023 09:12:45 +0800 you wrote:
> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> perfect for them.
> 
> Print hex string for ACPI_TYPE_BUFFER.  Also update the documentation
> to reflect this.
> 
> Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v3] platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
    https://git.kernel.org/chrome-platform/c/0820debb7d48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


