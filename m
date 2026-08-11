Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494837A842
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479710; cv=pass; b=ByD+GO9DgB3wEoihktgB0wfew+yQ0UiGVdKo4smpnNi8AlrjkgOyZzs+M5SprdPxpuC2kT/8ovpiAaJF8AGngVjy+n6Y8HggVFNxQgjwoVM99D0ZU6bsACzQBQ00Tkdu3DMZIWqOz7LBh+nFBlq4WronO10vIlGpr5hRUgEYNZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479710; c=relaxed/simple;
	bh=X+Hn+2UT/c3HZyX/hNrvvPS+vgTytH3RluH/8Z7NWV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwIFsyg5Pb4ACSI+p1k7WOcPLAuxw+sepH3XZiw3p/D9PVmUimO51FsLerIoTwxI7sTmL2wF7L90lo/fx1MTlNW626gaHsP7KbnNi/Q7Je+OVVYVby+uifxd3GZxAp/Ao07vP6ZT4endL9fN6fm6uIFBzHnPXPb3EXnrPZi2g1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NHQKJM3D; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NHQKJM3D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-498012a61f6so14215e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 13:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786479707; cv=none;
        d=google.com; s=arc-20260327;
        b=UxeOCv6Qkl1vXKuCpGfDz37aZJZ+wrXKF3OOALso5/stkvG6irjxtOt4wWG1YxPaIb
         Jqqn4mbTtEASz2ReZHqekfbvAAV8b39ktBBJJT9w4r6B0uaqL6C//NjBkR+5DQwEJY51
         1lzZ0bqogu2TcsejzT2r6cSiSpAhRm6CGyzbKTSbhjGU7J0CYCPPMTDAe+VjFt1FtIA4
         3ptzIMBVEBuiXU5H+a2jktsgMwnYWHij36awAAPZdGSdUA1oNwDSGT8auDVm/55gmOzy
         JVn0myPKTX7md4e2qLvjykWqUqOSjKjTFt5gQ2/Fmf4g6fS/QxzHItx8wF6DWGD/RC2M
         z49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2y76Lt61/i/b/snN9JbQtpyqqRRI3i3v46Jl7CWq7qg=;
        fh=z7gIJlcm8CkTTqPNyBNmo/elSZrkpHQa/9X5u2X7lGs=;
        b=cjg1P89QWeePr0K2olw3NYsphQf5mfpYg+1AQO8aEoubSvSFT7Y5FdXr//7ySJWgYG
         3pBBf1NTWGhElD/8Wm52q0K6NrNmeqlp4iTmM4dWLBTSRqwXffkwm11RexbBhgVz0EId
         i/42smcSQvcOK9KvonGniChJRfg4PxzHkHBOy1dOz9vaZcIyIB/7yI66K5CGqrB7UZZ/
         YV8ZNe7G/KeeFUIZEVEpLzIRsWxfAsYZJGSpGt93MzmorPUnSQNS2gCs+C1k879ztwJC
         F2SDd4fmeV43d4FLCc6h8CU7HA26gk9smtVRxS6cte4fE2T6KAy7aifjE/XgCUaabRbu
         aYLA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786479707; x=1787084507; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y76Lt61/i/b/snN9JbQtpyqqRRI3i3v46Jl7CWq7qg=;
        b=NHQKJM3D4O45WZ44HPJIZ1uXt/T/Vg88c2aDFu30DM0i0LKyqv4jSACcNVLLHG3QRp
         /SoBvnVz55uecCk4f0a98AenISMMnLj31jSngO0Sg6iRBNoTBpXhbtxRm+GK+HwrRdCv
         MpJmR94YkszmSbjpmwlxDAkF7BpKgH8CaH0mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786479707; x=1787084507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y76Lt61/i/b/snN9JbQtpyqqRRI3i3v46Jl7CWq7qg=;
        b=UoWlf2U+hxmQ7BuCD2uaFsQQqmaTaNlEQqaT0M5eEZk33EfkHiFJ+zCviEHZukPjl6
         gC+0UJ4p08U2DMOHAHHmuoZ41VHenufwWtIQEnY5bjxfOKAv0DS35WYH66oFz+VUgVHy
         LoJoajD6tj1n33yaspwmJH92piiYHEP2PxyKZhnRe/IJoAtNmdA8jRWYHAA30XILE30g
         jZCHOLlynrCCuTXiI0oWzm62zXPZ4b4tL8bSVY08HjFQdyj0HHvSK7UtPktemxJMegPG
         J5truYvYodRQvFCLOJyvZA3leALvwbaLMFgyhBr9I0I5hNaPSY6WbNxjV0zwtaxzJH3l
         arZA==
