Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232A3A6EF8
	for <chrome-platform@lists.linux.dev>; Fri, 17 Apr 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417109; cv=pass; b=ADnwQ+n5tjKzsrX+hUTh3aKWFHOHlfjtNBXgRqHRqFZCkcwtzIpxkunbgTxdCXG5ZtDJD/HlbN6PzcUM/j9bJVf+audfagETdkxwOcD+J5nNCuqyoUjyHl9boFIJKxY6R5uuI+ozSXyQTNRmDE3dPIYaPWP4CwgXFf9KgJG16nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417109; c=relaxed/simple;
	bh=hZqD33S6TaBeP1U8RwrHN4MgbX19/ibIMOcdz9Suo8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTWIezovP94FQgVv7IfCk4XyDWue3cROIb4M0IfGgLhC8gLLPIbNxrUQX1k9kPUmW0dXuAh3uFDWnKQmL4qprYg88zIGv44uZZYCetb8t4vpppPpwZT4tzN/B7tPEgy7kIAztBFGMHCxUe24INnM9/JDwKiCiLtBcoQ4DDsKbGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0p7Tq9m; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0p7Tq9m"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64e87a81639so456109d50.0
        for <chrome-platform@lists.linux.dev>; Fri, 17 Apr 2026 02:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776417107; cv=none;
        d=google.com; s=arc-20240605;
        b=hf1GXTF50VKG3LKhtmqs1i9BF0SAaCcVZiLV4P+Fk0Pe+laTJMkVy6wBE+yDW2/yVH
         3pVyiNFwD70dpNQIIaMNcRDu6YQBubK/yKmSgPDX/Dk6FZiW/CDhv46I4Rb9SIgrNDtc
         iuoBEBWuUb6oXH0+YNSYkAv5v/vfq05zvuk6HXHORcwIDzDivjLtoPdxjxVeAZWWd05f
         EJe82HQ2pT64pZLbvNrw3wCFnTxLDUio7BDp2H5cdPzXLk6BkhUE9Kk6ByKG+msDDjyf
         QE+Wtj7N35XpHb5Ts0/Mbo8b9ezjSS/mdrXMTKuC8kk56XoYNRRYNoZJ+asoGQI28DBB
         DZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        fh=S8re+dmp6bKLHCTzxciDuSqshJqzjMqUSNCSrwui4Fg=;
        b=LDTjCQ2jzxEWS0tM7Nlbly04OwqOPPhJZsY8q76SfCRLQ7zZJBu42Xi34wueomZRzF
         CuvdY13Ha3x5Z+oaFmUxps3BpOyMMwQT/p6sWYVoHWeKmGVPI91VdbTnE+o5TPdE9IoH
         pUOykRqxpHeyUbyD9RT4bjtsaRYA/DrTaMpXi+SGwA/n4ksUgsNpAInc1HEQickmZfI7
         JUZRioL1JtXwLwfATFrBMVin69I5iFSWzdssKbrE8bu5MA5qhOl+vX09gpQNN4p6C/fC
         Gnw9bYihPOfwjMFhUR0Xgax09N2l9/OKNw9vj1ElqzUkyQR2fKk7A/uq+fLQzBheEJlM
         6u1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776417107; x=1777021907; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        b=Q0p7Tq9mcKbWehC7s+FDYhZMZMNDgpkJUxm5V5Piq8V8c5Ft4gX+9yVEUbSOLkd4rD
         LzVQ5sQn75MXCDV202YItEgRWMsxMwiY+7FJpctz3E6LXlk1l8ZAz9NGe0+KYW0/VMAe
         eqTkq15DNNGTwGTtEoBn4YhoLNh2l8ySwQjOJtnzqEgHzWT5TZpAyCr18qMcLGwrUK4w
         Ui/rUTdbHyJV64go0bvjXXVaoHneH/AN64bHH9xInE+okIlZpkTI8gEXOtIVA4/tctIW
         qR4gWexs9DZ6h5fbh8nJKyr1p2FYDkLP0aVGJOHT5hpAJC596i0UQB6i1H2AN3cztpAV
         Sofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776417107; x=1777021907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        b=PmJbXGkuQQiAt7hoEK5tpJppgXgbiYEYVq7CC1IHJpCMyCr9VQi4xN4oit8ioylFcQ
         Nb3nxWegUE047BiKe5t0Wl9bHcBpnUM/nLgdf53lzkC+9nCYAhPaPCvAJco42C6izn6W
         ULCQofKXYtpWSsABWdBsmDb110KY7p/AZYaCv/uZn2xBmPeLZegE+1atJo5cLnEemxh/
         42LTcpXzlbk5So9IO+Vbh4/nP9YFybpH1Sh+aEACGXtzFsEitug8+k3nsLL7/mCh+mbL
         8bdj2dyZSTPPDeJc096ZwZVpvFSqWxRGZHGmxyHKKcZxsY7U5U9kJDr93HAU2BAjvq9o
         aslQ==
