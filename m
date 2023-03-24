Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0B15A7
	for <chrome-platform@lists.linux.dev>; Fri, 24 Mar 2023 01:25:04 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536af432ee5so8108537b3.0
        for <chrome-platform@lists.linux.dev>; Thu, 23 Mar 2023 18:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679621103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOHsiThpPjL+eLM3HHIUTKMIoD+2ShXS7e1zc/cDCKc=;
        b=Ib3rm7GQ8Z0pkmnWB8My3scExKSZDx0JBjhOi3y1FOpr5nfhfVGqtOFJoP+jEJ3o21
         AP4yCxr7jOaBu74fKwSFOVGUTJEu5JDBVTnW/kVrry9A86DC5Oih3XeT4vKlcPwje2rL
         ALAiUtZgpzAPM5e3X+MW6HepKTINMwGEjnzlZRwplHtSdYjgk9jy1G64RLyvSGAilSRV
         4M9DE33/qRH/uMNhBl9MEoprsH0+UVVGCYwDJ9TxY7aS9QweLT1Tln5pIAWx4khoXkLM
         Ni3Osi+ml8QjprCXdSeOa6Q0NzxzK9O1ImqfMy0YPkSD4otSogvEMucMm3VLOeVRdTIM
         NWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOHsiThpPjL+eLM3HHIUTKMIoD+2ShXS7e1zc/cDCKc=;
        b=M39MPf9EoeGSRVNxNICM6tOPc3iGu7veOR723xsr+Ggz+DBvqIFH9rVB6EsJQX7m0G
         h/Q4fcLeUqqE2UKOqW9vLKbbaajWt+sy+/loe2TLNRfM8Gh62PGt/Z9an2GMa99Br9tv
         Lt/vj1gohXfbEKmi8btu5sFL2x4TgxCGrwAJLFzODh8UDRUMM7jSo2ZBpTShhO3D+n7S
         P5xVXXbeo1Ryk71ji9caey4JTUjnq9/h2gjoa05HTvkRDQkttM0dE9iKaGNOLn9ye4GW
         HM8ekelZZGQ+BSdGyY0tdNZ8HHA4/DtIztod7UZ8Nf44tyWOaehV7ECCrn7Ej0XzjXlu
         2gsQ==
X-Gm-Message-State: AAQBX9epjC2r/HgkhmcQkLFGp5uxVhTgdLa3KgU8oBpnhxpQa/g61UPM
	iQRE9XN8MH2Ci+Gy2nE++iaqEkUKSe8kSmD/KNbu1A==
X-Google-Smtp-Source: AKy350YJfWXKrLw5uIYFRT8iyNx+j1CahHZu0JV+b4Nxf2O5k4LRwQHuen8wcbK+F3y+N5xQ42P1CE4e53jd+3wr3CQ=
X-Received: by 2002:a81:b107:0:b0:540:62be:42b with SMTP id
 p7-20020a81b107000000b0054062be042bmr238187ywh.6.1679621103444; Thu, 23 Mar
 2023 18:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230324010658.1082361-1-tzungbi@kernel.org>
In-Reply-To: <20230324010658.1082361-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 23 Mar 2023 18:24:52 -0700
Message-ID: <CABXOdTfWVxs6rhNajRycv7uJ7F4VMAZVhjhHJ4ZyfnjjWA5ZWw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_chardev: fix kernel data leak
 from ioctl
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 6:07=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> It is possible to peep kernel page's data by providing larger `insize`
> in struct cros_ec_command[1] when invoking EC host commands.
>
> Fix it by using zeroed memory.
>
> [1]: https://elixir.bootlin.com/linux/v6.2/source/include/linux/platform_=
data/cros_ec_proto.h#L74
>
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character de=
vice to talk with the EC")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform=
/chrome/cros_ec_chardev.c
> index 0de7c255254e..d6de5a294128 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -284,7 +284,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec=
_dev *ec, void __user *arg)
>             u_cmd.insize > EC_MAX_MSG_BYTES)
>                 return -EINVAL;
>
> -       s_cmd =3D kmalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insiz=
e),
> +       s_cmd =3D kzalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insiz=
e),
>                         GFP_KERNEL);
>         if (!s_cmd)
>                 return -ENOMEM;
> --
> 2.40.0.348.gf938b09366-goog
>
