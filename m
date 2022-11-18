Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DD2EBE0
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 22:55:44 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id t5so6152433vsh.8
        for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmKsoJxhwH4Zh+3ZRgMkGn8gHiF62zNOvvsc+BHVWu8=;
        b=gv5F7ldhqfhIsH8rj3kBab8j3pSGRlztT61uH5evDl+HD5sgZtbydI6mpzpUVuzG8w
         YxQXSM6U8nVYzRJVQKm7Ef/Kq8/0ykjLifVJZvy5lZxJpUnT68gXHvyT+AfjHJ8ss63h
         fg36VGWZ4unUYwmA1GNCLHmzGCV9c9ZhCPoCp9p2IBaOIFkxcwqSK1MwPat+bRDUwt81
         NWo540av9xzkf4Y2CYpuUGM7d5GSWhMxR8KvQ4euz7RoF87hnX9CqCsIveMPn7tfq8Ms
         luYfJv3E9eCXO9HoCcu8z+dRooFHGSnqf/CwwXE7ORqCQKnnc+O08v/oxgxCpfa8ffFE
         W3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmKsoJxhwH4Zh+3ZRgMkGn8gHiF62zNOvvsc+BHVWu8=;
        b=48WBeghWWZnmeuCwsPJNkqFy5/4Z0qTr54p7ai2HpFctJF5O4eTbF4f+6nvg05LRww
         mbTUrOWDW+qARyMHTZwJiGOFNNJKceZfJIWTpsWK8BKLatvwzitkhNH/KQ4tjROeAa8j
         uAE7KbNEp0IjbRmP2PH/qV9WHaRDu47lG3uGLH8c3kWtm8hTxn/6EffAEIbzKMwk5HsQ
         XhGuAljg60xXbLLkcZtGcIyvK0hXLG6khgUQdR+eCGc+V57Mnjf+H90T7jbBX5hQvi9Q
         XpyIuiwST2qmNDoAgvgEE53bamB5GGtFEtwBRsx13+9SDwuwN+Er0SlLUEwuKhmihkkt
         FVVg==
X-Gm-Message-State: ANoB5pnfCUUMHJCZekC7yehaU2lDlY/Z7HMgaXWOd9k/0Yoea/Wo+Sww
	CRv0e546mwILqy+PcoX9l+8Nnu/HmLp+x/AuODgOwg==
X-Google-Smtp-Source: AA0mqf4qDmbgKxpR2oFN7ECgll96czI8S2WtEpfjmw8jRjheJPJwoxDQZr632xe+zCiiTlcR9Xb4LznOsV0wW5aR7/c=
X-Received: by 2002:a05:6102:502:b0:3ad:94ed:2ab5 with SMTP id
 l2-20020a056102050200b003ad94ed2ab5mr5590845vsa.45.1668812143450; Fri, 18 Nov
 2022 14:55:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-513-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-513-uwe@kleine-koenig.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 18 Nov 2022 14:55:32 -0800
Message-ID: <CABXOdTftnYoj+_3+u47PYdenThn17NMBP2C6q2mDGkeCudur9w@mail.gmail.com>
Subject: Re: [PATCH 512/606] platform/chrome: cros_ec: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, linux-i2c@vger.kernel.org, kernel@pengutronix.de, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 2:48 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so i=
t
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>


Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_i2c.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chr=
ome/cros_ec_i2c.c
> index b6823c654c3f..dbe698f33128 100644
> --- a/drivers/platform/chrome/cros_ec_i2c.c
> +++ b/drivers/platform/chrome/cros_ec_i2c.c
> @@ -286,8 +286,7 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_device=
 *ec_dev,
>         return ret;
>  }
>
> -static int cros_ec_i2c_probe(struct i2c_client *client,
> -                            const struct i2c_device_id *dev_id)
> +static int cros_ec_i2c_probe(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct cros_ec_device *ec_dev =3D NULL;
> @@ -373,7 +372,7 @@ static struct i2c_driver cros_ec_driver =3D {
>                 .of_match_table =3D of_match_ptr(cros_ec_i2c_of_match),
>                 .pm     =3D &cros_ec_i2c_pm_ops,
>         },
> -       .probe          =3D cros_ec_i2c_probe,
> +       .probe_new      =3D cros_ec_i2c_probe,
>         .remove         =3D cros_ec_i2c_remove,
>         .id_table       =3D cros_ec_i2c_id,
>  };
> --
> 2.38.1
>
