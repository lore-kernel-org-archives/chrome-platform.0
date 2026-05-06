Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638014B08A;
	Wed,  6 May 2026 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034498; cv=none; b=qGGbdzIYtDfp4uCKLeTZzTNGrgPImy5akHkNwk38pfY7rHAEbH4APJXnTv3KdF7u1WCdJLAuLoSjvmXTu2arD6WO3aVdVhabl4NdOpSEDCjwuYhw16ShMKOR3bBVwLBLX8R79xsPGF1OGZ//vuoE2qhz+ra1LIxV/8d/BeMkP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034498; c=relaxed/simple;
	bh=DZ9nkG1RwN5rYhQ0DxOeLA1xUg02CRqZFiVnaR3tmZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nF9Oim0EUATv0eoFqxPVKsTou+mAm0ogLoW/Yh6Ehj0p43bfC4KXCkrU6yzUsvJSVg7WmyeuI+Jm4uCQouXgChGFqnmvLUPX6jlVJfsuD0FimA/8cF4tBjb3nJQU6LNaH9FEhZA5XgwxcmzriyeKx0gtbLgA5wqmVPFxUTyZjl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5yeoWWv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5yeoWWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D387C2BCB4;
	Wed,  6 May 2026 02:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778034497;
	bh=DZ9nkG1RwN5rYhQ0DxOeLA1xUg02CRqZFiVnaR3tmZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5yeoWWvgm2QXqprRhxmapmPQlqChtyE7ds1FBXUdAl4vCzDu/elWS2Am9sD6LWZ6
	 0wjlAQy1DuNYE5nIyCJY3ZfF1CUdSODcmnJMK5HnjYmW9vMjLeyZ3Eu/6pyTpH/Iug
	 FlY1gLXqUCOWmjSasH9Dy527UYxRi1RzIR4Up40Bsm8dMbuSlP8GUzX+9AmJpwSaZm
	 khq+crgXr1FJ7nNggNVge32oriYuLX/iKY6H+wXRFf0oiMmfAk46b0HKUl0JjVqIAc
	 /pBWvGexl6d/eStUua6bwmj0n/jDKCGM7X0UX7VNohDqxG5aMjAUosmeE3SZXJ8S0O
	 JzSXyYsR6xcXQ==
Date: Wed, 6 May 2026 02:28:14 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Init mutex in
 Thunderbolt registration
Message-ID: <afqnPhTMJkcWFRdL@google.com>
References: <20260505053403.3335740-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505053403.3335740-1-tzungbi@kernel.org>

On Tue, May 05, 2026 at 05:34:03AM +0000, Tzung-Bi Shih wrote:
> cros_typec_register_thunderbolt() missed initializing the `adata->lock`
> mutex.  This leads to a NULL dereference when the mutex is later
> acquired (e.g. in cros_typec_altmode_work()).
> 
> Initialize the mutex in cros_typec_register_thunderbolt() to fix the
> issue.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-7.1

[1/1] platform/chrome: cros_ec_typec: Init mutex in Thunderbolt registration
      commit: 525cb7ba6661074c1c5cc3772bccc6afab6791ef

Thanks!
