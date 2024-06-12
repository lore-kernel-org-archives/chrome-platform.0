Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5635CAC
	for <chrome-platform@lists.linux.dev>; Wed, 12 Jun 2024 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718159431; cv=none; b=PVir7c4qkvoUGGjJ4IHSIPn/QuC9tYaeU+aXNXscqxx5VXXnj1YlKJW4QCXXmJIfIHRmask4AcejiJoSXNlf6nmITX03NVM47pTGW2X1mIvCbtCl/M39xXmPqiMTvzmcIg64mYPy+SrM8XvpzgNSpSEPMEFLrwJAAqgw/0yRnmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718159431; c=relaxed/simple;
	bh=McHKgSBdxk3VnRMnT6ls2wD8rkzUA8dGjQBsH9yDY3I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=F+ya5pMWR2yvq6MGCI+Q1s2FHjaDtjCdT8EteBbrU41aZEu9hksGY7dJgZW+6b2YO225Qzp7Z7QsrcXqZxVkSc+6ji7S7H+05n9sWzU8ShzkWZLgEKPSQ5xhv8DLIQ/SzSGU5g5joDPdXJvbOxE78J7JGUUYcVN1Kg8T/zINvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rW2s+klZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rW2s+klZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAFDDC4AF50;
	Wed, 12 Jun 2024 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718159430;
	bh=McHKgSBdxk3VnRMnT6ls2wD8rkzUA8dGjQBsH9yDY3I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rW2s+klZl+1Mjfvy4D9D6FLGayyt6lXwkYIpFHjep8FJ2ijKpZvfXbtE8Jj0nTJuN
	 qNdsPLkirJ+6xnit+ILfbnBwOMRmaUXtibAY3WrhAaUJDEu4eRPBmeIxkOgAcjolwq
	 cxDtlg+S14GAyh5wR7lxcChlMLxX+x6GC2BrPAm4rEmtFHKNzXjwtyby0r4iKOTSGO
	 e/KlNQQEQOr6LBV+pM/x74WrlME26SeDolWoxDuFvG0J6uHFzoKvBJoymj7vcn7wj+
	 XqU7gHj7ACvBSzJL5O9E3g2N98n6e53afNz+9No9Yavh9bbcXoC+ZRhHgRzalRbthP
	 FauUCAyuf3eQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE8C3C54BB2;
	Wed, 12 Jun 2024 02:30:30 +0000 (UTC)
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
 <171815943071.29023.7456200928151542183.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 02:30:30 +0000
References: <20240611033113.4154548-1-tzungbi@kernel.org>
In-Reply-To: <20240611033113.4154548-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
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


