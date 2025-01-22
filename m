Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3FE1FAA;
	Wed, 22 Jan 2025 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737517854; cv=none; b=gXlh7+GnRmt+zHb53aXyFL3r7BYxjXWDWT7H0QWbZZUdoCJ75KEMnehgZ4feR+QsSQHY3i5mr7yimwvvqYmlEEAXn6fFoyzrbf22YkcmhvdwfBg2PK6WLwCWOacWNrWuHeuYIsao0nSESr5PiA4YpGdPk9JA/BGrgmKuQuzJIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737517854; c=relaxed/simple;
	bh=pX9ICoI9R+KoiSYKz5n40bDBTeqHvcv2PrlU+ZnvT0Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ea3YSP2DewhsfECmUINq7nK2mZy+UpKVB39N6eHLa5mWdj2Arc7iK5bbXOOtIYQOHOCZihkivdzjdptmCFBrh1Q6npio/Uu1usd6wMXqD9cKom2QbGXE/an4P4aAY4IczJ90y8KlOVxzweG7ei+zQkrgI/zBBspQalMskh4NoCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7dYigIk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7dYigIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9BFC4CED6;
	Wed, 22 Jan 2025 03:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737517854;
	bh=pX9ICoI9R+KoiSYKz5n40bDBTeqHvcv2PrlU+ZnvT0Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D7dYigIk0c7Gaikpyr0f46C5kM92sDpBkNQAUKc4aM4K+kzKzUrTqiXmkVovd8slN
	 KTL9rsC61lEVsUsS5Yu81ZRhivVZh5y6hgD/0O3+fT3P+uLlaCHQmu1ChbCyjA8+L8
	 a7zN6gr69NPzyjr+Cg1cuoExngUdKTzMYYOmg2MFwdZt1El4XYEON9wBseXqO0fRhd
	 SYhXfGWpct0uPz1MeJ3padpcv04aFpaf8Krq0OExx634x8FfpWlmZFrNTb0bvSZuDb
	 xfiZFu8gpuDnJq893B4f0U4A2d5lFVKLJ4TdzerFFTZazCcMGALWnzpf71qC9VNUS0
	 Ef+Sqqzh6LrOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DF7380AA6B;
	Wed, 22 Jan 2025 03:51:20 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z42tFgmKC5PJkCQm@google.com>
References: <Z42tFgmKC5PJkCQm@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <Z42tFgmKC5PJkCQm@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.14
X-PR-Tracked-Commit-Id: fccebbdde2067e359f01382a72c31ed2af7acbac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b394eabd539d01db10e27b57ac2497cbd1d32c6d
Message-Id: <173751787876.223864.7910213851030082398.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 03:51:18 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 20 Jan 2025 01:55:34 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b394eabd539d01db10e27b57ac2497cbd1d32c6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