X-Forwarded-Encrypted: i=1; AFNElJ9szjcs1R5qgU4uzgh1f6Lx12DjVKg9adxfMxHaoLU18sQrRlpkaMob44wjEg7Ql/gtGJHtACY5fB6CgUbbBz8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgGM5YZe3hGrLRYKcj0YuHPmqqpnQ+bHDsXrU7E8DyPdIIC0eI
	Y+OyuznkxW4SRLBl6Lwyy2epILTwFV6yMvd/OGEhZup8VhHi+dne1AKLIM3ZCXukU4g2lIXwT+n
	0mXVxM9I9vrZM7r5CEhYO/HIbjr6O86g=
X-Gm-Gg: AeBDiev6NDCIV5zrCc4TmSLYUnWcMhSeUuWwqOrdfZMLUgBzEevZineavwKSoh7/FfJ
	ck6BamISPJGmhj64r/eGryvCq18c3V6nx5tz0zilwINOM3t8evTSEijODY4BrvbfhHzupft7XHG
	c4hNo5hvaU20WP1i1GNLGzkEANXzGC3IpDviovaTGgWeaNymu00YXCYJ/63h7yPsED7zCuWKOLN
	VyfoqLPGs65gcrBLs4o0IxWuQ+Kmw2VkQoM8qhhw/6nEh86QyNjmiyJg+2xiJxB9dr5kcuqWH2d
	F13d7MeDmaFQocRbP7Tf
X-Received: by 2002:a05:690e:130e:b0:651:d634:6d32 with SMTP id
 956f58d0204a3-6531085f25cmr1805344d50.20.1776417106750; Fri, 17 Apr 2026
 02:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com> <202604171609.wl8JLCit-lkp@intel.com>
In-Reply-To: <202604171609.wl8JLCit-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 17 Apr 2026 17:11:36 +0800
X-Gm-Features: AQROBzCVBYydseR7J8ekLAtPw3aL9_q0Qe5MzF8i8S3g1XrJyVxsBCHjMaTpGHI
Message-ID: <CANUHTR8SyfZouETXFpDv4ivzin+DC8OTDYhbSQ1cRaoNqYPduA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: kernel test robot <lkp@intel.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Olof Johansson <olof@lixom.net>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 17 Apr 2026 at 16:47, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on chrome-platform/for-next]
> [also build test ERROR on chrome-platform/for-firmware-next linus/master v7.0 next-20260416]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/platform-chrome-fix-reference-leak-on-failed-device-registration/20260416-135638
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260415175038.3633384-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] platform/chrome: fix reference leak on failed device registration
> config: x86_64-randconfig-013-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171609.wl8JLCit-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171609.wl8JLCit-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604171609.wl8JLCit-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/chrome/chromeos_pstore.c:131:3: error: use of undeclared identifier 'ret'
>      131 |                 ret = platform_device_register(&chromeos_ramoops);
>          |                 ^
>    drivers/platform/chrome/chromeos_pstore.c:132:7: error: use of undeclared identifier 'ret'
>      132 |                 if (ret)
>          |                     ^
>    drivers/platform/chrome/chromeos_pstore.c:135:10: error: use of undeclared identifier 'ret'
>      135 |                 return ret;
>          |                        ^
>    3 errors generated.
>
>
> vim +/ret +131 drivers/platform/chrome/chromeos_pstore.c
>
>    119
>    120  static int __init chromeos_pstore_init(void)
>    121  {
>    122          bool acpi_dev_found;
>    123
>    124          if (ecc_size > 0)
>    125                  chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
>    126
>    127          /* First check ACPI for non-hardcoded values from firmware. */
>    128          acpi_dev_found = chromeos_check_acpi();
>    129
>    130          if (acpi_dev_found || dmi_check_system(chromeos_pstore_dmi_table)) {
>  > 131                  ret = platform_device_register(&chromeos_ramoops);
>    132                  if (ret)
>    133                          platform_device_put(&chromeos_ramoops);
>    134
>    135                  return ret;
>    136          }
>    137
>    138          return -ENODEV;
>    139  }
>    140
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Yes, the build error is because in the first version I accidentally
forgot to declare the local variable ret in chromeos_pstore_init().

Sorry for the oversight, and thanks for the report.

Also, the underlying issue here appears to be related to the
platform_device_register() core/API behavior. We are currently
discussing in another similar case whether the better fix, if any,
should be made in the core/API code rather than in individual callers:

https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Once that discussion reaches a conclusion, we will revisit this and
make the appropriate fix if needed.

Thanks,
Guangshuo
