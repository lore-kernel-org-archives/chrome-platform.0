Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F40E222575
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501045; cv=none; b=bkBjdzCj9mQ+Ep4zrS2xHesVwFxpWHp9TFygmDNYd7TYWZPYc5pHkjRPAik5RKRuPZAamK1CFI1EJ7Wdjxbe157xyV//prl2Bkxn6SUQDeTiyNpvmbDqU6Yu+wwPLwkwGTh4wVGVe9jCw1D+du++sxLjtsCqaqM/fmaI1nRF1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501045; c=relaxed/simple;
	bh=Qz5Colq+aYuTcYXa/uYYzxOdfv48MJddodnQZw7klwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpiM03wBqPc1Eof0qX7q18N2i6qy3Phy6xaoBXBL5pWnXw9qaLO5ImU1rkbCobWpx4qE5pJCGv5owOR1DdVXHODt4LZ0gFCUfvsqmMHnBYV4RigMob5l1G7QZH4nhhIXO362ZzTvxXY7WzvXjleSuD1wSWHdvEjzg8XD6ijTNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeeAUez+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeeAUez+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DD2C16AAE;
	Tue, 27 Jan 2026 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769501044;
	bh=Qz5Colq+aYuTcYXa/uYYzxOdfv48MJddodnQZw7klwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeeAUez+ceIJtD4NwNHFZXriOGpj7C162c3Ux1ZZ/HgJ5oHe0HjrI04bzNj5ExxZU
	 q+dTM9fCbzTZ3AtrwzETQ8kUuYGvds+LuNyiGz87mVLu8DN2Hof4KB5tT14pouKVPw
	 mVSDk9WENm8ISLOpewxnZvbttBDfDSCAp5kvDYFuTv7jVTa81/BvEEMOGienD5yU7e
	 t8Q4iBdeeuthv18WN/MR6/gt6hlO0M2hW12Fx4GsLezQ3FIelg92EpUVtnz+dGh/4Z
	 aHoC+XCiWiCxv1o964awRedTzlFmDPN7CEK/i9DQEt+6seElYJ0D3iuxCFSpunsR0Y
	 +299PdXBCZW8A==
Date: Tue, 27 Jan 2026 08:04:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/12] drm/corebotdrm: Support panel orientation
Message-ID: <aXhxcS1Sifj_qeyb@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-13-tzimmermann@suse.de>
 <aXhuGnUlM500G6Ht@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXhuGnUlM500G6Ht@google.com>

On Tue, Jan 27, 2026 at 07:49:46AM +0000, Tzung-Bi Shih wrote:
> On Thu, Jan 15, 2026 at 08:57:22AM +0100, Thomas Zimmermann wrote:
> > diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> > [...]
> > @@ -63,9 +68,13 @@ struct lb_framebuffer {
> >  	u8  blue_mask_size;
> >  	u8  reserved_mask_pos;
> >  	u8  reserved_mask_size;
> > +	u8  orientation;
> >  } __packed;
> >  
> >  #define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> >  	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> >  
> > +#define LB_FRAMEBUFFER_HAS_ORIENTATION(__fb) \
> > +	((__fb)->size >= offsetofend(struct lb_framebuffer, orientation))
> 
> Wouldn't the new field in struct lb_framebuffer break LB_FRAMEBUFFER_HAS_LFB()?
> E.g., fb->size == offsetofend(struct lb_framebuffer, reserved_mask_size)
>    -> LB_FRAMEBUFFER_HAS_LFB(fb) == true
>    -> LB_FRAMEBUFFER_HAS_ORIENTATION(fb) == false?

The example is wrong, please forget it.

Again, I supposed the "LFB" is tailing data of struct lb_framebuffer.

I meant: is it possible that there is no tailing data
      -> fb->size == offsetofend(struct lb_framebuffer, orientation)
      -> LB_FRAMEBUFFER_HAS_LFB() == true falsely.
