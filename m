Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116E2E55E
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 14:42:43 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-992b66e5affso204542066b.3
        for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688136162; x=1690728162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVEDvLJrxohBr48Igsc93HjxIYvHu2mgIMywKz9BB14=;
        b=bc9GffOpP9nZMGcVCrz5pM/g2RyLRlzR2Y5L1H52fp7oxki52XsKtHcpVUomgc2nQO
         rBdhk3D+cM8oH1RsS7ASkmLdOj8EDqv8XzIgEmw+Kaz02+S7N3yOp38xAQKxWWPR9ySV
         n3F2coV63YRWwOLcQQP/KOv5afyrw0BnhF18tlIDZLYysTfh4nX5fwx/+YqrDvLmDysl
         UDPDcfGV/GpHLF5hiQ8JadqaYYi6+x3TO5oAkNg358VSWNfNSi/yYDGic9eVMhJurPux
         EewwmrWqxKnRmLH8Ep13QOn1uZyCkCq2zdJ6q2v4Lh3qhN7zbHJqeDM2X+fF0RqQJfT1
         tvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688136162; x=1690728162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVEDvLJrxohBr48Igsc93HjxIYvHu2mgIMywKz9BB14=;
        b=CMI9e0s0y9IESiqPjJ2bZakxASCrHmEvZ37L6P1o7yzsXcsOlRqyjKhCvxTCUOuxzf
         6LlKYWDvmcJgpIsy7Tn+VgeJN3A43kcLzHfWuglr4LJ+rO+3KuEHZz+q/OyOgzhMTCVX
         q7AhTCRwd+YQ3fIayNUQnJoPxugxyhIZYtOrCEqRM022tJP/2rmT4vNQzMVaB4dGhpGx
         lVWelw2HXDKkd5kxxds4y5rWfy4+lLAtA0ygqd/YR1MybaYlOpTaz/Q8sVeziy81Mq3a
         bA1CPlGNQ7m4OynKRDduvNxhAt7nkVHt5KHSdldQik+mpRUqYiwxRQEOHXvTI2+4dR9q
         yPuQ==
X-Gm-Message-State: ABy/qLZuHSOLaHDGyOefU845sFZlAQooAr56SsTY1qiVBAA5Ltewt9YP
	qHM5fvuT/scCj45La0r4Uhro4N+WxZB2Y9fcLXU=
X-Google-Smtp-Source: APBJJlHfDj/bhEszK89onIdRr4fkJEOKVbpLatk0YWKdcIq8bzW/QuynD8I0ESgc4B1wmYFQ9toNRk8pqCinC6pRQwg=
X-Received: by 2002:a17:906:4805:b0:992:5deb:db89 with SMTP id
 w5-20020a170906480500b009925debdb89mr1973886ejq.22.1688136161805; Fri, 30 Jun
 2023 07:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJ6F4THLoYy6S8HP@google.com> <20230630083112.2344234-1-yguoaz@gmail.com>
 <CABXOdTdPTaJp8AwxfZzOZHDBsJSHpXH+KPsA3z_ZheekHPowpA@mail.gmail.com>
In-Reply-To: <CABXOdTdPTaJp8AwxfZzOZHDBsJSHpXH+KPsA3z_ZheekHPowpA@mail.gmail.com>
From: yguoaz <yguoaz@gmail.com>
Date: Fri, 30 Jun 2023 22:42:30 +0800
Message-ID: <CAM7=BFqEgpkRP30-P23wWy+hbS3HfCbKE1vb4BLQt8EgbMhxOw@mail.gmail.com>
Subject: Re: [PATCH v3] iio: cros_ec: Fix the allocation size for cros_ec_command
To: Guenter Roeck <groeck@google.com>
Cc: tzungbi@kernel.org, jic23@kernel.org, lars@metafoo.de, bleung@chromium.org, 
	groeck@chromium.org, dianders@chromium.org, mazziesaccount@gmail.com, 
	gwendal@chromium.org, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it. I have resent the patch in a separate thread.

Thanks,
Yiyuan

On Fri, Jun 30, 2023 at 10:07=E2=80=AFPM Guenter Roeck <groeck@google.com> =
wrote:
>
> On Fri, Jun 30, 2023 at 1:31=E2=80=AFAM Yiyuan Guo <yguoaz@gmail.com> wro=
te:
> >
> > The struct cros_ec_command contains several integer fields and a
> > trailing array. An allocation size neglecting the integer fields can
> > lead to buffer overrun.
> >
> > Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>
>
> Please _never_ send a patch as reply to a previous one, much less with
> a Re: subject.
>
> Guenter
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
> >         platform_set_drvdata(pdev, indio_dev);
> >
> >         state->ec =3D ec->ec_dev;
> > -       state->msg =3D devm_kzalloc(&pdev->dev,
> > +       state->msg =3D devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
> >                                 max((u16)sizeof(struct ec_params_motion=
_sense),
> >                                 state->ec->max_response), GFP_KERNEL);
> >         if (!state->msg)
> > --
> > 2.25.1
> >
