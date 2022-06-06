Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2228E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 16:06:49 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id m20so29819514ejj.10
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bAtCfvEl1lyvl2HOQAT6IS3UmkYl3/k1QXwg0oM1JYQ=;
        b=XXZmNZW3xMi87QDMR8nEBj1CKuCp+BG4Ywz5D7Ad/P1lIZcmbejl1Eo47KvEdOGLXW
         UbWUrXpiKO25dOeLKAGxUzH4Gkhqqys7KECw6DYJYEuqzlLsleyJqSh6S7eAew673SkA
         EcWAFCuyb29x3uWUz76WqLhALhymAi522ZDYu/jTqzuCVYqYJI7KTlRBwD484sS5tacl
         NaIjXdur74sasRFH41seIp2OKGOlS89GCm5qJKogyo3x0/Mnl4BOhwOjPSdn+vK4ADDz
         oXZsOOGg/nV22dyn1qXHSsRGJp9pllD+35HFTUoZEG4RqvsszywChl1udoYeWkdEDOwQ
         62xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bAtCfvEl1lyvl2HOQAT6IS3UmkYl3/k1QXwg0oM1JYQ=;
        b=LGpUeu3GTVaLJ1L7BnQAq1v/trdvcWzV3dE4Xp/XRbo1GbNP7ucuYYlrNcuV3ozm0W
         SZgH5XvXkI4gdmC+5ERjy70ULu9hCtGZA4p9SI5URd8xrIilKJK4CtForpIGFnUabZga
         XXDiai1KDWtTfsdEUKNoOhreoSRWQBpnBbpjmtCIrHhxTuy9U76Tz+pJesu09htyH5qt
         +P3SigZKqN9nVSIbe9X4XqBfu4Pj8cN6Y6tvZ8vz5fnQh+ved1RaJIx8tNaA0rLcErlR
         o5hc65J/6s978wKLcysIMfiwW/hpFzDk11pf/hlITlvvX5w3aNQxnLW466W4Nhl4H9yd
         lt3g==
X-Gm-Message-State: AOAM530Vj2rtP1FYMMp220INPW2sdJdTbJxi5MhIdaawQSym6+2WGQ77
	jC7XgQsRRNaMSdZcF4JlhACs2sSd8Lu21pODzywZxw==
X-Google-Smtp-Source: ABdhPJwLsxAo6HFC0fU1B+20a98Jl7PbB+opdSJcxqqbXe6miPGwB7qN9YvjJIUX/GtKfZv17X0TUuHIHDlNYYhz5D0=
X-Received: by 2002:a17:907:6ea4:b0:711:d106:b93a with SMTP id
 sh36-20020a1709076ea400b00711d106b93amr4782237ejc.189.1654531606488; Mon, 06
 Jun 2022 09:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-9-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-9-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 09:06:35 -0700
Message-ID: <CABXOdTcJiytvKpQhbka5cLySiM+_aUAS-k0COu+xteaAVKqttQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] platform/chrome: cros_ec_proto: separate fill_protocol_info_legacy()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Rename cros_ec_host_command_proto_query_v2() to
> fill_protocol_info_legacy() and make it responsible for setting `ec_dev`

cros_ec_get_proto_info_legacy() ?

