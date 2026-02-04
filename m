Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4970833985
	for <chrome-platform@lists.linux.dev>; Wed,  4 Feb 2026 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770180348; cv=none; b=bKXI07BxZe6HlsI+pdlBMwi8tHVSYcrygNYWyp+swAXvJLzZNQ/7ZGyEI+eGFVt4ImYQtejBi1G3JnX7fL4qnEznqN9dGUN+RWuvGiunRL2S+ilJo6h3R45B8a1cxWEVN276vkXlCRS02CTTBN0LPtAPdDlySfRaTHjUFaI9XzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770180348; c=relaxed/simple;
	bh=jKHRIksqHdq49t+LWyb/6ot0ZQWvugM0QDN3DXWtTxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHQlLIxTN0gW7A1aNBF253U9HJq5KK0zX5/nd+P1K8e9i6S/VZkqQweExEpkqj1Tn7DM46s1mX9EqHFhJrRWOkcqLxmD/paDHNEy+4HKEKivL2/XXohUabsRsb6JIWOPmXOD1A0mCKlCvJyB0gKShJiFji01iTA3a7o68ErwRxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8M5XZL2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8M5XZL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0E2C4CEF7;
	Wed,  4 Feb 2026 04:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770180347;
	bh=jKHRIksqHdq49t+LWyb/6ot0ZQWvugM0QDN3DXWtTxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8M5XZL2vOSX/u0vcgS0c9oPaIzn1GOfI14he5M0AAuvL7+tFld91Mfmnil7+dBey
	 2ddaPa9M2O6dH0HQJSWM1lQbpDX01SouZTwLbAg5WE6P7TxnTb3Xa7/VcUqxv32s0q
	 MJ2+D2foEhVMCCW2JYtXPttM1xbYR47Z1QXvxyQUKkSwfS7IxOwnrSknookevD7Jif
	 EYUYlx8OsWTr9fY/35Hy8i3LU0Z+WgoSuSQOHYOXZK364vJJnVKFBVcGfZvE4TARuZ
	 wNAb4fNMOm94lVD8t+wlMwfcbmcHNZRBJyCYoV6W80/quvsZHBOoXjcr9jdskBb+M2
	 ILEStEIIlgR5Q==
Date: Wed, 4 Feb 2026 04:45:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH] platform/chrome: lightbar: Remove [0]
Message-ID: <aYLO-UpmBAY5GyqW@google.com>
References: <20260204034848.697033-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204034848.697033-1-gwendal@google.com>

On Tue, Feb 03, 2026 at 07:48:48PM -0800, Gwendal Grignou wrote:
> Variable arrays should be defined as [], not [0], otherwise
> the kernel complains:
> 
> memcpy  : detected field-spanning write (size 9) of single field "param->set_program_ex.data" at drivers/platform/chrome/cros_ec_lightbar.c:603 (size 0)

Oops, https://lore.kernel.org/all/aXhWlV6SyaAAum-Q@google.com/ raised the
concern but we haven't addressed it.

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: lightbar: Remove [0]
      commit: 520e345dfdab89aed4a0ad98d5ec35086661a11a

Thanks!
