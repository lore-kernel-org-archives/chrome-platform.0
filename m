Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55517C6
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 14:37:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id u12so35650150eja.8
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydyhVNyupT/Dmeb5n3xMKR56hHFR+NFisItZZ689beA=;
        b=AuyNBdE8++FVn31d8JBsLc1B7kDxwDm6Rxhfo1abI+2SxJFZCzV1CYCnZCqJGE5YxT
         XBUC7f1fTGQUDOdEbZ5kLlI0zrnbnKDpmdFbEY3BFm21eVw9LPxOLp9zTcJIthon+k/k
         CTZKN6RhsYAw9mixbzhj8lR11avFlGnSNwFkL6ONZDwT9KzJVpXzOlaIqygdLAcnXkV7
         TW733W8M55ATeqcxsah6jeV97yK2RtJj6zgn8nXjbAGO2zawA1bN/LrON/BmbfaWFIF0
         yWp6k2g1xJmEBqG1xIZAATd2srf8pFp1pwF2y3zFeyyDbwWBtvwOYFRHnhZ1Wahbvx+9
         92Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydyhVNyupT/Dmeb5n3xMKR56hHFR+NFisItZZ689beA=;
        b=PmubTo2Ggq1jT4kTEo/k6Ya5aMGKPScH9ZaJbxtYsE48zysWQit2drZSjzuPxeIu04
         /DDXr0ajYvMNdke3/Cba7tqe+OldxNmW3MHvEFgGz7tbgMQ4vnPVKU5tlzzgQwBMwR4O
         ajf9z23FAsih5cwp4j8iDDd3ow3egOUtMrH8HxpVDMcfnrp2WHXFkSUp85O0y46+MjU4
         7TuE/92RBSSlvQsNYyyGLruDe3+GG8M90Fq51scPO2Y7urGGGEXssxxGfZ70fWE/2ODC
         aay1znfiMT1pYvRWzAOfeZ0dbpAdbshI/ye0yULNIvZR2t8Od5uKrrM3AFsqRPNBPzmb
         EYCA==
X-Gm-Message-State: AOAM533I8Gb+skPmmNcWvgyJjSKTWVh6RME4+9nIoJAO4HG23IUyYrDR
	rP1YUsX7hYvh69CgGwvrSVV0lRDjBbT8qRDUA8Cplw==
X-Google-Smtp-Source: ABdhPJwSwx5is2iG5pA5nZPbD6j0ERT1QeK+rH99/rZEXuWqA8p7cLVbp7BTk/R2yDqSZOuCnxDp56L7cNALxZKQR78=
X-Received: by 2002:a17:907:1c06:b0:6df:b257:cbb3 with SMTP id
 nc6-20020a1709071c0600b006dfb257cbb3mr26905346ejc.631.1654612666363; Tue, 07
 Jun 2022 07:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606201825.763788-1-pmalani@chromium.org> <20220606201825.763788-2-pmalani@chromium.org>
