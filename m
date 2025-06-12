Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51392E0B50
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767865; cv=none; b=Sl486IgfwCx7aeecCDJ+vk96zPXCxFIFkThevACSrumINk11Ama4gV1p2k9d/af3u2KkHZdfyqRxoCcuCsS4/gPPLd8z1HPqkYERl9Il/H7FE3m7dTBNx6zCdyEXprFLURq6TQqAIwZUijrLo9zDaKaU6Py6UKAqGDCeODNQiaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767865; c=relaxed/simple;
	bh=HHBQEYQNF/8iEYXZ5SjXLKleYW8rVfLIa1UfuspHa0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4FLyk0Jlz9k1ZvVmZ+ToATDglpsBVn4saPQ9tzmWbpf7Bx9VA5Q7TJ/KGW9MbWBH76yXWcK+MZBgLkFoJfRJUd1XduKtLJaT+Ec15RK7UzOVsX+4xKqALwilqAlZZvI6ZLnKncHcVfQPMNLVyBjucY45OPU8oapY43T0/NZDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R+4BdkBY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R+4BdkBY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7481600130eso1850924b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 15:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767863; x=1750372663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LtsssPi/+gGOTsI2cJ5/IE29IoNJ46aiwJ6dZko1hU=;
        b=R+4BdkBYN2yyl2Cw8d1boUNtvOnxV/KL8NZ+B+49KSSrC1vV4rbfQIgvMyIgalMe62
         rUIkcR9QHldUeNjZ3chzt7T+7G3rjDWFgk4zz3OhRZrjEj1R2N4hQXmmk4zotBbEUI6a
         CYaEzAqOviLYik5PgiTWnFThURAUp9xfsKPzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767863; x=1750372663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LtsssPi/+gGOTsI2cJ5/IE29IoNJ46aiwJ6dZko1hU=;
        b=qs+GpJIEe6TYflcm0SUGLfU4glQ37CEx8DgrcEcbH3cdJik3wgoyOcda0v67yEt2Dz
         rnP9l/8hfJoIxgzEjScD8L66x4QiJejV6DwINTxxBT5cy1eLLs3WHmMNqKH23UGJgFsa
         CzbxntrgboxE7MYC+nTW7nEpWalBxm/3cwJVznWDcYmNeKnC0XQ+wlQDI0MtVgi+PAo5
         Be0BxrHAybzh38/k1/T5pSZyZc0Po+nf2HvQDicXp4APapHiFOg2elB0rJ4BHrgN5h/g
         ZS9q2qC7pj2gose7ua2Rwj+qeGIU39AMrMp1i3dvKuHVmQNxDGnqqnMGBuuXVNBjOD1K
         U18g==
X-Forwarded-Encrypted: i=1; AJvYcCU4S8O5azNtXbRXJWEM7UF96JGBcJBqwOCcWgxuTLhAO1nRurwzIymQ8sRWr/uelynspsLm3Z8nn0qUki2KOgM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQSjzFq2ICOpy2eLLnWdhRysgI7xhi++7aQlWpwYVXlkZcQK3r
	bJxgFgbuJ1+F6iOYWO4hZKpMZ7qQWia8upj0hswDZEZm7wJvnA+swM0FY+d6OKcYXQ==
X-Gm-Gg: ASbGncuJfD+RCnVvO1zO0D7e3o4kcL6cHVwIzs/EIV16InQd82W4cw7KXZ+NT3C6ltc
	0NkdMHa7t72hVXReGtwhuBSg2tua1u05MxswY0tOc62c1ApZVNGOXBSgxAwzYE3zRMJX773P1ZG
	aiBGSAdKwuuBdsVc4YQmWKufVoFe6MerIh6EIqX4tUsTliUETtqxR7QsjJKXOIK1r2zJnfIdQkH
	WLTgzsUhu3gXhDVXAvPIrhn8yBrQCM+qK0zUWdVU9/UKFx9jRWzZU9ZFzisumwdGOCn562OVNtM
	aEvN1PPMagzbNEYTJhGNssffG2ssrTqB/9fHBzmB4/oT7k/YCvZd23yn3JRdHRWpTVZTUJo/ORy
	jOxOt6kPKY9O+89zrvZ2cQ/P9kPWKKcAOL38=
X-Google-Smtp-Source: AGHT+IEw/JbZv5ynkL7Za4u+3CAce/RTUMoNI00hDb4bZ/UIOB+tjKCYE3OGTdw9GoF3EWRRxm6TlA==
X-Received: by 2002:a05:6a00:1814:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-7488f71def1mr1410149b3a.18.1749767863227;
        Thu, 12 Jun 2025 15:37:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9a04:ac66:831d:e4a6])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7489000519bsm271514b3a.38.2025.06.12.15.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:37:42 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:37:40 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aEtWtBKfNhDT1bF9@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>

