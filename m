Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D7EA9
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxcvw3C2"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-419768e69dfso182741cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 04 Oct 2023 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696472044; x=1697076844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEiOx5W5moM/33aYbTS9fKKtjr45VnAt/6eD86UseKc=;
        b=pxcvw3C2IPXYSqkvrFFDvwUzzmZFQrI8XBnHhhWjY0B+XTN2ZOq7z8hUZjLEJzeyLr
         nrp15zjlT3pkhhcgdumD+vmu9O3vsxZ6n2I+vCf3ZDXt415zaW8W9acHRHRdLn/URXLY
         0dQ2KJzzZZtxUjCK5hGWuUTJ0V/h/a/yW+yGWZ9LAq5tt8olzPPB8KY1seeX/E8A01b0
         P4EOn3vQSv14vGTLSi2curVW7PKuLR0eFup7ujylV03OX6zec6QRGGWWjJltUqOzUuK7
         K3XAUotR3e02N5BQO/Hoo6CuGYnXZFeKwYUcJN32QMlMPZ0eqovwGVgzXfRMrmTid7DX
         zzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696472044; x=1697076844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEiOx5W5moM/33aYbTS9fKKtjr45VnAt/6eD86UseKc=;
        b=Tgj90iHrFbS8Ao/eG6fijjUAMXRyEx2QQAazb6QOppUxM2kQxrhz7POFkW3pqVbNRD
         cu2RjkzGS98GwI8NxgmeMF+kCOFKxCMm5hotEqUb9l/Pqk5XvB0fW/OueG00LwF+7MXy
         tPaVhA5rzAxZQpDkgiiPvaKmRwBb3F8vIPZ4kb7+mgyZ/VNWz3EfhwiPEPS83ynFTgCY
         4EZCUZeJqsBcrFEENc2uvudshbql3ExlTVcD/WOTlMYHgZw2tPrYiU+9tirAKBe630jT
         vAISLwS12s5QRKj81zy1bdYMv8mQSFNeo3mwnChYEZBvUjon1HSXRUYaWea6adAy2DZE
         rjEw==
X-Gm-Message-State: AOJu0YzssZZu/Z7j2+bmBm8VnIoGCIPG/DfKAM7UqbaRsYQZf5DN2ftZ
	cJKlciblJFFYDsIAagKvwBdZnisCWUNvRaKGzOWFHw==
X-Google-Smtp-Source: AGHT+IE0klxs/2lDIBlT4+esgKAyPKw3EnCO//cA6/8bYO8UMhY2nUm09pZ3oG7gHkMrzeJvPpgYnc+ldxJ3Q5nVsgk=
X-Received: by 2002:a05:622a:11:b0:403:aa88:cf7e with SMTP id
 x17-20020a05622a001100b00403aa88cf7emr82267qtw.29.1696472043889; Wed, 04 Oct
 2023 19:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003080453.4011301-1-tzungbi@kernel.org>
In-Reply-To: <20231003080453.4011301-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 4 Oct 2023 19:13:51 -0700
Message-ID: <CABXOdTfmzmHZ5ZCgDpeprtzbYykRcDFdz2WGeRtAE+u3QP+8Cg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: fix compilation warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 1:05=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> When including cros_ec.h solely, the compiler emits the following
> warning:
> > 'struct cros_ec_device' declared inside parameter list
>   will not be visible outside of this definition or declaration
>
> Fix it by forward declaration.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec.h b/drivers/platform/chrome/=
cros_ec.h
> index bbca0096868a..2b2574236030 100644
> --- a/drivers/platform/chrome/cros_ec.h
> +++ b/drivers/platform/chrome/cros_ec.h
> @@ -10,6 +10,8 @@
>
>  #include <linux/interrupt.h>
>
> +struct cros_ec_device;
> +
>  int cros_ec_register(struct cros_ec_device *ec_dev);
>  void cros_ec_unregister(struct cros_ec_device *ec_dev);
>
> --
> 2.42.0.582.g8ccd20d70d-goog
>
