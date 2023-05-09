Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AB19937
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 22:59:56 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-619ca08c166so31645056d6.1
        for <chrome-platform@lists.linux.dev>; Tue, 09 May 2023 15:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683673196; x=1686265196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swS6r3eXnHVWt2Jm6163rBkgZtTLZKNr5fCO/TJpJ80=;
        b=LFvjdiF5ny59TO1+TsX8zQHbFNyFmGGRTMl4uaANgR7cojw3lyLkrc+/qTTHmXkHs7
         etgySXx6z3XgGIgF6wI0r7hKp92cdNMYDoq40X2AxHTtOsKNcBjoQpQkCkpQYkxQzJe/
         +N/RfZZ0zQ/LcoPVkINF/cy3U6TzyuVmioY7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683673196; x=1686265196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swS6r3eXnHVWt2Jm6163rBkgZtTLZKNr5fCO/TJpJ80=;
        b=Vc3UFlE/w7MlBFMtuujQbs3C2ZSkDxJXP4U45I62gw0o+LsxxzW/VDdy1hN05xMjHM
         uoUq9bxyijzJUQ0xIu5ExX+TBOAr3StC283ChUpkFKwFd8hoG3TL23ETOTEP/ppr+gvR
         GDLRVAq1R03T77TamEHSVT735UTx8/fgLwTskAxBzvDzKHN5EhuGCq/JftistyO6JDPR
         x79Qz+Ryijc74pNL19xbtvwzsZgijp0LJKOTzEVea+TKaQPDaB5oip8lECTg7jtq3FS+
         qale/WzUkxsHQjLpumCwyFcYdAkIc1WRJ6Le/tJ5TPNsxUkBYiZVsgh/Zc1Mhq8xIVDK
         FSoQ==
X-Gm-Message-State: AC+VfDwZemxWg/At/6tkwj/Mo3+XEEt6ug10VWNT7u6xQQXXSUdGyfKc
	BeYRKxIIJWQSRt2E5Vfjq6H5vuEXyGL/T2sQVHs7iw==
X-Google-Smtp-Source: ACHHUZ7ziAeSVHHxAH0c1VjQLNCVL7BNWQGyqe3cjbY0i42Eg+mT521wINz817EPsTmV+yMVX3zfyYPMBpTPUm9VtWY=
X-Received: by 2002:a05:6214:412:b0:5cc:277c:b5e with SMTP id
 z18-20020a056214041200b005cc277c0b5emr24681681qvx.33.1683673195792; Tue, 09
 May 2023 15:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+Dqm32q5oDiHgAFQzMi12H-hd+f=v-NL6F5Bx9r2Jh6THNZrw@mail.gmail.com>
 <20230509222201.3013970-1-robbarnes@google.com>
In-Reply-To: <20230509222201.3013970-1-robbarnes@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 9 May 2023 15:59:44 -0700
Message-ID: <CACeCKafE3c+ie7_hHQnKpcRqV_n34oL3O3JfUNXoBUDTdTmQow@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Report EC panic as uevent
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, May 9, 2023 at 3:22=E2=80=AFPM Rob Barnes <robbarnes@google.com> wr=
ote:
>
> Create a uevent when an EC panic is detected. This will allow udev rules
> to trigger when a panic occurs. E.g. a udev rule could be added to
> capture an EC coredump. This approach avoids the need to stuff all the
> processing into the driver.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>

I listed a couple of nits, but once those are fixed, please feel free to ad=
d:
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> ---
> Changlog since v1:
> - Inline uevent call
>
>  drivers/platform/chrome/cros_ec_lpc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index b399f7cbf17be..fbce9898dc7e1 100644
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
> @@ -322,8 +323,11 @@ static void cros_ec_lpc_acpi_notify(acpi_handle devi=
ce, u32 value, void *data)
>         ec_dev->last_event_time =3D cros_ec_get_time_ns();
>
>         if (value =3D=3D ACPI_NOTIFY_CROS_EC_PANIC) {
> +               static const char *env[] =3D { "ERROR=3DPANIC", NULL };
The convention in this file is to have variable declarations at the
beginning of the function block,
so please follow that here.

>                 dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown =
is imminent!");
>                 blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, =
ec_dev);
> +               /* Publish uevent for userspace handlers */
I don't think this comment is necessary. uevents are for use by
userspace (by definition).

Best regards,

-Prashant
