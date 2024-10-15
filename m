Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23241B3950
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015503; cv=none; b=kmsEQST5G+4vWulx3KfvKRjI1uMP55o2lhw22mPJmDcLTFSPlaBVPX/HhvXN2n9uq0uKe6QGkO/SoUTbris05GIimPIWaFDFzzrj94ln35R+l6kG8FE2Lj36GT4dN7FqQZs7GpI7UhZD3VYZr3Nhix6zzewkVntu5g1V1yeNrRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015503; c=relaxed/simple;
	bh=8xSHcy2PuAPSvZBu9Eml4zzV7wYxfR0IjepjU1wiaRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+uS9v/wbCOge+kH/G1omOp5ykab21RqtreVelFLj6TBTH1ORg70znEYB8V/dpbmGWpW1o8TKrpqvqe1ZopVi7tSqJg40jL0iQ1PiGfYKt1HcaAXMnisxNZJEo9ZaMuRIcbh4+69dRxr7xJb16fvTlLUrZ2pn0A84y793mNjWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bEb0KZSo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bEb0KZSo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99543ab209so879895466b.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015500; x=1729620300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=;
        b=bEb0KZSoRa4fISt2bdWAusZdeGd6EgPCANBIIXCm90M2l6+d2rJLCpIXlNoIakiJPv
         LKdu89+djAYeFQCGNAPoRVoeRTMzhtVCT2GPFeVTi3pB5Af4GJIq3UBNK8EI9va82478
         mF9fiOfEqDFOLbxqfRjt0rWUwYCQun5v3jtqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015500; x=1729620300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=;
        b=XwgWkrDKtJsfVeXi9/sMl97UlVoLahsaI5m0+O2wfhylBf4eI4asXKGQH6Y/ENBhFW
         O39ZNtJtkU8x3r1mn2DsAvefbrcAnZzjuG2wT7WeQtXBMmMcc+BxO9wUnHsR9yBNREK/
         4Cgb8iquwD+IFC2K10voSDB3S4YlpLC5mP7mW63p5InOOIOyD+KCDETux15evCVgZKqw
         /RLzQG+dokV6EWLDTf8m4oV2kvYxhVJyR5AfqHjEZwsbBBYAeq4MACpRXW2MxsEso0bT
         NIpGjEqcmfFzDb80y6UZkwPuJ4GKs9FRNkKFBUONWi6hIznRJn0dw57DpGqCPRQi6z4H
         h6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxbknkHmQfQhPmxYv461F0xpvG2H7wUfFVHcMOg4nT2JTOAvLCSIxvchu+C5VcP/E1v36sgpSlVY4x4+OBb7I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc/5BX/Q+TlBUkw1d5fqSWQcQ8wqrd1i1qgAIFUePYAF2cMH+Q
	IZy1Iq1cnE809o+syQs803xIa7s/A2v3/czRRWKwdA0fCCSwW824TGCumGUmnluuf9elx8ZpqlU
	eNgpm
X-Google-Smtp-Source: AGHT+IFTBASuNZEfvMfX02zsqnt51fXwX8v0p1W3STAe8Fun+DRZqoRRIhp6FrXWYhne0vUq/sl94A==
X-Received: by 2002:a17:906:6a14:b0:a99:c9a4:a4da with SMTP id a640c23a62f3a-a9a34e76bf4mr86808966b.61.1729015499662;
        Tue, 15 Oct 2024 11:04:59 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2974994asm96097566b.78.2024.10.15.11.04.59
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 11:04:59 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso2044269f8f.3
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 11:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTIVZq4l2gIssNYB86z9zLGf373YGvjMraltPwYlptjlrY5KyvcfNdV2+WYg1anpt/Swe0xp6S3hXkjr8W0q4=@lists.linux.dev
X-Received: by 2002:a05:6512:1091:b0:539:f13c:e5ce with SMTP id
 2adb3069b0e04-53a03f77ea6mr882102e87.46.1729015152112; Tue, 15 Oct 2024
 10:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-7-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
Message-ID: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
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
> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct =
i2c_of_probe_simple_ctx *ctx)
> +{
> +       if (!ctx->gpiod)
> +               return;
> +
> +       /* Ignore error if GPIO is not in output direction */
> +       gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);

I'm not sure I understand the comment. Does disable() ever get called
when set() wasn't called beforehand? How could it not be in output
direction?


>  void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
>  {
>         struct i2c_of_probe_simple_ctx *ctx =3D data;
>
> +       /* GPIO operations here are no-ops if a component was found and e=
nabled. */

Instead of the above, maybe:

GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early()
was called.


Just commenting nits, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
