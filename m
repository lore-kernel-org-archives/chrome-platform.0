Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA9320A
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 21:08:30 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-5ef5245e5b2so5263136d6.0
        for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 14:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682024910; x=1684616910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVDfzrX18+DAOzfWNb+tbUY3f7HekUXR78Q5Wd9j1PA=;
        b=GmR5s2tj8Krxjsl4v0BmyLs0pGPzInNKVIAaZYbkUUdzFaWs/ytTpq2+XWzuMd4MtW
         SqP++cLCAGwP2n5cvXOGLKuVsQ2RLqADsOYo391ObgkMUKdKI8BHuURy68ZJVYIZdxH1
         VlAwNkH7gqChDDCeIn96uYKsljhesJBPSmjDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682024910; x=1684616910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVDfzrX18+DAOzfWNb+tbUY3f7HekUXR78Q5Wd9j1PA=;
        b=fZXrSjZ7ASNGb/5rMNaSu6ZI0zkLnPF25ClbnSqQtqtyosV+sJQa/r6Q3LdVJgwGGz
         zVZ9n9UWmNSEKyZsLyujYA0pEGJ20WwGn2tU5qJFX2QfUaIw6WKyiCov+PG7MpqJmj4R
         FVZnC//XTcZ7g6nbDCt7hRzndt33mHo05fowFJ9KvTidykxYHdB/C3lDqcE90H/mYjTo
         qghRDSKORpd4UnWkAnKYut/Fp4X+bPNdEDEaEvMkU9QWp+SNJQWETOUr2rdL+2Px0vtc
         t2AvB5EQz4pq3M9AMNw1gKvYYbT5uubM7ZHp242LkWGOz0gAckHQqo/VMSNp4Eeu6U7c
         TskQ==
X-Gm-Message-State: AAQBX9cv0s+3djgDSbcIsskaBE36y64aK7/BCTf/4RkgNeCeh56AqOWC
	/V6+/N/e7CigLsmcL5wpMPbOhVhCVzHs6Stk1uIPGgDnLMk0KT1O
X-Google-Smtp-Source: AKy350aMtAZRaK9C1qJBuRDIEWE3YNJJmxCq9KI6WL6poDWO7FfAKgvfVMlZ1961rghl+jWLCo38lzrD+jR2kcCw1Lg=
X-Received: by 2002:ad4:5b8b:0:b0:5c5:95db:859c with SMTP id
 11-20020ad45b8b000000b005c595db859cmr1079575qvp.33.1682024909836; Thu, 20 Apr
 2023 14:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230420174623.2794634-1-robbarnes@google.com>
In-Reply-To: <20230420174623.2794634-1-robbarnes@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 20 Apr 2023 14:08:16 -0700
Message-ID: <CACeCKafp-bww4zW_taj9pxx1d_+4fuj4abiOZOvxSKPp9xswEw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Report EC panic as uevent
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 10:46=E2=80=AFAM Rob Barnes <robbarnes@google.com> =
wrote:
>
> Create a uevent when an EC panic is detected. This will allow udev rules
> to trigger when a panic occurs. E.g. a udev rule could be added to
> create an EC coredump. This approach allows more code to be moved out
> of the kernel drivers.

Can you elaborate? What code do you plan on moving out of the kernel driver=
s?
Is there a follow up patch which does this?

Also, do you have a link to the userspace code that generates the coredump?

>
> Change-Id: I4fe7e4e603dcbf0ae6d4c4506f8978b0486abbbf
Change-Id's are not accepted in upstream submissions.

> Signed-off-by: Rob Barnes <robbarnes@google.com>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index b399f7cbf17be..f2d5b00e6c3a0 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -16,6 +16,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/interrupt.h>
> +#include <linux/kobject.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -313,6 +314,23 @@ static int cros_ec_lpc_readmem(struct cros_ec_device=
 *ec, unsigned int offset,
>         return cnt;
>  }
>
> +/**
> + * cros_ec_lpc_panic_uevent() - Publish EC panic uevent
> + * @ec_dev: Device that panic'd
> + *
> + * This function will generate a uevent to notify userspace.
> + * Typically the system will be reset shortly after an EC panic occurs.
> + *
> + * Return: 0 on success or <0 on error.
> + */
> +static int cros_ec_lpc_panic_uevent(struct cros_ec_device *ec_dev)
> +{
> +       struct device *dev =3D ec_dev->dev;
> +       static char *env[] =3D { "ERROR=3DPANIC", NULL };
> +
> +       return kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, env);
> +}

I think it's better to just inline this. I don't see any other user for thi=
s,
and  the return value is being ignored anyway.

> +
>  static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void =
*data)
>  {
>         struct cros_ec_device *ec_dev =3D data;
> @@ -324,6 +342,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle devic=
e, u32 value, void *data)
>         if (value =3D=3D ACPI_NOTIFY_CROS_EC_PANIC) {
>                 dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown =
is imminent!");
>                 blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, =
ec_dev);
> +               cros_ec_lpc_panic_uevent(ec_dev);
> +
>                 /* Begin orderly shutdown. Force shutdown after 1 second.=
 */
>                 hw_protection_shutdown("CrOS EC Panic", 1000);
>                 /* Do not query for other events after a panic is reporte=
d */
> --
> 2.39.2
>
>
