Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF7031194C;
	Wed, 15 Apr 2026 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290446; cv=none; b=AbTCByeNhIKCqDPxxPyAQg02uRro2E9G2lNUcY8x6zMoaLcbLtZM0rkS9HYTNYvpyWUtiwY95Ki5yFrm74iN0y71dAZo3DTqoZWl+cZrPhmFSJWWazcbNXGJKtt/HnTYSeK53pWLMrIqbXcCq+WkgHlKWfDWUPAkeTBeSRqfbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290446; c=relaxed/simple;
	bh=kC6CRA/imrSDZr5Ybvyt/QqL06wCQpkZgGCa6fQwG0g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Qkf4HHuKxBLLwMZOcdU2yNxHLRXZ9z/aiFcTkHfbKq1fh6dqOxF7rfeSTpkEmy0TVUgOS1XlQ8hdYh4/dKBj4mrpj0xepYf9fXOoxak3VFUYjhXu4FJrrXqLWdiBozsvc2QUZmQVfSFrtl+PP1pWRdXMIE+z/+u/qdRpLOG1nag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOacsmrd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOacsmrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E338C2BCB3;
	Wed, 15 Apr 2026 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290446;
	bh=kC6CRA/imrSDZr5Ybvyt/QqL06wCQpkZgGCa6fQwG0g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XOacsmrdthb/wpB47BoIpxhUOcU1O7mzLXWPPO3hoFIz4BblcHQacsT7E8hkfKsYV
	 18nNjg8lcbWOXjWuzTo5dB1aaF4xBoynzAP6mp2nxcDmWrtngN6cnYJw2fz43S1Uko
	 iNXyDQ+Ah+RT0LzMwYuHeu21hHc4sR/Sp/Fvv2dHuAicBDtN7rIJ7ZmhXDVsoUyK26
	 gcnlnWCf5q+2zoqk8khHQg6+H5JUvnTdGoNxLXWFrQGStpi7RaLiubRXuG6GsBcRFa
	 QVc/3/xgjXZjlmYSoDYAv13HJe+axi6scSscWF/kaJVBJ0k4uU7Ry0aJ5joLluxFiM
	 CC2pHw6NB+cNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E2F62380A964;
	Wed, 15 Apr 2026 22:00:16 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <adx0Aa1nOikgC521@google.com>
References: <adx0Aa1nOikgC521@google.com>
X-PR-Tracked-List-Id: <chrome-platform.lists.linux.dev>
X-PR-Tracked-Message-Id: <adx0Aa1nOikgC521@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.1
X-PR-Tracked-Commit-Id: 168e4b208ca8c2e04de20cc6cb7e2fb035dc1ec8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5af6e08ae74ef4c9e59873c7265ca4894205c636
Message-Id: <177629041571.2457809.3667321002605533294.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 22:00:15 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 13 Apr 2026 04:41:37 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5af6e08ae74ef4c9e59873c7265ca4894205c636

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
