Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05242BEAA
	for <chrome-platform@lists.linux.dev>; Wed,  2 Sep 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343329; cv=pass; b=HgGo2nVMF6hFiVq92SXuzkdLC1q2f/ps47GRfEnou+lGEJ27OPRBVtrCoNmm+nv/zkUHYzdV6twmKqpahqWCYS1rUCGdX7rqKwiBnMEP0H2Gpbde5tFBXsUgd5FAjjZI8LGieYQ3N6Kl2faOger6Dfa28yraZs0HO3OmQy32gL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343329; c=relaxed/simple;
	bh=BsYSShzm/APLl8qc9BTfD5vA4H/CGzk4/kuElmC6cRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDbRzUKc5OOU7r4u0falksBJWbnofPZMn9CkhFqlBHPeQru45NIcNksFiQ1uNVI+uc9AKjKTFBasFgEcRQh+o44//epoTsEWvYCAw3DiO0xklW/lwD6FYF6tDvYCPV/jzcqDC2tb44cIrS1AQ7mL2r3eN3qSth+pvOUKCz+rYSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=EIPqq11s; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="EIPqq11s"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8630c1503f2so9747087b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 02 Sep 2026 03:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788343326; cv=none;
        d=google.com; s=arc-20260327;
        b=OahfEgLXYb87gG/zD7WduZ77m910tefKAx0RDFKTTBVudspjIj+lk3P9IjK/N3WJwQ
         eX+Ic080xU/ZVzp7dTP58h0Ww01awLUxL9lahjeqggVVy4YLvz86SWLK3XISFfDPKG7p
         T+O21BUzsKHe63OUIzDAs1vQ3Yxvct2V6ZwGt0hYO85l5sEV5HkhGIlAytTieujxVu6o
         LiUW6H5rsvAzkm64mNH9XrMmjKWKWEBkk3sFOUvmQ2FC0V+mx1cTIJJC8eQ4TDrp7IpB
         18whk9x90KZxBkBG7ANz0+EH9oteLp6lCsvHE431X6i79dOv1XwWbBgUF/Np+wBG2DzK
         vbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        fh=QZW0bdRUPrhdrrQZCorgzSH8hL/TcR7/CdBqxfaH1jo=;
        b=JHv2JeywzlXLvdnw55262491ip3DfvrcoK/c6kzhgKAxXPaUXiP/Wr+H8cK1KKbYKZ
         Umu7i7ejJDwBt0/j7nS35QOH8sINswCB+WLdXiNJkg5QnwAlwSscbpv39Aj3xzTBlUY3
         KhNjCPf/YIvY0sAACk3+TMbTnyi2ojd4wAou+vCc6idjsinKTEKYi1he2n8LAxbS5PqA
         AJX5iAOy+21ZzGcrZOZl9X8cvt/ypeMHu8S3Iwo2KeostPpGQ8GBRogE+WEofqurThE0
         q3sP0RfaG6VK/qHJlIDnqUbYtNIOjLnNzVH9xzk7q6cZLana9CwHMLRs+EA2DbnaxCtI
         al2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788343326; x=1788948126; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        b=EIPqq11s5CYGSErvnwXw7lj6V2mtOfS+hKr7jS7tXi2F+4mHHo8syiydxPP1Wcwexn
         QGXVKMqMDeFyK34yFdno2XI6TALPpxpO0mumqi6Lr9b2pii+hrV+GP+plHT89l70W6b/
         9ibU8HEe08xJjOUfR3MoAZJn0KX2TPBmw3AC1O0b+rOwWu3ESeKWdM1W0icz01RXlCjJ
         416wMWtNjwhkddqUMHwAZ4gt1ZFoqyNT5ck1+Hueh6G0CtfDiM4yhzzjy+6DdzVt/ETb
         88h6pnT9NAy69ZZP28cUsPMVpz8IPkFZaev2xWfLwf4TO7GdKEV10Sx2BBE6xtyCb/e5
         CvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343326; x=1788948126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Yl5QmRxyNgI9FkGfHWferAKBRopNrYR4eAo0FssY70=;
        b=T+obSqDFTKkhg+IEy3Sw1GXe4EOp4BjC+MQIfO9q1e84dSHUsJhTGssxa0KLwFCtlS
         +9uv+warekSLhmXaePENrQ0+JiE1a+v8sqE5Hd2+Kz7SVSWxmz8kq1fXFNdyBOjRVEW0
         Bzz7uyPUNDAIX+xVqgkJUbS4LUCmn0BYeh2n53ac9mucbTxShYCSNtgfuLRIJw7iILZP
         VAwB7cPA6ACBmHbtIRXbmrW2WJbijztmZCwEV3vSmuis3y1j1SmKxLP6w7GER9kgndUn
         mEtxi/HXZ+epoO+pNghSRm4h3PQBTZW165RQ90k4+klRdYM779k5w8vImI2H/f1igO87
         wJQw==
