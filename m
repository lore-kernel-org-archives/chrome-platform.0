Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B27F2F7478
	for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 21:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325808; cv=pass; b=dHdMXMeeP/zmZXPQid9W5CP6nl2i5ekdIgaSg5mev4i3CJ+Tz3emtluYlyKRkfxZeieoLdY+IMe3bqHGf2pMpq9PZScKQL0BJihqjLCPibmxPLqhLYr336dY0n7rJCjD0aSigYJ5wulnxqiKz+IDoJnUuknGyGs2FO3yEUq833A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325808; c=relaxed/simple;
	bh=cjmZnFyA9NYWFPO1CQzc/6AUJVUPJDPhUjHCK7RONAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjW7eKQEoo8e0OCrWO+Gpodr5lK4v/xCJ6ACfXhr15r3d4APqu/72dTymKTQyDRvEuyXc8wKtegHLUkYp1PJc2xZDXLGtbn0mgO+qtenZLCh333CpU0TeBUwyO/6KALyCFbOOhKNQy4vrwzuYzAPyNCKd96CaHT+yqMxqhAMQrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eub9MJrZ; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eub9MJrZ"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c726f46baso13558486c88.1
        for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 14:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777325806; cv=none;
        d=google.com; s=arc-20240605;
        b=CXnT2VTzcktYGT4urBmhLLQSx11RiCds+kyr63ZQbcYjWe1LLQt0oLY+3ixTym73B0
         5Gkqg9dAFhP82zy2ZZRYecMrg//53OQdXt0i/dMnvxRQKincuZO9hbYn7XyaFJ+tdN2v
         B6xc5DbsvNTEzD4lGBVy4jmeRC9T4ntzXncbRw38VhWGBwauULSI2zzAqmrprv3AbfBs
         yED7MAwDhY0IlYFC+VJyBd9EgcdZEsII0MmCXAWmAPPAviRSWaDY4kvU3v22Q8QgJGDY
         TY6Ja+a1M4Tnyer1CGQsQczHnlof56IjFnEHG9wpSZM2v80bGPHWebv0Tn9qs9/4IINM
         gbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDEE0Pc2X73kF5Bt2iCz7U8oBEcuDtZ0h0Vpbnv35uQ=;
        fh=5oDLtIIKarR5WVXtz1Aj+dBV7tG1NPuLtqSXb4kg+2c=;
        b=H4jWAb6xrk2WG87cDpV4usuAI31Oj8RZSFTqAZEDjTqHIV0yv1HvTFvS63Wozgkg8K
         7zZqbksdAor9ZWh6pUpXGitQt4HC62+1JaCaFPtWjSr6H+ZDzLNRZpAeDJu+SxIoQNdA
         48jNqQ8qEPyquhhaOzpIUuRKBNEkUAXP+RbQN7xesqH9CxEUXkDpG4KAOuGYHJYPxs6X
         FDgzy9viZcLYSo/C6tPSxjQjvXbfsLwl9AoPxfeir96j+igrVWxwVRGSDCPEWRGUIDuV
         o26du71MsQXqd5UgQTlJ5b2LNM/SStltOHOYQfaPF1aITRE3ejjhc7XWRKJS6QWnckFg
         yf8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777325806; x=1777930606; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDEE0Pc2X73kF5Bt2iCz7U8oBEcuDtZ0h0Vpbnv35uQ=;
        b=Eub9MJrZaII48YFzGmvqZyVLCpla6i6Sh7kRymeyeBm6rjRk3tzGCCyILSp5tzHKf7
         6VT4O+ZdgEVDSIpu+aLDXg5Y1KKNSFDzvC5QlqvoSgJzrmIC4r1iVVvZWAEV/D0aHLBn
         MQ2ztRmaGmWvSm6/YGugJ67kmhL0BK30tgUXySuAuLs4bEtQa4lCOeIG9EWYmKRxKWh+
         s2fl6sw1uSVlTp2e1f9HJ7vxp3AIDMyyDI3T1PWIBdp6SpJ1ooj7VxuiJ0xpbQP7zN15
         KDGFJd9qxETqYjE8B/T7BV9sEzGu9FuuPy91jG8pi3cWwg1lEqlVtJfPxIvkCevyMQCo
         4ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325806; x=1777930606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDEE0Pc2X73kF5Bt2iCz7U8oBEcuDtZ0h0Vpbnv35uQ=;
        b=JikeNirYAGjXVCfh9AIXu2EVUw4IHw+3G4BXhYZfd/gX4epWZUNuDINdgLo3B7UOu7
         9Bi5f9dZNyruAnUC35ANPHR2bT0/ZP1gjbGfAy+zz/7xfnVlXuln5H1SsUQ2J7UxIbIY
         9ELr90xXlhEwq2urVTeoY28fAWNxdRItydE6niQGsy0R30zGqfbpQ9mFD8gVJPBqdKd7
         Njck4hL9diPXOTil1RcuPlAGx5UAv+sSUYlvl78c6o1dm18LbEt4oC2rLcl2UD14987T
         L2WG2R3PR6SqvwTjnzzT2Jj83BkWpLigmBjiTulrXXoSvyYwmkkfkNmfdKhiJFIi7YcG
         gGzw==
