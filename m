Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC7128727A
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416130; cv=none; b=NiQ6/5z0t78NQQaJ4f7/0usRAzF9cz/5EnvYGG+JkQhTaBelARJwUNU9vKm3AtkRDzmdZWxkWdZtvkKe5XHW4a716y+PIxR6vVKhzCFcW4rjU4IBflyHYrRhTWcap8qysQhrHOUWu//AJqAu3nENAKosDWA+oINxvwTEKggutgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416130; c=relaxed/simple;
	bh=i0L0U5tLgBAptErn/4aun1UYAA4iP6N9USbirT82Ink=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFKdBgcDtaTPZfuI6m+OByrtc4I+dHRczbi8ki9PKv4GRZzWqN06rehI9GmC8z5hX0sBhcbji1ccMYUd2l5faL/D5ClyhKqlv0YeDJO+g1e/JCmkqFWWQ71lchBpHHfnm2RoEjBzkt0Sx8AHzbgSaIYUdBIrohdcy5qFTa6cU+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD3PBLjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD3PBLjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1D7C19421;
	Mon, 26 Jan 2026 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769416130;
	bh=i0L0U5tLgBAptErn/4aun1UYAA4iP6N9USbirT82Ink=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KD3PBLjMJ9sIxP/zV/qBGzjf6J5eWHPEWWpaSIzmSilD8K5eMXJ6MUXvSQ2IYtZWg
	 g2z/41S1QCjX3daNqyPSKPX6GDsC6ZMoyrBmGMX0af0JJQw7wfNczcxZxuhGH45Rt0
	 ZMXXBe5YjjWdCQZV26dAtc/vC5oYbGkO8lvjrWXN7xCgvUIYHj0sNmghJLk2unbVPg
	 smdAXUiunsxniW+M/pdzAJwsz86WhUIcWDRlV4N9Z3wnm34Df2KdfBDNt4k0dnLX2X
	 e+DaxhBFf5PSwXaHM5l6mE+epv27qc8k13tyViY+VyZh5nNV2Rne/GVQLnL5FiU0zG
	 mW52icb+IROOA==
Date: Mon, 26 Jan 2026 08:28:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/12] firmware: google: framebuffer: Init memory
 resource with helper macro
Message-ID: <aXclvkVeqHTJ7xJX@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-4-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-4-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:13AM +0100, Thomas Zimmermann wrote:
> Initialize framebuffer memory resource with DEFINE_RES_MEM() instead
> of open-coding the setup.
> 
> While at it, drop the resource name to make the kernel use the device
> name of the simple-framebuffer device for the resource. The latter
> includes a device number. While the meaning of the resource name is
> somewhat fuzzy and varies across entries in /proc/iomem, showing the
> device name seems more helpful than showing a fixed name.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
