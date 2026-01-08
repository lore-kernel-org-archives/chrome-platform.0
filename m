Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB52E5B3D
	for <chrome-platform@lists.linux.dev>; Thu,  8 Jan 2026 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891368; cv=pass; b=dwVajJtUV3iNHHSvrJ50ot82GeciMVb7B1m+2PGZO9nrhwr1eDHSX0nTJgV+1mvjjuxPVuXbNIKY6B/JGQKTBxDy+L3a4ABpCcpZu7ZfiivwZYcxHMjebcWzJWAkH7SgbBY7t1kcRYFtBroIn7cQv1Ve9oQDXyTeo8yFe3QVau0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891368; c=relaxed/simple;
	bh=bj5At3d3u364yUqJB4ViHq22xAII6x29JDWnizEw9+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aor3PLuZo42rtAFwruE71iw3MxKwefiPvkmBmPNatBn07hTU0KlQUzw/+UfCNA9F9TDwIGLs8WMNHNC7oX+KTr7cHS/sgbYo5+S8JeJ+cl/3Vpp1/fYQ1a9kSJGIhZZwD5r1TWhTG66QkQhlvHCLGuAqa0GNjyisneuG7yb03CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MkgQhLXP; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MkgQhLXP"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee243b98caso939241cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 08 Jan 2026 08:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767891360; cv=none;
        d=google.com; s=arc-20240605;
        b=F8EJS5fkfDL9WxPpv2HzuWaZcocPO4gSBjIrvrfkZBJ7NzcCbS8ghxdMksb6usLipq
         S3bdW7Cy9FUQrZ5NV89C2+3RtoOuIRnlD94Z2kUj4zHokp7XCddJ6xoXdKO/LtG8oXRC
         yXkRbZfUWOi4CPIxGdUxeYaAkuxr/9J/6DLPTK8GdjYhVnn/QpD0bVsPWn7Jx71/Z99Z
         AlsL9/tm51+xYZ/PoxMfCCng6XAiHvmsJQImD1GBlMn00y7wpRRMNl9KlW+kGYTn60a+
         8Yg0wHHzeag3JZ/n5hv92qOblyVIWUMiQtkldo3Dvp/ZH9GlU9N6w/mYm2iY7YGX5XGr
         STDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIdw/bZz4S68grqXEhuikL6auL03By/bmt4IlBeykRk=;
        fh=BQ0q9cCKYLKKyU2NWixFVvkZ3jbBn+ISd+F+pDnWx1Q=;
        b=H9BPjjOz1Kw5wuhzjnUJCIQIJZTBjNIsIsvDX3LFcATGHXQfFIKlvZWkvP0/zF66K1
         wUgKcC8+81CpUfGxaudUsoaaSx1emBwGdFIdPm93i9drupJAlDbQPRElacsazWi8xD1u
         TKkdh3pcOZaQsMjrCPdEF1LriV+F2b6OxmpcNjzx6xMRXp8wg/lb3VA1OCgkyge86IyJ
         BCXf3hhMU0U6cgBmwR5vbYWD5PXvA6yJ3WAoF9Vf0+3V8NZPb5UqdyVZeRf4kzT9MoHi
         ltDwW6Sq2Xo738fMkoquZP6f5Rl/oBAGiksQmEDkatSvVPEUkK/7b0hZj980X/auF0RK
         mjVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767891360; x=1768496160; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIdw/bZz4S68grqXEhuikL6auL03By/bmt4IlBeykRk=;
        b=MkgQhLXPd1xroY+BLLOHVwbC5hOJPmqqFPLKZNA87ElIntQavpFQAn3CXgQ6AcfLRA
         N6iKjZgD+aEsuND93M558O0hFQ+iuXCU2wu7IxDLqqTcDYR4HFiImJvU2N5cxC1+6z+H
         Mje5eLvsYmhj3zOlQvagbltzP+d6nvFiBa88c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891360; x=1768496160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vIdw/bZz4S68grqXEhuikL6auL03By/bmt4IlBeykRk=;
        b=bEByzkojKdTrojVKdO8XUZcm6DU/UuHMY0mICtIshhF7rE9jK5nP0mLQIkL37BRsgF
         nqQZJByGVgLzV+pQoZiGi+4/yELGTX6ECe/zCr5h6FBRlAXlwrLtyBPjPNocahpR24sT
         rHXv36wqH28LngHOchkaVokiWIG8LBwQi+sPJP8rytAY75G4nlxOes6zIQdRB5v9rT+y
         xt5KVlZWQS0x4ghp5oVH2fYKbbPFGR7xd78Ub70M2WqWgtL0AXPCDETnPHQzGnqKW2zG
         PdexyRrh0nIKwY7jSKo9DroMo4rDy2ty6nv6sSg3l1vD1wPqP3EkQek+SQFXc0QxzkkD
         aI+A==
