Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F250B4C81
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554821; cv=none; b=MmvWzga24uVkCfoTuT+fXijhJMEj2Mj2Qz80j4eIQ0cuuR+umV1fc9gTt//ehdU7wDqAVGc60j61eJbYpOmdEQKaaoGOng8JJK+36rrMCObQDqsCXTigjEXfYJnrF+SghoPS/X46nghUAHx/ktvd8+CpWye3CA74PSA5UELY8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554821; c=relaxed/simple;
	bh=mLYzN5UqM+HvTCcP8XCike0pwHL9S/sIn2p4PFTMQC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuT78xzo9amuLgRA1vyWaa8IApMKembq6sLh6EBgJXGyd6Wii0qRlESK2B87oDSn0H9BgTOFvbdqC9n1tZdIsHf9CNFfOKhAtKkbpuonHNjfUdLUg0WZ+ra4VU4Saj2fgdQhDGjrVJ4Rv1y+iq9jsCoh1gqGp8WPC9lNGsZZcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blMA4ccs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blMA4ccs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CC1C116C6;
	Fri, 16 Jan 2026 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554820;
	bh=mLYzN5UqM+HvTCcP8XCike0pwHL9S/sIn2p4PFTMQC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blMA4ccs2NpwNePBouS27UscMZUBtyVqvXEfqIpT0Z3dXytTOpvIz6IBx9Sh5HWTg
	 gH+UIO1q5nfmuXfglCIOYKDxuCDDrNlRcvbvnQYKQiFEQmTraDCw+40cErq6j8s5le
	 HOgg2u+hggxKGMDyT3xwueILf25Xe6wGXfFAxhJcLIHWMxM20B7GyREz72QJ8Oksbm
	 +cc9axGurjCAls17U4CfFP8WVr21H6N9Cqfx5mZrmYjvRmfnvcLuzQYkmFNOxRSCdo
	 SrvAocr6+UdlSisCugR++V62Xhhe6z7yAfQZ3howS+cQ4qJePvK9AjE13szg81n+ym
	 C/GnBAHiM5l2Q==
Date: Fri, 16 Jan 2026 09:13:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
Message-ID: <aWoBQGckP3q8KcDX@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:10AM +0100, Thomas Zimmermann wrote:
> Coreboot implements framebuffer support via simple-framebuffer. Provide a
> dedicated DRM driver. Keep the simple-framebuffer code for now.
> 
> For each firmware's provided framebuffer, we prefer a dedicated DRM driver
> tailored towards the platform's feature set. The coreboot framebuffer
> device currently creates a simple-framebuffer device for the provided
> framebuffer aperture. But simple-framebuffer is for DeviceTree nodes; not
> for coreboot. The simple-framebuffer infrastructure should be phased out
> for non-DT use cases. Coreboot is one of the final users of the code
> (besides n64).
> 
> Patches 1 to 5 start by fixing problems in the coreboot framebuffer
> implementation. There is a possible dangling pointer, the memory is
> marked as busy, the device hierarchy is incorrect, and a few minor things.
> 
> Patches 6 to 9 prepare the coreboot support for use by external drivers.
> Specifically, structures for the entries os the coreboot payload table
> have to be exported.
> 
> Patches 10 to 12 add corebootdrm, a DRM driver for the new
> coreboot-framebuffer platform device. Corebootdrm follows the pattern
> established by similar drivers. It also uses the same sysfb helpers. It
> is therefore fairly small. With patch 11, it has feature parity with
> simpledrm on the old simple-framebuffer. Patch 12 adds support for panel-
> orientation flags that coreboot makes available.

What would you suggest to submit the patches (e.g., which patches submit
through which tree)?  Do they have build-time dependencies?
