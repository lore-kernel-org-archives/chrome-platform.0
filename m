Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F6633F1
	for <chrome-platform@lists.linux.dev>; Wed,  5 Oct 2022 23:27:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id bk15so101596wrb.13
        for <chrome-platform@lists.linux.dev>; Wed, 05 Oct 2022 16:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QK9Ffo7noBOOh68pwr2VdWG30paSM0HTeytlJI3ponQ=;
        b=X9cU4nMrm7TIMWhG4EGG2kJdfwvMNeHdgPmMiXncsa7X2+uTXPuygqXzWmK0IeSqM/
         BaybWEoyEEeZB4QjL7geXkScLmUx564HUYiv6dbK9cIiGW1Wgrfj2U8tzeBK9vKFIQGl
         y+/OkP8BJ9icwnMBiO7Yn9lAB2k/GT1eEgtJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK9Ffo7noBOOh68pwr2VdWG30paSM0HTeytlJI3ponQ=;
        b=qnxVto9LSobJkT1qL88FAL+T13mFYf4XO2L6w/5E/uiG+FxZzvSw0z7BGIq8wj2nfE
         EC9qYm2R8EUcUxqKP2d/4TFvGWPn6Ftt/O8m1/N/RybmSpMuzriVSJCz4ugFEILG7Hk0
         lulf41fnwSUx2dcWY6V5Y8RdMp8OrMN7+UoafT6c9OQDef+95HapQgxvCtRHEiItJC6x
         2b6Hx+HfgyKRLLlIha4MNTmriFfUElQ4rjS9Nj8QsmeAaUEbXj6pni3Hy6clxp5YNu37
         UbEgPOYAjHRawfYkFJQ2fxoLFmJg6M3Go4kXNpThCPyCEvgHpKP9g+hhHmgkZvAc2GNK
         06eQ==
X-Gm-Message-State: ACrzQf2hGGm+77nVhJYvS83lmlf7RR0odyWxWy9cOmuBF5xNTZrILP08
	kf9OHwIqWFFUsDz3xQGMGVAyZ4QTghbCgvFseKts0w==
X-Google-Smtp-Source: AMsMyM6mp6fKFkJ2vplYvf78dCTCXwCG8epih4Xm6z/FouJvLVmg01VxhT6Xry4RKpOb9g04BFLD4gGbHeF5/pC53uE=
X-Received: by 2002:a5d:4a06:0:b0:22e:3e36:d7e7 with SMTP id
 m6-20020a5d4a06000000b0022e3e36d7e7mr1206969wrq.410.1665012427627; Wed, 05
 Oct 2022 16:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com> <Yzxl2oczTtwEvIqt@chromium.org>
 <Yzxsu2Ms43eTfOYR@kroah.com> <Yzy6KNUHFqxWZb9U@chromium.org>
 <CAODwPW-7Y_CbCch+Y5unH3yJD1T=3epYvqja6w_CB-23C9x9sw@mail.gmail.com> <Yz0jVbfDOITZfE9M@kroah.com>
In-Reply-To: <Yz0jVbfDOITZfE9M@kroah.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Oct 2022 16:26:55 -0700
Message-ID: <CAODwPW8R2uXFJ_5V737Dy8z-WJHUwKkLyG4MW_Q50fs-OFm7Sw@mail.gmail.com>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Julius Werner <jwerner@chromium.org>, Jack Rosenthal <jrosenth@chromium.org>, 
	LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> If the kernel is reporting a value, that value needs to be documented
> somewhere.  If the kernel is acting on that value, it needs to know what
> those values are.
>
> In this specific instance it seems that the kernel knows a subset of the
> values, and some random userspace tool knows all of them?  Think about
> what you would want to see here if you knew nothing about this at all.

The kernel doesn't know any of the values. The kernel is just telling
userspace that spaces with these IDs exist and providing an interface
to access them, it's not supposed to know what any of them mean.

In terms of what you'd want to see in the documentation, I think what
Jack's patch provides is already the best solution? We're referring to
the definitions in the coreboot source tree as the source of truth for
exact details about what each of these IDs mean. Do you want that
documentation to say more explicitly that these are coreboot-internal
data structures exposed for use by coreboot-aware userspace tools and
that their exact meaning and format is only described within coreboot
sources? Or do you want us to put a full link to coreboot's gitiles
page for the file instead of just the file name? Other than that I'm
not sure how we could make this more explicit -- we don't have a big
official documentation page separate from the source code for all
these IDs in coreboot, unfortunately (like I said, some of them a
large and standardized but most of them are small, platform-specific
things for communicating between different firmware stages that don't
need much explanation beyond the source code itself and don't always
have a fixed format).