X-Forwarded-Encrypted: i=1; AJvYcCXSkqHNCeqzQhbY3TwOTbabriPH8Eqs/7BOv/VOFkJMmc4X6g1TkK1oRq1VfBYU4S4eruxW1hN5y1p8cxdyDE4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQz58nISdXFjXKvZ6W3KwvPgopbLsAWsDFvWebvYT3h+B0QK1F
	IqmvjMIjtc2/VEh02S8Wjal7kzrOR3kSdxuQKPBlkxmNKamjkZzPrXLYfExg64BU9TyjB2Zx14x
	8nzW12ieIq0wUwaY20Q5WNengGmSACLFdnqPzbZEc
X-Gm-Gg: AY/fxX4p+k9YgOwV4JyTljLyyadBxToN91cRMT7UgYwWbkdb+eU9l8qpLPVEg4SgFxf
	cPteINnGDm/7I1lwLMIwpYzId4pyU07G+7YzlQtaubIkzTlgSvw/d8/UeY67iYF35VS0JB+wQxj
	vpP/UGD91xoNU3mJbKmN3a5/33pR0F7gpJeRhAGE7EXD7Vq1AID2rMunoppPouUxLAfzLplOiN8
	HUO0i3gutaG87d2LFTLZnxNeXYmZZAy/r2fxG7Xdwlf6IMy6hWcZOLkDaOHRkxpPhCrEnMeWrLT
	YTFnGr0P0L1bvJulUJxtr0EzS4c=
X-Received: by 2002:a05:622a:58d:b0:4f1:83e4:73be with SMTP id
 d75a77b69052e-4ffc0a316e7mr11372301cf.15.1767891359532; Thu, 08 Jan 2026
 08:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108145058.56943-1-tzimmermann@suse.de> <20260108145058.56943-2-tzimmermann@suse.de>
In-Reply-To: <20260108145058.56943-2-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 8 Jan 2026 17:55:47 +0100
X-Gm-Features: AQt7F2qJIiDpBT_vI3dPo1eTLtai_cdssRpmiMmmVYS9yYB6c7XHe8vJWwfRxd4
Message-ID: <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
	javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, chrome-platform@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems less consistent to me, although tbh I don't understand the
Linux device and driver framework that well. I think the original idea
here was that the coreboot bus represents the coreboot table, and each
entry is represented as one device (regardless of whether any driver
actually wants to do anything with that entry). That's why we're
creating a device for all the tags even though most of them aren't
really interesting for kernel drivers. This also helps with inspecting
things in sysfs.

So the device with TAG_FRAMEBUFFER doesn't mean that we have a
framebuffer, it just means that we have an entry in the table
describing a framebuffer. Whether it should actually be used to set up
a framebuffer should be up to the binding driver. That's why I think
keeping this decision in the driver probe makes more sense, and
excluding it from the devices on the bus is weird (because you're just
randomly excluding one of the entries in the table from being
represented like the others, just because of details about how its
drivers would want to use it).

If you want these devices to be bound by drivers outside this
directory, then I think either that other driver needs to have the
logic to decide when a coreboot framebuffer should actually be used,
or maybe you should have a small stub driver in this directory that
binds to the list entry device, makes the decision whether to actually
use it, and if so creates a sub-device or something (if that's
possible?) which the actual outside driver can find and bind to.

