Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C41483833
	for <chrome-platform@lists.linux.dev>; Wed, 16 Sep 2026 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595033; cv=pass; b=TISKwVEDzCFFrP1FCbx/RgOeXwI1kmCuLFJ2lczRXM2rhONilcpPEgAVYa6+CF4v7Fqh9Aj14cKgy/XKa0LTFAmUpCk0/SmLhj9zWuj++834P/ZdhsknUtlIRAisP4YnERCmyAjD68E/3TCLFL4R5o970GEuHxcUpwhQ64y9LSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595033; c=relaxed/simple;
	bh=AayDStxvWbgnmWnKvKHBN/OOsgvHcfSQuvWss2icNiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P83kpfL2M9ipp6mJ3vfE4I40+FGNfjgNATFo3xNokg5/NjijOSrSicE58RnXA7ydGS3v/JKuQt94VglU2KMBXroZe3E/8TRbl1bITB2xWa049ggtGmwJtyaMpqvljoS1Tz6LUd7wdqJ4acZpnUP64bI4PSpFQ3/bdYG373JgnhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=WX2gqR5j; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="WX2gqR5j"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-87c938111a7so851207b3.0
        for <chrome-platform@lists.linux.dev>; Wed, 16 Sep 2026 14:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595003; cv=none;
        d=google.com; s=arc-20260327;
        b=OCysSV0/F6fgPm4QjHYErR8jtWrEDF4hJmCEuYWRhIuuezPwJDMATiAE6Uqf/qh+m2
         ntgPqLmvIJ6XZ95r8xbFSzEwjPkGf0FBD+RU5NfshABEMDHyA2je7hS5P/Qo4zjnS18L
         W1cwAVCiTFxs0Xvw67bE+Tk/7fY9LcjM0Hw4sJmjar0VbwhlOo2rP5rH8McVPrnibSzE
         p/ffR2UtSkmptDKEEZsVYPAFhceASsw3qeo5FzeYbJr3+rtuwdo4y6TpXE2aBB+Kizux
         bvj4LiYBnpC4FpLc70psW1vlj6OFI4ehqOkTPfxOmxxQaxvwmJoirM7EUJKHlNKfoWb4
         LoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        fh=04sgLueQ1tE2q75I/seo4+7frWRoAUPfmBmCWZwIzRE=;
        b=jG6nISNShVHyYwyoO783kZhNzGw3U2twAeJq+5q0eGIEsOekoXphs4LlXD6kd01TzV
         DAzOq43B5yYm8lQFf4kvCDFR5hoxMqbG+0WciqkN01kypSBW9gyYVJR/PhQhLGVy7w59
         zCJ29+1sc1RWgs2DYfAIfHXVi8fXKw+634/XvqNf9bTq788FGxvW/hykSrHLqzWIfV4C
         0tQUJG0mkDYE/w3kXwcHvrr5uzlT02zgv/dctz9qkvvS0b8W7ta5R4MiOPgdUULZKmDj
         2sSjCqlJIpskP/20QdldDFUoEQJoFqmNjnhUiAD966MsJpZxPIPvaV+IfI4A9w2e7AhT
         Jabg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789595003; x=1790199803; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=WX2gqR5j7oQQkb8X8KaLkQ+5dXufncPPrnYmjZGVkawrC/jcrGMDtmqooduq4LqHVv
         OoyB+CEGofboM9fuESWPIKxLsP6tsGgVa8A9lhTjLAtwMhB4JJGln91+WAczFLLejoTW
         Upiucq6KmXgVpboH3JuygAwrkZ35aR7520XBAdjTApG+clJ2DABIdjNZgCA8z3xo8itS
         OrrHleVB8fz/P9Ced0NlWa+MCQenUUd2PE9MSWmQH5zcZKvEusris2j2pSbWU54rliyq
         TY51i0JW8GKPbUnCojIqKzYvl3TAShWkgKp4G7OBe5i885ojrV8bIJHbPQhRLhlESoR4
         lrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595003; x=1790199803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XcwxAB43YdszLPV10ZP5iQsr+p0JEvwgv6jHK+rlABU=;
        b=tRVze5JakYS1jjNYrBp+K0P3dGOvpVjpINW0SGcSkLuaNpTF/X+RwF/nMou3TMh62D
         n1XQczHjJXeVhhlhghLJYbAxhmJmUPm9iVLRsnc6b8ZVzViLoEMRyNJ+RrwNPrCiODK9
         kGaNKHrakpPr4C2RdJfW4RfdqHeCF4X+A5+JV3Yf6c+M2wqYlz/Y/XLo9YrCNEqhP5yg
         aRiTUgGhoPtaYl6t6sL80uoOyUWTKPQscgeDQTRrCKLfN8yyJ0m1T4RSNKXspS/s2ma6
         fIkw3t85RpDqxceHfLso+dEYmNlUGqd6coMZ4WWtZcBTbn5x9AIANm7F9OJUpl5fVkH1
         ClbA==
