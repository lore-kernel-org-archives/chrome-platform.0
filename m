Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1EA6AA2
	for <chrome-platform@lists.linux.dev>; Thu,  4 Aug 2022 23:14:56 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j7so1415686wrh.3
        for <chrome-platform@lists.linux.dev>; Thu, 04 Aug 2022 16:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=UqlbzCJAY8VENrCVMz+v3dILFUlDvFsp0zoGxXFbGcI=;
        b=Miutd2BoNbFQIGTrdQElo7qVwUmVmzuXCh+XUR7Yq/r3hsQXVGt/UMCp83I70JjSZW
         51vh73wQ5UbgKHxVkxlmg/DGtkvU1agW9/Aioce/UZEYdLzv7tesUpFcf8yCNpqFvwNz
         4UgYBqPJIcJs7aUG/GYCOCxQyjtpj25t5vwMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UqlbzCJAY8VENrCVMz+v3dILFUlDvFsp0zoGxXFbGcI=;
        b=KWyTO0vgPXsRbOWvbs4zcSNxnM1moaJzTvTDbXkQdAilL3ly9zUDX/a8tVvceFLOog
         yTk6H5O3GupmVwsi0d8Rx6XNoLuBaKV1p6skQ83Pa2B6lTkEEbMeTQ2WRiQ/46emEZ2M
         1YbKfFBqGV5O9U3sYAAhtn3p7raKGErOFydGSkpG1mKzPisw41K0diDd7VhDOvQX1HVz
         CpHa4oug9rng4zRZu1xJUZv5ilzpDz2C9O4IxlcAFHDuSvTP0eJKR8UzNyNGk/jRgcPv
         ueY2+62WRAFGsVh9NcENazJBJiaQHCjwuGjtzjpJuMkbuOlcdv7jDgkhMLdOJsvumn5l
         aJAA==
X-Gm-Message-State: ACgBeo27lubP5bzFBvYAPyn/2+jjhZi8xJDzDLEPZJR4Ox1WRGNG9VoO
	gBjAmLEmPrHvtF6RNv2Jfh0heioVTu/UCH53vXBeUA==
X-Google-Smtp-Source: AA6agR5JyIrjylEqZg67TMMxn/Wb04OVkD08N9V2JPdB3PSyaEC5/ojwg3RaR5Cl1QgNCInOw+EnsSp+TB32Oyce4Lc=
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id
 l1-20020adffe81000000b0021a3574ec8emr2732465wrr.410.1659654894641; Thu, 04
 Aug 2022 16:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuuBrUmiRYoaSmPw@google.com> <20220804142856.306032-1-jrosenth@chromium.org>
 <CAE-0n51UcauP1ojoskV9_2+CFPoJrs08jGHVPCZdSA_oXX1zUw@mail.gmail.com>
In-Reply-To: <CAE-0n51UcauP1ojoskV9_2+CFPoJrs08jGHVPCZdSA_oXX1zUw@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 4 Aug 2022 16:14:43 -0700
Message-ID: <CAODwPW_mYQ1gcd2Xw5s+7dL2kLcYn-VTxKHUH1iM1V4mn7pT_w@mail.gmail.com>
Subject: Re: [PATCH v7] firmware: google: Implement cbmem in sysfs driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Jack Rosenthal <jrosenth@chromium.org>, chrome-platform@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> Quoting Jack Rosenthal (2022-08-04 07:28:56)
> > cbmem entries can be read from coreboot table
> > 0x31 (LB_TAG_CBMEM_ENTRY).  This commit exports access to cbmem
> > entries in sysfs under /sys/firmware/coreboot/cbmem-*.
> >
> > Link: https://issuetracker.google.com/239604743
>
> Is what you intend to use from here essentially an nvram? If so, it may
> make more sense to expose just that entry in drivers/nvmem/ as a
> read-only sort of nvmem.

No, it is not NV. It's just a normal memory buffer allocated and
filled by firmware on boot and placed in a region of normal DRAM
that's marked as reserved.

> It isn't clear to me what the structure of this path is. I'd expect to
> see an entry for each 'address', 'size', 'id', 'mem' with a different
> What/Date/Contact/Description. If those attributes are all within a
> directory in sysfs then there could be a top-level description for that
> as well.

CBMEM buffers are used by coreboot for all sorts of things and we
regularly define new ones. We can't maintain a full list of all IDs in
kernel sources because it would be a ton of churn for no reason --
best we could do is to add a link to the ID list in the coreboot repo
(e.g. https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/commonlib/bsd/include/commonlib/bsd/cbmem_id.h).
We really only care about one of these right now and many of them will
never be relevant to the kernel, but I still thought that while we're
doing this we might as well provide a generic interface to all of them
because others may become useful in the future (and then you don't
have to update the kernel every time you get a new use case for some
userspace tool wanting to interact with some resident data structure
from coreboot).

> Do you need to be able to write cbmem entries?

Yes, see the use case in the bug (using the vboot workbuffer from
coreboot as a write-through cache for the vboot nvdata on flash).