On Thu, Jan 8, 2026 at 3:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Test sysfb before creating the coreboot framebuffer device. Skip
> device creation if the test fails, as this framebuffer does not exist.
>
> Depending on the system setup, the initial framebuffer can be provided
> by the boot loader via screen_info boot parameters and handled by the
> kernel's sysfb code in drivers/firmware/sysfb.c. With the sysfb test in
> the coreboot-framebuffer probing, the coreboot device is present without
> the framebuffer. Even after the sysfb device has been replaced with a
> native PCI device, the coreboot device persists.
>
> Skipping device creation early avoids all these inconsistencies. It
> further prepares coreboot to support graphics drivers besides the one
> in framebuffer-coreboot.c.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/google/coreboot_table.c       | 17 +++++++++++++++++
>  drivers/firmware/google/coreboot_table.h       |  1 +
>  drivers/firmware/google/framebuffer-coreboot.c | 16 ----------------
>  3 files changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/=
google/coreboot_table.c
> index 882db32e51be..c34426e5002d 100644
> --- a/drivers/firmware/google/coreboot_table.c
> +++ b/drivers/firmware/google/coreboot_table.c
> @@ -18,6 +18,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/sysfb.h>
>
>  #include "coreboot_table.h"
>
> @@ -118,6 +119,22 @@ static int coreboot_table_populate(struct device *de=
v, void *ptr)
>                         return -EINVAL;
>                 }
>
> +               switch (entry->tag) {
> +               case CB_TAG_FRAMEBUFFER:
> +                       /*
> +                        * On coreboot systems, the advertised CB_TAG_FRA=
MEBUFFER entry
> +                        * in the coreboot table should only be used if t=
he payload did
> +                        * not pass a framebuffer information to the Linu=
x kernel.
> +                        *
> +                        * If the global screen_info data has been filled=
, the generic
> +                        * system framebuffers (sysfb) will already regis=
ter a platform
> +                        * device and pass that screen_info as platform_d=
ata to a driver
> +                        * that can scan-out using the system-provided fr=
amebuffer.
> +                        */
> +                       if (sysfb_handles_screen_info())
> +                               continue;
> +               }
> +
>                 device =3D kzalloc(sizeof(device->dev) + entry->size, GFP=
_KERNEL);
>                 if (!device)
>                         return -ENOMEM;
> diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/=
google/coreboot_table.h
> index bb6f0f7299b4..e3c353676940 100644
> --- a/drivers/firmware/google/coreboot_table.h
> +++ b/drivers/firmware/google/coreboot_table.h
> @@ -40,6 +40,7 @@ struct lb_cbmem_ref {
>         u64 cbmem_addr;
>  };
>
> +#define CB_TAG_FRAMEBUFFER 0x12
>  #define LB_TAG_CBMEM_ENTRY 0x31
>
>  /* Corresponds to LB_TAG_CBMEM_ENTRY */
> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/fir=
mware/google/framebuffer-coreboot.c
> index c68c9f56370f..bb53d1a47409 100644
> --- a/drivers/firmware/google/framebuffer-coreboot.c
> +++ b/drivers/firmware/google/framebuffer-coreboot.c
> @@ -15,12 +15,9 @@
>  #include <linux/module.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> -#include <linux/sysfb.h>
>
>  #include "coreboot_table.h"
>
> -#define CB_TAG_FRAMEBUFFER 0x12
> -
>  static const struct simplefb_format formats[] =3D SIMPLEFB_FORMATS;
>
>  static int framebuffer_probe(struct coreboot_device *dev)
> @@ -37,19 +34,6 @@ static int framebuffer_probe(struct coreboot_device *d=
ev)
>                 .format =3D NULL,
>         };
>
> -       /*
> -        * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
> -        * in the coreboot table should only be used if the payload did
> -        * not pass a framebuffer information to the Linux kernel.
> -        *
> -        * If the global screen_info data has been filled, the Generic
> -        * System Framebuffers (sysfb) will already register a platform
> -        * device and pass that screen_info as platform_data to a driver
> -        * that can scan-out using the system provided framebuffer.
> -        */
> -       if (sysfb_handles_screen_info())
> -               return -ENODEV;
> -
>         if (!fb->physical_address)
>                 return -ENODEV;
>
> --
> 2.52.0
>
