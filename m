Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A8B7B
	for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 16:04:50 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5416b0ab0ecso29209837b3.6
        for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 08:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678550689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G/X5+IzPvIp/u0h6IkNiabirE8Y9puo1twyHDWLaMA=;
        b=VJCB1uC5JrWowq+lL5LKURGf9F6grJOUQgJ0kSJDYl76qXzRvwoWda/HsCN3ZQfB6G
         DSa+tDW+3NlqICRdnvqurB7WtF4geijT6FWAWjF5vYBcGOMBSO+1Q9eRCHPobKdAjwQ1
         5IMWSXKnOoZV9qWXWjzPcRwhEtN3R1J/XMn5Camro6uha3/YC1gYfzuJD+0Bifq/2szQ
         2yglUr8Wne8GE1Q1FEjzSeQqs8bga5ij4uo5HJrjsjP7Q+j5GYzuIbycLrUsL03VsSpA
         FXTf1oCE4sO7FH0IIq6YUPwhvli0m6vKvVi25DbrRop6B43Y22XPpMy33rMhzYsz7vuk
         cj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678550689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G/X5+IzPvIp/u0h6IkNiabirE8Y9puo1twyHDWLaMA=;
        b=RcPxBXWYVPxfeaXJqM8ZlKdK/P2g5iDBomyNOsR49FEwPwfAf2vVatXf/3WjRteI94
         v7OUMibTulS1DaDitjFZm8AeH0ob8T3CLNS07vm4lk6fvB3xbNn3MExjEgzJyOr0mBr2
         4Pu7Dj3iHHw2xPIlsSRwsQOiNa5tUDMOP11gTw8wi4a5++XHJv506AbJ/fCiEdNTrGJe
         OrHeR8LQOlBoHX2GGhjwepb5lLE0JSEpU9hy5ibjpB5p/7YgY2FPfDve5SmgK9JaNe/a
         dAJcTR0ylYn0Ng8KYzCrPsVrIvjaQi+nBbqBfB/nPnm3GrxSVTvT4l/GKTrQpayzws3v
         nzaA==
X-Gm-Message-State: AO0yUKV2BPMa9FdeyGPYgplph7StfX8VnoBxJ9xuIzsI3jUks41jTFFD
	l/iWn4SNDk06dmw61MHKkUgQ7ehhZLGAsvTisGkJkg==
X-Google-Smtp-Source: AK7set9c9qRxU35UmkHTgz32UHoKUY+oqyuYpi2DEgv0Gw4dOgKiDSabwSr9lVyr+LPm+IMt8NbrQV2unV0hRjZR+Y8=
X-Received: by 2002:a81:ae4e:0:b0:52f:3399:ed08 with SMTP id
 g14-20020a81ae4e000000b0052f3399ed08mr18340951ywk.6.1678550689567; Sat, 11
 Mar 2023 08:04:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:04:38 -0800
Message-ID: <CABXOdTdm74LsShmx+Xv5W6D-Ub2q4ccU+SV4+VJUpBJmpXxLvw@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 3:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/i2c/busses/i2c-mt65xx.c:514:34: error: =E2=80=98mtk_i2c_of_matc=
h=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt6=
5xx.c
> index 43dd966d5ef5..59eaefe999b1 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1546,7 +1546,7 @@ static struct platform_driver mtk_i2c_driver =3D {
>         .driver =3D {
>                 .name =3D I2C_DRV_NAME,
>                 .pm =3D &mtk_i2c_pm,
> -               .of_match_table =3D of_match_ptr(mtk_i2c_of_match),
> +               .of_match_table =3D mtk_i2c_of_match,
>         },
>  };
>
> --
> 2.34.1
>
