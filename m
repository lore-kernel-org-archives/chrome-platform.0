Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C525F98B
	for <chrome-platform@lists.linux.dev>; Wed, 25 Jun 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854377; cv=none; b=CR0gkfJ/trOv332q8gWW4Nz227CmIj6vu2YqCEsdyUTq3nY3xoV1nyPuD8JlPH7NSNnzbMXQs+ENvr9+YV9HCbEiBZGRWkI+V5zzggIg1XAmYKFObaSawndt0PTxrxjvKjm4nDrmHbEhn9KTmOpamacnCY6NasoM2SVP+FAZy/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854377; c=relaxed/simple;
	bh=RJylVnltnYi62l6fnhJri2c9ENd6bS6fxc04Feonn0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oV1ZL3ZRm+FmxJa6o98iBD+fZn5/I91M9pXgXLrCOwU1mFIxDQJEqj6M8dsN+bEKvZEc5OIg+lYQfcLwuYwDoH6Mh25i6Pvdue4qxQjhuZ6TpFvblB3ErrNTykX/ukLqy3Cdc9ZhaS6gxRwy2MhBPiq9W6WTMoFZa2uzEIAwLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=MEHmug3C; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="MEHmug3C"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1009818f8f.0
        for <chrome-platform@lists.linux.dev>; Wed, 25 Jun 2025 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750854374; x=1751459174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MK0Hj58r5vfZoNmYyXjSjcoja0uU5HmHWhKlrdtiqP4=;
        b=MEHmug3ChI5PSS7TNnxahSVkjlRbebopEwKuUY/xJ4WvPIc3VCbFHnztN8FDULab72
         /jiwAcoLCWtDm9g1qpwBWnGwq4TFBwKVvRKaW0TUAgVIIjNHUA8HhGM8XMZ9Q+4xrBEB
         GU0sUTDWVBsOV7H+YsrAgdfkO0fOs3bpaEdBjGxGdIWcRGPzJAA1QWj6VBWAa6rpcuX6
         cVBPQhz5NVmIXw6bVMNsA4v5gMxYSMlPUwImIR12z7HpzFzyu+IP9g705BO4XB8bzfjB
         GdHXhagiUY/hqn3A2wB0/W+M5uF1xXls2Xrc9Pf/h2hjKv5fBQz7kRIwNslCQHyA+2kC
         Ratw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854374; x=1751459174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK0Hj58r5vfZoNmYyXjSjcoja0uU5HmHWhKlrdtiqP4=;
        b=f1I+qPZZB3asWLhI97piEAlDgvb/AviLDsEs8LRBUzRcLj4jyAN0XPGID2Eg2jzyaF
         rjSK4NL5tD5HZJIEC8ecLjBMl1DtN0aZI9gQc7j57lArT3+QovRYorAQyiVTjT4Ka77P
         08fus4VV64hgXhi1w7qRRm8eyOwyxaXCH8NBbtRGd147JkToQNZfV36fQsq4C+AkMvTR
         SKnt2M7o62bJZlkOyVJeDH2WMODEetbRkd74qdNeNVt0mLBReMZdz7wUpY+a5xQmXMBd
         dtZyl4+xcbNkwqDvbc1VE5hgAXoiUE3atT/YX30E0BZTHEacmseo7oxab9btMj1xTJ1P
         s/kg==
X-Forwarded-Encrypted: i=1; AJvYcCVezCo55KWX6GIn6Ql+QGA5qLBLqpq5i02ywhxX5qb7oVJk+4r6SblWnQHqbmPr3xWKa4y8AYHve/W7erVKjDg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTbH6TbbqeZbNEFCnnPCvD3Su8wjpCm+FEK1FEcGL94B1JgLcU
	7VIa7uvISyXuE3152ntDiIBCCfoLJXKC5AXVFF3irYKB3pN3ueYyrrlxnCF4nYRLbQ==
X-Gm-Gg: ASbGncuhjqFdbPdhplhF9vxhXpy5s19U0Qk9z0Z83fw+wi9K2rF99+hApaM+nICNiEE
	RDTRv60VyplLfuRS2DMDfcbHS1LEpy+ci7xe+XRMLB9XuaLy20mQZp2dD4z1fNS9SoVlIzMDnJs
	QaLNxgM7xBApat+7OGlN8SvTdHS7Iexj1woxtKqBCd0ePVYALkV/lQ3EN8HVjPwaohHX2pcsYSj
	XPssZ1y5/IgJiWeQoi7jnY6GiLESjsPVm1vpVmvg7c5AqmOMDGTS9u6IE24f92oaaTNWcmGaDvO
	jQbBdMxgED7NyVKCS0ct1GT+QclnuEbW+tN0b7oBZWGKn+BpPbJnoQ1JW4hX8clf/cS4CP5Gwxq
	AZRwupyj5bDMwvVm5xlmAwVMt3BnituzwOgQJ63xU3g==
X-Google-Smtp-Source: AGHT+IE0ZRp8hz87yz6pSXLfSGUZeMtxz5hwGB1i4LKMJooPymaYKx+TBLnM1kArAooUHdH2EKfAnw==
X-Received: by 2002:a05:6000:4b1a:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a6ed62eb07mr2151898f8f.19.1750854373878;
        Wed, 25 Jun 2025 05:26:13 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537c3bf576sm24715685e9.0.2025.06.25.05.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:26:13 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:26:11 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFvq49ODR3XfcwZJ@cyber-t14sg4>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFuQHqSd9kT87tsF@google.com>

