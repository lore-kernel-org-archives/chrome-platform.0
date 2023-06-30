Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4838156D8
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 14:07:10 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-401f4408955so225081cf.1
        for <chrome-platform@lists.linux.dev>; Fri, 30 Jun 2023 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688134029; x=1690726029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHNKzb0xtZDRFm7xSfYT1lsm0g1hDdSqIsV7ISLU2gI=;
        b=i5USUPNBwEgaWF6g3Ro3jJBZF0WCeUDXRsn1xhd0FxR78OIlDFWaH3iDqPaCWYR4zo
         rVJ3qxPJdk/YrREY2Ow1EbO5Su+C8P1RzMEFUaya5wLBYiiJyFEoSTxL/0GPgcSc1QVr
         D3LW+JuJFov5xzMJRxCfjmZrBXeAX5Gu6VM0itL0VgihJEAvPD3FVD52WD25TMdElH3q
         t7k+28lpecAagScvi7y1pWnNiectOUUsd+dotGV4WB4WDne/WjnxeRgJaaJrh6dgn04R
         QJJfDeoooGqTKpO9mEtx9zM/nxVuibRfIt5e+/cK8sEa3vvO5btL/Gw0FGK+z5/w6ym7
         at/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688134029; x=1690726029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHNKzb0xtZDRFm7xSfYT1lsm0g1hDdSqIsV7ISLU2gI=;
        b=CFLYO+2pigXBnCgmb4vKmDCCYNK5HfrPtu3khtIU7G9DySvQYf0vzTBNGmrSElRl6l
         jEO3ZkrkX/wmTBHJjNs5hBnKGZ5DkLpBxTmHE4YQGkSr4tSWoUngNZN8kLwe6h5hCByf
         cImSz9Gchwp+yoFoLIaF6rwCqJ4qVN6y/3X6dqD+3kkB14VXbiAdPGUEJwGGR5eahbpX
         EtXBtMxDfHrwr9cXGz+L94/ZAkzx7tStmzaFGXghXfpFQ/CjqowJbOQwRzsQ8/a9kYgf
         qd2szy+mDcvcF++VwNmaCtOhMjxflLCo7aF0NbFIYcXrBltWerknA9C7aPfEktGGd5R7
         54dQ==
X-Gm-Message-State: AC+VfDzSvMsP0kU3TNf3HuZBL4t+wV3vbOMzpo/ixFH5u5epETOQ9jjy
	fJCmG6RW/yvZLw9lpm7u/qy15Y+HSSLr/E1W+VcPEg==
X-Google-Smtp-Source: ACHHUZ47S2nLH6V2FUJYX+wiY64v1gecK1rWqbO/Z6+l5S28oyXmumxGHbDpZZEMVcwaepD8n4Eg0dLjxQoQ1/fdKbI=
X-Received: by 2002:a05:622a:188e:b0:3fa:45ab:22a5 with SMTP id
 v14-20020a05622a188e00b003fa45ab22a5mr702360qtc.27.1688134029436; Fri, 30 Jun
 2023 07:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZJ6F4THLoYy6S8HP@google.com> <20230630083112.2344234-1-yguoaz@gmail.com>
In-Reply-To: <20230630083112.2344234-1-yguoaz@gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 30 Jun 2023 07:06:58 -0700
Message-ID: <CABXOdTdPTaJp8AwxfZzOZHDBsJSHpXH+KPsA3z_ZheekHPowpA@mail.gmail.com>
Subject: Re: [PATCH v3] iio: cros_ec: Fix the allocation size for cros_ec_command
To: Yiyuan Guo <yguoaz@gmail.com>
Cc: tzungbi@kernel.org, jic23@kernel.org, lars@metafoo.de, bleung@chromium.org, 
	groeck@chromium.org, dianders@chromium.org, mazziesaccount@gmail.com, 
	gwendal@chromium.org, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 1:31=E2=80=AFAM Yiyuan Guo <yguoaz@gmail.com> wrote=
:
>
> The struct cros_ec_command contains several integer fields and a
> trailing array. An allocation size neglecting the integer fields can
> lead to buffer overrun.
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Yiyuan Guo <yguoaz@gmail.com>

Please _never_ send a patch as reply to a previous one, much less with
a Re: subject.

Guenter

> ---
> v2->v3:
>  * Added R-b tag from Tzung-Bi Shih
>  * Aligned the code by adding an extra tab before "max"
>  * Added a patch changelog
> v1->v2: Prefixed the commit title with "iio: cros_ec:"
>
>  drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/=
drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index 943e9e14d1e9..b72d39fc2434 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -253,7 +253,7 @@ int cros_ec_sensors_core_init(struct platform_device =
*pdev,
>         platform_set_drvdata(pdev, indio_dev);
>
>         state->ec =3D ec->ec_dev;
> -       state->msg =3D devm_kzalloc(&pdev->dev,
> +       state->msg =3D devm_kzalloc(&pdev->dev, sizeof(*state->msg) +
>                                 max((u16)sizeof(struct ec_params_motion_s=
ense),
>                                 state->ec->max_response), GFP_KERNEL);
>         if (!state->msg)
> --
> 2.25.1
>
