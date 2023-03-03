Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5448F42
	for <chrome-platform@lists.linux.dev>; Fri,  3 Mar 2023 19:14:32 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-536c02eea4dso60453897b3.4
        for <chrome-platform@lists.linux.dev>; Fri, 03 Mar 2023 11:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677870871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRFCHBII5HxWnVKdRDrtgCThRX8/e7j76YPCdtgTTJE=;
        b=m4oOiUB3+FZax2wPtoA+UBgc6k1LQdfyTtsseoG3abRFYOAUAgV68rye3BoA7iVcly
         TI9q1TTspLr6KnS+qdbRpxlLQ49dnXbrpqR4WvIsJKVOakO+Px+fjaKehlzwEsAtvfpY
         AUeYSXijPGIhMRgM3ohaBE0J8uo4iaL5SPFWjC43w99fqtnUDPoxAydc2GOCamrVqN+s
         QyM4964RS7u/EY8Pe/ZPDdAzFesN9cOdJJpZwbTRyqxAqbFDlckozwNfWpUkkMLZY71+
         vdGKlABM0U8gjLJTUUnl6vkFlx816cF5e/JYz1IUK2FLlW2YqnqojwpLBy51hG90fzPg
         G2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677870871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRFCHBII5HxWnVKdRDrtgCThRX8/e7j76YPCdtgTTJE=;
        b=knQWmrXaDEO25wBkiZyvu5fxD2JHOGg9uqTpXUt8DYM+dGzPzPnmQiONW5AvnOSEuR
         WZQZ+J2drkkN9ONG604DYS2yOBv2vm/6v0hDvliJUFyOjjbj8qKg+Xw/YLCPRZZxdoH5
         rClTxgZa91IdXzdzbwYXM4rGLbHpCS52sSdgLr684/RQ5notCfwsT/cKs58J7D93+gDG
         yU/Th23sQy8PVSJ1iNDvssmabeDKZZBzO33lWLLebW3jgkjYIg+HReJq4JKYPVLq/g8c
         zfbaoewwdjEwe5V+vQoV+9iLlB8u0XfW3Kjzi5rlIxs2tu+YxmJYlEWPLcF8/IhsIuut
         CDPg==
X-Gm-Message-State: AO0yUKXDN7VY0+hGzGna6TgvQniyaBmCQvkpWgtB4CxQXOEU6Zid2nYD
	QSB4JU+cLytAh5O0FgehtK2YSYeGr4yMlxqU0LgkqA==
X-Google-Smtp-Source: AK7set/axDl9gJ4mM3BPIagqkhYshrlpCAhyrWEAIWhAZL0379oSCnbH0viYM733QwcOWhI5UkNCnMsMbWplCkYqHys=
X-Received: by 2002:a81:af59:0:b0:535:5e8c:65ef with SMTP id
 x25-20020a81af59000000b005355e8c65efmr1549694ywj.6.1677870871418; Fri, 03 Mar
 2023 11:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de> <20230303185445.2112695-10-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230303185445.2112695-10-u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 3 Mar 2023 11:14:20 -0800
Message-ID: <CABXOdTddD34WJpTGzRi=KWGVG3uOdxdj_mwsfr8fFb99j3Y2SA@mail.gmail.com>
Subject: Re: [PATCH 09/30] pwm: cros-ec: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Benson Leung <bleung@chromium.org>, kernel@pengutronix.de, 
	Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 10:55=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/pwm/pwm-cros-ec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 86df6702cb83..90afce212fb0 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -328,14 +328,12 @@ static int cros_ec_pwm_probe(struct platform_device=
 *pdev)
>         return ret;
>  }
>
> -static int cros_ec_pwm_remove(struct platform_device *dev)
> +static void cros_ec_pwm_remove(struct platform_device *dev)
>  {
>         struct cros_ec_pwm_device *ec_pwm =3D platform_get_drvdata(dev);
>         struct pwm_chip *chip =3D &ec_pwm->chip;
>
>         pwmchip_remove(chip);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> @@ -349,7 +347,7 @@ MODULE_DEVICE_TABLE(of, cros_ec_pwm_of_match);
>
>  static struct platform_driver cros_ec_pwm_driver =3D {
>         .probe =3D cros_ec_pwm_probe,
> -       .remove =3D cros_ec_pwm_remove,
> +       .remove_new =3D cros_ec_pwm_remove,
>         .driver =3D {
>                 .name =3D "cros-ec-pwm",
>                 .of_match_table =3D of_match_ptr(cros_ec_pwm_of_match),
> --
> 2.39.1
>