On Wed, Jun 25, 2025 at 05:58:54AM +0000, Tzung-Bi Shih wrote:
> How about repharse the message to something like:
> 
>     Load Linux-owned SMI handler:
>     - Place Linux-owned SMI handler in ...
>     - Inform coreboot the location of Linux-owned SMI handler via SMI ...
> 
>     On success, the Linux-owned SMI handler takes over all upcoming SMIs.
> 

Yep, will do.

> > diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
> > [...]
> > +
> > +# LinuxBootSMM related.
> > +payload-mm-$(CONFIG_COREBOOT_PAYLOAD_MM)	:= mm_loader.o mm_blob.o
> > +
> > +subdir-						:= mm_handler
> 
> subdir-$(CONFIG_COREBOOT_PAYLOAD_MM)?
> 
Right.

> > +obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= payload-mm.o
> > +
> > +$(obj)/mm_blob.o: $(obj)/mm_handler/handler.bin
> > +
> > +$(obj)/mm_handler/handler.bin: FORCE
> > +	$(Q)$(MAKE) $(build)=$(obj)/mm_handler $@
> 
> mm_handler/ isn't visible to this patch. Separate them into the following
> patch of series?
> 
> > diff --git a/drivers/firmware/google/mm_blob.S b/drivers/firmware/google/mm_blob.S
> > [...]
> > +SYM_DATA_START(mm_blob)
> > +	.incbin	"drivers/firmware/google/mm_handler/handler.bin"
> > +SYM_DATA_END_LABEL(mm_blob, SYM_L_GLOBAL, mm_blob_end)
> > +
> > +SYM_DATA_START(mm_relocs)
> > +	.incbin	"drivers/firmware/google/mm_handler/handler.relocs"
> > +SYM_DATA_END(mm_relocs)
> 
> mm_handler/ isn't visible to this patch. Separate them into the following
> patch of series?
> 

Would it make sense then to merge patch 2/3 and 3/3 into one? mm_loader
depends on mm_blob, and mm_blob depends on mm_handler/ being visible.
I wanted to split these initially as the 3rd patch is already terrible
to read because of all the assembly code in mm_handler/. But if it makes
sense to have them as one patch, I'll do that.

> > diff --git a/drivers/firmware/google/mm_loader.c b/drivers/firmware/google/mm_loader.c
> > [...]
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/cpu.h>
> > +#include <linux/delay.h>
> > +#include <linux/gfp.h>
> > +#include <linux/mm.h>
> > +#include <linux/slab.h>
> > +#include <linux/device.h>
> 
> Please review again if it really needs to include the headers. Does it need
> to include cpu.h, mm.h, and slab.h?
> 
> Also sort them alphabetically.
> 

Right, I forgot to clean these up, my bad.

> > +struct mm_header *mm_header;
> > +static void *shared_buffer;
> > +static size_t blob_size;
> > +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> > +struct mm_info *mm_info;
> 
> No. Please allocate a driver specific struct and access it via
> dev_set_drvdata() and dev_get_drvdata() if the context needs to be kept.
> 

Yep will do.

> > +static int trigger_smi(u64 cmd, u64 arg, u64 retry)
> > +{
> > +	u64 status;
> > [...]
> > +
> > +	if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
> > +		status = PAYLOAD_MM_RET_FAILURE;
> > +	else
> > +		status = PAYLOAD_MM_RET_SUCCESS;
> 
> No. Please use -errno in the kernel.
> 

In which line here exactly? In the conditional statement I explicitly
check for RAX (and hence status) being 1. Not sure if status == EPERM
would make any sense here. I guess you meant specifically 
status = PAYLOAD_MM_RET_FAILURE? Then what would be appropriate -errno?
I think it could be -EREMOTEIO or -EIO, since the APMC SMI which
trigger_smi does is an I/O write. But I am not sure if that's the
appropriate errno.

> > +static int get_mm_info(struct coreboot_device *dev)
> > +{
> > +	mm_cbtable_info = &dev->mm_info;
> > +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> > +		return -ENXIO;
> > +
> > +	mm_info = devm_kzalloc(&dev->dev, sizeof(*mm_info), GFP_KERNEL);
> > +	if (!mm_info)
> > +		return -ENOMEM;
> > +
> > +	mm_info->revision = mm_cbtable_info->revision;
> > +	mm_info->requires_long_mode_call =
> > +		mm_cbtable_info->requires_long_mode_call;
> > +	mm_info->register_mm_entry_command =
> > +		mm_cbtable_info->register_mm_entry_command;
> 
> Does it really need to copy the data from `&dev->mm_info`?
> 

Not necessarily, the concept of copying the data made sense with v1
patches where the "parser" was in separate module, and was exporting
mm_info to mm_loader. I think it would be sufficient here to get rid of
get_mm_info and just let mm_loader_probe check for the tag:

	mm_cbtable_info = &dev->mm_info;
	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
		return -ENXIO;	

> > +
> > +	u32 entry_point;
> > +
> > +	entry_point = place_handler(&dev->dev);
> > +
> > +	if (register_entry_point(&dev->dev, mm_info, entry_point)) {
> > +		dev_warn(&dev->dev, ": registering entry point for MM payload failed.\n");
> > +		return -1;
> 
> Please use -errno in the kernel. -ENOENT or -ENOTSUPP?
> 

Yep. -ENOTSUPP fits here.

> > +	}
> > +
> > +	/*
> > +	 * Gives SMI some time in case it takes longer than expected.
> > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > +	 */
> > +	mdelay(100);
> 
> This looks weird. Are there some ways for Linux to be aware of the SMI has
> completed?

Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
[1] before and after sending an SMI, and wait till it increments. I am
not aware about any unified way that works for AMD SoCs. However, so far
none of the AMD boards supported by coreboot was tested with MM payload,
so to make it Intel-only in v3 is not a bad idea.

[1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880
