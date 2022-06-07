Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E472F7C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 19:11:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v25so24238203eda.6
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hV3xEmz3VLxIR9I3qG4yWszU0CvP4zSv4bB50jhgWQY=;
        b=FsOTpaCNvMmctTnP+zSEnTxCEQrRXWsITIdWtaHz5VCwaCh5RKGXylUsssMJ85p6wQ
         sb2Hjkscx9prhO++TxwhhysL4Z5n3qHt1c4c92Wc4qWs7HHu1pu6Z9V0Q2qU579iu5Lm
         PlBvFDeoEfE/D6RQ4VyRR+Jrn5X+GjXT9PVR7o+1N0E/cyeosjHoDIb8TGiZ7kXDMY0r
         aweTDpAuGXVX4QypEnIq90r0MYBiFO329pOeu5R73LKQj7eW4nw6x3UteyRo+UP3p7ux
         WeYoL9A+hCUhumITWwg4yBG0VI5zmlgmk8nmXpe56osIMet5WGsOMQ5oTIeSbrsLGlUc
         NLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hV3xEmz3VLxIR9I3qG4yWszU0CvP4zSv4bB50jhgWQY=;
        b=zHANQ/M/iEfUpMywLqBBrHJ5iEC2KPZq/yc2kCcA6sIBeKvfnaUhKVfc+bVOayTUGh
         YENpqNo8gqKJuHX1rKJmlQE1+BlBkaRls48D+cRGRBZp6QjSeCLWrfQWOlrLNN2KtVb5
         710ytN89cIS+NMNZTMrfJ5rRL1baluAy8FRs9Ky03NZV5RNDdfSpbHOM77FNx4bjeSsT
         TNJp4k5PhMDb8s2YjfrJ7UZcNDFG3JROnn1jEAGTA3FXSbr24VX+iHTR+I157MN33GoM
         RpzgZlZL5G890gbRE6PKpw17x/jnW1w/0x+8sdhtZyjWc/jH0d2gs6Lj3qHBrBKYx2MT
         T/fQ==
X-Gm-Message-State: AOAM531AOH265IXWanUeVTDmW72aspo+1QFzbxNstDnXu919YkNXxOXy
	tGRy0f6Pz9qM1jWIAyZXbFnd+DZuheDgdSL+qRXcpA==
X-Google-Smtp-Source: ABdhPJyR7w9fy1LybVL5JIIyJDc27TBl5rRQHyNxOHpEx3LkHY5wY1AXTQ/vuTD24Ix9wW5/Jqy0z0KQXMq4BdQi7Gw=
X-Received: by 2002:a05:6402:2405:b0:431:6ef1:e2a with SMTP id
 t5-20020a056402240500b004316ef10e2amr11282812eda.26.1654629095871; Tue, 07
 Jun 2022 12:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607145639.2362750-1-tzungbi@kernel.org> <20220607145639.2362750-15-tzungbi@kernel.org>
In-Reply-To: <20220607145639.2362750-15-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 12:11:23 -0700
Message-ID: <CABXOdTcBauEYxOokg3PHGwYfgjAHNPGzf9mHnNFTyhcucv+rzg@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] platform/chrome: cros_ec_proto: return 0 on
 getting version mask success
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_command_version_mask() used to return value from
> send_command() which is number of bytes for input payload on success
> (i.e. sizeof(struct ec_response_get_cmd_versions)).
>
> However, the callers don't need to know how many bytes are available.
>
> - Fix cros_ec_get_host_command_version_mask() to return 0 on success;
>   negative integers on error.
>
> - Remove the unneeded `ver_mask` initialization as the callers should
>   take it only if cros_ec_get_host_command_version_mask() returns 0.
>
> - Add a Kunit test: `ver_mask` has some garbage bytes from previous
>   EC_CMD_GET_NEXT_EVENT but there is no host sleep to make sure the
>   caller checks the return values correctly.
>
This should be separate patches.

Thanks,
Guenter


> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> - Return 0 on success; otherwise, negative intergers.
>
>  drivers/platform/chrome/cros_ec_proto.c      |  37 ++-
>  drivers/platform/chrome/cros_ec_proto_test.c | 286 +++++++++++++++++++
>  2 files changed, 308 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index ee15a73eee38..9d96ed16244f 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -428,13 +428,12 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
>   * the caller has ec_dev->lock mutex or the caller knows there is
>   * no other command in progress.
>   */
> -static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
> -       u16 cmd, u32 *mask)
> +static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev, u16 cmd, u32 *mask)
>  {
>         struct ec_params_get_cmd_versions *pver;
>         struct ec_response_get_cmd_versions *rver;
>         struct cros_ec_command *msg;
> -       int ret;
> +       int ret, mapped;
>
>         msg = kmalloc(sizeof(*msg) + max(sizeof(*rver), sizeof(*pver)),
>                       GFP_KERNEL);
> @@ -450,13 +449,25 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>         pver->cmd = cmd;
>
>         ret = send_command(ec_dev, msg);
> -       if (ret > 0) {
> -               rver = (struct ec_response_get_cmd_versions *)msg->data;
> -               *mask = rver->version_mask;
> +       if (ret < 0)
> +               goto exit;
> +
> +       mapped = cros_ec_map_error(msg->result);
> +       if (mapped) {
> +               ret = mapped;
> +               goto exit;
>         }
>
> -       kfree(msg);
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
> +       }
>
> +       rver = (struct ec_response_get_cmd_versions *)msg->data;
> +       *mask = rver->version_mask;
> +       ret = 0;
> +exit:
> +       kfree(msg);
>         return ret;
>  }
>
> @@ -469,7 +480,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>   */
>  int cros_ec_query_all(struct cros_ec_device *ec_dev)
>  {
> -       u32 ver_mask = 0;
> +       u32 ver_mask;
>         int ret;
>         u8 *din, *dout;
>
> @@ -503,9 +514,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>         ec_dev->dout = dout;
>
>         /* Probe if MKBP event is supported */
> -       ret = cros_ec_get_host_command_version_mask(ec_dev,
> -                                                   EC_CMD_GET_NEXT_EVENT,
> -                                                   &ver_mask);
> +       ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
>         if (ret < 0 || ver_mask == 0) {
>                 ec_dev->mkbp_event_supported = 0;
>         } else {
> @@ -515,10 +524,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>         }
>
>         /* Probe if host sleep v1 is supported for S0ix failure detection. */
> -       ret = cros_ec_get_host_command_version_mask(ec_dev,
> -                                                   EC_CMD_HOST_SLEEP_EVENT,
> -                                                   &ver_mask);
> -       ec_dev->host_sleep_v1 = (ret >= 0 && (ver_mask & EC_VER_MASK(1)));
> +       ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_HOST_SLEEP_EVENT, &ver_mask);
> +       ec_dev->host_sleep_v1 = (ret == 0 && (ver_mask & EC_VER_MASK(1)));
>
>         /* Get host event wake mask. */
>         ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 27b81a5a9880..af69410f2978 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -890,6 +890,182 @@ static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_no_mkbp_return_error(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->mkbp_event_supported = 0xbf;
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
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
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
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       {
> +               struct ec_params_get_cmd_versions *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_CMD_VERSIONS);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize,
> +                               sizeof(struct ec_response_get_cmd_versions));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(*data));
> +
> +               data = (struct ec_params_get_cmd_versions *)mock->i_data;
> +               KUNIT_EXPECT_EQ(test, data->cmd, EC_CMD_GET_NEXT_EVENT);
> +
> +               KUNIT_EXPECT_EQ(test, ec_dev->mkbp_event_supported, 0);
> +       }
> +}
> +
> +static void cros_ec_proto_test_query_all_no_mkbp_return0(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->mkbp_event_supported = 0xbf;
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
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for MKBP. */
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
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       {
> +               struct ec_params_get_cmd_versions *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_CMD_VERSIONS);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize,
> +                               sizeof(struct ec_response_get_cmd_versions));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(*data));
> +
> +               data = (struct ec_params_get_cmd_versions *)mock->i_data;
> +               KUNIT_EXPECT_EQ(test, data->cmd, EC_CMD_GET_NEXT_EVENT);
> +
> +               KUNIT_EXPECT_EQ(test, ec_dev->mkbp_event_supported, 0);
> +       }
> +}
> +
>  static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -996,6 +1172,113 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_no_host_sleep_return0(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->host_sleep_v1 = true;
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
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       {
> +               struct ec_response_get_cmd_versions *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               /* In order to pollute next cros_ec_get_host_command_version_mask(). */
> +               data = (struct ec_response_get_cmd_versions *)mock->o_data;
> +               data->version_mask = 0xbeef;
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
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
> +       }
> +
> +       /* For cros_ec_get_host_command_version_mask() for MKBP. */
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
> +       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
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
>  static void cros_ec_proto_test_query_all_default_wake_mask_return_error(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -1183,7 +1466,10 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_data_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp_return_error),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask_return_error),
>         {}
>  };
> --
> 2.36.1.255.ge46751e96f-goog
>
