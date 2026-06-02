Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF6936DA10;
	Tue,  2 Jun 2026 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370250; cv=none; b=Z7Wbbb/O5B1L36M+2kUCcZaTPjzYokyzjmBwo2aAKpf/4KFNssN7a7bAka+bz2m/OaeldijrdsVGC5t4yF0wmbOQYrmqi6UcflaFG8MaaI5XaQG4Vf84tDyssUdtQStGMxPlSbwVUCmugPLSKzs5+xFpDrHWCRvIi2ei+PfpumE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370250; c=relaxed/simple;
	bh=dQ9TdyQg+VSIOrOMkMKim6ThMkAAn4/A3GjbZNaHwY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNapCRvaDerk6T1pGJm+CkUnLayOKKai0hDl9ZmyCMcamfU76SNaRhqpnQHYCYvAgaGMe70LDnPvCt050DgiPYSR+2l/XkUq45rvk66saiYIwqMC7b/G9793x23MXiQOgOZb5M1+MbrEUN3N5X7pl8nXS6QXW/bLtdkbQjSligg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1HjJNDr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1HjJNDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ADE1F00893;
	Tue,  2 Jun 2026 03:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780370248;
	bh=Xc5ioyDXh9a//Qf5jYyeNMUePLxfyBspPSZIpQRq6OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e1HjJNDrXcY3+CxoNJSB82Mit7v5CVoaidKAz16pD1Gz/5Xfe3c7L9tAqjUXWPT+M
	 g+2VXi2KBUGTtiBUTc0Kk30b9eDl1ivLWYbpR88tK9NsmWx8IpWQG/LMt+WuLrUxLe
	 qYD4qw/H4MXEBNV3fIhHhP25iwHson/FuIrLxCeiuTIlis7J59OtKtKOn4HMtD7m+8
	 k0xv76XGWRVbZrDtW33eY0igRUCsJTdeipc2xoyXJQHS2ZqYBPQXi/tUZWJ8XqWccu
	 pJqQzCyagQtZKWQxoxSPTjXtB5ScW6TgP/QarpB7KC/cOgmDfO2hpUP1yxRoBVG4Aw
	 DhgN0Xbnq8yqA==
Date: Tue, 2 Jun 2026 03:17:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/chrome: Prevent build for big-endian systems
Message-ID: <ah5LRYKb77yaDIPR@google.com>
References: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260531-cros-big-endian-v1-0-0cc90f39c636@weissschuh.net>

On Sun, May 31, 2026 at 03:20:14PM +0200, Thomas Weißschuh wrote:
> Both ARM and ARM64 which are a dependency for CHROME_PLATFORMS have
> seldomly used big-endian variants.
> 
> The ChromeOS EC framework and drivers are written under the assumption
> that they will be running on a little-endian systems. Code which would
> be broken on big-endian can be found trivially.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: Remove superfluous dependencies from CROS_EC
      commit: 6b81cbaf36f4a4735c1bf2bb609c8e53e2d5706a
[2/2] platform/chrome: Prevent build for big-endian systems
      commit: 883f968dcbb08a155101e3a943557530d4ac0463

Thanks!