In-Reply-To: <20220606201825.763788-2-pmalani@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 07:37:34 -0700
Message-ID: <CABXOdTeFQebWvB+7oWvWN_n2YMCvGM==kjxp=D=ZyO1-ypnuRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] regulator: cros-ec: Use common cros_ec_command()
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, Daisuke Nojiri <dnojiri@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 1:19 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Reduce code duplication by using the common cros_ec_command() function
> instead of the locally defined variant.
>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/regulator/cros-ec-regulator.c | 54 ++++++---------------------
>  1 file changed, 12 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
> index c4754f3cf233..1c5fc74a4776 100644
> --- a/drivers/regulator/cros-ec-regulator.c
> +++ b/drivers/regulator/cros-ec-regulator.c
> @@ -22,36 +22,6 @@ struct cros_ec_regulator_data {
>         u16 num_voltages;
>  };
>
> -static int cros_ec_cmd(struct cros_ec_device *ec, u32 version, u32 command,
> -                      void *outdata, u32 outsize, void *indata, u32 insize)
> -{
> -       struct cros_ec_command *msg;
> -       int ret;
> -
> -       msg = kzalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
> -       if (!msg)
> -               return -ENOMEM;
> -
> -       msg->version = version;
> -       msg->command = command;
> -       msg->outsize = outsize;
> -       msg->insize = insize;
> -
> -       if (outdata && outsize > 0)
> -               memcpy(msg->data, outdata, outsize);
> -
> -       ret = cros_ec_cmd_xfer_status(ec, msg);
> -       if (ret < 0)
> -               goto cleanup;
> -
> -       if (insize)
> -               memcpy(indata, msg->data, insize);
> -
> -cleanup:
> -       kfree(msg);
> -       return ret;
> -}
> -
>  static int cros_ec_regulator_enable(struct regulator_dev *dev)
>  {
>         struct cros_ec_regulator_data *data = rdev_get_drvdata(dev);
> @@ -60,8 +30,8 @@ static int cros_ec_regulator_enable(struct regulator_dev *dev)
>                 .enable = 1,
>         };
>
> -       return cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
> -                         sizeof(cmd), NULL, 0);
> +       return cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
> +                              sizeof(cmd), NULL, 0);
>  }
>
>  static int cros_ec_regulator_disable(struct regulator_dev *dev)
> @@ -72,8 +42,8 @@ static int cros_ec_regulator_disable(struct regulator_dev *dev)
>                 .enable = 0,
>         };
>
> -       return cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
> -                         sizeof(cmd), NULL, 0);
> +       return cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
> +                              sizeof(cmd), NULL, 0);
>  }
>
>  static int cros_ec_regulator_is_enabled(struct regulator_dev *dev)
> @@ -85,8 +55,8 @@ static int cros_ec_regulator_is_enabled(struct regulator_dev *dev)
>         struct ec_response_regulator_is_enabled resp;
>         int ret;
>
> -       ret = cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_IS_ENABLED, &cmd,
> -                         sizeof(cmd), &resp, sizeof(resp));
> +       ret = cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_IS_ENABLED, &cmd,
> +                             sizeof(cmd), &resp, sizeof(resp));
>         if (ret < 0)
>                 return ret;
>         return resp.enabled;
> @@ -112,8 +82,8 @@ static int cros_ec_regulator_get_voltage(struct regulator_dev *dev)
>         struct ec_response_regulator_get_voltage resp;
>         int ret;
>
> -       ret = cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_GET_VOLTAGE, &cmd,
> -                         sizeof(cmd), &resp, sizeof(resp));
> +       ret = cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_GET_VOLTAGE, &cmd,
> +                             sizeof(cmd), &resp, sizeof(resp));
>         if (ret < 0)
>                 return ret;
>         return resp.voltage_mv * 1000;
> @@ -138,8 +108,8 @@ static int cros_ec_regulator_set_voltage(struct regulator_dev *dev, int min_uV,
>         if (min_mV > max_mV)
>                 return -EINVAL;
>
> -       return cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_SET_VOLTAGE, &cmd,
> -                          sizeof(cmd), NULL, 0);
> +       return cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_SET_VOLTAGE, &cmd,
> +                              sizeof(cmd), NULL, 0);
>  }
>
>  static const struct regulator_ops cros_ec_regulator_voltage_ops = {
> @@ -160,8 +130,8 @@ static int cros_ec_regulator_init_info(struct device *dev,
>         struct ec_response_regulator_get_info resp;
>         int ret;
>
> -       ret = cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_GET_INFO, &cmd,
> -                          sizeof(cmd), &resp, sizeof(resp));
> +       ret = cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_GET_INFO, &cmd,
> +                             sizeof(cmd), &resp, sizeof(resp));
>         if (ret < 0)
>                 return ret;
>
> --
> 2.36.1.255.ge46751e96f-goog
>
