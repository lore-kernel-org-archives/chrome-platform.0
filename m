Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82CA353ED9
	for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777537850; cv=pass; b=b9DXk3PoDTzkZiFLvMoIXVy8E+S8fn2z4+tHqyk4UtvL3cfOofGFVSVrKeVnuRW2busEqfFU49WmQnNJAqS9nc7tY0/yrdbNtD8KeYoTg52kxLPK/rJGagC+wx1vpcjPPDfb2sGtgIEUJ27Fj8a8TMLMZiWt3/+gkvIfPVhsotM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777537850; c=relaxed/simple;
	bh=pjbue108MD/OfJopb0YB9P3K8puOmeDNIhOLPwt+aok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usdHsjgg1iUjsBkW0w5hCgxJ0p5Bnmqxqkb6k66uxI5Y0FCd21hhHyCSycO0RX5ZDlBrzx0k/GYYieMKjLao7MSg3DbtirHlf5YpjbBXtF/2ifQLlaq25Zb1wMj+ttmpOYiAI0ddDWd6nKc5+oWczFPW4ZWohctpOAk9BcFAHOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTz3FpiL; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTz3FpiL"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso774644eec.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 01:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777537848; cv=none;
        d=google.com; s=arc-20240605;
        b=OQGOFqHe2TeTtAjkNdkcFDMDTtrgMPaVpNcC98OgNLD7susX4xJXvpQJBb1nWAkGZb
         MXGK2o++7XjZ4SA5gbwKYoKfD55XulgYgbVb55LLzkPd6qmInADEZMKyBlNgEMq2ngsb
         +pRqlWjxGRJ0o/gDgDaaCfw9SguqByEP4r/6PhEu80yuGDV0ri4tLBdOzXNtRwV90Fp+
         A6EF4Mfu58UAnniZ+fJpC3Hp8ftWA/2N1XeMhJGkmnZvoJKPyGwLyQoMl3hof5iIMmnd
         xbcWjd/v0sAYzJZNh5zQZOnxpYYae1MvKBYgOKhXFxtGhIV6uvi5L1wwS9VqWSzbvUWN
         vPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cxtiq5qdSFTZpyNVL+HBAIaHrCkUt+vVQNtp0ErVm+Y=;
        fh=GtVuQeq6e5Q7d//ej8aOTMkY+b9Yz4Gh3+x34iuZOsY=;
        b=WkOi06cGMLw1Y4BS1h5WApzOYbLOUG+qgn1eHbY97g4pqMUlR7wnpDCdFvdH/Boqs1
         sbNpqpexgwNUE6IKBzWH31lo4WPfhmWS3blYdl+8TSO16KzqIFveC4wZX93IrTUOvU9c
         qDScOm79DsHDHxW5xHxBh31NHNsOqDwnOCLd2s5G2wY5UKy5ku2+5efvjv/8JP8LSb61
         MrtFXu/oBxsv0kZ6ATqbdVz6gMZDrUQOJOwdZQw7UkVsuVKbb7jA6IG5T/p++iM1q/ly
         xQTI37D9+GPiOZf6VygB97E+xRpLCVS9EX0WUcxI/RWsOIfXLduXrMs1JTM4dWGfSm3N
         yODg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777537848; x=1778142648; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxtiq5qdSFTZpyNVL+HBAIaHrCkUt+vVQNtp0ErVm+Y=;
        b=TTz3FpiLwaaaXwEXHVnMOTyIWWLaJ7por42XzsdF2zFnXzMyJhCyxbkIZ4fbeD9ntz
         4Kw2RMb3KNMQCEhdzW/olo8tXXqUdpf0RedmTLQx+DaPrpCi+TGgZ9wBHCLl8brRsoBr
         bYo/cfcVRWvvTj7tu5OBOokXy+xNiOxSvPhzYwBx3lvWki3a5Zm+LouYPQtaXLLs4LGN
         8nvVTRl5lvKuXG7TCcgNuP3jPwIyBz5Kj9Fz3mfjqLn255P2RJRiR6F5xpvSoq4CRErX
         Vpmbl+vfX56Px+6iulD5cSIuMcVEUCtcnofdtb6um7T93Q1shu1aZpCwIqw/ZZlvXr6/
         vdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777537848; x=1778142648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxtiq5qdSFTZpyNVL+HBAIaHrCkUt+vVQNtp0ErVm+Y=;
        b=s3o2ii0nii1RFko1X2StS39PjHvkGBMvj7SkHZFE4++vjzajqOR5n606CfG8Rsmx8U
         73A88I4c6rk2yNFAfqkv8gJsGDRvL59CU4WznW7ECRW6ec7J0HDEBt+ni1yWX6WbBOEJ
         NZ9TNXU7mSbdwHYE2ZzUl+mrYCn5Wr+SobPVtLFIXUoxDSJAUoA4QZS9w041N4CB597H
         ed8cMRk3vKRi5pVzC0oCwNiuy7T3sqzyxN0K22b87wcZcQRjIm8pnGKSw5ryYZpx0333
         oKoRkPNG0hUKICGDEXrxneqjHZywR9BDp+CGwjW2R6eToCgumYXy/zhE6gDkOwQmS4qm
         rkNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9e3KTPRxE7kqfeG3MBwI507CxsKBtAgOLg5WK6HalSj4qg/ax7pXlMVp7VkeRp8wJvZQRhxveeUb+tv+CUP1s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTdrJI8eQH7ph0XRuL6mhtSzck7INVRK2mt1Gzb3PjSNjVKJEC
	zxRzP5M4yIPrpzZjH6ym4AQV8tpE/50auObuVeM533btxi/P7du6LCR9p/ufjJdD5ki2AVkfgPo
	Nq/+4z8XlCLrO1Rjw2Cpo9K2ktXsOr14fdNYy
