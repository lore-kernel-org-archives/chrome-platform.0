Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B61F4181
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769500181; cv=none; b=OgjAi7kSO2NzZo6q+lpY8+3/gBg6om2Aez8EjpMw/kjckcm4mJ6thguMHV1LvbUReQZ99o8s7YwzzbUwSPP0yy1TMYGGLfXNR47z65/F1sn6VPL2NJpQiHKVHpWAw3CH7KbFanW/SmoV1A/DvOHJkzu7DlkTq1LtgdXe4erQ+7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769500181; c=relaxed/simple;
	bh=qrQ87QTrbaOrbHIVv8WS9zmzzginkYNK7xoiselLuZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r50S7sgCJguo+oNV05lwwOvCgzbwlxmqSas9Pc1cp6ysbXJ7y8v7U4QK0jQVqoTR6cAo9MbRmldG0anie4OAKgjBU8JZxbIwxJmawWRexXR6LalXAUD8R64EcD+mVeSwJ8k1XmgQTflkd9cwymKaA65anwEjjVtqWcxhXK4SLeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4We9BXl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4We9BXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BEAC116C6;
	Tue, 27 Jan 2026 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769500180;
	bh=qrQ87QTrbaOrbHIVv8WS9zmzzginkYNK7xoiselLuZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4We9BXlHjcJEqo3Ujp+UHLo75poXn8hJg7br0K4cxXJCJy7yCF/haDDSuNRi2Yc8
	 OmjUBPC+dB3S/iWMoNopK2h3ENprZFA86NrlgMNmDv8TnRiFmgYG+Pe50lKerFXKM9
	 DM5mU41EOqd4sDxX2phrf3e7und166sdD0LpSMTClvKF7ogWN0yegIxU+XjRuhI3qW
	 R2oDI941Y5fytgzVV9V1I7qvLwzsrhcM77F5WVdnQGJlPWQFf6JZYOPHbVn1/g0Owo
	 IuLpbL75T08I/+Hba/I3Et7xnzg6Za7KuiUXkVSTlXkOmkllWe7BiwsCMZQp60ONAT
	 QjMr/D3Y2wJFg==
Date: Tue, 27 Jan 2026 07:49:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
Message-ID: <aXhuENnpeevg7vpw@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-12-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-12-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:21AM +0100, Thomas Zimmermann wrote:
> Add corebotdrm, a DRM driver for coreboot framebuffers. The driver
           ^ oo

> diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> index 514c95f9d0e3..e81ee5746e2b 100644
> --- a/include/linux/coreboot.h
> +++ b/include/linux/coreboot.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/compiler_attributes.h>
>  #include <linux/types.h>
> +#include <linux/stddef.h>
>  
>  /* List of coreboot entry structures that is used */
>  
> @@ -64,4 +65,7 @@ struct lb_framebuffer {
>  	u8  reserved_mask_size;
>  } __packed;
>  
> +#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> +	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> +

Does LFB stand for "Linear Frame Buffer"?

I supposed the LFB follows the struct lb_framebuffer in memory.  If yes, I'm
wondering does LB_FRAMEBUFFER_HAS_LFB() work?  As the struct lb_framebuffer
definition is different from [1].

`offsetofend(struct lb_framebuffer, reserved_mask_size)` is 37 in the kernel
but the tailing data (i.e., LFB in the context) might start from offset 40 in
coreboot.

[1] https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L232
