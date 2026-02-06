Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF8347BA3
	for <chrome-platform@lists.linux.dev>; Fri,  6 Feb 2026 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369610; cv=none; b=bYnRs7go3Iu4n8o2c5meBneIdJKrnC7MliIlEHvrm8ISARPpxFnAp+HdTGQJ9t05WIyqdJk6Txh8YWVh+GkvD+PlUlVtqsRz7UUq5EibNFsLOoKIOKR9Ecr5i8fnAlpnvXG8asyq3ay50W3GTD4OQfB3Cmwm3/jNJCzZ74RAMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369610; c=relaxed/simple;
	bh=vAroDH/Lr1jPD2ULUFPe5d0gjo/V+5nxyI9p7ddlUN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdF01RnRBMNseoshNAuUI/p0wY02syw19s/IAaGJ1FKP6fof0exd6aFlBeYyCQISUgOP1EAN/vugh9vGSFiNBDqFSFIf1jiOqrsm4LEgBRs4xMNWFRfLhFh7O0oSfzryA02CNHo0VB2pUzuWybUANhVUOToDuXPVtV5GE+WtLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMF4RAMO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMF4RAMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70299C116C6;
	Fri,  6 Feb 2026 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770369610;
	bh=vAroDH/Lr1jPD2ULUFPe5d0gjo/V+5nxyI9p7ddlUN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMF4RAMOGEu2O6nEPOSn3asbDtoQpkHIyHBnNLYOKx4pNxO8lQmhzXhqbt5et4BXb
	 Vzb8bzHSqn8A2cjGLo+46gEKqXBXu3Jm0mgJjz5WXCamLDvHX8nMLiFEEkrnZ5JL/2
	 FSyPd/2eRsM+iLw/tpHLwctjSr0Bv4VVOMgofjr1Ci5GZlpYOuB0yhBb3c8/fT/K5Y
	 LIl7WLhoaXrqpEwsAUK+MHnNKv/37FMjNElJl5QGd4vVFAUHYidi61k1LU9v1rw+ac
	 FR01fis266/jnhy984ff4zhFQ5gzUbZ/8bcMpk0By3PrKeRsVPDFJKjK86aPYWHAf4
	 xm4+POlD9ZmPA==
Date: Fri, 6 Feb 2026 09:20:06 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
Message-ID: <aYWyRiqpGdpze46p@google.com>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-12-tzimmermann@suse.de>
 <aYV4m5Q1U4Nc1qwm@google.com>
 <0a85e1ab-e1d1-4a3a-8f3e-7478d814d400@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a85e1ab-e1d1-4a3a-8f3e-7478d814d400@suse.de>

On Fri, Feb 06, 2026 at 08:44:02AM +0100, Thomas Zimmermann wrote:
> Am 06.02.26 um 06:14 schrieb Tzung-Bi Shih:
> > On Tue, Feb 03, 2026 at 02:52:30PM +0100, Thomas Zimmermann wrote:
> > > Add corebootdrm, a DRM driver for coreboot framebuffers. The driver
> > > supports a pre-initialized framebuffer with various packed RGB formats.
> > > The driver code is fairly small and uses the same logic as the other
> > > sysfb drivers. Most of the implementation comes from existing sysfb
> > > helpers.
> > > 
> > > Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
> > > output. Initialize the platform device for corebootdrm in the same place
> > > in framebuffer_probe(). With a later commit, the simple-framebuffer should
> > > be removed.
> > > 
> > > v3:
> > > - comment on _HAS_LFB semantics (Tzung-Bi)
> > > - fix typo in commit description (Tzung-Bi)
> > > - comment on simple-framebuffer being obsolete for coreboot
> > > v2:
> > > - reimplement as platform driver
> > > - limit resources and mappings to known framebuffer memory; no
> > >    page alignment
> > > - create corebootdrm device from coreboot framebuffer code
> > Changelog should be after "---" otherwise it becomes part of commit message.
> 
> I see. In DRM land, we usually keep the change log in the commit message.
> I'll change it for the coreboot patches, but I'd rather keep it for the DRM
> patches. I can split off the coreboot changes for this patch into its own.

I see.  Please keep it if this is a convention in DRM land.

> > > +static int corebootdrm_probe(struct platform_device *pdev)
> > > +{
> > [...]
> > > +	if (!fb) {
> > > +		drm_err(dev, "coreboot framebuffer not found\n");
> > > +		return -EINVAL;
> > > +	} else if (!LB_FRAMEBUFFER_HAS_LFB(fb)) {
> > > +		drm_err(dev, "coreboot framebuffer entry too small\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Hardware settings
> > > +	 */
> > > +
> > > +	format = corebootdrm_get_format_fb(dev, fb);
> > > +	if (!format)
> > > +		return -EINVAL;
> > > +	width = corebootdrm_get_width_fb(dev, fb);
> > > +	if (width < 0)
> > > +		return width;
> > > +	height = corebootdrm_get_height_fb(dev, fb);
> > > +	if (height < 0)
> > > +		return height;
> > [...]
> > > diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> > > index 5746b99a070d..b51665165f9f 100644
> > > --- a/include/linux/coreboot.h
> > > +++ b/include/linux/coreboot.h
> > > @@ -14,6 +14,7 @@
> > >   #include <linux/compiler_attributes.h>
> > >   #include <linux/types.h>
> > > +#include <linux/stddef.h>
> > Move it before types.h?  's' vs. 't'.
> > 
> > > +/*
> > > + * True if the coreboot-provided data is large enough to hold information
> > > + * on the linear framebuffer. False otherwise.
> > > + */
> > > +#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> > > +	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> > > +
> > To make sure I understand, do you mean:
> > 
> > - The __fb->size is possibly less than sizeof(struct lb_framebuffer).
> >    LB_FRAMEBUFFER_HAS_LFB() is for checking the following fields
> >    (e.g. fb->x_resolution) are available?
> 
> Yes.
> 
> > 
> >      struct lb_framebuffer {
> >      	u32 tag;
> >      	u32 size;
> > 
> >      	u64 physical_address;
> >      	u32 x_resolution;
> >      	u32 y_resolution;
> >      	u32 bytes_per_line;
> >      	u8  bits_per_pixel;
> >      	u8  red_mask_pos;
> >      	u8  red_mask_size;
> >      	u8  green_mask_pos;
> >      	u8  green_mask_size;
> >      	u8  blue_mask_pos;
> >      	u8  blue_mask_size;
> >      	u8  reserved_mask_pos;
> >      	u8  reserved_mask_size;
> >      };
> > 
> > - If answer of the previous question is yes, the next question: does
> >    LB_FRAMEBUFFER_HAS_LFB() needs to check up to `reserved_mask_size`?
> >    As in the patch, it only accesses up to `blue_mask_size`.
> 
> Well, it's a correctness thing. The reserved_mask fields have been part of
> the structure since the first version in commit b700254aa5 ("Add coreboot
> framebuffer support to libpayload"). I'd that expect that the framebuffer
> entry is bogus if it does not contain these fields. If you really want to
> leave them out, we can do that of course.

I see.  All makes sense.  Let's leave it as is.

For drivers/firmware/google/ and include/linux/coreboot.h,
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
