Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227626F2F2
	for <chrome-platform@lists.linux.dev>; Fri,  6 Feb 2026 05:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770354847; cv=none; b=hnAILDGleXE8Hazj52wfTs4uICwmB5sQlVw15rXmJ2jMhLKskiHXkG10jTyV5ZqVOA2lj9IUGuR3UTt6r9mKVbxkJSTDapZii7J+hVSLD8GWEnsTVbethbhJiO/0VAIF6o02arfiqK1pR327q0inSujrDyZ/p1fVMsTOJQDYZk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770354847; c=relaxed/simple;
	bh=KMl3QlTFnteWHPynJs9RzC7YCzH6lbUv5uYhAVsWxtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIG3vWCwvgd/tnw6vcaN/6YMBA2Pjtsv5I6IMZkWVlA1zS8InYMb6SpRTj+bKr6vKZiwOCqww+LFsec7hYbB+EHZC04IqugODIYgAcx2DMGzDVas56qLNfg0EqJMROR3a0kmcPt3D3L7dlDO7JYl2ugBMURD5/+bP9+x9DEW5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVPA2d/3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVPA2d/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153BCC116C6;
	Fri,  6 Feb 2026 05:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770354846;
	bh=KMl3QlTFnteWHPynJs9RzC7YCzH6lbUv5uYhAVsWxtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVPA2d/3TAPEDTiQeZt+qMRnw6ml+PXHTfPeLZLVamz1l8A7L1AkBdfOE3vH/ww0Z
	 kM/ywttnqAj0JfhVfiEOd7OvZYwReZgFcQrxURuMqrCb6BhgUnhKJvFXlhYqwgH2BT
	 3oLs7ibhODX75ocB86Nfn/NLNpr3nxT5/8XaLjWz1h4annYNHjVFbxThl9UGMlNT2E
	 p4cpUxIHsaxHRnNx7RGJDH769V7Cp5/pBvbY/2yTn3lOEWTx9LNnw0+x4krrDV3Zex
	 9SXAxB9hKcKl4WZ8J2uRz/20h/sH8TzfRHqDQXsAsHX8y3JQum6H8diO//NVEg/gNo
	 2QLNbyeE/7Hww==
Date: Fri, 6 Feb 2026 05:14:03 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
Message-ID: <aYV4m5Q1U4Nc1qwm@google.com>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-12-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203135519.417931-12-tzimmermann@suse.de>

On Tue, Feb 03, 2026 at 02:52:30PM +0100, Thomas Zimmermann wrote:
> Add corebootdrm, a DRM driver for coreboot framebuffers. The driver
> supports a pre-initialized framebuffer with various packed RGB formats.
> The driver code is fairly small and uses the same logic as the other
> sysfb drivers. Most of the implementation comes from existing sysfb
> helpers.
> 
> Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
> output. Initialize the platform device for corebootdrm in the same place
> in framebuffer_probe(). With a later commit, the simple-framebuffer should
> be removed.
> 
> v3:
> - comment on _HAS_LFB semantics (Tzung-Bi)
> - fix typo in commit description (Tzung-Bi)
> - comment on simple-framebuffer being obsolete for coreboot
> v2:
> - reimplement as platform driver
> - limit resources and mappings to known framebuffer memory; no
>   page alignment
> - create corebootdrm device from coreboot framebuffer code

Changelog should be after "---" otherwise it becomes part of commit message.

> +static int corebootdrm_probe(struct platform_device *pdev)
> +{
[...]
> +	if (!fb) {
> +		drm_err(dev, "coreboot framebuffer not found\n");
> +		return -EINVAL;
> +	} else if (!LB_FRAMEBUFFER_HAS_LFB(fb)) {
> +		drm_err(dev, "coreboot framebuffer entry too small\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Hardware settings
> +	 */
> +
> +	format = corebootdrm_get_format_fb(dev, fb);
> +	if (!format)
> +		return -EINVAL;
> +	width = corebootdrm_get_width_fb(dev, fb);
> +	if (width < 0)
> +		return width;
> +	height = corebootdrm_get_height_fb(dev, fb);
> +	if (height < 0)
> +		return height;
[...]
> diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> index 5746b99a070d..b51665165f9f 100644
> --- a/include/linux/coreboot.h
> +++ b/include/linux/coreboot.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/compiler_attributes.h>
>  #include <linux/types.h>
> +#include <linux/stddef.h>

Move it before types.h?  's' vs. 't'.

> +/*
> + * True if the coreboot-provided data is large enough to hold information
> + * on the linear framebuffer. False otherwise.
> + */
> +#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> +	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> +

To make sure I understand, do you mean:

- The __fb->size is possibly less than sizeof(struct lb_framebuffer).
  LB_FRAMEBUFFER_HAS_LFB() is for checking the following fields
  (e.g. fb->x_resolution) are available?

    struct lb_framebuffer {
    	u32 tag;
    	u32 size;

    	u64 physical_address;
    	u32 x_resolution;
    	u32 y_resolution;
    	u32 bytes_per_line;
    	u8  bits_per_pixel;
    	u8  red_mask_pos;
    	u8  red_mask_size;
    	u8  green_mask_pos;
    	u8  green_mask_size;
    	u8  blue_mask_pos;
    	u8  blue_mask_size;
    	u8  reserved_mask_pos;
    	u8  reserved_mask_size;
    };

- If answer of the previous question is yes, the next question: does
  LB_FRAMEBUFFER_HAS_LFB() needs to check up to `reserved_mask_size`?
  As in the patch, it only accesses up to `blue_mask_size`.
