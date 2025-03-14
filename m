Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200FE12B63
	for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 22:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741989977; cv=none; b=DLtvaob1wWv+GODLG69GHvrelfLArN0E2gVAPkT+gmmsSeDqyDWsgEjuyBIVnonKge9Bv3knQkqzy1HYsH6FlSqKA++vLBoaTX0d1ZW2lrIn4Q8+z/Ik2w91g/Zfav39qe0jNfgGCoWQDbr0lWnLi2iYHecwGzYqFXDfTaYPBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741989977; c=relaxed/simple;
	bh=CKhlM71HHWzhYTD7pWKMXzC0UBFFhRub+4ucFciopmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McpV278ltEAyafhdSFLNOYn6+p/PkBpl9kMPMLQaOLi5F0EryfSwaSNeVp67/eETBMzQ7wStBQnUNumu+w7DMFTPbbgZMaz9TcInVAutH+BxiWI+Bi6ieuNFEH67awzUl3qAra/Y133K6rUrcoStDZXyWpKRZOrNPIUMX/p5ACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FeFfcuBV; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FeFfcuBV"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30761be8fcfso28301011fa.0
        for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 15:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741989973; x=1742594773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=FeFfcuBVogztyG6WAIIthwmFacdb8frt6sFAcRgGNSbINK03hSIoqXlktfwfQet9X5
         4GFjnC4Dq9aILSv2uyTFuXGSdyPGtwFquauwcAaRzheNNqLG/tpBn83vblKwWuTHmqvq
         9M3p93s7X10Cwf/IIH+OD4Qd7i7j7ECrAoeE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741989973; x=1742594773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=PsZHaCb0H1kzpMvqN380hU0Vt2t1R/vdFRZLW2ki52f5ky06MLeMizJ05/R4iNEzPa
         RTeb645s7tTNxmtcGm3P6/u9MDxU15gL2AYyVGE3jDzIaDVKFqYY/pMq0E+D5T+9BytX
         tijO6vSQsRZGmXpmeGqGhUGagtfkDAKH/rdp76hi+ZdTA84ztJkf06QNr4SmVp67An79
         4OBg7JOEHStD+8tedsBeXJFck9hvVnXASqU/qMV/gDk8tJdgpiSAMRk2JkJwbNgK3lLs
         4D6tHXZLvkflG6YcFCaagotT1Ce43eQ3VTN1kVTc2xNwtlsoWySKfKIaIE2W/Z/D0gwy
         2jhw==
X-Forwarded-Encrypted: i=1; AJvYcCVgA30Jwt0VnEPDUU5HiyM+kWEYY6cf5jU+VQienAH+ZDhehXHSfwXjvNGP8d0GfaKZvLPcKyJnZihLgI+arrs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCA0eaD2neIQOb28maZKDi5AO76fvrKczWcv4qxmnqT9SDDARV
	9QV2Uff1pLgiaBnycenB5i+wXmtJeLRP0rx3+fTbLmjgoAKLydS0vO5Rs90iDB3jNWD0ntYl2wd
	zlhcR
X-Gm-Gg: ASbGncshxcfSho18oZMKEcQE3mFj/Ajqom0Gfa+2bE2Bv8gdtJ5GvV1UTXfaCGDhoUh
	qIjYT5JVQAuFYXexYCzrZQOOkJDYb235IpaG64J+W8Kb92hYn8L7wxXnXSzWRo21LwHdhTQzkgy
	66WN7Xoex/VxOIygcbBQztfpnWUPGuwNNkKhR7sWayndCYGg+XQ/FjYC81YVrqfXDil4zjC73Y0
	PM4nS5PyG0b5bhVGF9omUGhhgveWj3ioVAUC5wdvR5SwFtv2ZJXfTU2XehsFgyBWcFmtfFU4AZA
	dkSEL4PrkOHXJtasSpV+/V9D16L5+ag5bT8+e3vyoG75h6ih/Yxw/EsF1P59/WrQQVwSZJUjWbs
	GgYFGvFk9D8FK
X-Google-Smtp-Source: AGHT+IEFJrT1ZH7RzHGzU7m4H2ssD1GZUXpF51OAIkybWTyHxUxS9iMTnvERF0b4uTwKLOrx/m74Sg==
X-Received: by 2002:a2e:b8d0:0:b0:30b:d44d:e76a with SMTP id 38308e7fff4ca-30c4a8d8ae1mr21870351fa.25.1741989972601;
        Fri, 14 Mar 2025 15:06:12 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1170dbsm6948381fa.64.2025.03.14.15.06.12
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:06:12 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf251025aso22025021fa.1
        for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 15:06:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeiCCmKJDWXuciLreDQPvrwd97+Hc/9WbU3hS3eQN/rXKGmBPdVB2ufp//Zt289BE5nsl/dVwklEpbAzhivnM=@lists.linux.dev
X-Received: by 2002:a05:6512:3d02:b0:545:c7d:1784 with SMTP id
 2adb3069b0e04-549c3988b84mr1398468e87.43.1741989528244; Fri, 14 Mar 2025
 14:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250312104344.3084425-1-wenst@chromium.org> <20250312104344.3084425-2-wenst@chromium.org>
In-Reply-To: <20250312104344.3084425-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 14:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
X-Gm-Features: AQ5f1Jqp4S31G39Rg1NsczcQY3Hb3QPTaquvIuzNNpiFQjs9eAjzZVdMi2mJRe0
Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


On Wed, Mar 12, 2025 at 3:43=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration. Enumeration and subsequent operation follows the I2C HID
> standard. The eKTH6A12NAY requires longer times for both parts.

Somehow the last sentence above confused me. Can it just be dropped?
All you care about is that the new trackpad matches the timings for
"eKTH6A12NAY". Not sure what you mean by "eKTH6A12NAY" needing
"longer" timings.


> Add a compatible string for it with the ekth6a12nay one as a fallback.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b=
/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index cb3e1801b0d3..81c391952ccc 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Elan eKTH6915 touchscreen controller
> +title: Elan I2C-HID touchscreen controllers
>
>  maintainers:
>    - Douglas Anderson <dianders@chromium.org>
>
>  description:
> -  Supports the Elan eKTH6915 touchscreen controller.
> -  This touchscreen controller uses the i2c-hid protocol with a reset GPI=
O.
> +  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
> +  These touchscreen controller use the i2c-hid protocol with a reset GPI=
O.
>
>  allOf:
>    - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> @@ -23,12 +23,18 @@ properties:
>            - enum:
>                - elan,ekth5015m
>            - const: elan,ekth6915
> +      - items:
> +          - enum:
> +              - elan,ekth8d18
> +          - const: elan,ekth6a12nay

The "enum" above is weird, but it matches what we did for
"elan,ekth5015m" so I guess it's fine? I'd leave it up to bindings
maintainers. I guess the assumption is that we might add additional
touchscreens to the list...


>    reg:
> -    const: 0x10
> +    enum:
> +      - 0x10
> +      - 0x16

Again happy to leave it to the bindings maintainers, but _maybe_ just
drop the "reg" parts here and below. It doesn't really have to be part
of the bindings.
