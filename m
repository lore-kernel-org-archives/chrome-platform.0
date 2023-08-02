Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96E8821
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 18:54:55 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4036bd4fff1so48901cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 02 Aug 2023 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691002494; x=1691607294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP6AUbuQ4hb9Or4QdvG8nqcEVIonxr5jd7wasq4u8qQ=;
        b=5jUIP39X/Jx3VAY88P+qLpbQeSDGy7+0Zn5EVxl/eDymAtnLF7TKBjGrI6f3sN3kLt
         Fa3NB5IVuMN/UasiWKVupI8/7N2ex3yjLlkzbqFNF8Bsd0aGgZlHIHjU2pMBYpLIQfMu
         UbcUrjfddO0XvnzwUef8L40cAEmcJAD/nRDA/fU4qMZUmoYBkATCdTgv3VkfExSFM0c6
         W9+jgHMk4pyVxXxGl8WrhrG0Mm+BTP95C/lBJb4wqI73iBAYD12Am13LjIcoD5njijsX
         fpqzMuOm495g96PuoQ5K0sGXlE6vIYP62k1vqdtHkfMD+p/hoAxoojZhhQnPSblE/Db1
         QuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691002494; x=1691607294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zP6AUbuQ4hb9Or4QdvG8nqcEVIonxr5jd7wasq4u8qQ=;
        b=XPm3E4K8W7wF3w3OCrig8HHAHjUfkNBGKmb2F1fstp2c4Ycp6vy0UCzWRt8GxAQPHu
         1ibKsbO0rftguEt1V9Saa3eZ2am+Tw2lv7SJqNVNg+b4zz8X0AlALxWbSdcnA8PlTBlE
         hHKRUSk99f66FjHEqdfwTFk8MJg7rt8i0WrEauMuxy44rp5BB5pLicXGDRfBz3OLNIHR
         YfSPMr02jja/o5/cYST552oKGSldwthpa3tCwM3hlk3DHB209y7PlCxhJNmzGwi9tyso
         Y3ul8BGmfARbhz5sipTMO3S20MbZl0S1b0MCKW1DJ+kftzfeHJYD+u6mFw91r+RU/ODX
         D2AQ==
X-Gm-Message-State: ABy/qLYD79WaI7EZ7TTK7pEzOBdb27rvjFAP0icWCoEYcDEWbuxcZvp4
	lXw4077t+Ef2g0m7MnQPDU7IkumIuGhX/tdndTmzvQ==
X-Google-Smtp-Source: APBJJlHKZ+CsaEPZsx3CV6Js57iyo/EFCvUjefGlgik5Dkd1Sll37HUGQd1RJNEtsUrJl1iX/OZCw/vfaLAq6xzy4BQ=
X-Received: by 2002:a05:622a:1006:b0:3f9:ab2c:88b9 with SMTP id
 d6-20020a05622a100600b003f9ab2c88b9mr1436417qte.25.1691002494273; Wed, 02 Aug
 2023 11:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
In-Reply-To: <20230802175847.1.Ie9fc53b6a1f4c6661c5376286a50e0cf51b3e961@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 2 Aug 2023 11:54:41 -0700
Message-ID: <CABXOdTd0B2YwXkrr6t7Mx-LwOuV+9O9Q91P7M_=8d3iqGQ+=cg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Remove EC panic shutdown timeout
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org, 
	dtor@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 10:59=E2=80=AFAM Rob Barnes <robbarnes@google.com> w=
rote:
>
> Remove the 1 second timeout applied to hw_protection_shutdown after an
> EC panic. On some platforms this 1 second timeout is insufficient to
> allow the filesystem to fully sync. Independently the EC will force a
> full system reset after a short period. So this backup timeout is
> unnecessary.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
>  drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index 500a61b093e47..356572452898d 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -327,8 +327,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle devic=
e, u32 value, void *data)
>                 dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown =
is imminent!");
>                 blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, =
ec_dev);
>                 kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char=
 **)env);
> -               /* Begin orderly shutdown. Force shutdown after 1 second.=
 */
> -               hw_protection_shutdown("CrOS EC Panic", 1000);
> +               /* Begin orderly shutdown. EC will force reset after a sh=
ort period. */
> +               hw_protection_shutdown("CrOS EC Panic", -1);
>                 /* Do not query for other events after a panic is reporte=
d */
>                 return;
>         }
> --
> 2.41.0.585.gd2178a4bd4-goog
>
