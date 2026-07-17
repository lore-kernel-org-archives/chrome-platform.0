Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC433DDAF9
	for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273054; cv=none; b=IDX2UnE+rx2iBP7Aqr8N5snSFyoHboyXK+pxpO98OGvkCcHt5JQ87ZIlD4lREiXnW/mo+CtPhStV7u0aw8iqTkldTBpSOyguIcIkBdstkc+ulJwhFJQGZXxR+yJ6DgsMk3YeIzFuRGANa0s1VCCGEvIr6qCmi+4kKVIn2a6Ad+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273054; c=relaxed/simple;
	bh=6LddWbayDhqBr+mty7GrSodLfAslCJE6lEPzx7jXovQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oi8t2mCt29eg1NW+NxNk2VOgZKY28rU+ZAG0udZIpzaxG+HfWiQZ93h1B8QcEsncd1yTMehGgxqUbN8eOVCpjUBZPJmFeM154TqP9uhjLdmpZkN6wEAZgvgiTloKo9KNpOtAwfszah12O26Qxh5JSyvbY1i+AXCMeJnRPE7r2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m54nVywl; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m54nVywl"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c29b46382so55433561cf.3
        for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 00:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784273049; x=1784877849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFvtOxGkE6aSbQNqSK8ps28qSiGVzcrWy2iCMih2Vew=;
        b=m54nVywl3rOnjaSPp7YxoiQ1DOSGJgTIfaiFBI8x6KpHRpuWlWOZpm7oZy6Uli7dyx
         OHu2Jyz6yPy+f+3SCuwDBlIfsavSLbCcuGLRiFN4UhIJa7xqpKo0t4dR5vjTXZgZE2nx
         1FIPBarx+IXq44WcBV1ODCA9wbaufDpq5ys9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273049; x=1784877849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFvtOxGkE6aSbQNqSK8ps28qSiGVzcrWy2iCMih2Vew=;
        b=XZFOiz1N/ubpbpvOAxgcw3tp4lBXMYR181AaS0ehYW2TOy8crika4zVt9feNrYOeZV
         8BDhAef6u2yMSAQyKF7Z89vZCGSjr9uQwwRZpI3TqQtZsu2uLF8vgOgyLa4xqojQF7iR
         fYT+JIlLTeSk6mOHMIX68Xm8z3Ltf32eURRHiXdKba/3SZckivFKngVex0wQ/4JzRjqI
         7w5UZa/uPr951t1lkWR9bDIeRVFAKQaMag7Eop+TP6YCxe24k5RXw2sl4O4m4RLMuwAr
         DX36HvqejsgRM71bBmrJM3f+TmzyDAxm5JjUeZWWiDglG6vi1fMYAFqB+K0fcXEazIvK
         4oDA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1JSo7c91RUmQzcuqFRIOq4qY4JNsuLazplokH6mR0ICcU5vE+ddZPepVDxyzzvVDSJyQangBDMKW9A7egPl0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRAYil0MYw/LptRzFd2KFuBBhoWRcb9kw6NfAlh58rA2Xp2DCG
	1f29oJRVMvWOeIMs8khOBzgwAbrR7oo7xPOauFWoFeFts3T0Xx2fpSp/ngTmaT1ttOjpk5yp3Zd
	niNY=
X-Gm-Gg: AfdE7cnWBBSNmedeSUZLGpRxzlZRTtp9Q/TsW2FRzErKh/sL5Scw1gxLmIDSEyLE+49
	3zZnGuuCmzTNEICtlhWp1oW+DlJVgz+KsByfXesh7SmY2LpROGNcY48gXCm7L1scn14K20rXYja
	OT93KMLTqKHq5k+i0y0lzB97M8ce3fw9PgvRB/ZSjhmiDrYiPS7SEED065Pl688PylOse/lCmMM
	Dx2z0vuLV2mygvNCO9KJaSlUw+t8Tb5mRF6Z3+rilPPRf1nOkd0+0dNpt+dEFANYYqG71b2Y63J
	mMRxAGuxebd6O1l2M+EnnGfsPN1/urer2UeOEv4bO9EZiOXSRXJw1HwF32AtfnWuFthBVXs5Gcs
	MYoRkPFPmiLBR15JA6sjn77+E+gKF9RGqb8xjPbfl1+1GWGA6ukF0o11wurAyRfGVDHj/T1ANb0
	C8NrsK0QqNonf6aN1jlxskOrv4zemF/MW16JsaCdkGFcOyxHc=
