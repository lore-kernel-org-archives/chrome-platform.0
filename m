Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9F1B0F0D
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032903; cv=none; b=YIFElR2SMf4xz5WuHGghzwVJfyAv+9lwshzVK54l48cRQOtUX57DB0JGoZrs0JI1qynLV5jaCvmlkJ07hX+MriwMpgUaYZkgxCE5txjzChU5/Ipbzcc1+dyzFLG6jFzd+DyZIdIs+PRbzQalHaYMuNpxIXUP6TihnTDjNY86UnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032903; c=relaxed/simple;
	bh=dRXjZfVKQdyCTzo6xOCy0tUroKEEG+AxQHT9LS2Cin4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myk4THdJzzohjIW0ben5Y1d0L5FLfw/rAGhGqEOcC6U7VgL2q78n8rroxg3qIx92qUGTjKEn6JwQGYrY2RVOqzCwq/bG94U+fEMDJ/hZ65i8xvaN//nhfqrhJyUQ90ivIG/mSAVXfuGzzKW0L1qG3nPS6sokTHjCExtTlxMAn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdXbMlo9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdXbMlo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54E9C4CEC6;
	Tue, 15 Oct 2024 22:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729032903;
	bh=dRXjZfVKQdyCTzo6xOCy0tUroKEEG+AxQHT9LS2Cin4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdXbMlo92B5C7jRl8HOZGSXXiqvvqyqozw1pFSKTCNFMOQP4rhZ30Yjm54Act3MsS
	 vOpm+4tf6kIbeOglejIBesn7qaRHCBmnSQMBQ0Twj0UlPH5Lb1MmbSiODjiix5TRDN
	 gqyHzOSF7mMuSr3Ql4qifkiWIODlMEF0y56rT5pyBQeiA1AF/Sx4CvZ9pnOsEKbdHO
	 lTSUOZ3Cu+PwVgndcznhwWZmGxiknW1SjpxwsGPcfuHFevEb4lC8mS8K+YIpT8s40w
	 AkooIFqvEjzTpyzw07GQZQoGujZQm12mg9wCmFolagyuw4j83PfAtVdiU/Pgvgeekf
	 u+b5ypy/rM/ew==
Date: Tue, 15 Oct 2024 22:54:59 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yuan Can <yuancan@huawei.com>
Cc: briannorris@chromium.org, jwerner@chromium.org, adurbin@chromium.org,
	furquan@chromium.org, gregkh@linuxfoundation.org,
	rajatja@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] firmware: google: Unregister driver_info on failure
Message-ID: <Zw7yw3nuaFew2AZu@google.com>
References: <20241015131344.20272-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015131344.20272-1-yuancan@huawei.com>

On Tue, Oct 15, 2024 at 09:13:44PM +0800, Yuan Can wrote:
> When platform_device_register_full() returns error, the gsmi_init() returns
> without unregister gsmi_driver_info, fix by add missing
> platform_driver_unregister() when platform_device_register_full() failed.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: google: Unregister driver_info on failure
      commit: 32b0901e141f6d4cf49d820b53eb09b88b1f72f7

Thanks!
