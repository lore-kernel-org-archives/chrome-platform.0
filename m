Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE61FB7
	for <chrome-platform@lists.linux.dev>; Sun, 16 Jul 2023 13:55:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9926623e367so534278366b.0
        for <chrome-platform@lists.linux.dev>; Sun, 16 Jul 2023 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689515756; x=1692107756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyTcxwXZFWWWTJdMWT4XbgZXuCWSZ8AXlZ0nPqWqSY4=;
        b=KSJoqnJBl2+0lT/a7j3tDK0q2sxreRow6mWn6XmuqnFGdvSxYrW4kA3aQwJNTUdjC3
         Oulz0Ct5XACEowOvC/c3b8NfGZ5cCGdCkDrLd1OYPGCl/E8krCdTGQnyIeejiap+JB7r
         bT9MQbNhgFOmaRC/COkInbI1LQ1O19WSI5/EwuHkX9xvrrERqXem17dgiMqaZNG30O+p
         PLFyYEUFXJ2jf+OlCSHxptnhXWkX6nitnQZvleqjAh1vnRTV8lHgjsGZ7NEMZg3/s4S3
         Fi0oN9NcKhgEi7IDHkZ7dPV+R7efMqTvYbe48v9YG69pF26pUk6S6PvGMzvf77bbfKJi
         GCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689515756; x=1692107756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyTcxwXZFWWWTJdMWT4XbgZXuCWSZ8AXlZ0nPqWqSY4=;
        b=je7Pxm241KEYMlXJQ8HUrp0X3SYkrZqUPtowM1jhSZ8LHnhdwTKrSQCu22pIS4Chsy
         U+DdBHs4beuH+TCrawEYDnGKZmw0Z/EdhveJ5kPEIdYlVSOwKUY1ca7lltIsOEA7t5Fv
         14s1GwJEObTsHrXekOeu+OnR2SCc55MMF0ggfBd5IVITB77YPBiAV6DSucFQSwUxqMB1
         zMLz/br6yh4LKzihQhIJqcubECBKaz0idifFHOlzg7HAMhDFZT83alZuDjP5GB/JC3Zg
         ml7vsQ1wzmJCXMOvv5RRdxk5UIf03cPoUZ0JUfi4rFshc7N3S/D5gLNoPjHq7CFL/ScD
         b4Ow==
X-Gm-Message-State: ABy/qLZRq/O76+ZRwXlDKUn4eGVCsTUQCt6A83p+p+WP7GxZ9r4aPTLk
	cgMnOOBDmJPAyzthohkOvK6MAQwE+Bw3u7aWNIM=
X-Google-Smtp-Source: APBJJlGepphVzYcdY5n66RwHkHtAiFaEQtCcoIUXoGiOA9JXzM3b03+GmSgOJPmGuCzJGIcJW2tqQzwLQ9wYh7V6VsY=
X-Received: by 2002:a17:906:109b:b0:994:54e7:1287 with SMTP id
 u27-20020a170906109b00b0099454e71287mr6409125eju.73.1689515756297; Sun, 16
 Jul 2023 06:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230630143719.1513906-1-yguoaz@gmail.com> <20230716141028.4c57c5c7@jic23-huawei>
In-Reply-To: <20230716141028.4c57c5c7@jic23-huawei>
From: yguoaz <yguoaz@gmail.com>
Date: Sun, 16 Jul 2023 21:55:45 +0800
Message-ID: <CAM7=BFqJQZ6A3ssLhMA3NYRbk9vg6O+41J=Njz1KGYQTi9yXbw@mail.gmail.com>
Subject: Re: [PATCH v3] iio: cros_ec: Fix the allocation size for cros_ec_command
To: Jonathan Cameron <jic23@kernel.org>
Cc: tzungbi@kernel.org, lars@metafoo.de, bleung@chromium.org, 
	groeck@google.com, dianders@chromium.org, mazziesaccount@gmail.com, 
	gwendal@chromium.org, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes: 974e6f02e27e1b46 ("iio: cros_ec_sensors_core: Add common
functions for the ChromeOS EC S=E2=80=A6")

On Sun, Jul 16, 2023 at 9:10=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri, 30 Jun 2023 22:37:19 +0800
> Yiyuan Guo <yguoaz@gmail.com> wrote:
>
> > The struct cros_ec_command contains several integer fields and a
> > trailing array. An allocation size neglecting the integer fields can
> > lead to buffer overrun.
> >
> > Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
>
> Hi. I'm sitting on this one for a couple of reasons.
> 1) No fixes tag (replying to this thread with one is fine)
> 2) Various people commented on earlier versions, and I'm waiting for them=
 to confirm
> they are fine with this version.
>
> If I hear nothing in a few more weeks I'll try and figure out the
> fixes tag + whether all the reviewer comments have been addressed.
>
> Jonathan
>
> > ---
> > v2->v3:
> >  * Added R-b tag from Tzung-Bi Shih
> >  * Aligned the code by adding an extra tab before "max"
> >  * Added a patch changelog
> > v1->v2: Prefixed the commit title with "iio: cros_ec:"
> >
> >  drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c =
b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> > index 943e9e14d1e9..b72d39fc2434 100644
> > --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> > +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> > @@ -253,7 +253,7 @@ int cros_ec_sensors_core_init(struct platform_devic=
e *pdev,
> >       platform_set_drvdata(pdev, indio_dev);
> >
> >       state->ec =3D ec->ec_dev;
> > -     state->msg =3D devm_kzalloc(&pdev->dev,
> > +     state->msg =3D devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
> >                               max((u16)sizeof(struct ec_params_motion_s=
ense),
> >                               state->ec->max_response), GFP_KERNEL);
> >       if (!state->msg)
>
