Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B518F2C15BD
	for <chrome-platform@lists.linux.dev>; Sat, 14 Jun 2025 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749905612; cv=none; b=pVRYIaskdOTGjBlCGaWOBrqPR4F1v7XUg//zgi9zTdTzF+W224fJjuWXttGI/B8ztuID5HMN7tS5rQcwlVAs7P0ssAZAcvjcrrXLUeI8nVAPNft+hWinDFdlfokvpjby6uzfOYKvrxF8ghCLNCLn1nA9norkvQS8YY0ihZKnU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749905612; c=relaxed/simple;
	bh=ToJshkcEyLwRvFclTqTyawtN4G3ZoPLyAg2jYPi+ETg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPwdoChmWyxC034xYL/+NgqxoZqnZKFPzwm9LD7JuLbMqnDQpbuWjyQ3kEqinMVJm56hCa6/uUpEbBLoi969z4uDYIdSBFG8XJJhZMenLtd0qDytBMcrr7TcyYLs9LLIDH7Alo2umilDgtbo898c14kksrFymB9EeduYXVFTR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=DWqHquMc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="DWqHquMc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so23378545e9.0
        for <chrome-platform@lists.linux.dev>; Sat, 14 Jun 2025 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749905608; x=1750510408; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wkREfIjwCdSS/Av/sbgiO9IpKHvCzSSDUVEPCSGdPZI=;
        b=DWqHquMcTe4xzgRHu438r1jL6tvwIK3f+wwO0vhurf9UIN045BqvJ+2n58p6xEz6kw
         xd6WX0s1RGMfDs1/l1XI12zX5L+L/QZJ1mZ6pWnJ31ATFqzkp+RZh6voTSmj8cVXI/j5
         76a0hGlL28WGrMeqWEp0DnJco2cPoNbFIEw2T14IctVZ6Sodp+jBU3v9qZPygB+zuwsk
         Twyp24u6aJo+wxviB+FjzcKMennZ402Q30s9grS4mJuyU1WNWI0IVIhdkp5AMjTAEztw
         /scI0jzpXFvr/rnY/58C+bGrgX7FZJPpJCY6z6F9BbXjry8SjJqI73MvbTNW243PtCa5
         FiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749905608; x=1750510408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkREfIjwCdSS/Av/sbgiO9IpKHvCzSSDUVEPCSGdPZI=;
        b=Z3QrHrqKE/3in6xmuYNPYc5F4SjtiOyT8IF4tf+CD2xM9jSkdoJvgFPYCvZpkJfFNt
         0vIemoObhJYM6zschD/cJ4Em3YoD+QZsS9nlQo7lpm4lnfV5WwWLFPWaPA+/ndy/OSyk
         h06nVxi319QRCjN/vrWWBDSmNs5TncA7oI2tzjR95h3iP6TDr0xMvMkbkomF6g4LPuL0
         z1E60UzYfHgF8P+AN4sFc/Gu22j6ONBd8qyPIlEc5btQ+rw3h2E8M0ghVGrO2qEMNOpn
         kZzO5Uo2znw6jMFeBqrpHfETAoGc8HILthOqEerWCoJUUGZbQmzLyozPbYCGmlNkIQTu
         I7DA==
X-Forwarded-Encrypted: i=1; AJvYcCXXZPsbFsV9J4Vqs/y7Kyck1KtOhLwmI30jJaMOS54dEpXwp+QuBm6FHnNjmuD0ia8Z368iFYJo5nvl1YwIlYQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBzT5TrmLvumBUbZIF6qPiSbxr3Y18FXuQWqtSdRjK3f7qMGIn
	CfADBNarLXzvoXsRYUwl2RcQ9d3eqnullg8O7w4B1zQHNp96PFGYG96oHyqDc2VakA==
