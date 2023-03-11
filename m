Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2677B
	for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 16:35:44 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536bbe5f888so159474217b3.8
        for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 08:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678552543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=;
        b=UAQ71mkDnVkAMX0dBUZr9na7yjE4UcUPxg0d4QW9+TED0PGTdhVGRYzEOewrz4OOEA
         VZW95uFOQsbTG7SCyL1y5/XjlKCkwxuoSglzm5bgqGtQdoAyBwCwhkFAK62n9uP4NUqX
         5NXsW75RXvaDplRaP73qW5BIVFkYFPl2iKS9Msg4T2Kc7E85yFAsDC/o9m8oRylQFtVT
         rieInkzI+bi92+xxSiHSVVDuTfY72Ir/LAqQza7lLPRG8X9YLCnpd98cj36uhSC5kBxV
         bRLb63mcK+uo33HUtFca6zrhBdTTSD+/EtDXha8sz5m999IdYsA9t7xvbr2OIXH3nmUe
         DQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678552543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=;
        b=uIOEx8ElgPOAUxe79WH9Ad9YZCvrfW9bFYZWl8zpVnguLV295w2mcHxdoqd1pQatiS
         cIKL/ra8G4JH+cz/7qAh7wlmzvvD+5Po7wNdYpAW6cFSYmW5T7RVXCCUtsGFp7BRdY8K
         pySG/22TgvzXqNpQUP4T3wLso36RWK8ncMiugCEWr/XksUAbQ5rMKoL+dyHIgBU46ZAP
         +y4WzbI2SXwqareKJDq0J0U+Btt8OjENI9Ni2ihHWhu8p5HRZD5vxXlj9BwPECqJHtaw
         zxCaDsNP+a5GxUm49Y4Ya3tYylIKrznGSZw3VibsclyodiEaAMSR0/vSsUhZl5vC/RVv
         0ZUQ==
X-Gm-Message-State: AO0yUKWwAAWuV1ig1V69hdf/99TwIhV9KF1sJechhIAS4deQtCvkMBOm
	CS/R/aIZCs6M6Pq4pF9fc9KY1Ae0zBpzkTn7MpZoyw==
X-Google-Smtp-Source: AK7set93tV+avSHhtVAdwyX7DfN5gzCh81D4seJpwkCcmvQqrqKMSESRIYfCezkiV/oqBS7uIDZ168ZXua3DqwAa1MY=
X-Received: by 2002:a81:ac1a:0:b0:533:cf4e:9a80 with SMTP id
 k26-20020a81ac1a000000b00533cf4e9a80mr18506420ywh.6.1678552543118; Sat, 11
 Mar 2023 08:35:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:35:32 -0800
Message-ID: <CABXOdTdWkX9hpJtZmgMEBvT8XS5i3cTTF868RLx3Y9o52x6QAw@mail.gmail.com>
Subject: Re: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
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
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>
>   drivers/i2c/busses/i2c-synquacer.c:632:34: error: =E2=80=98synquacer_i2=
c_dt_ids=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-=
synquacer.c
> index e4026c5416b1..50d19cf99a03 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -629,7 +629,7 @@ static int synquacer_i2c_remove(struct platform_devic=
e *pdev)
>         return 0;
>  };
>
> -static const struct of_device_id synquacer_i2c_dt_ids[] =3D {
> +static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused =
=3D {
>         { .compatible =3D "socionext,synquacer-i2c" },
>         { /* sentinel */ }
>  };
> --
> 2.34.1
>
