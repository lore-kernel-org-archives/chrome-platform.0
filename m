Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB04C2C2
	for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 23:48:34 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e55517de3so2709a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 16:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689637713; x=1692229713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDZgTVBOtrhe4zyB3l0viMZQTIRr5Hbt8Gnmm5i7wY8=;
        b=bqzqjgWXG+sKHODPCAsrIzOXoVhSTwy8eIidM58WKz1RRXy8oGdhAx0HlptaSQD8ty
         JbQHOOJKm5IPoMTeVUVID8ijeDdlZkOgB9W4u/PhoyWEyzsMJreZbh/mh49nUd+TX/Nf
         AMwRVEJ8iiw/TwSvjVph4FV3V04JpMM3ABpmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689637713; x=1692229713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDZgTVBOtrhe4zyB3l0viMZQTIRr5Hbt8Gnmm5i7wY8=;
        b=Hdwegfgegio16z9FV6muNtgxAqwLM5h7bpNclPt1dL1NxLBLL39J86pe2+0xkRqf6Y
         o2SNZjGLZjy9FdV1+Rwyg3lT5R4sdmBu40XZ+LGXXHaNiqhhs5vuadi6eurdqiJD/gPT
         cVUreXcwjsCLhVHp0oghjVxXVv16YpW/CIq3VLdtJL8msPYVxGJyovCALAP/hGjFyQp/
         Sa6WlwvhV8xP+XhybZs7Bu3q/c8xh/79KGDXPQ14apfwtSZfenEtrbiYkiDOm2Ucj6WJ
         WjUFfimOaNk7bY7hgMLuL9W7RxNx6v6XQp9y+DNQTUBew4nJ6B2RGyLYto5SRK3Z4p38
         YAxw==
X-Gm-Message-State: ABy/qLZLJOLWfu4KtwTlmoDN6dNaOafI1RzdaB8zfvEFgnj4urAPwLEA
	IQvK3KCEX4LjjiNMtU3mTj5I/UL/onAoe4DJoYL+1g==
X-Google-Smtp-Source: APBJJlEW0AuUoRSE12bDJI1szQtbH+aXfUR7lmKm6/mPXsKEazqqnhOeC+Y4OCTm/0MBaiMdRDEDhVSet3qKHiXgQoQ=
X-Received: by 2002:a50:9fa3:0:b0:51d:e2d4:3d43 with SMTP id
 c32-20020a509fa3000000b0051de2d43d43mr22758edf.7.1689637712765; Mon, 17 Jul
 2023 16:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
In-Reply-To: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
From: Benson Leung <bleung@chromium.org>
Date: Mon, 17 Jul 2023 16:48:19 -0700
Message-ID: <CANLzEku3vL3EKmFhN7YYdjqP=O3p4sNxtHPji2Yv8s_EMAcvRg@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Emergency sync filesystem on EC panic
To: Rob Barnes <robbarnes@google.com>
Cc: pmalani@chromium.org, chrome-platform@lists.linux.dev, 
	briannorris@chromium.org, Guenter Roeck <groeck@chromium.org>, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Jul 17, 2023 at 4:29=E2=80=AFPM Rob Barnes <robbarnes@google.com> w=
rote:
>
> Perform an emergency filesystem sync when an EC panic is reported. An
> emergency sync actually performs two syncs internally in case some
> inodes or pages are temporarily locked.
>
> hw_protection_shutdown is replaced for a few reasons. It is unnecessary
> because the EC will force reset either way. hw_protection_shutdown does
> not reliably sync filesystem before shutting down. emergency_sync is not
> synchronous so hw_protection_shutdown may interrupt emergency_sync.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>
>  drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index 500a61b093e47..9652fc073c2a4 100644
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
> +               /* Force sync the filesystem before EC resets */
> +               emergency_sync();
>                 /* Do not query for other events after a panic is reporte=
d */
>                 return;
>         }
> --
> 2.41.0.255.g8b1d071c50-goog
>


--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
