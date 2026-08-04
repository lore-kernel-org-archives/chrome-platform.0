Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF445D5E4
	for <chrome-platform@lists.linux.dev>; Tue,  4 Aug 2026 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842692; cv=pass; b=pWYbQon2CvnYXa+q8Ts8dnokQuEfSLTSFzE1ROMFals4i+UFWMdN4yRLE3312X5kMnv+lQJN2m2szzX4WcGhWXADV8iIfUETrklDzY9zOh/hTwegKHxsAOxqOlH6I/ddzfG9i6GP5iH7Zy54jaYVblvmzPpYHb0mEPBrcoe9Aek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842692; c=relaxed/simple;
	bh=fIZ9xajQHzdj3VcK38Twv4uzZUBktgP6diHpCXIYbsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0vAZLY158oCJzWijUvdpi2kZsqDTAyGlvr1UTUiqWzn+Z0qhp9Fm6GUdOM8+qGuo+tIHcE/m556NKs8miJoDWmvcobTo0PGY53hnc7knipPIeJNOVtmEktyScLTz0Wmg9oJfod38rQi7clbUeW1mrsSy7u/TI6r4kdfqV2cc9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=U/5kvq9X; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="U/5kvq9X"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6626b5ace23so1429410d50.0
        for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 04:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785842687; cv=none;
        d=google.com; s=arc-20260327;
        b=gMcNyROjIhQYUFy35QzjG8X4Y059CIY7cZnr/WK3062kL0N+OWVQ278qR+5ztS6NGy
         LyKNwgyg4ezYOi0qhJ1wy1IYmws4LZqnRJX9gGJ8IdxOa4r4Te3B2tJfx7rFnoBNZM+r
         jkncOFxY+M5wB1CgmBal8+z2uH163e4g17NTHI3y2lwzJl61ljAmY/owuvzUN407t6Ua
         uQslbBsbalHjoibsa/l4ccASXu2Qny8jdSI8/XxRUGpt3bqJlU1tNbUV1GCDBlIlSSP2
         Z5kG3eAmnY2V0eAEioL0cYxPENdqnmbWU3Ldi/EudCBFMy3WRa2OwJzJTSrEMElYFFoG
         6yuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uEVKlwbWy5DXWZajPw8ll3lGkPxZtANhBjPjY4Q6jfY=;
        fh=8odMpgTPzHbaF3hVtSByHzRzo1xaw3QHnQlauTy1fMw=;
        b=LH2BPTFCoNoKMS1hhwpKfG4eucntw+a4e9enn83Zxh3T1Jwdc0HPUiepp8BT7xMccF
         Pj15nSrMy/bYn+YyjZcwofPo5Zi0wo7iB7DWFK0FiTnOPC8fvxEwLiMFsZ0JP3tczHxl
         pV4oYxJljEciTBQx9odi/oippBf+Cqbn6aXHyL7vcLtRGH7OZxi9WwFcqhIG9D1XY33T
         93ljJ/p7HY7072mq/3IESH2f7u/PKn+xNtC+5atGNxWIqc4mBE0BIId0TREAYf+naTjB
         pbzXPetPsujFQAjEFK2RNnuO9q+6RhrvpxfuSE9qPZXMhkNvrRpNVPhlWIeHb0wsfpXL
         dwig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785842687; x=1786447487; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEVKlwbWy5DXWZajPw8ll3lGkPxZtANhBjPjY4Q6jfY=;
        b=U/5kvq9XMAPKv2d4uzEkc4Tc0fcaPk0wDg0lqZNVhVDiNAmyr3YXkV/nAbgjaOKLXB
         MWcNatdJx16pP/+gQ0hOB4IyGTkM+mroxqrU3PKklNvPu1bZfuHvu7ry5K+DObKi0ejc
         BKPzw1W8Od/iAbHIZfxOJtRW7ibpVCuRI8JSAO9oTP44RqYP/rC+nOg9jRk3yGwxhfGb
         hC/BB+E67xBVJwdE3WKqjcPEssEdkbdHb9sn91q7oesav6w+01sWBZD13DuyI2Oecsft
         GxJ5BNxq52nYnm938q0a6dpBOpuOcc/EqQnZJV+k2Gw0LYQW53zJHGDUWIKe6tqq1E6F
         ulHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842687; x=1786447487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uEVKlwbWy5DXWZajPw8ll3lGkPxZtANhBjPjY4Q6jfY=;
        b=RWs7Y13EdnApyLGUIDYvdto6C411WLrgrxnKJs0kzoKnUcBaEKOIBQWWcrokf1dTy5
         gXPK/0fWl9d96iJm2axh8bnxxw/dqFDcrj8ReHzOUM50x4NUViTe2JEPfDrJSs1epyEG
         PC1p3hyCh2Qpa52rxweif6KrT52md05IcnG+omqvazwRxZ13fTeXcZG6jMrmNjUx31W2
         o84vTKl8WjK71WJACJCtBuszo0r0w9PjYyDVWdlsJkIiUlF2ookUquX3913PSB2v9OR5
         0+FVnpK/4OFS/NEgB7ytnWjjLIcgbMr6VmJElfinG9TUG/+D6il0BTqKllcYdHtu/Q2g
         8yyw==
