Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE769375
	for <chrome-platform@lists.linux.dev>; Wed,  5 Oct 2022 01:10:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so56117wmb.3
        for <chrome-platform@lists.linux.dev>; Tue, 04 Oct 2022 18:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vTtrZ5c58j0WZSj98SnKiN3CQ0KpqQiGa+HkG23eQ24=;
        b=Bg9O0HbmZ3imZTMmU16zgGU++dJLyfLlKUwtU1VSK+lHxLt8i0S/oghO8TQZuLZvb0
         UvAebMScWcN1GmILBzE2lPewB43O78oxQhjxZseelYzXslgsR/eHsHu6AIr4vsvF+w5j
         Zx0WLg5qqOf4orI6DdgtgEi/YmGmmY1igH2/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vTtrZ5c58j0WZSj98SnKiN3CQ0KpqQiGa+HkG23eQ24=;
        b=4i7bBLpuDLv/FP6yEVI8/LjeLpYZFmNaM7+52XU7tAlbM34Rye4pm97dYfAqJqtmBy
         MpQ0A7sjUNJEjv60oxyMda4nOZWqD0CXLk+8ex5rP0zTz6kdaV3umwOnB0tZgW0MwdQ2
         6bJLGtJ0soFHypVlU2P+5mW2eYq1hu43wII/TavvIpN1hofmf9Tj3ccSv8UjVabd1nu7
         Wmjn+wq2WaV8A6a3jvj7D8BOMhteSjGol14v3wcirfW7t1ovXwimJJinJNuuDYtOpLt2
         AE8M6hx9HbmDdCevIMZc8A3rzKbkT9EBf65EA2aYc+kx2SDR5s2Qq2yYYeOox7XwMrb7
         E50g==
X-Gm-Message-State: ACrzQf30T4joYMsIhaXbNaC1TLakjzgibCXVt7Y6Fz61kiL51COT0DhJ
	iHwGXrVoOj0PDsTPen2I9Qaxz/kGQF5E/DhwoD5Hkw==
X-Google-Smtp-Source: AMsMyM6jTum8U8UoTF+9TnQxxOV4RbGrGDfRAfKFR/zFXELeEqrkWJ9v6yu8fiJYCSBLVQcL3ZL18jHKrtyC9WtX4qs=
X-Received: by 2002:a05:600c:5490:b0:3b4:8db0:54d7 with SMTP id
 iv16-20020a05600c549000b003b48db054d7mr1579961wmb.62.1664932212925; Tue, 04
 Oct 2022 18:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com> <Yzxl2oczTtwEvIqt@chromium.org>
 <Yzxsu2Ms43eTfOYR@kroah.com> <Yzy6KNUHFqxWZb9U@chromium.org>
In-Reply-To: <Yzy6KNUHFqxWZb9U@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 4 Oct 2022 18:10:01 -0700
Message-ID: <CAODwPW-7Y_CbCch+Y5unH3yJD1T=3epYvqja6w_CB-23C9x9sw@mail.gmail.com>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> > Then how does the kernel know what to print out?  Why not add such a
> > reference somewhere?
>
> The kernel really doesn't need to know the list of possible ids: it
> simply reads what coreboot gives it from the coreboot tables and proxies
> that on up to sysfs nodes.
>
> In an earlier version of this patch
> (https://lore.kernel.org/chrome-platform/CAODwPW-JzXXsEANaS+6n695YqriAQ0j0LXm31R2u1OP3MhX9Uw@mail.gmail.com/T/#u),
> I actually had this list so that the directory names were human-readable
> instead of using the 32-bit CBMEM id, but Julius didn't like it citing
> that we'd have to keep the kernel tree and the coreboot tree in sync.
>
> I'm fine with either solution ... just want to make all parties happy
> here =)

There is quite a long list of possible IDs (79 at the current count),
many of them are just coreboot-internal implementation details for
specific platforms that are really not interesting to the running OS
after we're done booting, and new ones get added all the time. I don't
think there's any practical value in trying to maintain a
corresponding list in the kernel, it would just be unnecessary bloat
and a maintenance nightmare to keep in sync.

This whole driver is supposed to be a thin bridge between coreboot and
coreboot-specific userspace tools. Those tools will know about the
specific meaning of individual IDs and the data format of their
contents, and they are much easier to keep updated and in sync with
new coreboot releases than the kernel itself. So the whole goal of the
design is to leave all those details to the userspace tools and have
the kernel involved as little as possible, just passing the raw
information through without being involved in its interpretation.
