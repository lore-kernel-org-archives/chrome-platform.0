Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45219CC2F
	for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271022; cv=none; b=dl04lUuf5stHD3GGjTlpMUdrNmieC/avEc8yCP7VVPUyBE6w5+wchoTys8FxJLzKm01nVK/6cangWFGKV9V5PceiwghjD2eBncdhhuW/EezYAC9nfZFnZ688Kq8cM5lrWY5sYOIa8mVOQrswHxlDJMvbHE2/rKPGkT17vIa+Mg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271022; c=relaxed/simple;
	bh=HPCIWNWpBdtqLYZEm2Q7Mjcha/BIoksmpFmSMnXlxFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHBurnrUG6Jbr9d38ETF64xWhfN+CY4XOkjxHTmmncDNrjKhzNJLySgjL4hqMayLPVXYAMx34irjM0OP792w7y9zNGBVl7sfGyt5gsRTCcYmzUzMv7ulVOiv5DIZmgPrmbb/cshOgyXBdxg/DVsfMOXTOi1LWg3XdDmnP+T+EYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nkf9BjWl; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nkf9BjWl"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7a7f8b0b7d0so156807185a.2
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 16:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271016; x=1726875816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=;
        b=Nkf9BjWlSLQ/gXNbluQ21kqTwyH0UwdeUrpeL6iZRLshrxArQBpbX2TI/60KFYLlIA
         /HMNdDojUnm677z+ttOoh4H/iJ4Ns2vKdqJf/75yQzZ+UtA4P+wu67EcrKv8bLzcpuIk
         IW/3Az57gsjmmfpd7uKbo5rZ+Zvx8eaEGYaiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271016; x=1726875816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgrnQAkPxnP9xr/uHfnesOWhy4bQylWu/nCRFkQoiTg=;
        b=W8+2mJxrsUUFxNXefSK7K4eesVFRCrUMScvZaCg+SuR00E6GjPLIqrzLNF6s4W1d24
         HNe50Jm6rbNi0J4KQ0UKytAyIrUytfuqu/BsWnOROKxAYfadblYJgD4v4XeB3SCrOkSY
         ngceLBpkmGCOd75jqL2Euv4PktZgeMzXrOyLwiabliAElRoPc7dpSh+cUGv4syI9pDXd
         E0KXOnKTXq58WwcaWNNDhAVp0zvqPX2vEUrE4nfc08TOpoWaHkyvf9bTKttUQy5Mo1Om
         rpG/+Rbg5semlz4it9qeHZpv06oCxXzjgbHYVMJ8YyEBkOpY629+6WO/bCK9gRkzrS7W
         1+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVDaHVixsFgY3bHgUfyfENNAU4GU6Sz1a0AfxlTMy5+VXfk5eKc9jCwc1FeTZ8vH59jy0Lv0XM+xafpMsUD+0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE7w3GCauKS/h4fKCX8Wg7LXyY0BvxFBpNQALX92yvti4baQcb
	G6eyGqxJqdg93BinFgVQ2rMvsc+H1p1QOr13grFl/fDW+WCqtNADOsHrALtnAgTUgb7C5WtTdeQ
	=
X-Google-Smtp-Source: AGHT+IEW3xjirkHVxCaFP8LarMAwKLcNRTG13wJ9aSoFBRCsf3FvT+nbn8FpBb8W1zMg4agcOtPviA==
X-Received: by 2002:a05:620a:28d5:b0:7a9:b9c6:ab4d with SMTP id af79cd13be357-7a9e5f7a992mr1152073985a.51.1726271016321;
        Fri, 13 Sep 2024 16:43:36 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3eb562f7sm13351685a.82.2024.09.13.16.43.32
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:43:35 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-456757d8871so15255991cf.0
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 16:43:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUUecrAIgIFolPJLj6VVvjXKru4WAjvwGzAposjgdcNRfG5NY8IH06J4H/2xR70G/u/ceE7M12kSVvEFvigMY=@lists.linux.dev
X-Received: by 2002:a05:6214:5f07:b0:6c5:de4:3edb with SMTP id
 6a1803df08f44-6c5735881a8mr122878276d6.29.1726271012120; Fri, 13 Sep 2024
 16:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-10-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-10-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
Message-ID: <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
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

On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)             +=3D chromeos_acp=
i.o
>  obj-$(CONFIG_CHROMEOS_LAPTOP)          +=3D chromeos_laptop.o
>  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  +=3D chromeos_privacy_screen.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)          +=3D chromeos_pstore.o
> +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    +=3D chromeos_of_hw_prober.o

"o" sorts before "p" so "of" should sort before "privacy"?

I guess it's not exactly all sorted, but this small section is. Since
it's arbitrary you could preserve the existing sorting. :-P


> +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> +       { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_trackpad },

The fact that the example is only using "dumb" probers doesn't make it
quite as a compelling proof that the code will scale up. Any chance
you could add something that requires a bit more oomph? ;-)


> +static int chromeos_of_hw_prober_driver_init(void)
> +{
> +       size_t i;
> +       int ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +               if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible))
> +                       break;
> +       if (i =3D=3D ARRAY_SIZE(hw_prober_platforms))
> +               return -ENODEV;
> +
> +       ret =3D platform_driver_register(&chromeos_of_hw_prober_driver);
> +       if (ret)
> +               return ret;
> +
> +       chromeos_of_hw_prober_pdev =3D
> +                       platform_device_register_simple(DRV_NAME, PLATFOR=
M_DEVID_NONE, NULL, 0);
> +       if (IS_ERR(chromeos_of_hw_prober_pdev))
> +               goto err;

FWIW if you didn't want to see your prober called over and over again
if one of the devices deferred you could just register one device per
type, right? Then each device would be able to defer separately. Dunno
if it's worth it but figured I'd mention it...


Also: as a high level comment, this all looks much nicer to me now
that it's parameterized. :-)