X-Gm-Message-State: AOJu0YwcfkDWRP5fg3rHK7AvI8kLHblNEHgFkosiWcRSv+OrnbmzG0iQ
	/ZGU/oPNIKNI8ced7BMYJYSzIjF/2pPmOLsX7MP3qi/uI3KV+BowriOWwXfnbZonY5BU9qNxNNh
	aQOsh+Y/5gGMyxBpn3qYnqcKVqcl5yWVcEiPigPd8
X-Gm-Gg: AR+sD13VZEeODWeXjV2YaEKIc9bskXfKBNlY0T6LxpPxAjJUrDUmLnOx1L4qObf3N4H
	oCjse1AT6AHVjiY133hP56YemxuIi4jBzn25dLl53Vr+gY5N92K/TLcbtpRboLWo4vDpO09EOL1
	NRdFyZ4XjFhtWFArBuLyGabEVMAeO9App1cv9UB4TwoN66vMl/F7+MnkGE1BsHWKdSUlHJxFYMy
	w0NJnvi1XGen2y4AK++rqHglAnG5Cr0JZf89lfHojeKghi5SPJtolA4Rnj6LW5Kule2YZn68CTc
	nF29w3jW6ldGIfF8M6ynwGQ96BZtydnCciWCsa2Jz/lvtRLbOxh829a7+kWql2hJb2ihfW3Q0hv
	xwVHVVfjJk48=
X-Received: by 2002:a53:e809:0:b0:668:894e:4bf with SMTP id
 956f58d0204a3-66985b8b487mr2701317d50.13.1785842686824; Tue, 04 Aug 2026
 04:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785838269.git.sean@starlabs.systems> <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com> <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
In-Reply-To: <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 4 Aug 2026 12:24:35 +0100
X-Gm-Features: AUfX_mwh-6pbB3G3eHLoi8Syc4jiVFprtmWw6VDhCY8_98Qp6PgmXdAIR53yGtM
Message-ID: <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: chrome-platform@lists.linux.dev, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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

On Tue, 4 Aug 2026 at 12:05, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 04/08/2026 13:02, Krzysztof Kozlowski wrote:
> > On 04/08/2026 12:13, Sean Rhodes wrote:
> >> rename to drivers/firmware/coreboot/Kconfig
> >> index b78c644fa253..d273bd836245 100644
> >> --- a/drivers/firmware/google/Kconfig
> >> +++ b/drivers/firmware/coreboot/Kconfig
> >> @@ -1,13 +1,16 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >> -menuconfig GOOGLE_FIRMWARE
> >> -    bool "Google Firmware Drivers"
> >> +menuconfig COREBOOT_FIRMWARE
> >
> > As pointed out by defconfig change, which is supposed to be separate
> > commit, this will affect users of the kernel for no real gain.
> >
> > Do not change this.
>
> I am surprised that such change appeared at v10.
>
> Changelog is quite incomplete and I do not see any explanation for this.

Sorry, don't follow - so put the names back, or split it into its own patch?

>
> Best regards,
> Krzysztof
