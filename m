Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11F7A
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 16:36:05 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id n28so16987211edb.9
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxdG4nvp1mL9v47CQ0n2NZ6jB4BK+F4ml55XmGZjxlc=;
        b=aW4eUYpoym+2aS3zwn0yIvdinvpv4nBYcZa0yWHIXMRk4htHFwFuUN587n4WBK2GKW
         t+9ekXMwJeoX4f95TduKbtGnuc2xGVwBdQkMLjR1J35sgCXFVVE73zSmJRWb9d8kWOql
         PaZMGFJZrM4k969lkherPxF/u7g+8v4SetpwtSjEk6sQ1ePpVrFj9VhPlKfafru3gDd7
         WWWrEzKhx7k48t+rlVfiXJnN+OaC91gwGLo81ccyObTXtA37ihTzM6eZmtuvoDCgXq4b
         yRk9wKlfxrc7VSdIyA07IAVog1rX8Lp+HSVGtYYOtGtoyeVvt7zFO6so6moGuHeFvFVb
         8Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxdG4nvp1mL9v47CQ0n2NZ6jB4BK+F4ml55XmGZjxlc=;
        b=Jfg8UpmdSwUFYr5UTriCrUAWP8ZjIsb2LzASAeEN1WrVLHGdMumwx21zsQ78HB3tC/
         P6x9ZI+e4LMnrFSkvBGNDkbtOpg3Goc5a05dnCmyZZ1P9EHicRpK12O7WRcFUyC1y497
         wX3f8F+kmf7ju5oDFFZAlQkASdW++Duo2W+WNkHTvvMpa3+BeSdO7i1BPoZXj4se30s8
         ori2qJaRg+zmFX+KBy/I0/hXfuTZGNtUwD6Kn1WE6DK6go1wZdj8rhiKXbgcOP2zS9ya
         cH3HczFPUh/Nh+SGiW+g8aqI/oF02KHsV8n3NXGpOrIRawo5c1wLs22duzrDG/pefqj7
         4aMQ==
X-Gm-Message-State: AJIora+ni6wdZel+kRMB1abZXpbFJsrF6hQY9BvSKHw0z26jEltI4Mlo
	VgKoOk3hWuIBYrkwbMltiM2vjWPuG1DKErpox/JZ/A==
X-Google-Smtp-Source: AGRyM1sSYb0g1SC7WPMPbaMd7Nx3KmcIHuYDPLUx8zbSDMp27tkyaiNWX33VSGMY//qWrGXFwyjTzYyBdUa05Dnk5Nk=
X-Received: by 2002:a05:6402:f14:b0:42d:f989:4a21 with SMTP id
 i20-20020a0564020f1400b0042df9894a21mr783793eda.168.1655310963717; Wed, 15
 Jun 2022 09:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220615051248.1628156-1-tzungbi@kernel.org> <20220615051248.1628156-5-tzungbi@kernel.org>
In-Reply-To: <20220615051248.1628156-5-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 15 Jun 2022 09:35:52 -0700
Message-ID: <CABXOdTcnB8cQgWOLm5tTxzoUxAZ2Q5=nv0xirtNNOBf5th2Zyg@mail.gmail.com>
Subject: Re: [PATCH 04/11] platform/chrome: cros_ec_proto: separate cros_ec_xfer_command()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 14, 2022 at 10:13 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_send_command() has extra logic to handle EC_RES_IN_PROGRESS.
> Separate the command transfer part into cros_ec_xfer_command() so
> that other functions can re-use it.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index b02fd1414e52..0cec013be3d3 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -107,7 +107,7 @@ static int prepare_tx_legacy(struct cros_ec_device *ec_dev,
>         return EC_MSG_TX_PROTO_BYTES + msg->outsize;
>  }
>
> -static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> +static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>  {
>         int ret;
>         int (*xfer_fxn)(struct cros_ec_device *ec, struct cros_ec_command *msg);
> @@ -123,14 +123,21 @@ static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_co
>                  * the EC is trying to use protocol v2, on an underlying
>                  * communication mechanism that does not support v2.
>                  */
> -               dev_err_once(ec_dev->dev,
> -                            "missing EC transfer API, cannot send command\n");
> +               dev_err_once(ec_dev->dev, "missing EC transfer API, cannot send command\n");
>                 return -EIO;
>         }
>
>         trace_cros_ec_request_start(msg);
>         ret = (*xfer_fxn)(ec_dev, msg);
>         trace_cros_ec_request_done(msg, ret);
> +
> +       return ret;
> +}
> +
> +static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> +{
> +       int ret = cros_ec_xfer_command(ec_dev, msg);
> +
>         if (msg->result == EC_RES_IN_PROGRESS) {
>                 int i;
>                 struct cros_ec_command *status_msg;
> --
> 2.36.1.476.g0c4daa206d-goog
>
