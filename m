Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD97C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 18:48:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x5so19067754edi.2
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 11:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ifDxMatAlmHG6+QO/cX43ydwB+XCFucrKlR7RLoJRyk=;
        b=YwqKVRgDSYc7lhb5EOoK6KWe1n5ItyjnVVXQbxtboJkPu8qknjzCCMP5zI8o6wtucr
         O8oWZgd7TU+bt1TCM4PqWEfgUdm+mh5jPmqqhHyolyQOZ/aXsknjWebnd2MAVlcITrNC
         GgdK6YYEsFHFxNGQQjzoPMTWGYcAukmaKm82stLPel+yei+sLZ6CmwoT2uIFPwbZJGQm
         NBzOlIX5gZlg7Ctb8HBAzEh8w+NiH2SS5qle1ugL6jAsUBMX1mdyt2Owjt2s9wNB3t39
         izM6HDsttK01IyYzDfonGQ/Zjea48Twd5ku42IdNO/dbD1axrT7c7/jhsyVCmcDMPdmk
         BPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ifDxMatAlmHG6+QO/cX43ydwB+XCFucrKlR7RLoJRyk=;
        b=0QCFePB2Z8F1SD2tWTlGygayaM9c8HH6FRppJHTOAOvGQOyxPCkDsnPBeYLTN90x10
         HlBAr8RPliAftib2DeIdPtCw0UJHlwoxivOG2jXEtN8cPOznXwbud66eD5B3i+F3iUb0
         sanA4dNFwQwrJBeZds3bsAaHPwAh45efXc5mylf2EIqxAoh+axzknsmJgQw1Ju4ZaJWA
         WamhYo7itfSREqpBmHhoZudcCMdGLGwvJlj6Au8XnRxF/NEe5H40YBqivF5zsYC/eHEM
         fyoxnznzRtPS6oF4NtQaDMB2iaM4kvxEiSyVlDYXMAfZYg91CBHWkev79wXg/vpR6GxL
         InvQ==
X-Gm-Message-State: AOAM530BoeBczK2mW0xfsRMgrkV2HCCjomywWEDjW3FA5nfRYRWoaZUK
	FHLb21HVTwqlmNqKnpqA0n5o9MlBghjEQJ+RAnR9dQ==
X-Google-Smtp-Source: ABdhPJwG2tPtWu/ZYuhkA19R4quxtR+arcKJxUhS+mfI+LlDrHLpHONsROS5zTRZFP0xm1JWOiTP9BpRUkqW++dYki8=
X-Received: by 2002:a05:6402:3688:b0:42d:d3ba:4725 with SMTP id
 ej8-20020a056402368800b0042dd3ba4725mr35557327edb.212.1654627687938; Tue, 07
 Jun 2022 11:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607145639.2362750-1-tzungbi@kernel.org> <20220607145639.2362750-9-tzungbi@kernel.org>
In-Reply-To: <20220607145639.2362750-9-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 11:47:56 -0700
Message-ID: <CABXOdTdx7jKLbHa3X7aOz3wUMpwWWHkncfKuRyGzonkA92Rg=w@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] platform/chrome: cros_ec_proto: handle empty
 payload in getting proto info
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_proto_info() expects to receive
> sizeof(struct ec_response_get_protocol_info) from send_command().  The
> payload is valid only if the return value is positive.
>
> Add Kunit tests for returning 0 in send_command() and handle the case in
> cros_ec_get_proto_info().
>
That should be two separate patches.

> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> No v1.  New in the series.
>
>  drivers/platform/chrome/cros_ec_proto.c      |   5 +
>  drivers/platform/chrome/cros_ec_proto_test.c | 132 +++++++++++++++++++
>  2 files changed, 137 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 893b76703da6..6f5be9e5ede4 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -314,6 +314,11 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
>                 goto exit;
>         }
>
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
> +       }
> +

I think you can move that into the if() statement above (which already
checks for ret >=0),
making it a special case of that situation.

Thanks,
Guenter

>         info = (struct ec_response_get_protocol_info *)msg->data;
>
>         switch (devidx) {
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 14a4441a39fc..473714964cf2 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -406,6 +406,71 @@ static void cros_ec_proto_test_query_all_no_pd_return_error(struct kunit *test)
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
> @@ -471,6 +536,71 @@ static void cros_ec_proto_test_query_all_legacy_normal_v3_return_error(struct ku
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
> @@ -998,7 +1128,9 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
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