> fields for EC protocol v2.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c      | 72 +++++++++-----------
>  drivers/platform/chrome/cros_ec_proto_test.c |  4 +-
>  2 files changed, 35 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index f57b4dba95b7..abb30a685567 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -344,51 +344,57 @@ static int fill_protocol_info(struct cros_ec_device *ec_dev, int devidx)
>         return ret;
>  }
>
> -static int cros_ec_host_command_proto_query_v2(struct cros_ec_device *ec_dev)
> +static int fill_protocol_info_legacy(struct cros_ec_device *ec_dev)
>  {
>         struct cros_ec_command *msg;
> -       struct ec_params_hello *hello_params;
> -       struct ec_response_hello *hello_response;
> +       struct ec_params_hello *params;
> +       struct ec_response_hello *response;
>         int ret;
> -       int len = max(sizeof(*hello_params), sizeof(*hello_response));
>
> -       msg = kmalloc(sizeof(*msg) + len, GFP_KERNEL);
> +       ec_dev->proto_version = 2;
> +
> +       msg = kzalloc(sizeof(*msg) + max(sizeof(*params), sizeof(*response)), GFP_KERNEL);
>         if (!msg)
>                 return -ENOMEM;
>
> -       msg->version = 0;
>         msg->command = EC_CMD_HELLO;
> -       hello_params = (struct ec_params_hello *)msg->data;
> -       msg->outsize = sizeof(*hello_params);
> -       hello_response = (struct ec_response_hello *)msg->data;
> -       msg->insize = sizeof(*hello_response);
> +       msg->insize = sizeof(*response);
> +       msg->outsize = sizeof(*params);
>
> -       hello_params->in_data = 0xa0b0c0d0;
> +       params = (struct ec_params_hello *)msg->data;
> +       params->in_data = 0xa0b0c0d0;
>
>         ret = send_command(ec_dev, msg);
> -
>         if (ret < 0) {
> -               dev_dbg(ec_dev->dev,
> -                       "EC failed to respond to v2 hello: %d\n",
> -                       ret);
> +               dev_dbg(ec_dev->dev, "EC failed to respond to v2 hello: %d\n", ret);
>                 goto exit;
> -       } else if (msg->result != EC_RES_SUCCESS) {
> -               dev_err(ec_dev->dev,
> -                       "EC responded to v2 hello with error: %d\n",
> -                       msg->result);
> -               ret = msg->result;
> +       }
> +
> +       ret = cros_ec_map_error(msg->result);
> +       if (ret) {
> +               dev_err(ec_dev->dev, "EC responded to v2 hello with error: %d\n", msg->result);
>                 goto exit;
> -       } else if (hello_response->out_data != 0xa1b2c3d4) {
> +       }
> +
> +       response = (struct ec_response_hello *)msg->data;
> +       if (response->out_data != 0xa1b2c3d4) {
>                 dev_err(ec_dev->dev,
>                         "EC responded to v2 hello with bad result: %u\n",
> -                       hello_response->out_data);
> +                       response->out_data);
>                 ret = -EBADMSG;
>                 goto exit;
>         }
>
> -       ret = 0;
> +       ec_dev->max_request = EC_PROTO2_MAX_PARAM_SIZE;
> +       ec_dev->max_response = EC_PROTO2_MAX_PARAM_SIZE;
> +       ec_dev->max_passthru = 0;
> +       ec_dev->pkt_xfer = NULL;
> +       ec_dev->din_size = EC_PROTO2_MSG_BYTES;
> +       ec_dev->dout_size = EC_PROTO2_MSG_BYTES;
>
> - exit:
> +       dev_dbg(ec_dev->dev, "falling back to proto v2\n");
> +       ret = 0;
> +exit:
>         kfree(msg);
>         return ret;
>  }
> @@ -460,20 +466,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                 fill_protocol_info(ec_dev, CROS_EC_DEV_PD_INDEX);
>         } else {
>                 /* Try querying with a v2 hello message. */
> -               ec_dev->proto_version = 2;
> -               ret = cros_ec_host_command_proto_query_v2(ec_dev);
> -
> -               if (ret == 0) {
> -                       /* V2 hello succeeded. */
> -                       dev_dbg(ec_dev->dev, "falling back to proto v2\n");
> -
> -                       ec_dev->max_request = EC_PROTO2_MAX_PARAM_SIZE;
> -                       ec_dev->max_response = EC_PROTO2_MAX_PARAM_SIZE;
> -                       ec_dev->max_passthru = 0;
> -                       ec_dev->pkt_xfer = NULL;
> -                       ec_dev->din_size = EC_PROTO2_MSG_BYTES;
> -                       ec_dev->dout_size = EC_PROTO2_MSG_BYTES;
> -               } else {
> +               ret = fill_protocol_info_legacy(ec_dev);
> +               if (ret) {
>                         /*
>                          * It's possible for a test to occur too early when
>                          * the EC isn't listening. If this happens, we'll
> @@ -481,7 +475,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                          */
>                         ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
>                         dev_dbg(ec_dev->dev, "EC query failed: %d\n", ret);
> -                       goto exit;
> +                       return ret;
>                 }
>         }
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index cdedbdfc1885..79150bf511fb 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -418,7 +418,7 @@ static void cros_ec_proto_test_query_all_legacy_normal(struct kunit *test)
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_host_command_proto_query_v2(). */
> +       /* For fill_protocol_info_legacy(). */
>         {
>                 struct ec_response_hello *data;
>
> @@ -445,7 +445,7 @@ static void cros_ec_proto_test_query_all_legacy_normal(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
>         }
>
> -       /* For cros_ec_host_command_proto_query_v2(). */
> +       /* For fill_protocol_info_legacy(). */
>         {
>                 struct ec_params_hello *data;
>
> --
> 2.36.1.255.ge46751e96f-goog
>
