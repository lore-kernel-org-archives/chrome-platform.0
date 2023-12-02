Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9567F1385
	for <chrome-platform@lists.linux.dev>; Sat,  2 Dec 2023 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OM7t0ksp"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so4057719e87.3
        for <chrome-platform@lists.linux.dev>; Fri, 01 Dec 2023 17:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701479079; x=1702083879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=;
        b=OM7t0kspnAESSUe5SniE9ujqTCIU3pb8q6Y1fprFL8150EgIVkOkNcvEsi2+tcIQHD
         pAY57xY8NZEKDS/284/UnMKiSbE8MxPr7wMZiiuz5Yw4vXzNGg2xDjJqn1ZF0RiW4oLp
         uH+ajQMMaz4ejbrr29r+sqxQutJA2+xsVwhfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701479079; x=1702083879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=;
        b=HuQPLDNcnh/G/RWQX3IixUuVwzoxn4M+2Yk2DWu0vNWmyOTRw3M0XpRMIQYfI+G2WX
         lOKr9C06V32UIEaMHxbt7Q9F3sr/zqrPcRZhKzUZEYX8uJ7nEoH+WRArDjUy4xUx9Qkq
         ijZUsOJgQn/Np+CCxrLr7Aqp2OrKtNbWzQ3MgT7r7tY9fZ7swDFVSLQqihc85LWIRP90
         aTFzgMzTryyV4OPZCBwKL8PmGShZkvlhS6cII0+twZgvX86khXCgEcqJCZ/blp1Se9hb
         o+DCytB+nsbdE16hnVqprBs1KdcXjsFu5s4IHukox1OMPocz23wBB7Fg3vvMz09UFNUI
         e17A==
X-Gm-Message-State: AOJu0YyL2dtrzH13kZfPgQkHg8zqiCkFaD2HB5XufmHMgW3zGjkk2eSC
	bnF+b9UBGSS/xpOY+ncI/8J6gMiMBV6LAkEHmBKaic1P
X-Google-Smtp-Source: AGHT+IGgQBO3vmcd7LHDh1/rcHI/N+Ia1OryYvc+0vMgTRBblFotqMm6Vq34eEQNZttXyE8NgwKljw==
X-Received: by 2002:a05:6512:33c8:b0:50b:dec0:8d0b with SMTP id d8-20020a05651233c800b0050bdec08d0bmr990887lfg.85.1701479078967;
        Fri, 01 Dec 2023 17:04:38 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id o6-20020ac25e26000000b0050be88a108esm9355lfg.197.2023.12.01.17.04.37
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 17:04:38 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50bbf7a6029so1159e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 01 Dec 2023 17:04:37 -0800 (PST)
X-Received: by 2002:a7b:cb59:0:b0:40b:4221:4085 with SMTP id
 v25-20020a7bcb59000000b0040b42214085mr244275wmj.1.1701478712415; Fri, 01 Dec
 2023 16:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
Message-ID: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
>           To compile this driver as a module, choose M here: the
>           module will be called chromeos_tbmc.
>
> +config CHROMEOS_OF_HW_PROBER
> +       bool "ChromeOS Device Tree Hardware Prober"

Any reason that it can't be a module?


> +       depends on OF
> +       depends on I2C
> +       select OF_DYNAMIC
> +       default OF

You probably don't want "default OF". This means that everyone will
automatically get this new driver enabled which is unlikely to be
right.


> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +               if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> +                       int ret;
> +
> +                       ret =3D hw_prober_platforms[i].prober(&pdev->dev,
> +                                                           hw_prober_pla=
tforms[i].data);
> +                       if (ret)

Should it only check for -EPROBE_DEFER here? ...and then maybe warn
for other cases and go through the loop? If there's some error
enabling the touchscreen I'd still want the trackpad to probe...


> +                               return ret;
> +               }
> +
> +       return 0;

Random thought: once we get here, the driver is useless / just wasting
memory. Any way to have it freed? ;-)
