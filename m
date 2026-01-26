Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEB3115B1
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416146; cv=none; b=Pay6ThlJqeQSRxeTsOlJV2yGMx3M5IxvWOrr7C4vlpoxEQFN+MXW0G6zmX1WERgAT5TFGs+3nDL42Z5PJfD3v0qBlp+HKG0tO/2YP+pub/OWeKfbLP3wLmTMOoCHXw4x040ee5emhEG+fYUe3C8tl+HHGmkhnZaGtOXtb23YxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416146; c=relaxed/simple;
	bh=duv63FSna/7UJJZ/FsHnyQa6lqZbbd1PPZS3QmcNnrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGHecoqnk5MVT8XTO3OqhNlUhE/UQvtLabmxsxzEG2usCyypk7sgHbxj4sAYkQN0GUV9rBWtZWUB4y3B1cD+bQjWpRXnRLiE2xpJX/ys95proq0Bs+SPs+fHYz9AxzBC87WrS7fCUDKpxdvMVhjAJ5L/So6ioSy6rw/BMBiu7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+QAmRBq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+QAmRBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07773C116C6;
	Mon, 26 Jan 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769416145;
	bh=duv63FSna/7UJJZ/FsHnyQa6lqZbbd1PPZS3QmcNnrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+QAmRBqjxBgW1zExN8CFs4irRmp9XHTWSdmyaACeX+KIVQ+agtMRIakolZn8cy4s
	 lDx9Uxng0aegOT6V2/OgTfsFy2eg0A/cQ5WtrOsI+LrTTJiLiMfc+fMj19Em/VHL9/
	 4j+hT9kHLxHb7ZKnnHxKyY9sEhIBjKAhB5w/BLkU9F7mfJqyED3uOT5KGfloHbDoY8
	 +nrJDKGgJrqoTOBRU0+jJOSS8uiE4p/V6VhM4hT2NaflpoCe0t8FHWh3FoiZ0WYwSb
	 H4qmjBn1rLB+ZfLjBz9EcOs6Wiq1yGl2+JSYI+VIFPx1aRskOKHoaSiw7i7pjX5HVc
	 cnQl76LzmhPkw==
Date: Mon, 26 Jan 2026 08:29:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 04/12] firmware: google: framebuffer: Tie platform
 device to PCI hardware
Message-ID: <aXclzjXprwN8HMQr@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-5-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-5-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:14AM +0100, Thomas Zimmermann wrote:
> Use the PCI device as parent of the system-framebuffer device instead
> of the coreboot device. Prevents SIGBUS or SIGSEG after hot-unplug of
> the PCI device while the framebuffer is active.
> 
> The simple-framebuffer device depends on the PCI hardware, so this
> device needs to be its parent. The current coreboot parent is no
> longer needed after the system-framebuffer evice has been created.
                                            ^ d?
> 
> On systems without PCI or if no PCI parent device could be found,
> the platform device hangs on the platform bus directly.
> 
> The fix here is similar to code in sysfb, which contained that same
> bug.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

With some minor comments,
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

> +	if (parent)
> +		put_device(parent);
> +
> +	return 0;

Or maybe just:

  ret = 0;
