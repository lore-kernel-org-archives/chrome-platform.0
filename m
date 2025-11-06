Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160F334E741
	for <chrome-platform@lists.linux.dev>; Thu,  6 Nov 2025 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453118; cv=none; b=tdiw6eynktkpC2SZkU1na1uH9v0y2nioX76lSOaqdQNm9qdAr1lsOmUU/urDfq+7MryQpH2EUyN6oZPAYKIlJUMfSTTpt9DlfSNLUmnHdXiZtY3aJ4euDNgxVZb5ZVtGcO8qj5cEJSDXKN1v/tW05VYowrx5WvkTFJ/ufB8WMRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453118; c=relaxed/simple;
	bh=oMS8T+OT/9Nui4b46aIksLQJ0N9ZjMFuDvzZmhiJqww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3LVRt/fa6zuax9RCoF69ItInWGcWwokQxraW+qM8n9enpFZBIathFGpGx0HKJ6wIbFMBREAMleyxhNEm7ZVbaM9x7gTduDESa4cizODZV2wiM38F61DckFQzG6/TuyVdhIepWKmA02Yxcl/3vH2OwgKeq4d4SwSdiKCds5cQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JH2P2qKd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JH2P2qKd"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b5a8184144dso192505866b.1
        for <chrome-platform@lists.linux.dev>; Thu, 06 Nov 2025 10:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762453115; x=1763057915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FN9+63BCY6a91Sh11P8wg56sTIKFRq6Ev4z9/iG60s=;
        b=JH2P2qKdBBGyU2tLYdh1E0IvwfzIkqdeLqDp8wQtY7bLNO5NCs2t+m5zJ8hXnrhCgI
         qy1gsbqp5W5D3c8q+qXR8ffGRZhLGuiP6aRuU/1/U3AHWTlOVn2f4hj120eRMr2K7YzD
         RGFpUoi/QXmSO1Hhb/91eSDmaxlEj+eSclq2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762453115; x=1763057915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FN9+63BCY6a91Sh11P8wg56sTIKFRq6Ev4z9/iG60s=;
        b=Zc2ZQz5yGDnUJz/X/TS0fIBjnAtB37OAEIaUrw/ac0QjMXYOccWN3yX+yJSRkLpGRy
         I1OLQHFZivxyseFzZlBy6OL7HUvCAlDxfZxMpNpCxDw91ZatJFPqUsE9+LP1MxOqf4FL
         SdPQqDBgAZK1kWXUw92BBO773t+2SOG16Un5OtP4xOYMTZJ4AKNjvQgrlWVO/7tZYAGu
         GpGxM5HtC8xCJxY/78GZNjqaVkn4J09a2xoHwNdi8A0HuLBjAQgUj0yODcHt+3gHmVys
         Ev3icUVzXK58geqP62HAk0htCyRBZPjLpc9U0gZuWx8VUukSPp89/jO57DkO8ohyMQM+
         nYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuL2s0z+IigPmqdW+JTMvDDiBQ/4zqjP8k5LbwsxqOE49wgO0LphVFvVhUcNcr9ryfYQsNfRd/JxYcV9lVcn4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZoz9/RGvCQ2SOswmoTdOF33T+FYK6oe+cCkgbm7F6Ak2rEj6p
	sc79eOdOTCb//7VFoGb5WfHOhn8cuOdk5OeTLjJQjtBCEf7KBhdR0Fwi6u9GTm+Qm1zQplYe87k
	rkFfXdK5ZD4i8Y/z6Ynakqow1FcaEEzXLc1zKVkYU
X-Gm-Gg: ASbGncswlMArEEDo2Sq6j2/85S893zcuAjlsAzW1hdjCGXtjCHwd/mnVM7vR89HVO2/
	oatWuin4sPF0gt9rvbwDEfVlynVVT+DLBdDNtXABDOhwPunfmpKSuNisJgZ8QkMOId7OkhFEF58
	wRAMpLqX5kCglvzC1dbMH5ZQmjVFFpVnl0e4g4plu5D2pYVyTUnnoatkqLLBwNk14sGC1F6ERwB
	uJsoikMTd0fv42OsshUMl4DogR6zqp7Hjt1YoaPlsOigaFvWAJzyOAkgVTvPwPYOT+1oj/WzRxu
	CNc=
X-Google-Smtp-Source: AGHT+IEP/nwzlykeSLaebiXJLfmr7cwOpqfsasygiy3POXKTjyaWp0Ppxd+0Gxo3zqPuZbdRPhQDcPYGjLKAO0sPWyQ=
X-Received: by 2002:a17:907:3c91:b0:b33:b8bc:d1da with SMTP id
 a640c23a62f3a-b72c08e023emr12144066b.1.1762453115425; Thu, 06 Nov 2025
 10:18:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com> <20251013203331.398517-4-jthies@google.com>
In-Reply-To: <20251013203331.398517-4-jthies@google.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 6 Nov 2025 10:18:22 -0800
X-Gm-Features: AWmQ_blOKtSWKrioiTuTVnOpd2P7YQAJP4q98Q_uCp-RggagsBRvuHIuk3LHNVM
Message-ID: <CANFp7mV0FjZ-4OB8uMeVfyQn_BAMhnhYs-w+ABzupoiiywN1Gg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Jameson Thies <jthies@google.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org, tzungbi@kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 1:34=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> ---
>  drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..1928c2ea2b8f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subde=
vices[] =3D {
>                 .mfd_cells      =3D cros_ec_rtc_cells,
>                 .num_cells      =3D ARRAY_SIZE(cros_ec_rtc_cells),
>         },
> -       {
> -               .id             =3D EC_FEATURE_UCSI_PPM,
> -               .mfd_cells      =3D cros_ec_ucsi_cells,
> -               .num_cells      =3D ARRAY_SIZE(cros_ec_ucsi_cells),
> -       },
>         {
>                 .id             =3D EC_FEATURE_HANG_DETECT,
>                 .mfd_cells      =3D cros_ec_wdt_cells,
> @@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *p=
dev)
>                 }
>         }
>
> +       /*
> +        * FW nodes can load cros_ec_ucsi, but early PDC devices did not =
define
> +        * the required nodes. On PDC systems without FW nodes for cros_e=
c_ucsi,
> +        * the driver should be added as an mfd subdevice.
> +        */
> +       if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +           cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> +           !acpi_dev_found("GOOG0021") &&
> +           !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) =
{
> +               retval =3D mfd_add_hotplug_devices(ec->dev,
> +                                                cros_ec_ucsi_cells,
> +                                                ARRAY_SIZE(cros_ec_ucsi_=
cells));
> +
> +               if (retval)
> +                       dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d=
\n", retval);
> +       }
> +
>         /*
>          * UCSI provides power supply information so we don't need to sep=
arately
>          * load the cros_usbpd_charger driver.
> --
> 2.51.0.858.gf9c4a03a3a-goog
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