X-Forwarded-Encrypted: i=1; AHgh+RpRooIxMHRDR7WgJhyKYZ4GHYyA7BC78EClt9INNHc/eHfIMAAcQZguNia4BFOZbhkJztV0DE0fD5Fh2E1SQOc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBWh36axhPPLGNO6WS9oMBPYLPlsf/1PGKFdS7zoCzUCuJp8TJ
	CyBfPoICeMA3aEwNIKQHbB8JditIzNRZfvLtJ9SrN0/rGLfJFyJ4vV3HLp/W1luDYD1WwQI8TPd
	j3MhHf81LMfl1WzI1ZfiZlHni9Pe54OiI1hy5V9bs
X-Gm-Gg: AR+sD12SDqURaBexQL5RUrYW+TaWDLll3EQAPL9JPMOqIvSwFQv5GvTs4exSonKAXWP
	2Bgc2ODS0xlfgr+7l+HXohU8GVfOKXHCwAjXhXbdJEf0qJoN/sH+Q9QArlLzK6vr5Vph4KYQoZ6
	exmAoIeDAVu1O3eeHTTdHDoxGj6blNrA0sKPvr/KXhc2EkjL9gEjUttaCrth+nAySKv+m+UUWy4
	dFBPA0GiDFZ6sEnP2qNw8cxmz035DtU7EXxKKWJyu8Z98wSitOcQqlToTlVBJybdb3GRvs1lrDp
	KT0k+akTqwfT/pzd+Jxm+TxFEJH8pEAb9xdycJn5DMumlqo0OZLxYovLPtIRtYcM2SdHMXMfPbR
	7rycQHLE228hrRVE=
X-Received: by 2002:a05:600c:a210:b0:495:51b1:3b7c with SMTP id
 5b1f17b1804b1-4997ae8fa87mr189725e9.8.1786479706369; Tue, 11 Aug 2026
 13:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785838269.git.sean@starlabs.systems> <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com> <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
 <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com> <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
In-Reply-To: <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 11 Aug 2026 13:21:33 -0700
X-Gm-Features: AUfX_mwPkMPdfE9_YsGRn0TlcmOaeVgS_UG6HvdrEqDFesBA8RH57sUUWpUXm-M
Message-ID: <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sean Rhodes <sean@starlabs.systems>, chrome-platform@lists.linux.dev, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, Kees Cook <kees@kernel.org>, 
	dri-devel@lists.freedesktop.org, Oliver Lin <oliver@liuxiaozhen.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 4:28=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 04/08/2026 13:24, Sean Rhodes wrote:
> > On Tue, 4 Aug 2026 at 12:05, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
> >>> On 04/08/2026 12:13, Sean Rhodes wrote:
> >>>> rename to drivers/firmware/coreboot/Kconfig
> >>>> index b78c644fa253..d273bd836245 100644
> >>>> --- a/drivers/firmware/google/Kconfig
> >>>> +++ b/drivers/firmware/coreboot/Kconfig
> >>>> @@ -1,13 +1,16 @@
> >>>>  # SPDX-License-Identifier: GPL-2.0-only
> >>>> -menuconfig GOOGLE_FIRMWARE
> >>>> -    bool "Google Firmware Drivers"
> >>>> +menuconfig COREBOOT_FIRMWARE
> >>>
> >>> As pointed out by defconfig change, which is supposed to be separate
> >>> commit, this will affect users of the kernel for no real gain.
> >>>
> >>> Do not change this.
> >>
> >> I am surprised that such change appeared at v10.
> >>
> >> Changelog is quite incomplete and I do not see any explanation for thi=
s.
> >
> > Sorry, don't follow - so put the names back, or split it into its own p=
atch?
>
> I did not find explanation of this in the changelog. It cuts at v9, so
> maybe that's the reason, although lore pointed me the v10 as the first
> version introducing new CONFIG symbols.
>
> Anyway, IMO renaming is really not worth if the sole reason is Google
> name is disliked now.

Krzysztof, the idea with this change was to introduce the new Kconfig
symbols that more accurately represent the new directory structure
while keeping the old symbol names available as fallback symbols for
people who continue using old .config files. Doesn't that avoid the
pain to users you're concerned about? I thought doing renames like
this cleanly was the whole point of the `transitional` feature in the
Kconfig language. Why do we have that lever if we don't want to use it
for the kind of cases it was meant for?