X-Gm-Gg: AeBDietkx31ctams3tWO3lJ4F0aU8kfKpwqR3bYvntLMPCN9uAWC2IXNxIvyTsWd7bm
	RIMvnyJM0Lxmq7H0ArPL4OZ6GK58JNF0FU1R7nyzaAfAyuGFsk2EcJILxpInbw2PotT1Fr2J0yh
	p9oLUHFy0nzRd/fZHVpe3TNHG2nvpi8J0fHiBJpjDFf/Di0j+d6DaGzpOo3KgcAbNEnW2mNomtp
	boL5btQxqPZRHFpu+EHY513P0Ha7Z2rWjAt+47xL58L+EeskX1MR7TURD+0FT6wPQa6Trt5/rco
	s4lgKigzkD9x9w==
X-Received: by 2002:a05:7300:e805:b0:2e2:9c65:ef6c with SMTP id
 5a478bee46e88-2ed3ced0c09mr755492eec.4.1777537847927; Thu, 30 Apr 2026
 01:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426220204.118399-1-titouan.ameline@gmail.com>
 <CAODwPW8S2q+mcLY9xM+p6usqa+rXXj7nv0QBEve_4hywMtO65g@mail.gmail.com>
 <CABvHBc7nPNoU2riE8ckT7gt5V=3PBXOKhjE2PrL+Os+Si0TytA@mail.gmail.com>
 <CAODwPW8T6o93pQodem-hNrszH_dsa5KMTu0iRY6y8CLJNjfXsA@mail.gmail.com> <afEZlycZGgTiD0Ga@google.com>
In-Reply-To: <afEZlycZGgTiD0Ga@google.com>
From: Titouan Ameline <titouan.ameline@gmail.com>
Date: Thu, 30 Apr 2026 10:30:35 +0200
X-Gm-Features: AVHnY4IiI-6mPxL86op_t9F7eNX5PqU1FIDa1v6VZsAKTe8xxg8vt-yjfBnYc1M
Message-ID: <CABvHBc7ixznG_qXZnyHwc6befEfUNTxs5Ftn75bh18kVYBUe2A@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: fix orphaned devices on partial
 populate failure
To: Brian Norris <briannorris@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>, tzungbi@kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks both for the reference to of_platform_populate(), that makes
the  clear.

I'll rework the patch to simply continue the loop on any
device_register() failure, log a warning, and always return 0.
That drops the cleanup and aligns with the strategy used
in of_platform_populate().

Will send a v2 in the next 24 hours

Le mar. 28 avr. 2026 =C3=A0 22:33, Brian Norris <briannorris@chromium.org> =
a =C3=A9crit :
>
> On Tue, Apr 28, 2026 at 12:49:35PM -0700, Julius Werner wrote:
> > > Given that, would the right approach be to continue the loop on
> > > entry-specific errors ( logging a warning), while still aborting and
> > > cleaning up on systemic ones like -ENOMEM? Or is the name collision
> > > case considered impossible here since names are derived from the
> > > tag/index and the table is only parsed once?
> >
> > I don't think you should hardcode behavior so specific to what the
> > called function does. Trying every entry doesn't really hurt even if
> > they all fail due to some systemic problem, so if there's any chance
> > that other entries might succeed, I think the best option is to just
> > always continue the loop and try the next one.
>
> FWIW, of_platform_populate() might be a (highly-used) analog for
> comparison. Aside from some top-level errors (such as, "can't even find
> the root to start from"), it doesn't actually return errors at all [1].
> It just skips individual device failures (including -ENOMEM).
>
> Seems like an OK strategy to me.
>
> Brian
>
> [1] of_platform_bus_create() technically has some recursion-carried
> return codes, giving a chance to propagate a failure, but all the return
> codes are still 0.
