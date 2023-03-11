Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402D7B
	for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 16:05:33 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5416698e889so37356067b3.2
        for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 08:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678550733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=;
        b=h34LVM3UqmqUgwxpTXBJ/4CwnImSFFUMozqSylfyzNzIg8rEUFi/BCA/5SfPAhPXSK
         zVyg4dkH/np2nYMcxgt34KGbvvU69/pstFffIbpXSdjTuqr7mHRcatJl8wcG+ChH9+dA
         A5V6TTYkNmvyKGoj+SnE4wGxe2nzztZ+0cYdHj/So+YjENl4RPexyIQNksQlU5AqWmJ0
         wlqIaTJA+4pIrmihYkk+CWZVx2geZVmmUhYo5eOPcvWV+YR6xqVFHKFMSoocJOLnX6CR
         WwHQ52y8meSmlDKg6ykn0PXkeSs5FMhUOArFwyfH5cPvgTYIVyDHckPo68ZLvtp94miA
         EPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678550733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=;
        b=hsWtwraADnzp2d/1T2BCD9nnimYSaNYZf7nus8joXUcVKdk2xUlL0HiolzSsnVWitG
         DYEBSS1/hVo00mafRfa7sHFIgAKus6PgSjq9u+zKNg0dfe+OoMIq1sBvw8622v206BID
         u6g9nxT0FzTB3TDSCWDGZbMoSVzMHLypZMd8BGnhCV22GyYPF15yiEjfCyASq++wYgxN
         cm3cdWuxwuUocexrmb9FO3GClOmEmCFAl05ZZ768uz4DnrDZCQyjapb+YcVeQSWW4eGh
         bKG27eLfY/cOB+6nJm9Kr2wMUx4zG3h2PWUTBfnD3o6FOioAseNAqa9mPswwNuEciZ4e
         R9yA==
X-Gm-Message-State: AO0yUKVQRPnKVdx7T5H+mQqg0e02Br3sqNaUEnvsU/EKEKvVTgNd1c3w
	QAh45vxarlb90m0OfAVvtLQOasq/1H3xNs2vB/Tsrg==
X-Google-Smtp-Source: AK7set9ic8NaN+kdm7NG2bG/3UThQQCFa78uyAWSZO+HX+TKv1qILKSdYFavvGkzUkH3l060xAj5J+UbUwRtinZAjtU=
X-Received: by 2002:a81:400c:0:b0:540:62be:42b with SMTP id
 l12-20020a81400c000000b0054062be042bmr2285636ywn.6.1678550732657; Sat, 11 Mar
 2023 08:05:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:05:21 -0800
Message-ID: <CABXOdTePJ_gcBYcJ7fE2pX5E71oBmq41KzxiMmVJ_GcDRi7MGw@mail.gmail.com>
Subject: Re: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
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
>   drivers/i2c/busses/i2c-owl.c:510:34: error: =E2=80=98owl_i2c_of_match=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-owl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 98882fe4e965..99ddd8894964 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -519,7 +519,7 @@ static struct platform_driver owl_i2c_driver =3D {
>         .probe          =3D owl_i2c_probe,
>         .driver         =3D {
>                 .name   =3D "owl-i2c",
> -               .of_match_table =3D of_match_ptr(owl_i2c_of_match),
> +               .of_match_table =3D owl_i2c_of_match,
>                 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>         },
>  };
> --
> 2.34.1
>
