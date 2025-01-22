Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AAE156C62;
	Wed, 22 Jan 2025 04:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737519292; cv=none; b=eu90KbvM/KYyckal3mhHqVx//LHXvRCwZNS57CDDuIboxtJDG4M+u7zek/VteWgGCiE7ldQCW2TlJyLfgDIVOd0vwi1gywrvRwNt3IlmmJXv6tOV7b9/HGmaV+K8TVMC/h/MDuzMKhIgXtNND0hyD6pgtxF3n4KUdhIMF/CkxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737519292; c=relaxed/simple;
	bh=3CNf6AeFeEbRnBB/JCPDwfgRKSFWwOv6v/C1PXxTwaE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JySsOPJ309jwTvFAFC7Blj1i9hFDNRXuRCwjlIpccFr/pe1sp5Vk5z3Xpxo7Jepp9mcHaoCjvnx+zECruSXOjkwbI9GfHYn0kXIIyQD1ZOHoSaYGcxkEGLk3MiCWnWP0KMnH4WNzccMq1LUZdRLVuw3xn1znuTHuBznWYolZ8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0v0U+2o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0v0U+2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F671C4CED6;
	Wed, 22 Jan 2025 04:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737519292;
	bh=3CNf6AeFeEbRnBB/JCPDwfgRKSFWwOv6v/C1PXxTwaE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=R0v0U+2ooTPnv0b6GR2KCzIAUequQG73xAFg5uwW6BXGIIos+hLPYaPfBI0wn9ASx
	 QWZP9rmq6kfbSUHzKIh5zMyZIzZ42k3Fi+iC1X5eb6WJD947bMCbgHxpQh2YH3m5R+
	 lq3u+95qfy1lP+RTYSUKdrEOwkg2GEJ3sKGxhQQKzgAxZsDY6Wzqap9xSXaPj5JI4z
	 sOxQ8wqH537UHMP7+hSK0OV7C5N+QNKPOL83gmVkb8QmFn+pYv5EOBgCFOljNAdl0T
	 LMKCDPBm8M43GgSH9c5R4ncbwQlsGxL+xLWWQ5StDk5IWDCSNIfPa3f6GgfXVyw4SG
	 0vG61H8ickSXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB122380AA6B;
	Wed, 22 Jan 2025 04:15:17 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform-firmware updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z42tY9rGfqes47SM@google.com>
References: <Z42tY9rGfqes47SM@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <Z42tY9rGfqes47SM@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v6.14
X-PR-Tracked-Commit-Id: 7543d5702c2cfe0e8e8bc8bf4fe8cd44f08d6d39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7dd457a2fd78f3dd39aad4579d13e9eed2effbca
Message-Id: <173751931657.229101.2164485589718007945.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 04:15:16 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 20 Jan 2025 01:56:51 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7dd457a2fd78f3dd39aad4579d13e9eed2effbca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
