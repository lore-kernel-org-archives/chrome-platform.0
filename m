Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CC62E
	for <chrome-platform@lists.linux.dev>; Sun, 26 Mar 2023 14:45:58 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-545ce8e77fcso47675457b3.1
        for <chrome-platform@lists.linux.dev>; Sun, 26 Mar 2023 07:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679841957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34KWfrJk1OWOYjGE50V1KXP7G0F1OpvWfeUVk+h/cZQ=;
        b=sCpSUSSWfaPQD6yYox/cUzSKZz16BT68QLNHQzeeZbUZBprpHQHMQIGmvp46O5LMqk
         WdIR4ZS/FpyYQOI2PMi0tTvjZWX31yTbbPHZ+JJcn4s0MxxiDLV6+kniu+otGQV70oqC
         qoW53+UeTsR61zyEhhLnhA/op5qMuQuLTkX+wXczMXFxDS1/qCa4qK+Z/rtyw5bJn2or
         v4gPiax94MUQXZkJUfeZt4L/ISP3MM0+9P4qitPc4xjyhCBnoDZUT5JU/A/Nx/7Rmn+h
         VDdZNvxRQCHSLmnWlI+JFNTvU0X7IBEeqyn6nZjEx21xpCDVDlFMk7KVWoIs8oP/t5Kx
         LqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679841957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34KWfrJk1OWOYjGE50V1KXP7G0F1OpvWfeUVk+h/cZQ=;
        b=HwikFn5EdqOvA2/D7hlQMAKZl6vvs3jXyb4wBY7IddstzINXgXEjKMqtesWqARpqk2
         e49lQQQXHekYX8iU42JFMaqFvDIs1nlCqumzfZX0Bes+OxQqSNKSp7jR6USSxnwje2uL
         Ht/nzZWDXpObr7IdPAHCnhdNXDr49oFFuiJsQKWYpLtgYDRKPWPOqdsrvd0huZ1LYqLE
         BcquN/PvTszVToFMA7v22Tv4HduAy2Y+rjEroQxlC/1FTZf6zXsAv4unvZfHQoZOP/AH
         DqrZy08tfBCUfZawFN08vTjyYUQHSA9spQxKsrvLJqpVmFZW6S3VRn3ofxt8YSuUvyps
         WOtQ==
X-Gm-Message-State: AAQBX9frc1I5+pRd+oTgnEtZbL39ysJ9z+nAAGKyfjnljJ1v4LD2CXHT
	8K47+ggbepgCKa33IAoHw2MEMkyQQEnoLRubRpJNBw==
X-Google-Smtp-Source: AKy350Y/JOwuKrNZKUyA3hhsFUn8vWbBoVETOy/PlETziuW1TPuvqv8tr6qpbmIvWMFIjBqeaLT7w7nUMYGqo+ooxkA=
X-Received: by 2002:a81:4426:0:b0:544:5aa0:e212 with SMTP id
 r38-20020a814426000000b005445aa0e212mr3611263ywa.6.1679841957067; Sun, 26 Mar
 2023 07:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-5-u.kleine-koenig@pengutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Sun, 26 Mar 2023 07:45:46 -0700
Message-ID: <CABXOdTeAJaDuXP22omaxMBo6OpF6act8L6jZgUfj+busk-mesQ@mail.gmail.com>
Subject: Re: [PATCH 002/117] media: cros-ec-cec: Don't exit early in .remove() callback
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Benson Leung <bleung@chromium.org>, 
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>, 
	Scott Chao <scott_chao@wistron.corp-partner.google.com>, 
	Rory Liu <hellojacky0226@hotmail.com>, Guenter Roeck <groeck@chromium.org>, 
	linux-media@vger.kernel.org, chrome-platform@lists.linux.dev, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 26, 2023 at 7:32=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Exiting early in remove without releasing all acquired resources yields
> leaks. Note that e.g. memory allocated with devm_zalloc() is freed after
> .remove() returns, even if the return code was negative.
>
> While blocking_notifier_chain_unregister() won't fail and so the
> change is somewhat cosmetic, platform driver's .remove callbacks are
> about to be converted to return void. To prepare that, keep the error
> message but don't return early.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/m=
edia/cec/platform/cros-ec/cros-ec-cec.c
> index 6ebedc71d67d..960432230bbf 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -332,14 +332,16 @@ static int cros_ec_cec_remove(struct platform_devic=
e *pdev)
>         struct device *dev =3D &pdev->dev;
>         int ret;
>
> +       /*
> +        * blocking_notifier_chain_unregister() only fails if the notifie=
r isn't
> +        * in the list. We know it was added to it by .probe(), so there =
should
> +        * be no need for error checking. Be cautious and still check.
> +        */
>         ret =3D blocking_notifier_chain_unregister(
>                         &cros_ec_cec->cros_ec->event_notifier,
>                         &cros_ec_cec->notifier);
> -
> -       if (ret) {
> +       if (ret)
>                 dev_err(dev, "failed to unregister notifier\n");
> -               return ret;
> -       }
>
>         cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
>                                          cros_ec_cec->adap);
> --
> 2.39.2
>
