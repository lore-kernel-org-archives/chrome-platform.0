Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAE2DCF4C
	for <chrome-platform@lists.linux.dev>; Thu,  6 Nov 2025 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453058; cv=none; b=cJYbGfDqcyTPBKgUdnsEN3t7+4KtIebKvaxo8fApaXSYWLvvA20cyBjV8fPm5MKssNaz51dOBg74ufCtK4L2PerhSMn7Nh9LVfSaSC62414pEinFU42SWBwcsYwcBttJhg4rGsWy2SIXhfoYZtz9mGgKdI1UxplfLz4J7gqaz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453058; c=relaxed/simple;
	bh=+EDHG6jC3dR9djMGzxaDhYnGnavUlqsN9UCm8KOuNUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrxdBoNq+bNgrOF6YoU7AOFuiAI2NwPnnRqkDBXw/s0KqeKO9UiRIIpu/nyqH1PQ/TTAbQlKNW2Y4imWXxHuidtQAmqrVx2jY/9+2wJsglS1X3bBUl6END3c3NOEmI8WQpwrhlQmbXR/rLci8Y6S0VEQOilq0Jnp1Jl3jWaYHts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W2JtydAx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W2JtydAx"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340c680fe8cso1279049a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 06 Nov 2025 10:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762453054; x=1763057854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5F+Z9IhhsywZTDYjJqeTgWl/deiC3wHlce6TFxmwAk=;
        b=W2JtydAxiLW27YqFecwid8RnysOemLzmeXgyOcx9HHjGl41OzjzgzJT/5MOkTuGJq7
         pfzFxyw8g2gGxX4DB/gMQQ8Pvtrxr0t2zemzKeDZxp2U+tmXSSLFELjqNSlrIpa1R5Dt
         aQ8oCekGiPs7+1cL9sWBRe89VYwaQQCQjvyFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762453054; x=1763057854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5F+Z9IhhsywZTDYjJqeTgWl/deiC3wHlce6TFxmwAk=;
        b=C9glVEDkngJw5ZawX+RXVgVqeUZprUOgnvYo0jN1cS3i3VF4Bgp9VtBjuPcR4Qt2R6
         3qNJyDxzeLibDZI2Sd8ZpETdjOfShDfipiR6Z2JPg2xuFajU8ockzIq5SwuhIRRoe5+y
         e5eZyGpjbPLlNyb6Ve0FC9Hwdb7v7PuR7hry6Ao/8om5wxMfE6C1UUmOyWhqjPZgds8E
         1WiatAe93X6ij+uQh4UsDsViLxaZL+ApuRgYuK7rf4lw8oqPGso+HYNr4oR4yqsqbMGW
         o7KaGYgaC2GyAAE+XXBMxFWUn+Pkabbv5vRXZE/VvAehf9KzN3Cg373bJfctqTiNrFfZ
         +Ayg==
X-Forwarded-Encrypted: i=1; AJvYcCUw9mS0XQI2TiSNj8Q48Tpu6oem68hY03rh9N7OLgSUVvnO956fJ8YxjPuzDbsV3gT8dd4NRH2gj3oOBYUuSlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyOiSwvFcuYZxn9kyPb2XXkbENPQ1zPlcGtjLyY8cAOpIBgget
	WKNBdPELZHYgSGepKGjrnUOl7w1kEesdnMhi369WHHLadrXXA8VZqKEtn/dzRKrvMhfkOxR4DdD
	oGG2Gv5xbwl5p42AdB9vfmxVSLwrG2d3wZTlw3MG4
X-Gm-Gg: ASbGnctDjgHWC1zkU4qcRLTp5sI6zJ4SCdLpQhwSBUZ+YEk6xV5XIT7W7GZcNbYgcVC
	hOdJdBDYfRWJJ/bSxMWcFMkoA769lmLnM6t7W99iadKv/NGnFlOfTi+ZitQD0cCMIYmg6GnxjmX
	uTruYsNQ0aF6yDo4cbWOaezINz6x8rSfLecKqAgxJmPAFRUn0DaeicU3zAU4TA32Bi+rFIhYKui
	oeGZyDAltmCnVGECnG9nb2MsaFwRCi094s/2Vn7d8gO3piPHK5x5JLI6bxhZgZI2NCM
X-Google-Smtp-Source: AGHT+IFn6PXjJHldODS9KPqz+43IEKzySmCOy8+pWSyHAUSQQolRbTp/qwgRR6qDsxBJoBB7XlBLo11zLmP3uDqvHJ4=
X-Received: by 2002:a17:90b:2e07:b0:340:48f2:5e2d with SMTP id
 98e67ed59e1d1-3434c4eaf75mr131609a91.9.1762453054072; Thu, 06 Nov 2025
 10:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com> <20251013203331.398517-3-jthies@google.com>
In-Reply-To: <20251013203331.398517-3-jthies@google.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 6 Nov 2025 10:17:22 -0800
X-Gm-Features: AWmQ_blB4FOIIKSVgccXNEhWQ1KfEoxR1FTLnGkjSWTXpx8IGMHNb4ruYVitNo4
Message-ID: <CANFp7mUq7=8Sw2VHabjiESMTNLqR0DRQUWkQN3OTfTTMfWOx6A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
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
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index eed2a7d0ebc6..0c19ba84d11c 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -5,11 +5,13 @@
>   * Copyright 2024 Google LLC.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -235,7 +237,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
>         struct cros_ucsi_data *udata;
>         int ret;
>
> @@ -243,9 +244,16 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>         if (!udata)
>                 return -ENOMEM;
>
> +       /* ACPI and OF FW nodes for cros_ec_ucsi are children of the Chro=
meOS EC. If the
> +        * cros_ec_ucsi device has an ACPI or OF FW node, its parent is t=
he ChromeOS EC device.
> +        * Platforms without a FW node for cros_ec_ucsi may add it as a s=
ubdevice of cros_ec_dev.
> +        */
>         udata->dev =3D dev;
> +       if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
> +               udata->ec =3D dev_get_drvdata(dev->parent);
> +       else
> +               udata->ec =3D ((struct cros_ec_dev *)dev_get_drvdata(dev-=
>parent))->ec_dev;
>
> -       udata->ec =3D ec_data->ec_dev;
>         if (!udata->ec)
>                 return dev_err_probe(dev, -ENODEV, "couldn't find parent =
EC device\n");
>
> @@ -326,10 +334,24 @@ static const struct platform_device_id cros_ucsi_id=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
>
> +static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] =3D {
> +       { "GOOG0021", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
> +
> +static const struct of_device_id cros_ucsi_of_match[] =3D {
> +       { .compatible =3D "google,cros-ec-ucsi", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
> +
>  static struct platform_driver cros_ucsi_driver =3D {
>         .driver =3D {
>                 .name =3D KBUILD_MODNAME,
>                 .pm =3D &cros_ucsi_pm_ops,
> +               .acpi_match_table =3D cros_ec_ucsi_acpi_device_ids,
> +               .of_match_table =3D cros_ucsi_of_match,
>         },
>         .id_table =3D cros_ucsi_id,
>         .probe =3D cros_ucsi_probe,
> --
> 2.51.0.858.gf9c4a03a3a-goog
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
