Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDE28E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 16:17:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u12so29942487eja.8
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tAzwPSe0Ztlxd1XqVYMDYMyDZ1/mepH2mr3JHF5Ji8=;
        b=OTfKsUGbsbJeV39+/nlkujt9ehBA9RXJ2USQ0kZ3I/uqrz6V6SpnjcXFF76649atqL
         cc0S7Acb5CV5bs8vAuXkRmhlYOKk8QBEisztUU0jZ97Val0n0J8+hYEveuYGduR4aVn6
         V+LzB10u/zEa78Z2k4XpqdFwALYt/Yi3MTwEBl9Xq4pdInHJaOQBq0pIe4SpPMez91Fh
         1pnnizQcIo+WN+lIEWaDPoPsAgPDUsRejiV9td+TL2pZ0GxIy3B9yFIp3a+LQ9dW6ANk
         QmDugrmq0SMAI6pp/M1byDvisA3plW1fDvGy6Vlai94Y7HyHSknz3lG7FdGTbhU+00Zp
         WdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tAzwPSe0Ztlxd1XqVYMDYMyDZ1/mepH2mr3JHF5Ji8=;
        b=gMyvZWlNSej+lV/t57Adjrz6YqUSxs41jXQLTo/4edQYfy28VIZSEvHKR3AcYW/KQF
         J7AZHedewnP2M9l2euLBnf5E+nWFh46682+1AajREp1pMMqx5Q3n0GbLmC07FjUvTAEC
         WLOBRCdxhytNtfbgBvPeDRAfj5UsIdnjVif46T3exZmasHmRvRYUr7mTyjdfL09ow64D
         BybNgD89PfZaY+r0Pi4iIMpda99beGfUb4zyVJUt5a+2+q1Lce9Fp9jzG+ZvEDSiyWbm
         r7Z+T8NKOAXyw9qEZxQsKf+VwRdR/4qT1v0yrCXBkBi7Z1BQZpcLn8cUr1C02AXgrIwK
         xmkg==
X-Gm-Message-State: AOAM530vxlGT5kCfcrXuQI9LKYmGWfHfNyfgEUbtHOLuJrOMvUZRKjjL
	huExf7De+nTl07ab6+E18E096hVG2+He0DN43Cmg+RwYbprmhA==
X-Google-Smtp-Source: ABdhPJz3/J0M2Qr1PRrc3I8fIyptWURl/dc9cFFDruwiysSJtFHCKZ0cXPj+xmBN1OnJjteQBkDP0YYqG0GoAHP9HSI=
X-Received: by 2002:a17:906:4d50:b0:70d:afd4:1e63 with SMTP id
 b16-20020a1709064d5000b0070dafd41e63mr17709889ejv.618.1654532224225; Mon, 06
 Jun 2022 09:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-12-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-12-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 09:16:53 -0700
Message-ID: <CABXOdTe+cZ9ouzjqNKGp5TmCrbfFH9hmpnmbBOGoCv3a1VCBhQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] platform/chrome: cros_ec_proto: fix
 get_host_command_version_mask() returns
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> `mask` of get_host_command_version_mask() is valid only if it returns
> positive number (i.e. sizeof(struct ec_response_get_cmd_versions)).
>
> - Remove the unneeded `ver_mask` initialization.
>
> - Update callers of get_host_command_version_mask() for checking correct
>   return values.
>

I think it would be better to have the function return a negative
error value instead of 0 if returning 0 is indeed an error. I also
wonder if the caller ever uses a return value > 0, or if the function
should just return 0 if there was no error.

Thanks,
Guenter

