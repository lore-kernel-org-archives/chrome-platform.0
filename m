Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7E383A3
	for <chrome-platform@lists.linux.dev>; Wed,  4 Sep 2024 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725490659; cv=none; b=qRU/yGy1/3fFXwQ9bIxkzB5E9I8ewAT7ZifHXCyeaJtE7UoaPytST9/t7svSTU3zZm09pAfQCAdHQQKJc6Whp+H5KHoRAb/46OfyfUZIwT9bFU9zS37SmZUYIJ4FanmJ7oNLDzstombAtDavloERrQ0jjNhzNsFDzVtd31nOCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725490659; c=relaxed/simple;
	bh=9+gChnP5+JN/xcDHFnljOqSBOGQpXqxh0GSV4CRi4i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF4z6D/3ogi8rxwvdiuKU5b7WgQmSAMA4tPQAnYv5lDvijRXylfpRpwhCbWB3g9lek/y4U21SkomSVFAJ9VrakHeep/cJzO8cyoxAaTFbIomOw6b/31qG5xzc81ZKQPuYeyCBBbqi8mXNAOUZklwjJlPQaYjFrYaz0BRgrMKOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N7+kOM1H; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N7+kOM1H"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4567edb7dceso985891cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725490655; x=1726095455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=;
        b=N7+kOM1HWThtJTF+R5tjijfIb4cHaj6oPuEz5HvMXs8lxUDX/ex7ueOlnShYFyCYAx
         Y/eJv2oEZnI8somxCREPcXMYM1MhTl38nKx9kSLYhKKS/bFyz8jVvCh2pfLhLiUDmi4g
         gwhIF+Yuj+s2FnjdmEhTVFDK9wzkRnR/aVvyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490655; x=1726095455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k696Bg6R54WASMTi+pz+LZlGCRBSQtRYcr6+VwRcm/8=;
        b=YLL6myNjApdw7j6NWpiVYu4RUDu8sBCh1d3MTthXda/S7d9wfyd+7m/kbu/jn1Tf9g
         vR3wdLcyVMgWMQ2u5Op/w544f6qwitZzgU8HrUX/2rYuTi3uwdu/O1kK+59/h7ylbBLD
         Mi2cHvIYnGJQ2C6GL798pFrN+oqTu7CQzfyc7Oy2z+7faTRA/dYlHXamVQ1kxOKFivQL
         yTrURLTkuVmKiofcD7DLyu3FShDpPDqqLkDf4ky81rHPm/m6pJFF5BhtS7YmQTfH/cyS
         4+VfcqJ+hkYcf96AeCAyqD0aKqeVLI0l3P0REvtEcU2+ES9kAslBcLTA0Ym6NCY/PM2S
         K6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXnsWG/bmBV7ROQSVcC2qScC5l/1VZEZj/XXN01YTB6+V+iSqO/spW3EGrs0vqRR88GBaiiUBy3ayLXzMnJUUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUv8EUZfawXlhUiP+IQzguHQgYg3aQd1e2Ko5y2sBhpUOqKXXH
	UyXD0M33NPI/Q3nwfrGspwemTbNt9cftznUP8E7fMLsX6OGVoYQjKf62c93xHaN3sTDAQt3Pp3w
	=
X-Google-Smtp-Source: AGHT+IHFGTKWtftEml+BRsZoBe3lV9/SHTApznwLNG9eQLL2+JkK87HibkkeInNd8b8VaUjgA6NI7A==
X-Received: by 2002:a05:622a:993:b0:447:e48d:f067 with SMTP id d75a77b69052e-4570eb0dcfbmr197767831cf.14.1725490655088;
        Wed, 04 Sep 2024 15:57:35 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801a1556csm2579731cf.7.2024.09.04.15.57.34
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-456954d0396so843611cf.3
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 15:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURWJUiTYYecHklOPrI2mYFHaev/vD91nkkkeMPeOX8M5LmsMMKK7dz1/vYY1kd/P4Ys9Cc2Z7KipjeWqBy6NM=@lists.linux.dev
X-Received: by 2002:a05:6214:3da0:b0:6b7:b277:dd12 with SMTP id
 6a1803df08f44-6c3558475afmr184722756d6.49.1725490653502; Wed, 04 Sep 2024
 15:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
In-Reply-To: <20240904090016.2841572-10-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 15:57:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
Message-ID: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> This adds regulator management to the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
>
> Without specific knowledge of each component's resource names or
> power sequencing requirements, the prober can only enable the
> regulator supplies all at once, and toggle the GPIOs all at once.
> Luckily, reset pins tend to be active low, while enable pins tend to
> be active high, so setting the raw status of all GPIO pins to high
> should work. The wait time before and after resources are enabled
> are collected from existing drivers and device trees.
>
> The prober collects resources from all possible components and enables
> them together, instead of enabling resources and probing each component
> one by one. The latter approach does not provide any boot time benefits
> over simply enabling each component and letting each driver probe
> sequentially.
>
> The prober will also deduplicate the resources, since on a component
> swap out or co-layout design, the resources are always the same.
> While duplicate regulator supplies won't cause much issue, shared
> GPIOs don't work reliably, especially with other drivers. For the
> same reason, the prober will release the GPIOs before the successfully
> probed component is actually enabled.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Split of_regulator_bulk_get_all() return value check and explain
>   "ret =3D=3D 0" case
> - Switched to of_get_next_child_with_prefix_scoped() where applicable
> - Used krealloc_array() instead of directly calculating size
> - copy whole regulator array in one memcpy() call
> - Drop "0" from struct zeroing initializer
> - Split out regulator helper from i2c_of_probe_enable_res() to keep
>   code cleaner when combined with the next patch
> - Added options for customizing power sequencing delay
> - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
> - Add i2c_of_probe_free_regulator() helper
>
> Changes since v4:
> - Split out GPIO handling to separate patch
> - Rewrote using of_regulator_bulk_get_all()
> - Replaced "regulators" with "regulator supplies" in debug messages
>
> Changes since v3:
> - New patch
>
> This change is kept as a separate patch for now since the changes are
> quite numerous.
> ---
>  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++--
>  include/linux/i2c.h              |  10 +-
>  2 files changed, 155 insertions(+), 9 deletions(-)

I never jumped back into looking at this since you started sending new
versions last month (sorry), but I finally did...

At a high level, I have to say I'm not really a fan of the "reach into
all of the devices, jam their regulators on, force their GPIOs high,
and hope for the best" approach. It just feels like it's going to
break at the first bit of slightly different hardware and cause power
sequence violations left and right. If nothing else, regulators often
need delays between when one regulator is enabled and the next. There
may also be complex relationships between regulators and GPIOs, GPIOs,
GPIOs that need to be low, or even GPIO "toggle sequences" (power on
rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
rail 2).

IMO the only way to make this reliable is to have this stuff be much
less automatic and much more driven by the board.

I think that, in general, before the board prober checks i2c address
then the prober should be in charge of setting up pinctrl and turning
on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
may be specified by different children, the prober will just have to
pick one child to find those resources. It should have enough
board-specific knowledge to make this choice. Then the prober should
turn them on via a board-specific power-on sequence that's known to
work for all the children. Then it should start probing.

I think there can still be plenty of common helper functions that the
board-specific prober can leverage, but overall I'd expect the actual
power-on and power-off code to be board-specific.

If many boards have in common that we need to turn on exactly one
regulator + one GPIO, or just one regulator, or whatever then having a
helper function that handles these cases is fine. ...but it should be
one of many choices that a board proper could use and not the only
one.

-Doug