X-Forwarded-Encrypted: i=1; AFNElJ97ACQf1yKHBO4DscIwb/xsz3ys+/EtAf2D0Ov2SB9RmFOFkI4/gGiybheHZw7ZVsh4EnoZONkYNgjfCP7bMWI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yys3tj3k6cSKKpLgWxbMpBcPksiKYeg3u2nIzmcY+qfRIZcUyWR
	K4mmQbN+HZRKTZQOl0SLSWfu+iukoj8a4AD+au4R8Mtupl8d2h+FZY2PjTsPhQggOd7ScFjuypD
	QY0iA5N1gNgNStu0BCLbZHtUXB+o8RjE=
X-Gm-Gg: AeBDiesWabFnuqqiFWLb3ziAVGNlt8Qk3tWI0HwKXfypoCwXh5LMjMvFM1trkz31BoV
	nxtrvwVI5hasptEOrCa/dzNKx0KGvxAhA31hdqxUFa2UrgKH1af7D58ARmSKB3bkblPIaMJRpw/
	0p3bL/88l8hpJtxChYUudRJ2OsnOU65SggqYnIwPolovkeJQ2Wujf2+GsWtUFR2o5z3kAPqnsaz
	wwsTfXMrN0zukyAR7tk+/aZzoCDrEj+7vm+r0J/f3E9zli+b02XC0KtGg1HK508Dv6Fw4gp8/Fy
	GOvOOzoMTNzAGw==
X-Received: by 2002:a05:7300:1908:b0:2e6:ff79:e344 with SMTP id
 5a478bee46e88-2ed09fbb95bmr398461eec.9.1777325806516; Mon, 27 Apr 2026
 14:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426220204.118399-1-titouan.ameline@gmail.com> <CAODwPW8S2q+mcLY9xM+p6usqa+rXXj7nv0QBEve_4hywMtO65g@mail.gmail.com>
In-Reply-To: <CAODwPW8S2q+mcLY9xM+p6usqa+rXXj7nv0QBEve_4hywMtO65g@mail.gmail.com>
From: Titouan Ameline <titouan.ameline@gmail.com>
Date: Mon, 27 Apr 2026 23:36:34 +0200
X-Gm-Features: AVHnY4Ip-rXe2iIBcqfFYRXusiCM7Gw_soVBXA1tm8px7aiQYJ9LpFn3N0jkjn0
Message-ID: <CABvHBc7nPNoU2riE8ckT7gt5V=3PBXOKhjE2PrL+Os+Si0TytA@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: fix orphaned devices on partial
 populate failure
To: Julius Werner <jwerner@chromium.org>
Cc: tzungbi@kernel.org, briannorris@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for feedback. You are right that the distinction matters

Looking at what device_register() can realistically return in this context:
it calls device_add(),  which can fail with -ENOMEM during
kobject/sysfs setup, or with -EEXIST if the device name already exists
in sysfs.

 -ENOMEM is systemic and means subsequent entries will also fail,
while -EEXIST would be entry-specific
so a duplicate name for one entry shouldn't prevent others from registering=
.

Given that, would the right approach be to continue the loop on
entry-specific errors ( logging a warning), while still aborting and
cleaning up on systemic ones like -ENOMEM? Or is the name collision
case considered impossible here since names are derived from the
tag/index and the table is only parsed once?

If continuing on all errors is preferred for simplicity, I can rework
the patch to skip failing entries rather than aborting, and drop the
cleanup entirely.


Le lun. 27 avr. 2026 =C3=A0 21:03, Julius Werner <jwerner@chromium.org> a =
=C3=A9crit :
>
> Why does device_register() generally fail? Is it usually a problem
> with the device specifically (e.g. the device driver probe failed) or
> does it always indicate an issue with the core Linux device framework?
>
> The coreboot table entries are generally independent of each other, so
> if one of them has a problem that doesn't mean we need to kill all the
> others. If there's a chance that later device_register() for other
> entries would still succeed, I'd say we should actually just continue
> the loop instead of returning immediately. If it is certain that later
> entries can also not succeed (e.g. because this error can only happen
> when the device framework ran out of some allocatable resource or
> something), then I think the current code makes sense that just exits
> with the devices we already managed to create.
