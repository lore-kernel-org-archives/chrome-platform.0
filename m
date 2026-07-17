Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB083B9D8B;
	Fri, 17 Jul 2026 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275196; cv=none; b=JgD/MJyKGtaX2ES0EFmZH2JjyO+mQQRiuNYA7GkOYQzhpYTczfcC+bkp5jpiBsIEjJINH/u2ZUmXGxniVzuYMMGUt4zmUzHbF0f22+Bf0WTM/fq0dHQUSphy2toLLKwtZzAZRzcKQEOFve3oIThf3+gcVgDa7GJaTemJfsN8+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275196; c=relaxed/simple;
	bh=p5KCq4YPqauwiaiW8FyFswJzNFmBVRMt0L7Ku04ENt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No50agK1V5STr/eY6V1ayL2Boj4zUvsMx1GZObAkOxhHNhjy6UTG5zshdlBfbKRdLdmKNzMPCZPvw4wMxUDcTMrH+WyY2REM4k1nnSkNUwKDyixiGjNQ1q7DZD5lTNlp4EhYxgVgwKgKQGQx3yRMbWW4FqQuglbLO60lnjmAXC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA++MPQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA++MPQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9096D1F00A3D;
	Fri, 17 Jul 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784275194;
	bh=61klz7YZTbndUJ+37lArltjTGqnZ+fmF1mrEjf6lblo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eA++MPQXhcVWV9UuUluILHip3YSIyWjYLItCHZpI3xhcGbENPXF6IL+lP1pVdX9qj
	 ls3g/sDV1Ok4sPkQbERGy+FWITnU5JUvhFjax8vMACNVMWjo0O6QrFOdEvqBL9Lwyh
	 7S1HsRN9xmvBzSNJvzsZBht2Hb+c0hS+S/6m/qQ6ovFtLbGvK6ZPn9cBVq2+d74d2L
	 1SXlZntqe4Dgi+lYoGDjMlLUplqIxqz0ydLq5ZUsSH9Gbmf/JfX66ysL2Erkh029Zm
	 +d2XU1mxUTWxwhBu0ee/cz+ATruOV3Z7M9mBimdDZFklU0lqENO0P2ydW7LtRnuZql
	 0VcqgNqBVUGCQ==
Date: Fri, 17 Jul 2026 07:59:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yidi Lin <yidilin@google.com>
Subject: Re: [PATCH] firmware: google: coreboot_table: skip no-map CBMEM
 entries
Message-ID: <alng9zHTD854NBk1@google.com>
References: <20260714-coreboot-v1-1-f59754d71b55@chromium.org>
 <aliLyZOubSa6ARfS@google.com>
 <CAHc4DNJwVOa-j5D3SiSiXTzA8MGq9p_RxYHXjXSd1po=uDHPqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHc4DNJwVOa-j5D3SiSiXTzA8MGq9p_RxYHXjXSd1po=uDHPqw@mail.gmail.com>

On Fri, Jul 17, 2026 at 03:23:30PM +0800, Hsin-Te Yuan wrote:
> On Thu, Jul 16, 2026 at 3:44 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Jul 14, 2026 at 09:19:18AM +0000, Hsin-Te Yuan wrote:
> > > @@ -147,6 +149,23 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
> > >
> > >               switch (device->entry.tag) {
> > >               case LB_TAG_CBMEM_ENTRY:
> > > +                     /*
> > > +                      * Skip entries that are not exclusively System RAM or
> > > +                      * Reserved memory.
> > > +                      * On ARM, no-map reserved regions are not System RAM.

To be specific,

   On ARM, no-map reserved regions are IORESOURCE_MEM.

> > > +                      * On x86, CBMEM often resides in IORES_DESC_RESERVED regions.
> > > +                      */
> > > +                     if (region_intersects(device->cbmem_entry.address,
> > > +                                           device->cbmem_entry.entry_size,
> > > +                                           IORESOURCE_SYSTEM_RAM,
> > > +                                           IORES_DESC_NONE) != REGION_INTERSECTS &&
> > > +                         region_intersects(device->cbmem_entry.address,
> > > +                                           device->cbmem_entry.entry_size,
> > > +                                           IORESOURCE_MEM,
> > > +                                           IORES_DESC_RESERVED) != REGION_INTERSECTS) {
> >
> > Per comments of region_intersects():
> >     Note that REGION_INTERSECTS is also returned in the case when the
> >     specified region overlaps RAM and undefined memory holes.
> >
> > Won't the check falsely be bypassed if the region overlaps SYSTEM_RAM
> > and `no-map` memory?
> 
> Just discussed this with Yidi Lin.
> It seems that 'no-map' region will be marked as IORESOURCE_MEM instead
> of undefined memory holes
> (See arch/arm64/kernel/setup.c:request_standard_resources). If a cbmem
> entry contains a real memory
> hole, it is likely a coreboot bug.

I see.

Please rephrase the commit message and code comment to be clear.  E.g.:
1. On ARM64, no-map regions are filtered out as they are IORESOURCE_MEM
   (See arch/arm64/kernel/setup.c:request_standard_resources).
2. On X86, standard reserved regions (IORES_DESC_RESERVED) ...

3. Mixed regions containing holes are safely skipped.
Remove it as this is inaccurate (the patch can't skip holes).
