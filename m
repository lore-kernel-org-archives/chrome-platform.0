Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF733033C
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423102; cv=none; b=C2JX9GJFzFRHsEujpaHkFoeYTirebLkndlAawpTGw9dFTcACgXX/k+KJIyDlToP6Daffqf/scS600hymYA5Nt8qnQ2m0PsoLGaHRm9yssi8E15nlsqGSTiB8i4YZgM7qDObkWDHONKJ04RFoxylDGEFqiDox9Mr8jc/g7+S0/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423102; c=relaxed/simple;
	bh=rag0QuEAtuEgPaG+JU7H/3uGkGlRj/rw6uQhP+G00Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlfQ+WNcWVPUBRHFp+wdDzfRx3RghnW8zcuHzBY6hQbghrjA7VwzarnALIfKTqdkkMCaG3m3519Wy3uA5LdOpXiupml4X1jC3LGExBWRkh18ZQwyfsVxJjIDGqPTUxk/t0x1olqpHHaFvxnFhAx1t7DAh2ez+4mHYfbXK16UvS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClnnYjdZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClnnYjdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A694BC116C6;
	Mon, 26 Jan 2026 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423102;
	bh=rag0QuEAtuEgPaG+JU7H/3uGkGlRj/rw6uQhP+G00Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClnnYjdZiPfzewpDG4iVTzI9R5rw3yPpVgh09IPQcIhR5BZTjQgHA/10Ev4jyoPOT
	 +5gO+SIQY6H3yXB8wUa09MYkrrinW4xEWJ8tzxdExB8yaJApLYthQgCFxMj1I7NNEW
	 TK2hQA1OMSY3ymWLjB23myEMj5T/oaKLI21Yc/1jJwxq164mUrAVpHHv8cEtCQU3F7
	 z4o5Gj2t7JoVD1gV2ZABAtLNFtYjDzMTAHg3PRdK0w/e0tdXYXzFF5J7Od4SFRQdpP
	 LPOLhe5GoZ2BQ6uXes+vM3qpdSWs6dx/La63lJ3hldFZdCXcSssK1FBQ7C83lHortw
	 Oe6BnC9uxHnEA==
Date: Mon, 26 Jan 2026 10:24:58 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 05/12] firmware: google: framebuffer: Fix dependencies
Message-ID: <aXdA-h7DICJ4syLT@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-6-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:15AM +0100, Thomas Zimmermann wrote:
> The framebuffer on the coreboot bus represents an entry in the
> coreboot payload table; not the actual device. [1] Hence it must
> not depend on any other driver setting.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com/ # [1]

The driver has no build-time dependencies to neither FB_SIMPLE nor
DRM_SIMPLEDRM.

The patch makes sense to me,
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
