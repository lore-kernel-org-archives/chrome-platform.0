Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54231FAF19
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015169; cv=none; b=bOMWOqSJCF3YnvxfOT6uGGVZQ3LOG4t5g0gEhhMkI+O8/TQP7t5I3+jTSZltssMxOtqw3kXOjI+IDNBnlkO7CiGBl6Yjcj3YJA5w6sGQKw03iQqFU262bvd8VerpkCooP44cIc72y0+0IL2+Bz76UpVvO3a3ldpUDYufDeL/FLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015169; c=relaxed/simple;
	bh=Nw8AYXxLQYRASA0EqVaeq4osc1EcBSEe7S6yFgCszeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+459IQqA3Q7ykb3Xz8GR2cuKsf7aXJzXZoHOW44TQIElrJnX1npg+nF5zD2VzziuMNRg/J05W6Y/iVcWn8eozfhTXSY+UT3EK3vOS9U8Jk5ftXjOMwNlCo9JeF0CTy1JLFt/o9X7F5plk6lYlHgCZLQUdtg7BLX+RpM249P0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f4Gteh4H; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f4Gteh4H"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e6c754bdso2946479e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015162; x=1729619962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=;
        b=f4Gteh4HL1UjytSnKISZF3DAntxJIFVb8EMUdySfbQAryJyjuqbwEN/i4g9kYWTzjU
         MbPQGvovuYGb3hpISwqiEM91Venf/E0tPdT2k4gkjEigkjgEeW4v+S0a7A518TPhHVqX
         n44Op06jPNOL8pT6winYpn2eDcvmN0u/s92M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015162; x=1729619962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgVZjc/qQxBTME0XwgT07broj1qCt0+6Ia7kOJS88zs=;
        b=DMyGe6KwJrNSSChivdMpJZeBgqYYKKoFJ4UmkniX2mB8kP+bcs+DUrgJsX+H2pxvRe
         MEW10oru8L+EbBOL7DCFoS3LlJ4iG+S6DgfZ7Y7so5LjvkrmqgXAJ9Oyp+V6yrbuD7g/
         5mIie0/9FW0Dot9oVUGFqgrfjMyb/0H7wehUDuvvgPfgRBkkuLkh9Oas82Pqy9U8QQy6
         m7WpZq0QEDyKmAmPIjHmnuo8jbZfc9fcTKpbserAzWRadp75EVf5Z4qP49Uas13HyUnP
         bE7U7AEPh8QPrhren3gsxA7tM9Ek3WSbq4b2wIzNQ9W2qhXsJvnVyhbGsm36tE6y37rt
         n7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsI0eF+NYOXIxXtrgdyzcatS0AZ8yGDVx/T+zp6PBXmfzLDflxTbabbTN1f3Eqso6m4z/J9Glq+rp+BxLyZKA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB2R1xjv/rdrAawWtuSKt53xnbNbN99e/nz3f+hQ7nDQ5h7JVT
	w7UL9Q3fBb/zqwCcQakD96UPqwW+qTEp2Vkl385sPejwrTiudVRPYa+uU4NYM6KrTivzGE3am4l
	mPk6a
X-Google-Smtp-Source: AGHT+IFnnIdd/y0tuHNtYTcY1+2vdWopNxm6NcEXGHKzIhd9VFBZC7nZj1OqXu085T+aSilnocYjUQ==
X-Received: by 2002:a05:6512:1283:b0:53a:7e:bcc6 with SMTP id 2adb3069b0e04-53a007ec0fcmr1883299e87.53.1729015161544;
        Tue, 15 Oct 2024 10:59:21 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb1e37sm223873e87.83.2024.10.15.10.59.20
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:59:21 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e6c754bdso2946406e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 10:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVITmixdFi8NkbxyVkeDQpK08hFZY38Ashzd5ZdNMaWQsrzziOnb54C0SnrI3QXzVvqcUYhfA/tsJjqu7Fpz3Y=@lists.linux.dev
X-Received: by 2002:a05:6512:3046:b0:539:d9e2:9d15 with SMTP id
 2adb3069b0e04-539da4e12eamr7412619e87.29.1729015159647; Tue, 15 Oct 2024
 10:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:59:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-00zCEGhp=Buqg2OFikX2TYDK81gXuD7S_+btqKp9JQ@mail.gmail.com>
Message-ID: <CAD=FV=V-00zCEGhp=Buqg2OFikX2TYDK81gXuD7S_+btqKp9JQ@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component prober. For any given
> class of devices on the same I2C bus, it will go through all of them,
> doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
>
> This requires some minor modifications in the existing device tree.
> The status for all the device nodes for the component options must be
> set to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Maintainer expects this to be merged through I2C tree.
>
> Changes since v7:
> - Corrected Makefile item order
> - Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
> - Added include of "linux/of.h" for of_machine_is_compatible()
> - Switched to simple probe helpers for trackpads on Hana
>
> Changes since v6:
> - Adapted to new I2C OF prober interface
> - Collected Acked-by
>
> Changes since v5:
> - Adapt to new i2c_of_probe_component() parameters
>
> Changes since v4:
> - Fix Kconfig dependency
> - Update copyright year
> - Drop "linux/of.h" header
> - Include "linux/errno.h"
> - Move |int ret| declaration to top of block
> - Return -ENODEV on no match instead of 0
> - Unregister platform driver and device unconditionally after previous
>   change
>
> Changes since v3:
> - Include linux/init.h
> - Rewrite for loop in driver probe function as suggested by Andy
> - Make prober driver buildable as module
> - Ignore prober errors other than probe deferral
>
> Changes since v2:
> - Addressed Rob's comments
>   - Move remaining driver code to drivers/platform/chrome/
>   - Depend on rather than select CONFIG_I2C
>   - Copy machine check to driver init function
> - Addressed Andy's comments
>   - Explicitly mention "device tree" or OF in driver name, description
>     and Kconfig symbol
>   - Drop filename from inside the file
>   - Switch to passing "struct device *" to shorten lines
>   - Move "ret =3D 0" to just before for_each_child_of_node(i2c_node, node=
)
>   - Make loop variable size_t (instead of unsigned int as Andy asked)
>   - Use PLATFORM_DEVID_NONE instead of raw -1
>   - Use standard goto error path pattern in hw_prober_driver_init()
>
> - Changes since v1:
>   - New patch
> ---
>  drivers/platform/chrome/Kconfig               |  11 ++
>  drivers/platform/chrome/Makefile              |   1 +
>  .../platform/chrome/chromeos_of_hw_prober.c   | 140 ++++++++++++++++++
>  3 files changed, 152 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