Hi,

On Thu, Jun 12, 2025 at 04:05:48PM +0200, Michal Gorlas wrote:
> coreboot exposes (S)MM related data in the coreboot table. Extends existing interface,
> with structure corresponding to (S)MM data, and adds parser. Parser exposes this data
> to the modules executed later.

I don't think I have much opinion or knowledge about this feature, so
I'd probably defer to someone actually involved in the coreboot project
(Julius?) for some of that.

But a few cursory thoughts on the driver mechanics:

> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/firmware/google/Kconfig          | 12 +++++
>  drivers/firmware/google/Makefile         |  3 ++
>  drivers/firmware/google/coreboot_table.h | 34 ++++++++-----
>  drivers/firmware/google/mm_info.c        | 63 ++++++++++++++++++++++++
>  drivers/firmware/google/mm_payload.h     | 58 ++++++++++++++++++++++
>  5 files changed, 158 insertions(+), 12 deletions(-)
>  create mode 100644 drivers/firmware/google/mm_info.c
>  create mode 100644 drivers/firmware/google/mm_payload.h
> 
> diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
> index 41b78f5cb735..5d918c076f25 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/google/Kconfig
> @@ -81,4 +81,16 @@ config GOOGLE_VPD
>  	  This option enables the kernel to expose the content of Google VPD
>  	  under /sys/firmware/vpd.
>  
> +config COREBOOT_PAYLOAD_MM
> +	tristate "SMI handling in Linux (LinuxBootSMM)"
> +	depends on GOOGLE_COREBOOT_TABLE

This all looks highly X86-specific, so you probably need 'depends on
X86'.

> +	help
> +	  Enables support for SMI handling by Linux-owned code.
> +	  coreboot reserves region for payload-owned SMI handler, the Linux
> +	  driver prepares its SMI handler outside of SMRAM, and lets coreboot
> +	  know where the handler is placed by issuing an SMI. On this SMI, the
> +	  handler is being placed in SMRAM and all supported SMIs from that point
> +	  on are handled by Linux-owned SMI handler.
> +	  If in doubt, say N.
> +
>  endif # GOOGLE_FIRMWARE

> diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
> index bb6f0f7299b4..e0b087933c5a 100644
> --- a/drivers/firmware/google/coreboot_table.h
> +++ b/drivers/firmware/google/coreboot_table.h

> @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
>   * boilerplate.  Each module may only use this macro once, and
>   * calling it replaces module_init() and module_exit()
>   */
> -#define module_coreboot_driver(__coreboot_driver) \
> +#define module_coreboot_driver(__coreboot_driver)                  \
>  	module_driver(__coreboot_driver, coreboot_driver_register, \
> -			coreboot_driver_unregister)
> +		      coreboot_driver_unregister)

You're making arbitrary whitespace changes in this hunk. Try to avoid
that, please.

>  
>  #endif /* __COREBOOT_TABLE_H */
> diff --git a/drivers/firmware/google/mm_info.c b/drivers/firmware/google/mm_info.c
> new file mode 100644
> index 000000000000..55bcdc8b8d53
> --- /dev/null
> +++ b/drivers/firmware/google/mm_info.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mm_info.c
> + *
> + * Driver for exporting MM payload information from coreboot table.
> + *
> + * Copyright 2025 9elements gmbh
> + * Copyright 2025 Michal Gorlas <michal.gorlas@9elements.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include "coreboot_table.h"
> +#include "mm_payload.h"
> +
> +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> +struct mm_info *mm_info;
> +
> +static int mm_driver_probe(struct coreboot_device *dev)
> +{
> +	mm_cbtable_info = &dev->mm_info;
> +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> +		return -ENXIO;
> +
> +	mm_info = kmalloc(sizeof(*mm_info), GFP_KERNEL);

Error handling? (Needs a NULL check.)

And might as well use devm_*() (e.g., devm_kzalloc()); then you can drop
mm_driver_remove().

> +	mm_info->revision = mm_cbtable_info->revision;
> +	mm_info->requires_long_mode_call =
> +		mm_cbtable_info->requires_long_mode_call;
> +	mm_info->register_mm_entry_command =
> +		mm_cbtable_info->register_mm_entry_command;
> +	return 0;
> +}
> +EXPORT_SYMBOL(mm_info);

Why non-GPL? IIUC, EXPORT_SYMBOL_GPL() is the usual default.

Or, I suspect you don't actually need two separate modules, so you
probably don't need this EXPORT at all.

> +
> +static void mm_driver_remove(struct coreboot_device *dev)
> +{
> +	if (mm_info)
> +		kfree(mm_info);
> +}
> +
...


Brian
