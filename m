Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096A210EA
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5646C433B5;
	Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660535728;
	bh=9cStDL6VDIu1GtVJwkvwpUgJHRXcmBxfDKU5KW3InG8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HDJq+qF9bgTQIP6ZWDldAAV8hgsu5Kes38TB8Ljy4PnUISUwgnWs8J42GNlXeRrKa
	 LlGHqjPdLo9zLXO0hdt8aofmwXKC0jZ2JYK1XMn8lBZ8/ZpkSY+saoxn6l622p9rhA
	 kQbX0OKL0EqddrWPuIkWQo0s+Gkj3ZH/dnZEGD8XyNB3gA7bpBCdfuzTyYOyT8Lvsg
	 g8iEnKGnkGNF5FXkgMpji2ML/3Pzrxmkyj69rcETUc9mSFk/RRs2brEVm1sVSMPq+Q
	 2kqkmrC7OYD0XYXOuGcH9xMb1/0kY4PmuA+VzRWg3H1O2cvSts8XMxPuWx8KniFonc
	 IMlSZCL1dJNXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86D72E2A04E;
	Mon, 15 Aug 2022 03:55:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: Update version on
 GET_NEXT_EVENT failure
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <166053572854.30867.16514927913447252293.git-patchwork-notify@kernel.org>
Date: Mon, 15 Aug 2022 03:55:28 +0000
References: <20220802154128.21175-1-pdk@semihalf.com>
In-Reply-To: <20220802154128.21175-1-pdk@semihalf.com>
To: Patryk Duda <pdk@semihalf.com>
Cc: bleung@chromium.org, groeck@chromium.org, gwendal@google.com,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 upstream@semihalf.com

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  2 Aug 2022 17:41:28 +0200 you wrote:
> Some EC based devices (e.g. Fingerpint MCU) can jump to RO part of the
> firmware (intentionally or due to device reboot). The RO part doesn't
> change during the device lifecycle, so it won't support newer version
> of EC_CMD_GET_NEXT_EVENT command.
> 
> Function cros_ec_query_all() is responsible for finding maximum
> supported MKBP event version. It's usually called when the device is
> running RW part of the firmware, so the command version can be
> potentially higher than version supported by the RO.
> 
> [...]

Here is the summary with links:
  - [v1] platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure
    https://git.kernel.org/chrome-platform/c/f74c7557ed0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


