Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3D17A
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 16:34:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id v1so24276123ejg.13
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 09:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/x9Jvq5dHmh9cUcCuKN+pT3+uf0i+wFTmORu8d97Fo=;
        b=TWW7VRdLrHKJ1iGN0l0ePcy/m0THG+JXj3S/GhTbGYCso/nw5e5tyv7vFpbHbjsE5v
         tKMQGrsaIOa9PqjeZrVrp6rIPgYD2lPeqsC+RRNCNDqK7qFaK/ZaviVWvt/yYCvtfRf4
         Q+XBCb1UT9EKD+Dnurnfl8JiCGGRL3v9YYhtuZpBle7tkK+be4NYftO5WgVFrYOIrDSO
         UtqZVYgmla9YZQd48ijbDoX1XQdBVghmkZ6fFEwrx9Q9UZ+SYMh0zUmdzJoPSAuJa6xB
         H3owJnermjhwpXm7yH8MC0uGXy6LtlALsFHqDdh+PanY8PULCqkXEaaKeKfFP9UiSaMR
         rixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/x9Jvq5dHmh9cUcCuKN+pT3+uf0i+wFTmORu8d97Fo=;
        b=rzLBtmpqRYXa7lYL9ejRSw8KlEWmg5gX5E0PVnqO5uG2rPdYABOZLDBWOiFOzHCUoK
         Ykw2RHni15KJBFfuNEsOxdfycUGSBF1l2sPa4QhpbdKnYiRUiDXpzSYVmpuH/hFJJnEF
         Dk4LfqskRolMEDA0t+cS3KIh90cVQlfRanJt23mQM+BI9myobfyTVDHb/rLNJ9rd6hDy
         oX5fXHn6fQuUlmBUTDKG/jA9+hYYQVe1KTVc0PRxmgOiR+QzDmK3q2xltnbwLdY7ZBjW
         CxZuZ/BOdkJxrYUdtjXR97KdLzxFzJ0lu6tWC+lolnUTWbyruA56A04oel2GxxX/SGh+
         /rrw==
X-Gm-Message-State: AJIora9W/6Lsm0tgyenPzhigFbi7t8CI/+LU8XUdpCfjswG/90Q1yDfc
	106TZoqNDQka7Js0B1LwEus+A6hB4qyZ4F8zOgHI0w==
X-Google-Smtp-Source: AGRyM1tAqHis1A5Tbkl367ddK/r4jr9DNZifQrUFw3AoCvEF2MjQRPabIQ77VzOdqm1l7Ew0c93LJHDLrnt1+XqmILo=
X-Received: by 2002:a17:906:85cb:b0:70b:ffb4:b0e with SMTP id
 i11-20020a17090685cb00b0070bffb40b0emr546815ejy.533.1655310876651; Wed, 15
 Jun 2022 09:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220615051248.1628156-1-tzungbi@kernel.org> <20220615051248.1628156-2-tzungbi@kernel.org>
In-Reply-To: <20220615051248.1628156-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 15 Jun 2022 09:34:25 -0700
Message-ID: <CABXOdTdrJ9pWvr-Fyt-pvcjiat_NhkWyiNysaofN2ggVO=_k_g@mail.gmail.com>
Subject: Re: [PATCH 01/11] platform/chrome: cros_ec_proto: add "cros_ec_"
 prefix to send_command()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 14, 2022 at 10:13 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> To be neat, add "cros_ec_" prefix to static function send_command().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 6923ea4401e5..b02fd1414e52 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -107,8 +107,7 @@ static int prepare_tx_legacy(struct cros_ec_device *ec_dev,
>         return EC_MSG_TX_PROTO_BYTES + msg->outsize;
>  }
>
> -static int send_command(struct cros_ec_device *ec_dev,
> -                       struct cros_ec_command *msg)
> +static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>  {
>         int ret;
>         int (*xfer_fxn)(struct cros_ec_device *ec, struct cros_ec_command *msg);
> @@ -255,7 +254,7 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
>         msg->command = EC_CMD_HOST_EVENT_GET_WAKE_MASK;
>         msg->insize = sizeof(*r);
>
> -       ret = send_command(ec_dev, msg);
> +       ret = cros_ec_send_command(ec_dev, msg);
>         if (ret < 0)
>                 goto exit;
>
> @@ -295,7 +294,7 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
>         msg->command = EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOCOL_INFO;
>         msg->insize = sizeof(*info);
>
> -       ret = send_command(ec_dev, msg);
> +       ret = cros_ec_send_command(ec_dev, msg);
>         /*
>          * Send command once again when timeout occurred.
>          * Fingerprint MCU (FPMCU) is restarted during system boot which
> @@ -304,7 +303,7 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
>          * attempt because we waited at least EC_MSG_DEADLINE_MS.
>          */
>         if (ret == -ETIMEDOUT)
> -               ret = send_command(ec_dev, msg);
> +               ret = cros_ec_send_command(ec_dev, msg);
>
>         if (ret < 0) {
>                 dev_dbg(ec_dev->dev,
> @@ -376,7 +375,7 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
>         params = (struct ec_params_hello *)msg->data;
>         params->in_data = 0xa0b0c0d0;
>
> -       ret = send_command(ec_dev, msg);
> +       ret = cros_ec_send_command(ec_dev, msg);
>         if (ret < 0) {
>                 dev_dbg(ec_dev->dev, "EC failed to respond to v2 hello: %d\n", ret);
>                 goto exit;
> @@ -453,7 +452,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>         pver = (struct ec_params_get_cmd_versions *)msg->data;
>         pver->cmd = cmd;
>
> -       ret = send_command(ec_dev, msg);
> +       ret = cros_ec_send_command(ec_dev, msg);
>         if (ret < 0)
>                 goto exit;
>
> @@ -634,7 +633,7 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>                 }
>         }
>
> -       ret = send_command(ec_dev, msg);
> +       ret = cros_ec_send_command(ec_dev, msg);
>         mutex_unlock(&ec_dev->lock);
>
>         return ret;
> --
> 2.36.1.476.g0c4daa206d-goog
>
