Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52651181335
	for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712778542; cv=none; b=NBvwRfE+BMqEDbyAYRtdXMjPab/3HwkIi8DIbU++SnRc1RheE9tTInQGvyJv3k4pU9o2ly6Kf/iE1b9HUHG4lb7QIHOCfcimesGXcRnSQNLb+/PV52x37ZNTvfdIXzbG2ZiQpOBIKE7QBtQvCXENAmMsBvWSX6JUY865tJxD3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712778542; c=relaxed/simple;
	bh=xEoGedRNiXJoGnqajnhf1BwPxOUbcpaoDU2aUMU/6xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkBNW3jisTX6vqLSP4Z7yD5vxhtT/8Jl5AqWfAWghqLI2fi0bPyqlGqjdMiMECQ/bl6bmoknKCcH6Xnq0rQ3fbb+9/8tY4bKEQKQ/Pvi3mwJ45uZH9SvpH8ckRc6lzQcPRVGVZ+FCB3nVeV3JKCln4GPtYExJAmFflONNbdOLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFSZefPS; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFSZefPS"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-43477091797so2881cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712778539; x=1713383339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWCShh/bRGRzeO22yeBjtZLPhJ0/AGFCyE+KkcrS+ds=;
        b=RFSZefPSsv/st0uW2v02r18F8RGvmUxmHd9X9vhAwnij3vSmz1TMx581PB3k9kG6AF
         WgMRZxP4TAVoxYpmxBY0QxFWVh7uj1gcsjIFnvmGUoOHV3Acdz5n/uvUAnM6eYjvPhZg
         0GjXexdxxBh/54fzBbPrK/ZmjAilJMxr8Jw7jlPXvGwjNa5rjTGzxjfmwIn4Wubg8nlq
         eXWoiwkEYse0aRFt8ZA/Sni5P48L1CgNI5rq8Zg117ZVWO8v0soUACOP0UsWqJvfweyv
         1jzaftSwg6wy0Ya8HkzwX5kI4JHB+E9fz2MYeANnNCJ3UAEdTe9vHA924MccrEcw2fcP
         C2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712778539; x=1713383339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWCShh/bRGRzeO22yeBjtZLPhJ0/AGFCyE+KkcrS+ds=;
        b=NhYHXwBJJqblRpTsTc1FuSXO0pdpgbHV4kqL6ETSCseS5/EnI/LKqhqgYad2Tqbyve
         YGQDcSmuAZNuPATTR279DoZZAGgtuBKkj8zuflBW95MGP5L0hN4Q/AO7GmBltqAiePTh
         G2eDofYjntjXqbYiPFKSG3JpvDU+7xjHH1wfm1I2/0cKaVAqPvGYWU3QmyIzf/D/eu53
         3IJv4kEzGaW4PdhmE77arqPazzgCkI1VqUPWdwF2lx7EAJ1FtdaIAVU5QJEWyst1E25h
         ol5NMu6vYTnjTWVwOMV7OlsEiCom9DwD6NzX/fM55a4SPRTLDH/uCipx7XJHFFSO87hF
         SDew==
X-Forwarded-Encrypted: i=1; AJvYcCUJKslTkblRkS6cI6xaDQhs00zHMZzQUg9PFyJXcRJ0S+IJSu5s2SlYMOLCpa/jTvMa/WA58Q2wmmPktp4YqHSWnRNU/TQ9rK91tuAdt0Lk
X-Gm-Message-State: AOJu0YwqL/hB22/Mv3kT7WTAlqz2BABXfpaW6xk8h/FSyJ7Lp/ftNugq
	mhSyIFyP2UweCvN5VVY5NHczOVZUdPN6dROvUOI5HCLR8FGSUuv32MugkPLGFgvvvs53eEGkDc/
	/FOqrG7hwYN6DwylnsQgLSQtOitR3r6jMNPef
X-Google-Smtp-Source: AGHT+IGa6MOnKjfghS1aRAZ4F4MxrT/E1DKiGKtukJn/QsQjBmlT/f6kggLbge9jt3UM+LRGc/z5WVALVplB0eqXhqc=
X-Received: by 2002:a05:622a:5c13:b0:434:61ad:8c1b with SMTP id
 gd19-20020a05622a5c1300b0043461ad8c1bmr55230qtb.28.1712778539135; Wed, 10 Apr
 2024 12:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240410182618.169042-2-noah@noahloomans.com>
