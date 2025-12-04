Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6834EEE9;
	Thu,  4 Dec 2025 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764876646; cv=none; b=j1KgmewAn+CqMZkVfB/SU5EZyrMP5GJ0KyEtcjAVI0cZJDqG/euWossuthfTDFWHx3AqV8YuGNIUITymGgOiIpXq0O1Pe2MM9U40g6Y7zcWkvu/2ql/royLyz/yTTZrTnyt7jjnC3edQpzfImlqXtxgWAwd0eHi2MzqYzUjh5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764876646; c=relaxed/simple;
	bh=qetgFrsKnuKdHNsFypc7aodW9L9z/3AAlejwXv5dZg0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F1ooJpt3EQfRidrWe0n73vCjkd/98NcNDAWpuu14F9ouIgMe+8xlV4fnvT42OARHYX5XAJTmsWiJiHnSMXV+gj4Sg3ZTdQHFSGQNHKoIz6CgOunLGUu2pxgFuAcegoxa+KtHhziPEtk3E2eFw6yxxEVhkV2DSpKXOXWNjPRICz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBtjTGqB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBtjTGqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C4EC116B1;
	Thu,  4 Dec 2025 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764876645;
	bh=qetgFrsKnuKdHNsFypc7aodW9L9z/3AAlejwXv5dZg0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FBtjTGqBOfz3ImGJvdrbHoHhcDFUQYXnqscdyA1CyBHzdOmDktDUB2mA+fWFQ+Lpp
	 hlkyyI5dN3EGweL4DVLxeDGD8q8Q1QfciHyvjaOfGiN8OCvIWT6hRN1tLeB4a9DPj7
	 /XAsaxJvue1hrF7h1thwBRns3ZhtC4B9fxocJqI/RA4mfv2GJ904+Z2f0aUxegvurc
	 Mga0px89xWlyZ5nWhqs0/S5Mdw54yqSkCY3HwpV8EI2K3ykx9C63niqQEahI4xlPUd
	 lDP0mdBJUACwYxzE/1istYCWOxN3HVQ+noL/mzMCcCJ5IdtpCuUnTOeMAPhqLij5Ip
	 OMmONDGiYSM0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C0F4380048B;
	Thu,  4 Dec 2025 19:27:45 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aS0Q71JuMYM56FZ0@google.com>
References: <aS0Q71JuMYM56FZ0@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aS0Q71JuMYM56FZ0@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.19
X-PR-Tracked-Commit-Id: 52075d2c7595cfd6c1ce211a9cd138a9b067c448
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04265849c856ace113e75ae88069b8665bd4dcbe
Message-Id: <176487646386.944914.325165621070354070.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 19:27:43 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, tzungbi@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 1 Dec 2025 03:52:15 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04265849c856ace113e75ae88069b8665bd4dcbe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
