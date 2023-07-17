Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48622C2C2
	for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 23:54:15 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-40371070eb7so70911cf.1
        for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 16:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689638054; x=1692230054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3jAfeK1TboEapIapoxRTzROdPFxCqeB8GfaLFzRyWo=;
        b=3gaop0MsrObpCuLYGnTyArZ2CGnoMsQaKXXRnHdTAY86IOXFCY/AMb8eBeWDzQDYYt
         q+BXzVZ9BHEaHjkwj0fDMJfBnAzAKV2C4j0pzqeBDCSL4g6iFK3aJp/nIua+EVu3jDRB
         Jkjif6sPNULgL5T/b1wRRcFgI6l+u90arfcvIx9JutOBPf+iF/N631Y3LRIN7aEQmVRw
         1Kk8kRDqyfJmSMwoxs7RlBJhdPw80Nzvu0Ug+/u1QiXDIfqsQt0ytC5r9FMUXV2xdWYd
         7GsdA8HxKNhtAVO17OcCkd3B99Prr5pkAp18oxkqTflHCCmui/GI46lq/NT2ZykA+Vet
         uEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689638054; x=1692230054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3jAfeK1TboEapIapoxRTzROdPFxCqeB8GfaLFzRyWo=;
        b=b2Ym1kaTC8S4YS8BD7th/5DR9RUNe31pcVcn1W2P01VfJY7jzxsZbCPBwymG2grMiN
         0jAGIPQKReV7Q2903vGHeKwCYLcLqgnpQ81E9YnpTlmwmOpqnN1EBhpDIOrm51bEVAjZ
         emvGe79mCDliRLh/h8uFdlyL+nKD4DRjMF61Z1G5+9Cs8gNiS+MMCigZ3xXSNZUYh7Ii
         h8uwL56JEcGWeoWZdRTUC/itky7W6tIgyjzaaitrNtJi46P4vd4eUlNFH3Jigupc7Rho
         xrolS9l6qAGT1+JvXQl22POpFG+FKvYlpCh7Qd/vgz2EL6cxl193F9u1nRMQleW549A/
         7lHA==
X-Gm-Message-State: ABy/qLY7Po+I+6d9Z5yHoFH1GAqysFLd5hYXpbyArK6MzYmFlHSmUYYq
	ml4+M8S5FvYsFqMh4kEnCCA4s3eDaChv5AXjxEUIYQ==
X-Google-Smtp-Source: APBJJlGNEFS+X2UGYRBHYYlFepf8nUahnFcsaO6KQp3gAz3I89PT5DeYE6k/X0DxNLKoUyjOl42CZofV0dXpydIMYyw=
X-Received: by 2002:ac8:5714:0:b0:403:a43d:bd7d with SMTP id
 20-20020ac85714000000b00403a43dbd7dmr120416qtw.4.1689638053953; Mon, 17 Jul
 2023 16:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
In-Reply-To: <20230717232932.1.I361812b405bd07772f66660624188339ab158772@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 17 Jul 2023 16:54:00 -0700
Message-ID: <CABXOdTf2bJMekRR9f4zyBNDEY5Uuogin-dy9HOEvWhaEW0-Qtg@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Emergency sync filesystem on EC panic
To: Rob Barnes <robbarnes@google.com>
Cc: pmalani@chromium.org, chrome-platform@lists.linux.dev, 
	briannorris@chromium.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 4:29=E2=80=AFPM Rob Barnes <robbarnes@google.com> w=
rote:
>
> Perform an emergency filesystem sync when an EC panic is reported. An
> emergency sync actually performs two syncs internally in case some
> inodes or pages are temporarily locked.
>
> hw_protection_shutdown is replaced for a few reasons. It is unnecessary
> because the EC will force reset either way. hw_protection_shutdown does
> not reliably sync filesystem before shutting down. emergency_sync is not
> synchronous so hw_protection_shutdown may interrupt emergency_sync.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>

Makes sense.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
>  drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index 500a61b093e47..9652fc073c2a4 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -327,8 +327,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle devic=
e, u32 value, void *data)
>                 dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown =
is imminent!");
>                 blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, =
ec_dev);
>                 kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char=
 **)env);
> -               /* Begin orderly shutdown. Force shutdown after 1 second.=
 */
> -               hw_protection_shutdown("CrOS EC Panic", 1000);
> +               /* Force sync the filesystem before EC resets */
> +               emergency_sync();
>                 /* Do not query for other events after a panic is reporte=
d */
>                 return;
>         }
> --
> 2.41.0.255.g8b1d071c50-goog
>
