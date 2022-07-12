Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F66AAC
	for <chrome-platform@lists.linux.dev>; Tue, 12 Jul 2022 22:08:12 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id oy13so11877706ejb.1
        for <chrome-platform@lists.linux.dev>; Tue, 12 Jul 2022 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e6Mh3C+uukR/DWRHXYHxlUK8ZlybYZpRoKWBJ/X1AF4=;
        b=aU+dJonux1J27uENvyLoPGXSYNfkO6wrAHdlorO59BdNhVvVFTDO8JNMtb7rQTmsrH
         wkdd8LR2o+pA6+wIp34HmTQHfdOHKkvNk09aempDqPp5U9mIdnanPiy1huOLbovsJiUs
         gqaW40ygQNPXHFq4tg6Kj0QL+siUkH4D1XsfsAr5koMlq3sbuLWNkXmUK4gsWt7yw2Vm
         zHcbF+y0IR8unFA0W4amDtmlmKhWxehj6gQM1pSJU+aq2RUBCFMzwgFRR/EeaiumenDb
         jcP/xEqI3UzjuH1ZPfZPJunbfsSh779A1Z9TdpM+bVOipCWyNFpPLDyvvL5ibtxJctn3
         4+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e6Mh3C+uukR/DWRHXYHxlUK8ZlybYZpRoKWBJ/X1AF4=;
        b=GEa2IGTvJN5Vo5DN4nZymi9mJ5C3v6Z6vxesdQu8CZLLFBwTXRq4T9XkVQa5C9J9QI
         /atvIr0NHn1OkAB7dYnR33kKq+uilmlGPyutPGqvZ623Ulph0uGMU57EiUk35bdGsLD1
         yUwwUpbJ0tB4zAgsWaa3gnMBJa6wQ8wZUXzTIiiJBAENG85AVh/8wunInfXJIDyl7OiK
         kCw2N/L9jccmcpNCW/Vu+xSiqWLqozVXenmn39Bw/uIvdSF2UoDGmxiCHoL1Lnzgg1Zr
         ZBGujIXW14FD/A4gwP4fUHo+BPil2f9xBXWOkxrvG3nao0FeFXbz9O8adU/6YmyYawbF
         H22A==
X-Gm-Message-State: AJIora+xz7mwcURPRjExzeK1lRGUBsMU1LSeLeG7uUsahy3KSaFPpcqk
	dCPMn5yfAIMhvcsKYi9TF4w0HepaSiPrCQmXJ9q6IQ==
X-Google-Smtp-Source: AGRyM1sbMjtnE3khqOzWbs6jH+h1l6uJCY8+VMLsW0fheWtLu5UbaHn/tRGVkDQ7Jqqj79gC4r2wmAh96zyfSzDYhuk=
X-Received: by 2002:a17:907:2c77:b0:72b:1154:33da with SMTP id
 ib23-20020a1709072c7700b0072b115433damr265458ejc.27.1657663690831; Tue, 12
 Jul 2022 15:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712214554.545035-1-nfraprado@collabora.com>
In-Reply-To: <20220712214554.545035-1-nfraprado@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 12 Jul 2022 15:07:59 -0700
Message-ID: <CABXOdTe_Q5fcM_Ffa72V=X5NWv8jZvK_exZ2i3tfCJ_SW3N-XA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Use dev_err_probe on port
 register fail
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Prashant Malani <pmalani@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Collabora Kernel ML <kernel@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 2:46 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> The typec_register_port() can fail with EPROBE_DEFER if the endpoint
> node hasn't probed yet. In order to avoid spamming the log with errors
> in that case, log using dev_err_probe().
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

>
> ---
>
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index d6088ba447af..8c0ca3c128ee 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -352,8 +352,8 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
>
>                 cros_port->port =3D typec_register_port(dev, cap);
>                 if (IS_ERR(cros_port->port)) {
> -                       dev_err(dev, "Failed to register port %d\n", port=
_num);
>                         ret =3D PTR_ERR(cros_port->port);
> +                       dev_err_probe(dev, ret, "Failed to register port =
%d\n", port_num);
>                         goto unregister_ports;
>                 }
>
> --
> 2.37.0
>
