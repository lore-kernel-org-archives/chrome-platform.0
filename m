Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6497B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:13:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id s12so35213355ejx.3
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJW5PXvVdEwE0T70Irkxa5WekVJL3N0yIkXVXlVvJX4=;
        b=IKdRSGMYjDtk/Ff+Y3vj8CHRQ7xdW1cnj+jYmjGhlEzhCu7xbQWVYCFSKe5ukhgx4o
         1ohsrzszgk5aGZH6fOksVjbiWBnV1PLQ/MyGUtwyNoNO3EkyhbyxT9bHXthQd3odk1dP
         cKZyJDBKrwtY3ePIu5rzEjT0yaF5oYSPS6U1z0Ygdlb/mcpm6SoMGtAGKq0F4n3habhg
         cSE3eFG7EqSPW13DItMzTYonzo91GaXTrTlUV1wKlRxxbBto1Re7J4C6vMr0xuUkYmpE
         eytRz3c1rpRVqZByIfYY3qFekhjYNHh4Pfv0yZ3hSykrJ7tnSIxaQxOWh5+zpaArGU/V
         FLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJW5PXvVdEwE0T70Irkxa5WekVJL3N0yIkXVXlVvJX4=;
        b=pjQYUQwZ+7IWKTZk3Li3SgDUeSlc6Qf+gumUe7qXekFu4TbYLgvqV5TnT6DP2xI4Zg
         H0MuyTiqATOcn7+09dGtgT9AQvTToqR6Lhl6JdfirnSfzQlLW4oHPOYDMpa2uO3EV9Im
         azEBd3BX3nbBxuLdBWl+aJOgg5SY/ti5PMWKvSTjnDKVW8c9veV75R2ETDl6GG+tMTwm
         qAn/nWTSwe+1Ji0M8LMMxdgSfsoBNhvqd7zl8HIDWXrGStCBfnFsA5mIRRk3+27OVco/
         VLP7UZOolB5gnBGo8v8ht0AF/sBFNxjAC0b9YlUlYOOOBJPTp4vWG9YLVvBMpt8InujP
         rIrQ==
X-Gm-Message-State: AOAM530BiNcEcMr7tZqsk15d68vOzcRcPCMEeQnxUr2k9Z/LoEy8Oh5l
	/O3q3jdg3rcoEJMq7jgetL2AybFe334pboBS4iqrBk7zPFS1iZRs
X-Google-Smtp-Source: ABdhPJxSVb/1m5UsWH1NoJ7H8cB1Jdw/pYZXx5gMJdTqIcaMUAGx8Btj4XYutdVzOpyvypZ2Yp5l+kIpeEpJ7uxE3z0=
X-Received: by 2002:a17:906:4d50:b0:70d:afd4:1e63 with SMTP id
 b16-20020a1709064d5000b0070dafd41e63mr28190727ejv.618.1654704816852; Wed, 08
 Jun 2022 09:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-9-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-9-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:13:25 -0700
Message-ID: <CABXOdTcDig=fRGjPDVOsXt5t7nz6C8GAL7ZzKXDNZ1V0kYcy1w@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] platform/chrome: cros_ec_proto: add Kunit tests
 for getting proto info
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_proto_info() expects to receive
> sizeof(struct ec_response_get_protocol_info) from send_command().  The
> payload is valid only if the return value is positive.
>
> Add Kunit tests for returning 0 from send_command() in
> cros_ec_get_proto_info().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No v2.  New and separated from the original series.
>
>  drivers/platform/chrome/cros_ec_proto_test.c | 132 +++++++++++++++++++
>  1 file changed, 132 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 8b16666c1657..1378ac90e1cb 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -407,6 +407,71 @@ static void cros_ec_proto_test_query_all_no_pd_return_error(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_no_pd_return0(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->max_passthru = 0xbf;
> +
> +       /* For cros_ec_get_proto_info() without passthru. */
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
> +       /* For cros_ec_get_proto_info() with passthru. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       cros_ec_proto_test_query_all_pretest(test);
> +       ret = cros_ec_query_all(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       /* For cros_ec_get_proto_info() without passthru. */
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
> +       /* For cros_ec_get_proto_info() with passthru. */
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
> +
> +               KUNIT_EXPECT_EQ(test, ec_dev->max_passthru, 0);
> +       }
> +}
> +
>  static void cros_ec_proto_test_query_all_legacy_normal_v3_return_error(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -472,6 +537,71 @@ static void cros_ec_proto_test_query_all_legacy_normal_v3_return_error(struct ku
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_legacy_normal_v3_return0(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* For cros_ec_get_proto_info() without passthru. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For cros_ec_host_command_proto_query_v2(). */
> +       {
> +               struct ec_response_hello *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               data = (struct ec_response_hello *)mock->o_data;
> +               data->out_data = 0xa1b2c3d4;
> +       }
> +
> +       cros_ec_proto_test_query_all_pretest(test);
> +       ret = cros_ec_query_all(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       /* For cros_ec_get_proto_info() without passthru. */
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
> +       /* For cros_ec_host_command_proto_query_v2(). */
> +       {
> +               struct ec_params_hello *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_HELLO);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_hello));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(*data));
> +
> +               data = (struct ec_params_hello *)mock->i_data;
> +               KUNIT_EXPECT_EQ(test, data->in_data, 0xa0b0c0d0);
> +
> +               KUNIT_EXPECT_EQ(test, ec_dev->proto_version, 2);
> +               KUNIT_EXPECT_EQ(test, ec_dev->max_request, EC_PROTO2_MAX_PARAM_SIZE);
> +               KUNIT_EXPECT_EQ(test, ec_dev->max_response, EC_PROTO2_MAX_PARAM_SIZE);
> +               KUNIT_EXPECT_EQ(test, ec_dev->max_passthru, 0);
> +               KUNIT_EXPECT_PTR_EQ(test, ec_dev->pkt_xfer, NULL);
> +               KUNIT_EXPECT_EQ(test, ec_dev->din_size, EC_PROTO2_MSG_BYTES);
> +               KUNIT_EXPECT_EQ(test, ec_dev->dout_size, EC_PROTO2_MSG_BYTES);
> +       }
> +}
> +
>  static void cros_ec_proto_test_query_all_legacy_xfer_error(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -999,7 +1129,9 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_check_result),
>         KUNIT_CASE(cros_ec_proto_test_query_all_normal),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_pd_return_error),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_no_pd_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_normal_v3_return_error),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_legacy_normal_v3_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_xfer_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_data_error),
> --
> 2.36.1.255.ge46751e96f-goog
>
