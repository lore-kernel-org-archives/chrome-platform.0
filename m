Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445123AB81
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 07:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769500190; cv=none; b=FD1bt9Ncc3+7Wv1q65RdxYelo1DgBoX5ai16FcjfhT/y/vqypQYTe9QwoSM02NBPE20gomf124CW87dA+xpc+blHb/ybkXC08G9wmwPhEqBMGsggh6m6IHjb05/q4DGvvEdvw6l6P+1WAE0C3Fpm89Mz9FOngbyYmlyQC89epV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769500190; c=relaxed/simple;
	bh=hIQjKfwqD6iueffzFaX/iK+4wHuIaRycJj0c9qB8dXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCFDmRNhY53E3iWGv61V1LsH7SDXDMSFkFbjEpix4a9c1gAtOq9bLTkSdN3aPoynIQ6Wa8wDonRFOcPpGV12EKNyD9JJqL2jXR4hRO9uiPm52HwU8Wn3m3cwqMn48KYM2b5/pjlb/PtlYeoEsWzY6RyeZGSRT5V2BfUMI3Q9F/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQQ9e4TL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQQ9e4TL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B6FC116C6;
	Tue, 27 Jan 2026 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769500190;
	bh=hIQjKfwqD6iueffzFaX/iK+4wHuIaRycJj0c9qB8dXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQQ9e4TLL6lXBE3KikiTVxvZgT99i2VNqcT96wbUu/sl3qWat++dUHP/NQHVVKUWv
	 RiCdx/DWNvRhlNzcBUcT2rCAGN5X7jPUd9B4mjbkg+b7W3NpzQpkTGhK0+fTdJRbNz
	 0fF4v1pXBIDhK8L3eUq4oMKodlaxyfmYnV8ao67G37Sm2D216q36057BBw/rpX/kk8
	 CEIoWoypB1I2K9EsPNjc9H85Hk3vTAECFwNbV0d6RijwAsOLpDuEVCYXkDPAYBZSH9
	 vQBBnwU4Gwb4u6M6DsrK3JZ66f4Ud9QbMsYltxSzvyi8JHV0tWrUB6Ob1PEwREutX8
	 /AuzsVNxJOEtg==
Date: Tue, 27 Jan 2026 07:49:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/12] drm/corebotdrm: Support panel orientation
Message-ID: <aXhuGnUlM500G6Ht@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-13-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-13-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:22AM +0100, Thomas Zimmermann wrote:
> diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> [...]
> @@ -63,9 +68,13 @@ struct lb_framebuffer {
>  	u8  blue_mask_size;
>  	u8  reserved_mask_pos;
>  	u8  reserved_mask_size;
> +	u8  orientation;
>  } __packed;
>  
>  #define LB_FRAMEBUFFER_HAS_LFB(__fb) \
>  	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
>  
> +#define LB_FRAMEBUFFER_HAS_ORIENTATION(__fb) \
> +	((__fb)->size >= offsetofend(struct lb_framebuffer, orientation))

Wouldn't the new field in struct lb_framebuffer break LB_FRAMEBUFFER_HAS_LFB()?
E.g., fb->size == offsetofend(struct lb_framebuffer, reserved_mask_size)
   -> LB_FRAMEBUFFER_HAS_LFB(fb) == true
   -> LB_FRAMEBUFFER_HAS_ORIENTATION(fb) == false?