X-Forwarded-Encrypted: i=1; AKwUvBxnGTwkimvmHPa5otkhP3j3okUISVpoOdP1LQCO/CvI+ubnOMuGSe71/v4b9nOqOjH7RS2HMXYjg7k7LS9QPIk=@lists.linux.dev
X-Gm-Message-State: AFuF++k7fCZN7HNE2ZR+z3kqB44yxbb7x51Vvt/7ILiS7DpW1t6Jd43w
	K8xXLb0UuUWamCPRQVcqObll527CJzpitdohm83sdv9nNZTTUB/4X+g0kXAzFIfIXAiWY92sxvv
	e2kf8LTLYJNxFKNT8rNBV2yqb4r+H92sTl2NiVbU+
X-Gm-Gg: AYBFou2xBJ++mzhDouvJI/BuQPRYmrwyaDHiHXH1FtIPc4XNspvkeSuT/sQmL1f9m+f
	vUI+HdjyRcgfrXP/eYGaigh4q8ffXjTc8rguKbPoK3bUmsSF49cKhvROZcGsOp1cj9XVZ6olOu/
	pRkZ+AQrlwI+BfdC0Imu8mVd1IerJe6D46iu0vit9jnNl1QL7Mf6qHTDFpqKp6cx5G50Gd00sTu
	zSwbRsRpEfX9ZhZNXWnAroDlpnlOwG1GxCKaWqdWjQaOvFOXstRzPQU4IqJ7IMQv0nboT9GLzWW
	G97jFZQlM6jSOpl5or+Z+K8KeEV39YVHy3TCMZtybB2X6HRAxWjZgYhjFeakWj61aV+4hxvnzdc
	aRKsGkxvK2g==
X-Received: by 2002:a05:690c:7:b0:873:5c7b:c12d with SMTP id
 00721157ae682-8944596a1a4mr2540477b3.21.1789595003466; Wed, 16 Sep 2026
 14:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
 <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
In-Reply-To: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 16 Sep 2026 22:43:10 +0100
X-Gm-Features: AcwNN1U8ZB3podUdFXiPZ834VqBifCusJKONnKfdetS9jbEaRFfMhwBYCh_JS1c
Message-ID: <CABtds-2srRmKDvNj7g_0C2w8L72WczLsA+Vc_Yg3KC4gvSJyqw@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/5] coreboot CFR firmware attributes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, 
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>, Yidi Lin <yidilin@google.com>, 
	Kees Cook <kees@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	chrome-platform@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Michal Simek <michal.simek@amd.com>, 
	Sven Peter <sven@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

How about patch 1 and 4?

Thanks

Sean

On Wed, 2 Sept 2026 at 11:01, Sean Rhodes <sean@starlabs.systems> wrote:
>
> Thank you :)
>
> On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > > Move the firmware attributes class helper out of platform/x86, rename the
> > > coreboot-table firmware driver directory from google to coreboot, and add a
> > > coreboot CFR firmware attributes driver.
> > >
> > > Changes in v14:
> > > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> > >   intervening coreboot table bounds and CBMEM no-map changes.
> > > - Drop the standalone include-order cleanup. Replace the affected relative
> > >   includes directly in the firmware attributes helper move, as requested by
> > >   Tzung-Bi.
> > > - Split the DRM coreboot framebuffer dependency update from the firmware
> > >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > > - Keep the CFR driver and its runtime behavior unchanged from v13.
> > >
> > > [...]
> >
> > Applied to
> >
> >     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
> >
> > [2/5] firmware: Rename google firmware directory to coreboot
> >       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
> >
> > Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> > and patch 5 which build-time depend on it.
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
