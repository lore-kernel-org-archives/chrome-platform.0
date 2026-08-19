Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4D480335;
	Wed, 19 Aug 2026 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154787; cv=none; b=bXevA8wOdqRS+4XyCkwe+Jkzlu75LIVsgGUBmmWEQWDraKuzZhtPXPy9+MnVvfOE+UShw70b2oxsCRYXh0rjrSHhjg/NPylsYEIf8wZpupyUeSsxARDgQJscepO/hrmbjp+s8TUAQekAU9pxxF8nKgiunjGCsswIfCEVYHbmgNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154787; c=relaxed/simple;
	bh=3IZsIXJgZq2y1u0Zf8HdlxIIS1Um2F6LZlYQV+ZCEhM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XA0TrPnpVebmBf+Uwb47xD1y6ACNDHIhfkRnE85txFf84zULNgPd3+xcPRGQ8jRs7jeGfIuFCLCPYJMzoPlfRjxKqV6iEVPJ6AUlkJIw4FodxP62+XTHL5tHWLBAz+nYq6o1JJ/eNvzM07lQcesoGcB9mvWGkqSoj1QG0S2HBng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMRyzk6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMRyzk6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A451F00A3A;
	Wed, 19 Aug 2026 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787154786;
	bh=PGJ39dy3ryaS2hWg/i2WUsLjrb34TTOCzoCqJifIEf0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=DMRyzk6IuSfjmiJxO19qaBEI6qPAjnGYPrc29ao149Oj9kryxq1pgXCo6DYbqvwGc
	 VGkzuBfOc8npW0zzlsu1oDtLhSNIGsPEIDDkcFs1mrQLWbj1fsh1Ukci+IhfHy9he3
	 9ESucqCU6LqrvBiTk/N730bhLgqvZPaQa1bw3sty8MeAY3M4WOKHrk8EydcW0mwAHi
	 2Rz35YHHghDcpPWEFFWldoeDR2L+hZz3IEsOybB00/Ylzh9LPrsm4sgTov1C7WhCC3
	 /fsgZj9yqQ8arZuaya0syLN2jM+jPqnJRjgZW1wxoM7Iej1cNUUUIdXnCclH7DjyIS
	 U4amT54ihfcYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5683B38119E0;
	Wed, 19 Aug 2026 15:52:18 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform-firmware updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aoJ8Pbv35-mKIHun@google.com>
References: <aoJ8Pbv35-mKIHun@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aoJ8Pbv35-mKIHun@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.3
X-PR-Tracked-Commit-Id: a58a57a1076f8c5dae0327e3710899478c3be901
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8bf40d154020dd323596933ffaebda7111828fa
Message-Id: <178715473685.3549109.1249921207981552346.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 15:52:16 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 17 Aug 2026 03:13:01 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8bf40d154020dd323596933ffaebda7111828fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
