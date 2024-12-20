Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55377DA7F;
	Fri, 20 Dec 2024 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668122; cv=none; b=o7abbPT3/NOFlZLeVYPxZnquJBh3i+50lJQIxek78Ir3BLlayGRlNsgyiKaqvc8+nqUPN9lzJjsKuvL/tGf3wGDmou8iMNf6LmelmgqlUbVlBZtVQPtx2P/yVkHlm85SVFbR2kq2muakv7Mev9IhWRkId34duzz8IEbXzjE/vJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668122; c=relaxed/simple;
	bh=rbugXgmu/Bf9y1avq1oVFiMjHUyP7ghc+eAAlKRHelI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF69Ss9z6VL02UKSaup0UopdJ/D8zsSfatr7cYS627nZzAD55Ct7P31dwjTphTARDKE6QZULYx4YOZbdHUWPXeu+Vd3Qc+SAFny/vPTrhTP0mAfZ/83KAVoBGGRtp58Kj04iTgl9LBDyLFAUA5jmo1l2NQQynUDzdUeYFk/dQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmICHGKJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmICHGKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6E3C4CECD;
	Fri, 20 Dec 2024 04:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734668122;
	bh=rbugXgmu/Bf9y1avq1oVFiMjHUyP7ghc+eAAlKRHelI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmICHGKJeAJ6Jz2EpEG2xPuXGy4/n1DxdwgyC1I4A2NwfIwNuzIf1FRz5wbQDcRUk
	 YRon3GHlsZ9OsI11D2rkIX3cdbkMIGCB+SMLQpDteHDwTSgKT4Q87c6LcGLZGAHagH
	 yEFJgG4AqZV5O8yh5fAy5dBu5p80cg1l8s0rdYoQVEKUBkZNSHob07zBxJ7kXOe5Kn
	 WJWEWwOHvA2G2Md9nZ42lf1HXH5WckPPmo8T4tS+43Ly30yR8Y6Fbb7VaVOSDWB7PK
	 5aR5OSTwjaTD6Ui9B9esGyZvagVRVPeZiLe/8y1ehkSlRPJVbs3I4X5yQLnjeI4cA6
	 I/DAEyA1JnYEQ==
Date: Fri, 20 Dec 2024 04:15:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Only check for events on
 MKBP notifies
Message-ID: <Z2TvV7Lzsl81yuww@google.com>
References: <20241218015759.3558830-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218015759.3558830-1-robbarnes@google.com>

On Wed, Dec 18, 2024 at 01:57:59AM +0000, Rob Barnes wrote:
> Only check EC for MKBP events when the ACPI notify value indicates the
> notify is due to an MKBP host event. This reduces unnecessary queries to
> the EC.
> 
> Notify value 0x80 is reserved for devices specific notifies. It is used
> by many devices to indicate various events. It's only used by cros_ec
> for MKBP events.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_lpc: Only check for events on MKBP notifies
      commit: a15ab7a5cc2a17b6a803f624fcf215f4e68d56b6

Thanks!