In-Reply-To: <20240410182618.169042-2-noah@noahloomans.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 10 Apr 2024 12:48:46 -0700
Message-ID: <CABXOdTe02ALsv6sghnhWMkn7-7kidXhjvWzpDn7dGh4zKEkO8g@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: properly fix race condition
To: Noah Loomans <noah@noahloomans.com>
Cc: Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Robert Zieba <robertzieba@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 11:29=E2=80=AFAM Noah Loomans <noah@noahloomans.com=
> wrote:
>
> The cros_ec_uart_probe() function calls devm_serdev_device_open() before
> it calls serdev_device_set_client_ops(). This can trigger a NULL pointer
> dereference:
>
>     BUG: kernel NULL pointer dereference, address: 0000000000000000
>     ...
>     CPU: 5 PID: 103 Comm: kworker/u16:3 Not tainted 6.8.4-zen1-1-zen #1 4=
a88f2661038c2a3bb69aa70fb41a5735338823c
>     Hardware name: Google Morphius/Morphius, BIOS MrChromebox-4.22.2-1-g2=
a93624aebf 01/22/2024
>     Workqueue: events_unbound flush_to_ldisc
>     RIP: 0010:ttyport_receive_buf+0x3f/0xf0
>     ...
>     Call Trace:
>      <TASK>
>      ? __die+0x10f/0x120
>      ? page_fault_oops+0x171/0x4e0
>      ? srso_return_thunk+0x5/0x5f
>      ? exc_page_fault+0x7f/0x180
>      ? asm_exc_page_fault+0x26/0x30
>      ? ttyport_receive_buf+0x3f/0xf0
>      flush_to_ldisc+0x9b/0x1c0
>      process_one_work+0x17b/0x340
>      worker_thread+0x301/0x490
>      ? __pfx_worker_thread+0x10/0x10
>      kthread+0xe8/0x120
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x34/0x50
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1b/0x30
>      </TASK>
>
> A simplified version of crashing code is as follows:
>
>     static inline size_t serdev_controller_receive_buf(struct serdev_cont=
roller *ctrl,
>                                                       const u8 *data,
>                                                       size_t count)
>     {
>             struct serdev_device *serdev =3D ctrl->serdev;
>
>             if (!serdev || !serdev->ops->receive_buf) // CRASH!
>                 return 0;
>
>             return serdev->ops->receive_buf(serdev, data, count);
>     }
>
>     static size_t ttyport_receive_buf(struct tty_port *port, const u8 *cp=
,
>                                       const u8 *fp, size_t count)
>     {
>             struct serdev_controller *ctrl =3D port->client_data;
>             [...]
>
>             if (!test_bit(SERPORT_ACTIVE, &serport->flags))
>                     return 0;
>
>             ret =3D serdev_controller_receive_buf(ctrl, cp, count);
>
>             [...]
>             return ret;
>     }
>
> It assumes that if SERPORT_ACTIVE is set and serdev exists, serdev->ops
> will also exist. This conflicts with the existing cros_ec_uart_probe()
> logic, as it first calls devm_serdev_device_open() (which sets
> SERPORT_ACTIVE), and only later sets serdev->ops via
> serdev_device_set_client_ops().
>
> Commit 01f95d42b8f4 ("platform/chrome: cros_ec_uart: fix race
> condition") attempted to fix a similar race condition, but while doing
> so, made the window of error for this race condition to happen much
> wider.
>
> Attempt to fix the race condition again, making sure we fully setup
> before calling devm_serdev_device_open().
>
> Fixes: 01f95d42b8f4 ("platform/chrome: cros_ec_uart: fix race condition")
> Cc: stable@vger.kernel.org
> Signed-off-by: Noah Loomans <noah@noahloomans.com>
> ---
>
> This is my first time contributing to Linux, I hope this is a good
> patch. Feedback on how to improve is welcome!
>

The commit message is a bit long, but the patch itself looks good to me.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

Guenter

>  drivers/platform/chrome/cros_ec_uart.c | 28 +++++++++++++-------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/ch=
rome/cros_ec_uart.c
> index 8ea867c2a01a..62bc24f6dcc7 100644
> --- a/drivers/platform/chrome/cros_ec_uart.c
> +++ b/drivers/platform/chrome/cros_ec_uart.c
> @@ -263,12 +263,6 @@ static int cros_ec_uart_probe(struct serdev_device *=
serdev)
>         if (!ec_dev)
>                 return -ENOMEM;
>
> -       ret =3D devm_serdev_device_open(dev, serdev);
> -       if (ret) {
> -               dev_err(dev, "Unable to open UART device");
> -               return ret;
> -       }
> -
>         serdev_device_set_drvdata(serdev, ec_dev);
>         init_waitqueue_head(&ec_uart->response.wait_queue);
>
> @@ -280,14 +274,6 @@ static int cros_ec_uart_probe(struct serdev_device *=
serdev)
>                 return ret;
>         }
>
> -       ret =3D serdev_device_set_baudrate(serdev, ec_uart->baudrate);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set up host baud rate (%d)", ret)=
;
> -               return ret;
> -       }
> -
> -       serdev_device_set_flow_control(serdev, ec_uart->flowcontrol);
> -
>         /* Initialize ec_dev for cros_ec  */
>         ec_dev->phys_name =3D dev_name(dev);
>         ec_dev->dev =3D dev;
> @@ -301,6 +287,20 @@ static int cros_ec_uart_probe(struct serdev_device *=
serdev)
>
>         serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
>
> +       ret =3D devm_serdev_device_open(dev, serdev);
> +       if (ret) {
> +               dev_err(dev, "Unable to open UART device");
> +               return ret;
> +       }
> +
> +       ret =3D serdev_device_set_baudrate(serdev, ec_uart->baudrate);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to set up host baud rate (%d)", ret)=
;
> +               return ret;
> +       }
> +
> +       serdev_device_set_flow_control(serdev, ec_uart->flowcontrol);
> +
>         return cros_ec_register(ec_dev);
>  }
>
> --
> 2.44.0
>
