Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1064801
	for <chrome-platform@lists.linux.dev>; Wed,  7 Aug 2024 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723001296; cv=none; b=vFnsK7BMexxNbRZdNAgwtQGK2CNfNzYAnO+aMZbnHuSGvHZ/XbHrDtjj7hvJrWm8Yg0j7MdWvCQyakzHzd5A9FiFry4KjRAfxdIBViy0ymHwQv1NB4G3dJZoel3lHmVyxG5qs1gBNEqXCaGXRpMLzYt+xGgi/olK7b7TN1+mTwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723001296; c=relaxed/simple;
	bh=8W6rLWhYF8C8Sh9w8nzXic/NcFdimjT2dYGpjIwW88U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKQKayhMx0mIWomLXHjpWMEOLfEqyKtsbp0UrSlf64JBwSzvI0GKFF8gfV5J88wu9veZmv74SAf0q987vGgq+JUP1uyE60Do1qTY7+S6pauF//CCUZqNj4aOnyEgzfhBiPMwus7cOwRrFt2WflCE/AjCW4icV8dPtLdQ8+DdkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=Sp3Wjwmn; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="Sp3Wjwmn"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso1343753276.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Aug 2024 20:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1723001294; x=1723606094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6dDyXEzdvY3O/2ZGCYfE/LJsjjyAReQdL395WzbNWw=;
        b=Sp3WjwmndCu4BhVYRXqENyDjnRHGoHYb8ZV6eMTe0hdqBsRhEQHpr6pIufVZ8Te4Pz
         IRPF8ZAI35IvTww/IjW0eNjSqxa8pgUT0fymaE0UytiJ6geGR1emhaiEs/4ncClL4gKy
         MVXAKNMlPoijM4EghI6RIMPd6tUobAcqweDAWeBwFJPlXCPbXYCRRP7OhSArT+JJygQs
         B3M1LuaHFKhxR9tHKAtn+ouyeMFnIflu9fZkJASqUqzcy+speRX1v55P9wFdg2KjlhB9
         d75mPvD5fC3vO2QrClufn4rGby+Wsi0x8GVslhmvXeEcdciIPsJHlPg+SME8zyl41fMN
         g2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723001294; x=1723606094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6dDyXEzdvY3O/2ZGCYfE/LJsjjyAReQdL395WzbNWw=;
        b=leUYnqxLQvwbh/F3VslnZNW52AQnBQEcwYB0hHXawa4UbC952O95+gTV1tZweco7r/
         J1Wx/U60YUGKV9P6M08ujxfBPiQRnaXfjWSmwGcLRcEmTsymB+SIBWve42+jv8kU3cKV
         ++mWAy8EAz8wZ1OblI4ge0HXzAgJlUSKmXKOA9crKPOwsp0v7/ECTG8M6y3MfbCSvvkn
         TBpkDWJFV3A9Kpw4SVObuADr6zE9/OOixdNGsscPHknSNJPHLbCzSyOHN737ryCAAIgB
         6/QFpTgwqJc5txSxKgTNPFcKqTPrRk44bUQ7bYYYw/FJuDaGPLDgfGH13257CW5B9wt2
         kFLA==
X-Forwarded-Encrypted: i=1; AJvYcCVG22VJyPUbFUcDtVfDrKNWtE+ZdJjzEUoH0XJ2lm61LN43tfx3DdDjWYLln1qv+IFfnL/6EmRf6ekolXfpnatPbP6ASTVocWIEGy+8NNvU
X-Gm-Message-State: AOJu0YzbyI0/+FgHC8oADFFJzpUDuwF/pEXTQnNslQBodMYEf+a5zT7x
	QFIzLWmaFCuMcvO/bg2Bv9qTmZjWxg1Ba/uPUqzl2p0LfIrKUpzcQdUPs6wvnWxPFWuKDdCDwR8
	YdhEEQ5Cdadi6+bvMyP7iNjr05PFmVKnD1n9L6Q==
X-Google-Smtp-Source: AGHT+IFOvsJQY5k4idstz23ZfdKY9CVH9/k/pJLYdr/rLaQnaer3PzwH4It7pRkC6S9NzR62YITWSg4kVAZc9a0IqWc=
X-Received: by 2002:a05:6902:1749:b0:e03:4c64:c814 with SMTP id
 3f1490d57ef6-e0bde3b0c16mr15989415276.22.1723001293862; Tue, 06 Aug 2024
 20:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806-platform-chrome-cros_ec_lpcs-change-the-default-disposition-of-the-framework-laptop-v1-1-09e0d602b215@howett.net>
