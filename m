Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731643F8
	for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 16:37:08 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z7so29320027edm.13
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IzrLxDpEBSWeooyKGwQ+hzBdc/h09H6UYXx0nMqWJH0=;
        b=DfzUZzFWpDuUns+JvgHrc0XwVd1yNntKXiNmtX6RtXgU4We7pxItOhoADnR+8GkFbw
         bUAJuYUThK4+Ak6oGmxRHP1uM5Hmo5D/GjQNfuqRwXGH30WUVKeFMQ0y46GU4o6qFwB4
         /jub9DQw1HZhhy7GULlsoyqsixD9lRftjXgoz3MeBFySfzxfWllfYD+MVqb+6fn/APBe
         HB6Ncp5E1RSvMM4ChDPQ3YTbKh53VcAbeLXj27J7itakJeSuLWB+MWYY9XwzYk9iVpBh
         sGzK7lFcspWcvPUF2Et+yEVpAOSCIjOgajranJZn/yKWC/9Jk1MVJrqoT8202Yb2MeeM
         hTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzrLxDpEBSWeooyKGwQ+hzBdc/h09H6UYXx0nMqWJH0=;
        b=LJEGOWcAyzWuWEOBWbszugEcaoLDq50z3LF+P6tr+u1TCS8DDiwkU1pCMdddoshkGx
         5p+WiVmeqItGeQ9mMhLFQJ4DvI01/BDBuO7GAeWXdSdB+N11i28uqQQlwTUbsl5aBHIv
         W443YP0wI4yqrlZARLLhGWb4FhtkwvTPGnNKXur0Ggz6RLDAfcQiccCXN8a9fZR5tZFy
         HkBXBO2+4LTKDQMt2TTN9bpzt4Ztu70y9LCGTtaS1FzYDtnE+cwbDQkBfeoVJye+XLtu
         4fv1Jf0O3eW89bfKP0Qzyb/OxlXtQyx7NHVMVlC5VmulGGDMeJo3pUkEPS1psxnHN480
         Q/Lg==
X-Gm-Message-State: AJIora8uyS0MS9qex33zmUTeLlC6aJXXEVAWDBSIp8VVipd88DEivYx7
	xweiBBQDnTr/yRxm07ukr7/yK+uw6ss42RVz9arAOrrN+nSQzXX0
X-Google-Smtp-Source: AGRyM1svggQmC7sw5XFvqlEGsD+NCcmKEbeiYU9YGFcHJdYW4oUjo+c1INRC0jZfmwxuaCBEhRzXJq6Q4VMJoP2pvj0=
X-Received: by 2002:a05:6402:2687:b0:430:328f:e46b with SMTP id
 w7-20020a056402268700b00430328fe46bmr11939484edd.33.1656002227128; Thu, 23
 Jun 2022 09:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220622041040.202737-1-tzungbi@kernel.org> <20220622041040.202737-3-tzungbi@kernel.org>
In-Reply-To: <20220622041040.202737-3-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 23 Jun 2022 09:36:56 -0700
Message-ID: <CABXOdTeeNSwG-79+h4NGQiPjGsBr7hrQ+eijKFzVNTxpw1Eytw@mail.gmail.com>
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_proto: add Kunit test for cros_ec_map_error()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_cmd_xfer_status() is the only exported function that calls
> static function cros_ec_map_error().
>
> Add Kunit test for cros_ec_map_error() through calling
> cros_ec_cmd_xfer_status().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 6464f6101fd3..be3ac77abdf9 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2004,6 +2004,54 @@ static void cros_ec_proto_test_cmd_xfer_status_xfer_error(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, ret, -EPROTO);
>  }
>
> +static void cros_ec_proto_test_cmd_xfer_status_return_error(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret, i;
> +       struct cros_ec_command msg;
> +       static const int map[] = {
> +               [EC_RES_SUCCESS] = 0,
> +               [EC_RES_INVALID_COMMAND] = -EOPNOTSUPP,
> +               [EC_RES_ERROR] = -EIO,
> +               [EC_RES_INVALID_PARAM] = -EINVAL,
> +               [EC_RES_ACCESS_DENIED] = -EACCES,
> +               [EC_RES_INVALID_RESPONSE] = -EPROTO,
> +               [EC_RES_INVALID_VERSION] = -ENOPROTOOPT,
> +               [EC_RES_INVALID_CHECKSUM] = -EBADMSG,
> +               /*
> +                * EC_RES_IN_PROGRESS is special because cros_ec_send_command() has extra logic to
> +                * handle it.  Note that default cros_kunit_ec_xfer_mock_default_ret == 0 thus
> +                * cros_ec_xfer_command() in cros_ec_wait_until_complete() returns 0.  As a result,
> +                * it returns -EPROTO without calling cros_ec_map_error().
> +                */
> +               [EC_RES_IN_PROGRESS] = -EPROTO,
> +               [EC_RES_UNAVAILABLE] = -ENODATA,
> +               [EC_RES_TIMEOUT] = -ETIMEDOUT,
> +               [EC_RES_OVERFLOW] = -EOVERFLOW,
> +               [EC_RES_INVALID_HEADER] = -EBADR,
> +               [EC_RES_REQUEST_TRUNCATED] = -EBADR,
> +               [EC_RES_RESPONSE_TOO_BIG] = -EFBIG,
> +               [EC_RES_BUS_ERROR] = -EFAULT,
> +               [EC_RES_BUSY] = -EBUSY,
> +               [EC_RES_INVALID_HEADER_VERSION] = -EBADMSG,
> +               [EC_RES_INVALID_HEADER_CRC] = -EBADMSG,
> +               [EC_RES_INVALID_DATA_CRC] = -EBADMSG,
> +               [EC_RES_DUP_UNAVAILABLE] = -ENODATA,
> +       };
> +
> +       memset(&msg, 0, sizeof(msg));
> +
> +       for (i = 0; i < ARRAY_SIZE(map); ++i) {
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, i, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               ret = cros_ec_cmd_xfer_status(ec_dev, &msg);
> +               KUNIT_EXPECT_EQ(test, ret, map[i]);
> +       }
> +}
> +
>  static void cros_ec_proto_test_release(struct device *dev)
>  {
>  }
> @@ -2086,6 +2134,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return0),
>         KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_normal),
>         KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_xfer_error),
> +       KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_return_error),
>         {}
>  };
>
> --
> 2.37.0.rc0.104.g0611611a94-goog
>
