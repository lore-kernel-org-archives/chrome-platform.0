Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34457E
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 16:31:34 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id kq17so4895186ejb.4
        for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r1oLO7O64SDRDNcmae9yhgZmG0/o3ZbaE07wdLh2WFQ=;
        b=d3ftFDSE2RnvF12jRgGG+txqJyBd/ppy2FzGUzh8ZdS5XsqYp41rNlyyk0uGlh1kG8
         8+ipFezXKpEJqt0FbB9RD9nE01cndrmo9l3Z4xO6xhaHoNPhZ6+lHIAAQONJBRnL0XGz
         jAlRAlMGYgQyvsL7A4D0ExDfDOr4R8T/uMR/R0uZE/X2XsQh4ILJ6XhT11Ve/GNdcrry
         64MapQem4AuA/rXiRqKblOHsX6Odiz6FjT1AJCslR14QCpdbWGfEfAOFsxcs+rOFpitC
         uFaSkhgLaE57WMDFBIZHHtJGWCeC5mkKS40RjuiB9x2QpvERtyH1dY6/MuK2JQcqq0sN
         CGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r1oLO7O64SDRDNcmae9yhgZmG0/o3ZbaE07wdLh2WFQ=;
        b=JqLUMme+boTlnktgH3JpMa0ybNlkLrw+5FjNKged5OThPwawZdWPXNxOCFUNy/f8/q
         zd1gs1heGJdstJ4LfJQDp/pvas40vX1eofQ/cbqr3wfZnZ7MEv9WHY/y2+y97TZ6jM93
         3QvLchlGIDjFRT6hwLOmZNBVbiYCa3ZxqsH3ROoX7yMJjer4s7dDzMoyXvfi91321hU+
         Lp9keHVbAyJZzqV2zQm1Zhe/iNt0pmm4LIUgQpxufUyW6KvWRfQDhqQ0yALGokXgpPko
         kd1cYJYmDBH5gRv+SqHWSvFqfmcGxvDx35wzdYkNqaLc7a//Gxz7Nl7P35wlBDyhRmwL
         kFUQ==
X-Gm-Message-State: AOAM533vRR4RJVtMQQGWa0Szy5LiOdcasrs8vK0lHI+iKn6K4INffTfS
	2bDqNJcNUI7tYOG+lITyDZKZLTaBMpL8D/ywVAZqhA==
X-Google-Smtp-Source: ABdhPJxeTSwGbl7FGSVnCs22tbEzqpLymMjcjO0LZv2ZWelzkkszQjknqK4mMIFHEeBmZVCFBtcARPNbd052uiFrKNw=
X-Received: by 2002:a17:907:6ea2:b0:6fe:6da9:5d2a with SMTP id
 sh34-20020a1709076ea200b006fe6da95d2amr377345ejc.189.1652891492792; Wed, 18
 May 2022 09:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220518091814.2028579-1-tzungbi@kernel.org> <20220518091814.2028579-5-tzungbi@kernel.org>
In-Reply-To: <20220518091814.2028579-5-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 18 May 2022 09:31:21 -0700
Message-ID: <CABXOdTdUtP+7CLHfpUh+zJ7ho+MduEiMYRtMK5JNnzaY8bCWdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_check_result()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, 
	Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 2:18 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_check_result() is used to check if the EC communication success but
> EC responded EC_RES_IN_PROGRESS.  It should return 0 even if EC wasn't
> happy about the host command.
>
> Add Kunit tests for cros_ec_check_result().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 41 ++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 61abb18ac00b..25c4fca5c165 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -132,6 +132,46 @@ static void cros_ec_proto_test_prepare_tx_bad_msg_outsize(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, ret, -EINVAL);
>  }
>
> +static void cros_ec_proto_test_check_result(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct cros_ec_command *msg = priv->msg;
> +       int ret, i;
> +       static enum ec_status status[] = {
> +               EC_RES_SUCCESS,
> +               EC_RES_INVALID_COMMAND,
> +               EC_RES_ERROR,
> +               EC_RES_INVALID_PARAM,
> +               EC_RES_ACCESS_DENIED,
> +               EC_RES_INVALID_RESPONSE,
> +               EC_RES_INVALID_VERSION,
> +               EC_RES_INVALID_CHECKSUM,
> +               EC_RES_UNAVAILABLE,
> +               EC_RES_TIMEOUT,
> +               EC_RES_OVERFLOW,
> +               EC_RES_INVALID_HEADER,
> +               EC_RES_REQUEST_TRUNCATED,
> +               EC_RES_RESPONSE_TOO_BIG,
> +               EC_RES_BUS_ERROR,
> +               EC_RES_BUSY,
> +               EC_RES_INVALID_HEADER_VERSION,
> +               EC_RES_INVALID_HEADER_CRC,
> +               EC_RES_INVALID_DATA_CRC,
> +               EC_RES_DUP_UNAVAILABLE,
> +       };
> +
> +       for (i = 0; i < ARRAY_SIZE(status); ++i) {
> +               msg->result = status[i];
> +               ret = cros_ec_check_result(ec_dev, msg);
> +               KUNIT_EXPECT_EQ(test, ret, 0);
> +       }
> +
> +       msg->result = EC_RES_IN_PROGRESS;
> +       ret = cros_ec_check_result(ec_dev, msg);
> +       KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
> +}
> +
>  static int cros_ec_proto_test_init(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv;
> @@ -159,6 +199,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_prepare_tx_legacy_bad_msg_outsize),
>         KUNIT_CASE(cros_ec_proto_test_prepare_tx_normal),
>         KUNIT_CASE(cros_ec_proto_test_prepare_tx_bad_msg_outsize),
> +       KUNIT_CASE(cros_ec_proto_test_check_result),
>         {}
>  };
>
> --
> 2.36.0.550.gb090851708-goog
>
