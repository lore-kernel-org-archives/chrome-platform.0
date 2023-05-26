Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768592A9EF
	for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 23:29:37 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f6c6320d4eso33281cf.1
        for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 16:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685143776; x=1687735776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7COUyi4XLPljihoCv3LYawi6oUvyBBnUUu4CtgtS/9g=;
        b=a8hV2CHH4dPBwzX7SxGt3zkHmmqCLDZYNhn/8RHgHtiYMzWbvRJFSIoN1C67tlfQmR
         gjHNjH8Y603T/zWEcRrhKUGROv16WjmR5TPXB3bS+eVW0mu+uNK5FdF2nW4lCFzEY3WJ
         63fIFJ2JUfdibXE8kr4E0+ufvsjvCCpO8r5J8a9fDWgoUHl/3piRq6wKi5w91p2mDbVb
         ToKY0vKg/G432LtwKw7mt2okWbooYSqrh1iIvFvrB7TImvNHUZD0EYfdjuopflwn/0hY
         ytemyPmOuu0WhK2reXwoYRQXvTnLSoO4m4WXQGGBFBDAgi4rUss+lQhoAaCMYqyNl8gJ
         5WIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685143776; x=1687735776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7COUyi4XLPljihoCv3LYawi6oUvyBBnUUu4CtgtS/9g=;
        b=OMQCUBGdt3eN1NL93J3WaNMtrCcux9xvAkFYw7LrqJ+lYUZT/C6m6VaTVdbhBVbGTh
         Q533X63+E/BgMOJ745GVKGIr8NpzU8aENRAc913yu48PsvDkV4DNsKkC2wrZbC/J2enS
         ag6H6DP1Zxqru978g7SuzAVdK64107/nQpjWY7XLPYn8TqwTGCiVIMj87MLa+Xek9/u4
         ZFL61xeFozvSp5iu9VWwaSo83B7dHa0fzXxnCpsG74p1U98mWe50CSuQOP+ND/pvpfD8
         LTisJ9oW2ecVRxSud+cSetQpWmeF8wqkxAnOZKnqQOHcXsean8gaFuFhC07lCWI8UwyH
         idMw==
X-Gm-Message-State: AC+VfDx31WLqQj1aKXOWc2zKkoLCXCl52wcBICyKNWCavtcFPQe5Yui7
	aW2vUE2B/+Nq+SsRi4EmDapn/y/xtoE5R4hzelKZrA==
X-Google-Smtp-Source: ACHHUZ67yG+TZmiF6gTVCHTDyFYmUCZZ7mKfgd7fAlqugrDfAl4bmtu1GKJV2QZV2XTd7xPUOsg/9+NgcIYAF7uTz+M=
X-Received: by 2002:a05:622a:18f:b0:3ef:302c:319e with SMTP id
 s15-20020a05622a018f00b003ef302c319emr78684qtw.8.1685143776138; Fri, 26 May
 2023 16:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230526214703.2135137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230526214703.2135137-1-u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 26 May 2023 16:29:25 -0700
Message-ID: <CABXOdTcQX29=3cKg0dY=WHJuXqwT6Jk=ktQ2mStVe6Uw8pakAA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Switch i2c drivers back to use .probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Benson Leung <bleung@chromium.org>, Dan Callaghan <dcallagh@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, =?UTF-8?B?U2FtaSBLecO2c3RpbMOk?= <skyostil@chromium.org>, 
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 2:47=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_i2c.c  | 2 +-
>  drivers/platform/chrome/cros_hps_i2c.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chr=
ome/cros_ec_i2c.c
> index dbe698f33128..e29c51cbfd71 100644
> --- a/drivers/platform/chrome/cros_ec_i2c.c
> +++ b/drivers/platform/chrome/cros_ec_i2c.c
> @@ -372,7 +372,7 @@ static struct i2c_driver cros_ec_driver =3D {
>                 .of_match_table =3D of_match_ptr(cros_ec_i2c_of_match),
>                 .pm     =3D &cros_ec_i2c_pm_ops,
>         },
> -       .probe_new      =3D cros_ec_i2c_probe,
> +       .probe          =3D cros_ec_i2c_probe,
>         .remove         =3D cros_ec_i2c_remove,
>         .id_table       =3D cros_ec_i2c_id,
>  };
> diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/ch=
rome/cros_hps_i2c.c
> index 62ccb1acb5de..b31313080332 100644
> --- a/drivers/platform/chrome/cros_hps_i2c.c
> +++ b/drivers/platform/chrome/cros_hps_i2c.c
> @@ -143,7 +143,7 @@ MODULE_DEVICE_TABLE(acpi, hps_acpi_id);
>  #endif /* CONFIG_ACPI */
>
>  static struct i2c_driver hps_i2c_driver =3D {
> -       .probe_new =3D hps_i2c_probe,
> +       .probe =3D hps_i2c_probe,
>         .remove =3D hps_i2c_remove,
>         .id_table =3D hps_i2c_id,
>         .driver =3D {
>
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> --
> 2.39.2
>
