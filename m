Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F91B15A1
	for <chrome-platform@lists.linux.dev>; Sat, 30 Jul 2022 00:08:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n185so3236061wmn.4
        for <chrome-platform@lists.linux.dev>; Fri, 29 Jul 2022 17:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2WINx4ONMT5wiFIiO5PeVQw7Ko03HZeFZ82O/EDiScs=;
        b=BW39Q9qQf63iIQFrTh2NUvyKcMNfCnGUnQFIgjWhYk5EJHg+NUjqKOB8LgO+tlETJ5
         R+vOlfh9l86S7r/0lBlUtuKeGSfgVmSxaFjy4UnjXfVKU/9xMbdMW64O5HNuCpVMLd42
         JTIieYzYCwqAIMG4rvA0hOGd5shT97S7imZ/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2WINx4ONMT5wiFIiO5PeVQw7Ko03HZeFZ82O/EDiScs=;
        b=tyTn5kn2MgJLRyuoDPXiMmr3/IXZmo+dD9hx/GnnVtPLG6B1rAo61sgOdtlLic5RL2
         esw9ASf9Re3x5xI4rKmTH15ci4e37FI703ka/gq7Xa8JQTDiJrYq9p96KJWcYABVBdVQ
         lfVFiNWruBJ3VBiv/NyrabndQhJCtctEjo7sFxqvYgIitONEL7eWrRUSfJHsPFNFoUb7
         isXh7qJ9tlVEJeGYkFdS+Zjc/JFOf6kGX2n6qu+C2/njHadCXP8xwN8pv7S2z45vIbQE
         wAH7iiYHc0P5XIvgLVOz28LCwIWfkkokNUXX0c7RwMwZpx1mk5WFVbU2sB4iXozLkK4r
         Iw+A==
X-Gm-Message-State: AJIora/ltpmGBBb4nmZZjMi4S1aT10Taf4WxbHozAp7Z2irepS+Zyxmc
	2UinZ+5tXMTXUgrW9FIMCi+msY6A6nCHlySG3RjL9g==
X-Google-Smtp-Source: AGRyM1uVgzbeHPCN35MD8rG8omEj8mDY5Xip3bGarjKIXUhS3qzBQANpuYHcjwieh7sLbbUVoA0Qmu8P8cQmxKhtBXU=
X-Received: by 2002:a1c:7c07:0:b0:3a2:fef0:f999 with SMTP id
 x7-20020a1c7c07000000b003a2fef0f999mr4297951wmc.62.1659139705723; Fri, 29 Jul
 2022 17:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuGTL79tPPoalk/j@chromium.org> <20220729193107.2466530-1-jrosenth@chromium.org>
In-Reply-To: <20220729193107.2466530-1-jrosenth@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 29 Jul 2022 17:08:14 -0700
Message-ID: <CAODwPW-JzXXsEANaS+6n695YqriAQ0j0LXm31R2u1OP3MhX9Uw@mail.gmail.com>
Subject: Re: [PATCH v3] firmware: google: Implement cbmem in sysfs driver
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Thanks, I think this looks great in general!

> + * Copyright 2022 Google Inc.

LLC

> +/*
> + * This list should be kept in sync with
> + * src/commonlib/bsd/include/commonlib/bsd/cbmem_id.h from coreboot.
> + */
> +static const struct {
> +       const char *alias;
> +       u32 id;
> +} cbmem_aliases[] = {
> +       { "acpi", 0x41435049 },
> +       { "acpi-bert", 0x42455254 },
> +       { "acpi-cnvs", 0x434e5653 },

I don't think we really want to keep this in the kernel? New entries
get added here all the time, I think it would really be way more
effort than benefit to keep this in sync. It also doesn't really mesh
with the idea that this is a thin interface in the kernel that doesn't
do any heavyweight interpretation. I'd say keep out the alias stuff
and just have the numeric nodes only.

> +static ssize_t cbmem_entry_mem_write(struct file *filp, struct kobject *kobp,
> +                                    struct bin_attribute *bin_attr, char *buf,
> +                                    loff_t pos, size_t count)
> +{
> +       struct cbmem_entry *entry = bin_attr->private;
> +
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EPERM;

Not sure what the current standard kernel policy on these things is,
but we already have file permission bits to control this so generally
I'd leave it at that and let userspace decide how to manage access.
(Forcing everything that could possibly be security-sensitive to be
"root only" just means more things are forced to run as root, which is
also not a good thing.)

> +static int cbmem_entry_setup(struct cbmem_entry *entry)
> +{
> +       int ret;
> +
> +       entry->mem_file_buf = memremap(entry->dev->cbmem_entry.address,
> +                                      entry->dev->cbmem_entry.entry_size,
> +                                      MEMREMAP_WB);
> +       if (!entry->mem_file_buf)
> +               return -ENOMEM;

Can this use devm_memremap() for automatic cleanup?

> +MODULE_AUTHOR("Google, Inc.");

LLC
