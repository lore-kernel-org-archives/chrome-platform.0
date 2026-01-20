Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471673B8D70
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899056; cv=none; b=LQNlLy4rHxb4gX7HjBmEIcrB1+ZFB2pL4Q8FiihDBuq8gwOxdGxvKyNzyWYUiiVdLqo5GrBTSSNS+LHoF+WiBMhkLJIRO8KbWRAyXdY113/M/OX6ZAyrKMZv8D1UDsR6bLiSmj8DgbA22V72m6Q4a/142t0TS2RBtCN090Dzdjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899056; c=relaxed/simple;
	bh=do0XuP3Zi8PjdCXNfroMPixzMEA5ulmxumiLJlFnLiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anmelP/L26JFhmq+IENH8fp14hn7nGIYHArUnmWa6u0T/wV/41QIz2hHIgzg6OvSQZ5loQMVlPZwDDfEGG2oM2AO4RIUkqE+0e8nxqKQQfUkiogJefimQNSLJ2L0/A/0ki42eJb3+cKdaVD4cdY7rlAJVpdeHJU/0FFG8ONpSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abpykzdW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abpykzdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC44FC2BCB6
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768899056;
	bh=do0XuP3Zi8PjdCXNfroMPixzMEA5ulmxumiLJlFnLiY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=abpykzdWTduQDgu0Lbd2tV5/P9Zd1OBRMmQhsodoucKJfOLCExTpk55eDnHYXAo9y
	 nkYkRG5CqpLpmAEpGzKGaIftT3iguRIsmSx/EMtjZL5B+4ibuFOQUBItMddFFvWNwv
	 bUujNoxPIss8n+rcbw2oqvNHBMUm1GngXK0DZcbtNsFL4CUbAlXbQ45kD71oGJJx/5
	 hUzady4AUQgiZWhGQEQjPN0QKKB28lX5FIbLP0lBir1wWFJTHN7JNG2Ub9NxKmLKwh
	 5EJnVsfu5hS/k6fARFIkFZKfKsTBIIo8QThAkMZUOJ3XjsBoL3fPweWrCgTPpbpbCl
	 AnXh4OcS3l6DQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so5309608e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 00:50:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpoHIq6iq8+tY6WLZDsemB6glB0Zn7jDdRtGzrtSCibuseR7Fr9oUsyoOlMEGnCV4lD52rwRm/S8W8C6/rIsk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRzX5nLRJ26BzlKok7JZCW+rsW3l7ZUbyU9AvzKkrTKzGtVri5
	j7gRQouOElg37MNXAP148/BlR6CJmgqpLNeLO9yJwwGeFL+WXKd0htdlrVkP7l5OtFKHm6u+ja8
	/NexE51Z3o5ildvyVqXQod2pTDEIEactWnug6X68Aqg==
X-Received: by 2002:a05:6512:4028:b0:59b:7864:9776 with SMTP id
 2adb3069b0e04-59dc93613b6mr485045e87.46.1768899054537; Tue, 20 Jan 2026
 00:50:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116081036.352286-1-tzungbi@kernel.org> <20260116081036.352286-3-tzungbi@kernel.org>
In-Reply-To: <20260116081036.352286-3-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 09:50:42 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mdngn4c4QW_ZhDs+VcDovO0nQ9XO2PkrNdrbyHDxrm3AA@mail.gmail.com>
X-Gm-Features: AZwV_Qh3M58U2X97aT7pLBRq3LyYL2qXklUQjfDBH6SF1QA_AYfcibS66WclyeE
Message-ID: <CAMRc=Mdngn4c4QW_ZhDs+VcDovO0nQ9XO2PkrNdrbyHDxrm3AA@mail.gmail.com>
Subject: Re: [PATCH 02/23] gpiolib: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On error handling paths, gpiolib_cdev_register() doesn't free the
> allocated resources which results leaks.  Fix it.
>
> Cc: stable@vger.kernel.org
> Fixes: 7b9b77a8bba9 ("gpiolib: add a per-gpio_device line state notificat=
ion workqueue")
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_devi=
ce with SRCU")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 3735c9fe1502..ba1eae15852d 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2797,16 +2797,23 @@ int gpiolib_cdev_register(struct gpio_device *gde=
v, dev_t devt)
>
>         ret =3D cdev_device_add(&gdev->chrdev, &gdev->dev);
>         if (ret)
> -               return ret;
> +               goto err_free_workqueue;
>

I need to drop this because it jumps over the guard(). I think you'll
have to free the workqueue locally here instead.

Can you send a separate v2?

Bart

>         guard(srcu)(&gdev->srcu);
>         gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
> -       if (!gc)
> -               return -ENODEV;
> +       if (!gc) {
> +               ret =3D -ENODEV;
> +               goto err_free_cdev;
> +       }
>
>         gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gde=
v->id);
>
>         return 0;
> +err_free_cdev:
> +       cdev_device_del(&gdev->chrdev, &gdev->dev);
> +err_free_workqueue:
> +       destroy_workqueue(gdev->line_state_wq);
> +       return ret;
>  }
>
>  void gpiolib_cdev_unregister(struct gpio_device *gdev)
> --
> 2.52.0.457.g6b5491de43-goog
>
