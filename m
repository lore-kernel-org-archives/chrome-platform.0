Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C537B
	for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 13:11:07 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3378303138bso418603637b3.9
        for <chrome-platform@lists.linux.dev>; Wed, 24 Aug 2022 06:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PBMgiKITqVFe9ipKJMfcHRkx37YurSW2KouZuSOxvmo=;
        b=G8HG4atxv1FGKcEwA8h3eqLA3fYcTq032qpxC3dbKrMW3N95pSHEXR98mowy50CZ7F
         fBGcrjskhuDed/1nAk/hDvLJwCrgPtBVdesg58XFiA+ds1Qx48cKbgFBPGJRAxcdon/f
         TqeRtatUlQotnj/Cb9tvWMjfrMg5s+ylkFWUu3pV2WCA9iR7r2vczFer6HnIrscKOlT2
         BR9fOm7xDAj4IB+krbuFvRxmfmV2fSGE8yWi5jV7dP/fpMMj1gAx95dGlAZFdpWNaMTl
         iHMavq4cwyy5SqhSsb3+bP/tKEYw2ZWYI2t7NIU2bEEjpzFWYg5lymNhMPCgvtzXp1cp
         dgmQ==
X-Gm-Message-State: ACgBeo3trNdkgtLsEox/7YhQeD7o8+XRJdmjwa+DP7JWuflQHewZwsE1
	ddeQ3SnFrXZNgREODMX8UG3w3YTSWUqJcPdsx5s=
X-Google-Smtp-Source: AA6agR62tJ8S9HOpJZQz5VLSfKhkCpn7RiNHfYE77AQwGBkfA6rm8VSjZhA9q+pokze+xAMH6HUruQA79TgT4Qa34xo=
X-Received: by 2002:a0d:da83:0:b0:329:9c04:fe6d with SMTP id
 c125-20020a0dda83000000b003299c04fe6dmr31037608ywe.196.1661346667024; Wed, 24
 Aug 2022 06:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com>
In-Reply-To: <20220824044013.29354-1-qkrwngud825@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Aug 2022 15:10:54 +0200
Message-ID: <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
Subject: Re: [PATCH] PM: suspend: select SUSPEND_SKIP_SYNC too if
 PM_USERSPACE_AUTOSLEEP is selected
To: Juhyung Park <qkrwngud825@gmail.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, chrome-platform@lists.linux.dev, 
	Len Brown <len.brown@intel.com>, Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
>
> Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> optional") added an option to skip sync() on suspend entry to avoid heavy
> overhead on platforms with frequent suspends.
>
> Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> Kconfig") added a dedicated config for indicating that the kernel is subject to
> frequent suspends.
>
> While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> is selected already.
>
> Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> ---
>  kernel/power/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 60a1d3051cc7..5725df6c573b 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
>         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
>         depends on SUSPEND
>         depends on EXPERT
> +       default PM_USERSPACE_AUTOSLEEP

Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?

>         help
>           Skip the kernel sys_sync() before freezing user processes.
>           Some systems prefer not to pay this cost on every invocation
> --