X-Received: by 2002:ac8:594f:0:b0:517:59a1:82cb with SMTP id d75a77b69052e-5213e28e183mr11831741cf.48.1784273048561;
        Fri, 17 Jul 2026 00:24:08 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214c5cb721sm6349151cf.1.2026.07.17.00.24.07
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:24:07 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c10e86e52so293151cf.1
        for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 00:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrN3d/Dkku/K439F0UTjvmTDKxEFRpIznNkAPFbjQac2DRmq+ele/lCplCm8MCmnfNAT+uiBOBa9MJ+F2pfslM=@lists.linux.dev
X-Received: by 2002:ac8:59c1:0:b0:51c:289:6979 with SMTP id
 d75a77b69052e-520ff10b2cfmr5359341cf.21.1784273046872; Fri, 17 Jul 2026
 00:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714-coreboot-v1-1-f59754d71b55@chromium.org> <aliLyZOubSa6ARfS@google.com>
In-Reply-To: <aliLyZOubSa6ARfS@google.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 17 Jul 2026 15:23:30 +0800
X-Gmail-Original-Message-ID: <CAHc4DNJwVOa-j5D3SiSiXTzA8MGq9p_RxYHXjXSd1po=uDHPqw@mail.gmail.com>
X-Gm-Features: AUfX_myS2l_B-pstLeRDjOyrK1ob0_E4XEac1l7yfVdIYShznlnOysOj9TTJ2fM
Message-ID: <CAHc4DNJwVOa-j5D3SiSiXTzA8MGq9p_RxYHXjXSd1po=uDHPqw@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: coreboot_table: skip no-map CBMEM entries
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yidi Lin <yidilin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 3:44=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Jul 14, 2026 at 09:19:18AM +0000, Hsin-Te Yuan wrote:
> > @@ -147,6 +149,23 @@ static int coreboot_table_populate(struct device *=
dev, void *ptr, resource_size_
> >
> >               switch (device->entry.tag) {
> >               case LB_TAG_CBMEM_ENTRY:
> > +                     /*
> > +                      * Skip entries that are not exclusively System R=
AM or
> > +                      * Reserved memory.
> > +                      * On ARM, no-map reserved regions are not System=
 RAM.
> > +                      * On x86, CBMEM often resides in IORES_DESC_RESE=
RVED regions.
> > +                      */
> > +                     if (region_intersects(device->cbmem_entry.address=
,
> > +                                           device->cbmem_entry.entry_s=
ize,
> > +                                           IORESOURCE_SYSTEM_RAM,
> > +                                           IORES_DESC_NONE) !=3D REGIO=
N_INTERSECTS &&
> > +                         region_intersects(device->cbmem_entry.address=
,
> > +                                           device->cbmem_entry.entry_s=
ize,
> > +                                           IORESOURCE_MEM,
> > +                                           IORES_DESC_RESERVED) !=3D R=
EGION_INTERSECTS) {
>
> Per comments of region_intersects():
>     Note that REGION_INTERSECTS is also returned in the case when the
>     specified region overlaps RAM and undefined memory holes.
>
> Won't the check falsely be bypassed if the region overlaps SYSTEM_RAM
> and `no-map` memory?

Just discussed this with Yidi Lin.
It seems that 'no-map' region will be marked as IORESOURCE_MEM instead
of undefined memory holes
(See arch/arm64/kernel/setup.c:request_standard_resources). If a cbmem
entry contains a real memory
hole, it is likely a coreboot bug.
