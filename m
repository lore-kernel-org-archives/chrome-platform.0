Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AB01CAB4
	for <chrome-platform@lists.linux.dev>; Wed, 12 Jun 2024 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718159432; cv=none; b=rQ+pnQGH8rQvEjvGH7HMzq80EGJeNY2jVQ9x0KwpDQwMYa8mo4/VtAMTrIA4laxCAs/9xBQAdJe/2rDubfHFyVk8+UeeicI+iYyq2XwDtzWFsaGWalV/wVwTw4BzvHlbmNL9htLP9fppbszd7TkYMc96LG/BqCVII9p7+rfkkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718159432; c=relaxed/simple;
	bh=stqtNnyMpEWpEf16vLrKJH9hemPSz4CZb27H3DqADRY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Rmts4x42K62jtZGd0bq8TmFB4Ze4QIe1C7gF89cGIqKNiiAp93l1TLNI7YmlZ0H/1qteuq22z5Z6aaSwp+q+3Y0HsF+JZ3vRkwU3+aTwUGRexJXF+eq/pJtMhqCd5167mPkXn5nR/eSDFf7ym+bG+Z4R42Wi5DzEp4NhMyRH0Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5UUm2KW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5UUm2KW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EC4BC4AF50;
	Wed, 12 Jun 2024 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718159431;
	bh=stqtNnyMpEWpEf16vLrKJH9hemPSz4CZb27H3DqADRY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e5UUm2KWpLgP/GUIN1H7fQqa8+a2e9rc+ESxH6dxC8chBt0TuEYQ+1kzBGF+zF5Yq
	 +6eCzlNWv7zgU6snkiLXqxhwsQuDGnNyZChqJ/H4uAG2S7+5BLrv1/SbpLIwzySsyJ
	 aeKt18P8Ia5x+e64mkNm5BkELOqz2REHGQs+NSGDLRip++qXABjOh2GncKbf9iWJpx
	 vltGKQvGrFGRlcYsj5ia7x84Z+ewFZJejbu3tkeFSvtdDIU+YonpZlxyorXmKTqQnf
	 m60EUX6XfN22Gf1xjqATWLcLeP8IvAOYyImAPLDEqyx86hA3uboTMGS6rLqEEMplpH
	 XW+jx/npLl3Eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2309BC4332D;
	Wed, 12 Jun 2024 02:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: update Kunit test for
 get_next_data_v3
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171815943113.29023.14985125192417749534.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 02:30:31 +0000
References: <20240611033113.4154548-1-tzungbi@kernel.org>
In-Reply-To: <20240611033113.4154548-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 11 Jun 2024 03:31:13 +0000 you wrote:
> Since commit 106d67398233 ("platform/chrome: cros_ec_proto: Upgrade
> get_next_event to v3"), (struct cros_ec_device *)->event_data becomes
> struct ec_response_get_next_event_v3.
> 
> Update the Kunit test for fixing the following error:
> > Expected mock->msg.insize == sizeof(union ec_response_get_next_data_v1), but
> >     mock->msg.insize == 18 (0x12)
> >     sizeof(union ec_response_get_next_data_v1) == 16 (0x10)
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_proto: update Kunit test for get_next_data_v3
    https://git.kernel.org/chrome-platform/c/41f1242f6249

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


