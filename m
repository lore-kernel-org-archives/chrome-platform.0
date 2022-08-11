Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539AB17D2
	for <chrome-platform@lists.linux.dev>; Thu, 11 Aug 2022 01:17:28 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z12so19666507wrs.9
        for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 18:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=a7wTeZiD5uv9ZHvAgSeNDVn0fwfsH+L72z3RFwFeB7Y=;
        b=obGN0OMkiMt7YEbipQStZUvuWrxtJf5rl0HkgZpU8PtWxS+UB3i1ujciA6Kvv8WtVf
         c23tC4EAalrPGjH6hETwcKqqyracGhuMU5Ex586E7+qQeLB6aHJ2r3L4G8pJbWcxKooW
         LEU+L7h/ITYxEJzrNwTXGGNUrkBCVv0TbjcMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=a7wTeZiD5uv9ZHvAgSeNDVn0fwfsH+L72z3RFwFeB7Y=;
        b=7kqhMMaZAtexW+difwc6iCHTRI5s9iJOw2NRjBwtsZdACO+wBNlimZK7INc4kLRM48
         FyptJttn183simb73Mb0qWZy4WYFmN4JgHvf5JbU8I/ntMTVt6VTUQYu1SKWSzymrLwN
         Ku6maLSQ35HxJ0rt0wEVYSgQiTIY19Q2AxIDcZDEv9pGLpohGvM/9PzkHsx/9+wx8aZV
         AkNTVN+LrpsngSoqw79tQ1PfrAAsm6PPxdRoybYsnpPSKB9Fg/CcJEcLSWuG7cZkUSec
         lZN4VujD/oe7U+qZlfBdhml9bHIOp5LiA799HrtBJq+zsJGtmI0SSyGMZON3xwBfAOE5
         IlOQ==
X-Gm-Message-State: ACgBeo0bBim6WiAEM6arZ0yrR57XVLbdlnzyL7JajQOka1/1SwBNL0Tz
	75fMhxhobtBnDjYHT/GF9ykJqKdszi/R1DyNjajt1A==
X-Google-Smtp-Source: AA6agR4sTgcuh0TtqDd+SyqW0bqduYhV2MvXS2JY/svgqTSAcuEI2YXFP3/SxCv1HIcwamY1P4A/7bS1x1WutHM9DDA=
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id
 l1-20020adffe81000000b0021a3574ec8emr19210578wrr.410.1660180646481; Wed, 10
 Aug 2022 18:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuuBrUmiRYoaSmPw@google.com> <20220804142856.306032-1-jrosenth@chromium.org>
 <CAE-0n51UcauP1ojoskV9_2+CFPoJrs08jGHVPCZdSA_oXX1zUw@mail.gmail.com>
 <CAODwPW_mYQ1gcd2Xw5s+7dL2kLcYn-VTxKHUH1iM1V4mn7pT_w@mail.gmail.com>
 <CAE-0n504q_NeB9e2BYF8P9Scp7TPqsp9KEWu2DO=ZzbYdJfyew@mail.gmail.com>
 <CAODwPW-LaaD+ptch=R-S4GWoBDjTgWzfvwjyQeBRETZnnosR7g@mail.gmail.com> <CAE-0n50cVxFhOU7ULfs8KWkhji8-P57ffzC8sAUGFoYzdhnV5w@mail.gmail.com>
In-Reply-To: <CAE-0n50cVxFhOU7ULfs8KWkhji8-P57ffzC8sAUGFoYzdhnV5w@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 10 Aug 2022 18:17:15 -0700
Message-ID: <CAODwPW9PBAdgnL3vuXXFG1hAG6nCFDgA7w8EYbx7UWU6A4X-=g@mail.gmail.com>
Subject: Re: [PATCH v7] firmware: google: Implement cbmem in sysfs driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>, Jack Rosenthal <jrosenth@chromium.org>, 
	chrome-platform@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> Got it. Thanks for the background. Is it possible to create new entries
> in the table? Or to resize existing entries? Or to delete entries
> entirely?

Not easily (would have to see if there's still space at the end and
rewrite the table header), and more importantly there should be no
reason to ever do that at OS runtime. This table is only meant for
coreboot to publish information about itself or store data that needs
to stay resident for whatever reason. Userspace should be able to
access the things that are already there but it isn't meant as a
free-for-all for other environments to add on to.

> The /dev/mem interface has been restricted over the years. At this point
> we're trying to steer users away from /dev/mem to anything else. I
> suspect it happens to work right now because coreboot tells the kernel
> that there isn't actually memory in this address range so that devmem
> can map it. I don't know but I wonder if the memory is being mapped
> uncached on ARM systems, leading to slower access times? Usually when
> memory addresses aren't marked as normal memory that's reserved it
> doesn't get mapped until the memremap() time, and that would be mapped
> with whatever attributes are used in the call. /dev/mem doesn't optimize
> this from what I recall.

Yes, we mark those areas as reserved in the e820 / device tree. The
kernel drivers (this one and the older ones) use MEMREMAP_WB which
should do the right thing. `cbmem` uses mmap(MAP_SHARED) on /dev/mem
which I thought does the right thing but I'm not quite sure. That's
another good reason to implement a dedicated sysfs interface where we
have finer control about these things, once we have that we can make
the older tools use it as well on supporting kernels. (`cbmem` is
currently not called in any critical boot path on Chrome OS as far as
I know, so its performance is not that critical. The new use case Jack
wants to build _is_ going to be in a critical path, though, so we
should make sure it is as performant as it can be.)

> Fair enough. How similar is this to efivars? I don't know, and you may
> not either, but at a high level it looks similar. The sysfs interface to
> efivars was deprecated and I saw recently that there's an effort to
> remove it entirely. The new way of interacting with those firmware
> variables is through a filesystem that's mounted at
> /sys/firmware/efi/efivars. The documentation[1] states that the sysfs
> interface didn't work when the variables got large. Hopefully that won't
> be a similar scenario here?

I don't even know what efivars is tbh. But whatever other cases with
other firmwares may exist that may or may not be more standardized and
make more sense to implement high-touch drivers for in kernel space,
here we really have something that's really opaque and really not
meant to be tampered with by external code, so I think this agnostic
byte buffer access is the only thing that makes sense. I don't see any
reason why there would be size restrictions with the implementation
Jack proposed? FWIW, the total size of the CBMEM buffer we want to
access is 80K on current builds of coreboot (but our use case will
likely only need to read the first couple hundred bytes).