X-Gm-Gg: ASbGncsLlKPv8Y+/e/4Hnd+dlPtHMAw3agRSN46naAtF9+OQ3ati5xPlf5UIJLGTl9D
	R8qeskqgsVdOHX2wpdnrJVfXPMj4tL3PFW/eN+IgAf/W6Lpdjz/JXb7CwWVi3PbsFPD6kyck6Xi
	WwWCWFVgsWYBWBLASU6OiwQ+jzwR0Y3GTwv7/n+oRJOg9wBznPg+ptEqeyvNM4/hxZUqsp3Fgrk
	RGIP1FamQEqC31Jk249UiWT00g3ZjKqNwnhjDxKa/LYdubYHOXRkhhpwPLDqK5roS0g3uE8zKGN
	+YLRK0CgIL91M9d00lvwEHGAmDAP812wsQLCK5ToRFYpFqamZvEXQVFx
X-Google-Smtp-Source: AGHT+IHRodzhlunFMz+eKrbtmZROtcyK1UcFGPm84SPSS9puCFJ64hOc4gISQBo3WbGbUH1Ve1yKwA==
X-Received: by 2002:a05:600c:c16a:b0:450:d614:cb with SMTP id 5b1f17b1804b1-4533cacab63mr27851035e9.33.1749905607856;
        Sat, 14 Jun 2025 05:53:27 -0700 (PDT)
Received: from cyber-t14sg4 ([2a02:908:1578:7a43::64fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm81655735e9.4.2025.06.14.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 05:53:27 -0700 (PDT)
Date: Sat, 14 Jun 2025 14:53:18 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aE1wvuamXqVTzpny@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
 <aEtWtBKfNhDT1bF9@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEtWtBKfNhDT1bF9@google.com>

Hi,
Thanks for taking your time to go over the patches.

On Thu, Jun 12, 2025 at 03:37:40PM -0700, Brian Norris wrote:
> 
> This all looks highly X86-specific, so you probably need 'depends on
> X86'.
> 

Indeed, this was also why CI build was failed.

> > @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
> >   * boilerplate.  Each module may only use this macro once, and
> >   * calling it replaces module_init() and module_exit()
> >   */
> > -#define module_coreboot_driver(__coreboot_driver) \
> > +#define module_coreboot_driver(__coreboot_driver)                  \
> >  	module_driver(__coreboot_driver, coreboot_driver_register, \
> > -			coreboot_driver_unregister)
> > +		      coreboot_driver_unregister)
> 
> You're making arbitrary whitespace changes in this hunk. Try to avoid
> that, please.
> 

Sure, will do. It came from a style warning when running
scripts/checkpatch.pl. I thought it could be useful to fix it on the
same go.

> >  
> >  #endif /* __COREBOOT_TABLE_H */
> > diff --git a/drivers/firmware/google/mm_info.c b/drivers/firmware/google/mm_info.c
> > new file mode 100644
> > index 000000000000..55bcdc8b8d53
> > --- /dev/null
> > +++ b/drivers/firmware/google/mm_info.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * mm_info.c
> > + *
> > + * Driver for exporting MM payload information from coreboot table.
> > + *
> > + * Copyright 2025 9elements gmbh
> > + * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +
> > +#include "coreboot_table.h"
> > +#include "mm_payload.h"
> > +
> > +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> > +struct mm_info *mm_info;
> > +
> > +static int mm_driver_probe(struct coreboot_device *dev)
> > +{
> > +	mm_cbtable_info = &dev->mm_info;
> > +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> > +		return -ENXIO;
> > +
> > +	mm_info = kmalloc(sizeof(*mm_info), GFP_KERNEL);
> 
> Error handling? (Needs a NULL check.)
> 
> And might as well use devm_*() (e.g., devm_kzalloc()); then you can drop
> mm_driver_remove().
> 
> > +	mm_info->revision = mm_cbtable_info->revision;
> > +	mm_info->requires_long_mode_call =
> > +		mm_cbtable_info->requires_long_mode_call;
> > +	mm_info->register_mm_entry_command =
> > +		mm_cbtable_info->register_mm_entry_command;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(mm_info);
> 
> Why non-GPL? IIUC, EXPORT_SYMBOL_GPL() is the usual default.
> 
> Or, I suspect you don't actually need two separate modules, so you
> probably don't need this EXPORT at all.
> 

Yep these two definetely can be merged into one module. Will do that in
v2 series.

Best,
Michal