> - Add a Kunit test: `ver_mask` has some garbage bytes from
>   previous EC_CMD_GET_NEXT_EVENT but there is no host sleep.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c      |   8 +-
>  drivers/platform/chrome/cros_ec_proto_test.c | 109 +++++++++++++++++++
>  2 files changed, 113 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 07b57ea105b6..91c945c9911f 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -409,7 +409,7 @@ static int fill_protocol_info_legacy(struct cros_ec_device *ec_dev)
>   * @cmd: command to get the version of.
>   * @mask: result when function returns 0.
>   *
> - * @return 0 on success, error code otherwise
> + * @return >0 on success, error code otherwise
>   *
>   * LOCKING:
>   * the caller has ec_dev->lock mutex or the caller knows there is
> @@ -454,7 +454,7 @@ static int get_host_command_version_mask(struct cros_ec_device *ec_dev, u16 cmd,
>  int cros_ec_query_all(struct cros_ec_device *ec_dev)
>  {
>         struct device *dev = ec_dev->dev;
> -       u32 ver_mask = 0;
> +       u32 ver_mask;
>         int ret;
>
>         /* First try sending with proto v3. */
> @@ -486,7 +486,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>
>         /* Probe if MKBP event is supported */
>         ret = get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
> -       if (ret < 0 || ver_mask == 0) {
> +       if (ret <= 0 || ver_mask == 0) {
>                 ec_dev->mkbp_event_supported = 0;
>         } else {
>                 ec_dev->mkbp_event_supported = fls(ver_mask);
> @@ -495,7 +495,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>
>         /* Probe if host sleep v1 is supported for S0ix failure detection. */
>         ret = get_host_command_version_mask(ec_dev, EC_CMD_HOST_SLEEP_EVENT, &ver_mask);
> -       ec_dev->host_sleep_v1 = (ret >= 0 && (ver_mask & EC_VER_MASK(1)));
> +       ec_dev->host_sleep_v1 = (ret > 0 && (ver_mask & EC_VER_MASK(1)));
>
>         /* Get host event wake mask. */
>         ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index e2c369765612..7d73aeb99d1d 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -760,6 +760,114 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_no_host_sleep2(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->host_sleep_v1 = true;
> +
> +       /* For fill_protocol_info() without passthru. */
> +       {
> +               struct ec_response_get_protocol_info *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               /*
> +                * Although it doesn't check the value, provides valid sizes so that
> +                * cros_ec_query_all() allocates din and dout correctly.
> +                */
> +               data = (struct ec_response_get_protocol_info *)mock->o_data;
> +               data->max_request_packet_size = 0xbe;
> +               data->max_response_packet_size = 0xef;
> +       }
> +
> +       /* For fill_protocol_info() with passthru. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND,
> +                                                   sizeof(struct ec_response_get_protocol_info));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For get_host_command_version_mask() for MKBP. */
> +       {
> +               struct ec_response_get_cmd_versions *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               /* In order to pollute next get_host_command_version_mask(). */
> +               data = (struct ec_response_get_cmd_versions *)mock->o_data;
> +               data->version_mask = 0xbeef;
> +       }
> +
> +       /* For get_host_command_version_mask() for host sleep v1. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       cros_ec_proto_test_query_all_pretest(test);
> +       ret = cros_ec_query_all(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       /* For fill_protocol_info() without passthru. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_PROTOCOL_INFO);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize,
> +                               sizeof(struct ec_response_get_protocol_info));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> +       }
> +
> +       /* For fill_protocol_info() with passthru. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command,
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize,
> +                               sizeof(struct ec_response_get_protocol_info));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> +       }
> +
> +       /* For get_host_command_version_mask() for MKBP. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_CMD_VERSIONS);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize,
> +                               sizeof(struct ec_response_get_cmd_versions));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
> +       }
> +
> +       /* For get_host_command_version_mask() for host sleep v1. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_CMD_VERSIONS);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize,
> +                               sizeof(struct ec_response_get_cmd_versions));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
> +
> +               KUNIT_EXPECT_FALSE(test, ec_dev->host_sleep_v1);
> +       }
> +}
> +
>  static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -941,6 +1049,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp2),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep2),
>         KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask),
>         {}
>  };
> --
> 2.36.1.255.ge46751e96f-goog
>