X-Forwarded-Encrypted: i=1; AKwUvBxzHK+ZU5LH1mfCLBSgGj3HCCbXA5Pt/xj5fB+g0KxY347wgDCrqxEJd/0G2CaShoqSBBbyTvftfTJurQ1+IZc=@lists.linux.dev
X-Gm-Message-State: AFuF++lLJ26d1Ky32gi+wW3wv8gC1TO+XwYetyA7rQ5Ghb13tOikCxbt
	dauVVO6WTNKxlOCr9CXHSNXMjxs/+Yt38E2RyFT/c4h8K9cRAPELPHUBLkSJwhyHl8Zqc7dcP0/
	/nI29XDgi9+Sy9nG7IyCHdD6OI5FgwV+uDXNoRVYf
X-Gm-Gg: AYBFou0JwL8lL1QU6TkfPE6ehPZvX8HMF1sFNyoWwQkPn/VpFS2cWhuFHDlPp4DprUT
	qDQp55EvECudfQ/dR7H4jEfbNzGH4GFvQWfS/0x7jNKmsW+WCCjD/7smTMt0aj4kY920D/XQPeF
	vGp24xTNwaZxK2/a2ps1ZrAvKyDC4+HqNwxHKeor/DE5hCtHguxIhFKD+uk+VtA/quEAGbV7QBo
	jS49WoGPADldVI3r5XKpNJkIsdyi2QNYKKIdD6lN9vjov8DDTXfUAVIfUMwKlvDDyABzADvuEWk
	8mjjQ8ytzNZtcTlWf2Bol6p7SmBbtB2g5zPJKLkl9Z9UhdBd/zXFFzIKCcRIOcmKXd+S6d58KLL
	R
X-Received: by 2002:a05:690e:1514:b0:66f:7c64:9d47 with SMTP id
 956f58d0204a3-66f9bd4991dmr1118782d50.23.1788343321975; Wed, 02 Sep 2026
 03:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1788284852.git.sean@starlabs.systems> <apfz3lf1RIfAkKYS@google.com>
In-Reply-To: <apfz3lf1RIfAkKYS@google.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 2 Sep 2026 11:01:50 +0100
X-Gm-Features: AcwNN1XY2WlZI7b41cj9pFZjq4mCyoo_3nH6T_KZHZYXfCYS3mXFpBitd3ECMtg
Message-ID: <CABtds-0w2b0P6SGoAZGHJe-4usmG6B8SUP1ufRQyp0+9UFcF3g@mail.gmail.com>
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

Thank you :)

On Wed, 2 Sept 2026 at 11:01, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Tue, Sep 01, 2026 at 06:48:01PM +0100, Sean Rhodes wrote:
> > Move the firmware attributes class helper out of platform/x86, rename the
> > coreboot-table firmware driver directory from google to coreboot, and add a
> > coreboot CFR firmware attributes driver.
> >
> > Changes in v14:
> > - Rebase on current upstream master after Linux 7.3-rc1, preserving the
> >   intervening coreboot table bounds and CBMEM no-map changes.
> > - Drop the standalone include-order cleanup. Replace the affected relative
> >   includes directly in the firmware attributes helper move, as requested by
> >   Tzung-Bi.
> > - Split the DRM coreboot framebuffer dependency update from the firmware
> >   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> > - Keep the CFR driver and its runtime behavior unchanged from v13.
> >
> > [...]
>
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next
>
> [2/5] firmware: Rename google firmware directory to coreboot
>       commit: 44e33a5aaa2de3f5cf2701d6f4b0a7c63d4fe602
>
> Also created an immutable branch "ib-coreboot-rename-7.4"[1] for patch 3
> and patch 5 which build-time depend on it.
>
> Thanks!
>
> [1] https://lore.kernel.org/all/apfyaxKEEJz20wRC@google.com
