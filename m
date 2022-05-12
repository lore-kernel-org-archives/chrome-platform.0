Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9833C2
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 15:11:29 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id i19so10814782eja.11
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0AwmGRZiz5OBa3h7F2JloJbsspAv/u88JHvx56Jj1Qw=;
        b=eSsQw/2koso7HKgPGY+qaB5sAH4bsxeOrb4Hiypsv/qbj9Yua5XDR0oXLO8kLzOwii
         oUFZjt8YDj0Y3S1sTOy9xJwK1yGNmdTBm1o84VgSlmii1GealU4f9wgfZm5hT6docTaM
         F1/QpgsCsWfR5K4dv0xDPRp82d2GhBTzCX+VhI2YVgLtFY4Gkpq34HTZyniCs2rBNPaf
         kjCHxe9F/12Qom2jDIcpUc8u+84s1MbkBVgaxuULnkWwxdXFqR+iCjy8Wa0JwCYkfADw
         jo9lbaqw/yRvIZbeghEq9MkMx/IZ/8VPKszrxp2zJ4iMDuTVoYkZW5CFiOAXl91Y7uvH
         AtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0AwmGRZiz5OBa3h7F2JloJbsspAv/u88JHvx56Jj1Qw=;
        b=mfjo6Y/y8P1wRCDbahmAxXztFkNkJqFLz1gu7eSjhRhAsVh7phIhfvaMvctzZZetng
         l6HOZKHLFeDabcn80vYQdLWt84TbposEzCaSDQy/SjHS9xzQzEGWBO2H29znP5H4DcYs
         VdjfdjlsGw/jf8MvlFX+ycPyylZ9OhNhA4b8TgaoJPFfOg1xxAxoHyygHJQqfo2VXmid
         SsQPWRRK5snXWtfP7V7kQX6UAYXtb9se7+TpRwjla91CldM+A3RFM7d4NGJIl0iecuR/
         fdENY//Jld5Mw7mb0MKp6KQ9soanPYCo8WWrmp7LY0/zKg8t2auGNljSivhPSVyxF3a4
         RkIg==
X-Gm-Message-State: AOAM532wAYSDb4U7xtztSiLafYB6UKBcRVLxY4aN5bY/NY6H2SMA8+bY
	sYMOzkQhbaV6ULQq5FGlmf6D3IFSXKF8iXH7EfwdYg==
X-Google-Smtp-Source: ABdhPJz2dDA+OPU/KX/Q+/9cZuuZabKhHqEim53rurCejKAXVoPdzgRMBPGG81WG8lgIKAv/XGbRxv7cltM+5BmnP+U=
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr310876ejc.631.1652368287563; Thu, 12
 May 2022 08:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512083627.885338-1-tzungbi@kernel.org> <20220512083627.885338-3-tzungbi@kernel.org>
In-Reply-To: <20220512083627.885338-3-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 May 2022 08:11:16 -0700
Message-ID: <CABXOdTeZCo-dL8k=1VaGfTycj==USab+hQFvmnyT3uyXkAfOQw@mail.gmail.com>
Subject: Re: [PATCH 2/6] platform/chrome: correct cros_ec_prepare_tx() usage
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_prepare_tx() returns either:
> - >= 0 for number of prepared bytes.
> - < 0 for -errno.
>
> Correct the comment and make sure all callers check the return code.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Makes sense in the context of the next patch.

Reviewed-by: Guenter Roeck <groeck@chromim.org>

> ---
>  drivers/platform/chrome/cros_ec_i2c.c   | 2 ++
>  drivers/platform/chrome/cros_ec_ishtp.c | 4 +++-
>  drivers/platform/chrome/cros_ec_lpc.c   | 2 ++
>  drivers/platform/chrome/cros_ec_proto.c | 2 +-
>  drivers/platform/chrome/cros_ec_rpmsg.c | 2 ++
>  drivers/platform/chrome/cros_ec_spi.c   | 4 ++++
>  6 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
> index 22feb0fd4ce7..a4f305f1eb0e 100644
> --- a/drivers/platform/chrome/cros_ec_i2c.c
> +++ b/drivers/platform/chrome/cros_ec_i2c.c
> @@ -89,6 +89,8 @@ static int cros_ec_pkt_xfer_i2c(struct cros_ec_device *ec_dev,
>
>         ec_dev->dout++;
>         ret = cros_ec_prepare_tx(ec_dev, msg);
> +       if (ret < 0)
> +               goto done;
>         ec_dev->dout--;
>
>         /* send command to EC and read answer */
> diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
> index 4020b8354bae..cb2031cf7106 100644
> --- a/drivers/platform/chrome/cros_ec_ishtp.c
> +++ b/drivers/platform/chrome/cros_ec_ishtp.c
> @@ -521,7 +521,9 @@ static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
>         out_msg->hdr.status = 0;
>
>         ec_dev->dout += OUT_MSG_EC_REQUEST_PREAMBLE;
> -       cros_ec_prepare_tx(ec_dev, msg);
> +       rv = cros_ec_prepare_tx(ec_dev, msg);
> +       if (rv < 0)
> +               goto end_error;
>         ec_dev->dout -= OUT_MSG_EC_REQUEST_PREAMBLE;
>
>         dev_dbg(dev,
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 8eeef85a96b1..7677ab3c0ead 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -147,6 +147,8 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
>         u8 *dout;
>
>         ret = cros_ec_prepare_tx(ec, msg);
> +       if (ret < 0)
> +               goto done;
>
>         /* Write buffer */
>         cros_ec_lpc_ops.write(EC_LPC_ADDR_HOST_PACKET, ret, ec->dout);
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index db1c8ba43171..2d6d3fbfa905 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -164,7 +164,7 @@ static int send_command(struct cros_ec_device *ec_dev,
>   * only SPI uses it. Once LPC uses the same protocol it can start using it.
>   * I2C could use it now, with a refactor of the existing code.
>   *
> - * Return: 0 on success or negative error code.
> + * Return: number of prepared bytes on success or negative error code.
>   */
>  int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>                        struct cros_ec_command *msg)
> diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
> index d96d15b8ca94..39d3b50a7c09 100644
> --- a/drivers/platform/chrome/cros_ec_rpmsg.c
> +++ b/drivers/platform/chrome/cros_ec_rpmsg.c
> @@ -89,6 +89,8 @@ static int cros_ec_pkt_xfer_rpmsg(struct cros_ec_device *ec_dev,
>
>         ec_msg->result = 0;
>         len = cros_ec_prepare_tx(ec_dev, ec_msg);
> +       if (len < 0)
> +               return len;
>         dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
>
>         reinit_completion(&ec_rpmsg->xfer_ack);
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 8493af0f680e..589f18e9537d 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -401,6 +401,8 @@ static int do_cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
>         unsigned long delay;
>
>         len = cros_ec_prepare_tx(ec_dev, ec_msg);
> +       if (len < 0)
> +               return len;
>         dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
>
>         /* If it's too soon to do another transaction, wait */
> @@ -544,6 +546,8 @@ static int do_cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
>         unsigned long delay;
>
>         len = cros_ec_prepare_tx(ec_dev, ec_msg);
> +       if (len < 0)
> +               return len;
>         dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
>
>         /* If it's too soon to do another transaction, wait */
> --
> 2.36.0.512.ge40c2bad7a-goog
>
