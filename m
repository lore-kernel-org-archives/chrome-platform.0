Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FE63C5
	for <chrome-platform@lists.linux.dev>; Tue, 28 Feb 2023 16:19:16 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536c02eea4dso288073407b3.4
        for <chrome-platform@lists.linux.dev>; Tue, 28 Feb 2023 08:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hvwi10BCTbbsbzCDkyaJyelvBf36hI6KbwY7rWAn+yI=;
        b=Rs7XQMKTGdkQouim1SxhyfOHHjAPnJdbNpHg0sJ+MBDNH0F89vy4153+0K4fSwpRzO
         /BgxRQ3nEMNtm4BhcSqTytojoSlcZfJYJNFn46+eC0FGyhdyqV+bQDrFyq4UQB+aWJA5
         G7IyfIA77lACVCE46aHx78a0EeQBe1RJ8KAVfTvqC+pzf27e/y/nKfJtLCoQOU3Xr/4i
         l3sEg+AgWKy31KTOwfnt6wFojKVMobFgdO54cZX2LjQgumufcN7XPMXaeMbKZIQKdq3E
         QJ6ADTFvzA3wegE9OcG0oh3Xw8FWI5CdGEuXqQMi48VkIE3uvuJknvcVdbEZ/4e0qoTp
         sYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hvwi10BCTbbsbzCDkyaJyelvBf36hI6KbwY7rWAn+yI=;
        b=Ms3/KBerAot9SpYsRr87vPxrfm2mFLUh78JtaI3Z4HMMDsITazWjxJZ/EVIoVtfBOX
         FSmTiJdi9AQZAhKssn3e7ihMAKVNdXUkGPJarUUMEdmVTu8GSOnQbwklu5+miYRhAR7M
         8EW63MFJJoDRT10M4A9weI4FRp9yNEE7o6HX3QOR9/sWo6TkaUmZjZO4M6mGtXzXJeFf
         R40XB9hYc/p1iBW6QzeFyXhK5ndQBOpWZF77fzGVFqbZtFFmB2P/MZIVoPcRm7iNhIck
         QiXmB5Ok+ZJ1Hsx6rEAF1PA4F53fSs+FneOU8r+mPKluwfdDl07V4TWEdLSNEzUHgc0b
         l86g==
X-Gm-Message-State: AO0yUKV4ffBHXLY+BSUgBdVtAduOHiliCCeYvefYMTtYPyGp/rYTQVOJ
	rzFOTHzQEIS0tWBE19XugmjvstYoGDmYbtpYIZylpw==
X-Google-Smtp-Source: AK7set/VGlrxe4bCPrXoKKdImpARYrcb4bLo6BZA7c0D74m/IHouJb6Ka7q1yEfXuou60h8FhHfju3fw/QNEiAlPsik=
X-Received: by 2002:a81:3e17:0:b0:52f:69d:cc75 with SMTP id
 l23-20020a813e17000000b0052f069dcc75mr1980711ywa.6.1677601154832; Tue, 28 Feb
 2023 08:19:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230228135508.1798428-1-u.kleine-koenig@pengutronix.de> <20230228135508.1798428-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230228135508.1798428-3-u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 28 Feb 2023 08:19:03 -0800
Message-ID: <CABXOdTfSg8MtNFD8nz8XYsy74K3gMY0xis+aq+VfDnQi7JZsxQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pwm: cros-ec: Explicitly set .polarity in .get_state()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Munehisa Kamata <kamatam@amazon.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 5:55=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The driver only supports normal polarity. Complete the implementation of
> .get_state() by setting .polarity accordingly.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/pwm/pwm-cros-ec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 86df6702cb83..ad18b0ebe3f1 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -198,6 +198,7 @@ static int cros_ec_pwm_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>
>         state->enabled =3D (ret > 0);
>         state->period =3D EC_PWM_MAX_DUTY;
> +       state->polarity =3D PWM_POLARITY_NORMAL;
>
>         /*
>          * Note that "disabled" and "duty cycle =3D=3D 0" are treated the=
 same. If
> --
> 2.39.1
>