In-Reply-To: <20240806-platform-chrome-cros_ec_lpcs-change-the-default-disposition-of-the-framework-laptop-v1-1-09e0d602b215@howett.net>
From: Alexandru Stan <ams@frame.work>
Date: Tue, 6 Aug 2024 20:27:38 -0700
Message-ID: <CAORQ5J5BWKOeSHYg1Fh-EAiNL9PN=Pph+abkgiKVBuJQewe65A@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: switch primary DMI data for
 Framework Laptop
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 7:54=E2=80=AFPM Dustin L. Howett <dustin@howett.net>=
 wrote:
>
> Framework Computer appears to be moving away from the Microchip embedded
> controller seen in the Framework Laptop 13 with Intel Core 11th, 12th
> and 13th generation processors. All newer models use a Nuvoton NPCX
> embedded controller.
>
> Changing the default DMI match for Framework's products to match their
> newer product lines will reduce churn in this part of the cros_ec_lpc
> driver.
>
> The new match tables are:
>
> - Microchip EC models
>   - "Laptop" (product, exact match) for the 11th gen. Intel Core
>   - "12th Gen Intel Core" (product, exact match)
>   - "13th Gen Intel Core" (product, exact match)
> - Nuvoton NPCX models
>   - "Laptop" (product family, partial match)
>
> ---
> Signed-off-by: Dustin L. Howett <dustin@howett.net>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 36 ++++++++++++++++++++++++++---=
------
>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index f0470248b109..c784119ab5dc 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -631,12 +631,12 @@ static const struct acpi_device_id cros_ec_lpc_acpi=
_device_ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
>
> -static const struct lpc_driver_data framework_laptop_amd_lpc_driver_data=
 __initconst =3D {
> +static const struct lpc_driver_data framework_laptop_npcx_lpc_driver_dat=
a __initconst =3D {
>         .quirks =3D CROS_EC_LPC_QUIRK_REMAP_MEMORY,
>         .quirk_mmio_memory_base =3D 0xE00,
>  };
>
> -static const struct lpc_driver_data framework_laptop_11_lpc_driver_data =
__initconst =3D {
> +static const struct lpc_driver_data framework_laptop_mec_lpc_driver_data=
 __initconst =3D {
>         .quirks =3D CROS_EC_LPC_QUIRK_ACPI_ID|CROS_EC_LPC_QUIRK_AML_MUTEX=
,
>         .quirk_acpi_id =3D "PNP0C09",
>         .quirk_aml_mutex_name =3D "ECMT",
> @@ -696,21 +696,39 @@ static const struct dmi_system_id cros_ec_lpc_dmi_t=
able[] __initconst =3D {
>         },
>         /* A small number of non-Chromebook/box machines also use the Chr=
omeOS EC */
>         {
> -               /* the Framework Laptop 13 (AMD Ryzen) and 16 (AMD Ryzen)=
 */
> +               /* Framework Laptop (11th Gen Intel Core) */
>                 .matches =3D {
>                         DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> -                       DMI_MATCH(DMI_PRODUCT_NAME, "AMD Ryzen"),
> -                       DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Laptop"),
>                 },
> -               .driver_data =3D (void *)&framework_laptop_amd_lpc_driver=
_data,
> +               .driver_data =3D (void *)&framework_laptop_mec_lpc_driver=
_data,
>         },
>         {
> -               /* the Framework Laptop (Intel 11th, 12th, 13th Generatio=
n) */
> +               /* Framework Laptop (12th Gen Intel Core) */
>                 .matches =3D {
>                         DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> -                       DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "12th Gen Intel=
 Core"),
>                 },
> -               .driver_data =3D (void *)&framework_laptop_11_lpc_driver_=
data,
> +               .driver_data =3D (void *)&framework_laptop_mec_lpc_driver=
_data,
> +       },
> +       {
> +               /* Framework Laptop (13th Gen Intel Core) */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "13th Gen Intel=
 Core"),
> +               },
> +               .driver_data =3D (void *)&framework_laptop_mec_lpc_driver=
_data,
> +       },
> +       {
> +               /*
> +                * All remaining Framework Laptop models (13 AMD Ryzen, 1=
6 AMD
> +                * Ryzen, Intel Core Ultra)
> +                */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> +                       DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
> +               },
> +               .driver_data =3D (void *)&framework_laptop_npcx_lpc_drive=
r_data,
>         },
>         { /* sentinel */ }
>  };
>
> ---
> base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
> change-id: 20240531-platform-chrome-cros_ec_lpcs-change-the-default-dispo=
sition-of-the-framework-laptop-2249a26c88af
>
> Best regards,
> --
> Dustin L. Howett <dustin@howett.net>
>

Thank you! Can confirm, the new designs are NPCX based, so it's a good defa=
ult.

I would even go further and say npcx doesn't have to be in the struct
name (since it's mostly the default settings that might work on
non-npcx chips that aren't microchip), but that's more like a nit.

Reviewed-by: Alexandru M Stan <ams@frame.work>

Alexandru M. Stan (amstan)
System Software Engineer
