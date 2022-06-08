Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4D7B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:21:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id o7so9177146eja.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0c4Gn5I2o58WzgwyMKPBdqh6wLqRLIJsSDMIz4+N3Ok=;
        b=DItdxYRWi3rvmBKzbNyNp6ydZfygezeGVUwXWW3R4zL3sDQX0eu4zKDMQaTmGD+mfi
         n6/XUw99yJ9wCdlG9nLmYQbUmnObMKeRMTqJRRg6/x9tB9ASK5DZhZiPytABpzd+FAYG
         pqqPMawkMLbY5rQyUtJFO+nbAD/q16eFWXwgwdj2cpPUrGf6jqfc0gD1pevDSh1Q/mof
         yY1MvML2FH95AEVyyulYw76e1dkyms2rvEmHCsi3A6BZP9/t3BXkpBsMWSWRRxhWVOcl
         oN8Y/LOwTYxAbfYA9Vhoy128wkeXy8dy5pGVOWZJC3dEAnWLEKAsIkYRv7gTBvL1cCpT
         Dlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0c4Gn5I2o58WzgwyMKPBdqh6wLqRLIJsSDMIz4+N3Ok=;
        b=1O8jFTCdNLCyrtgJHwQoAsYPRHYGJ3nl2DMQbRiNbYD3avwkDeMPSfDuYHI12gqgC0
         a4awBLVPihVdET/ef61+YBqoI+zWDuGE2E+VfZH9/0gvrGFZRhtz8rvYW6ycVlsRCSod
         u1u/RpSSFT6uUbFk5fDRGjggxFHfHfIUH/QkmBZkDphmTLBbvcgJ6FZmGJ9zQJZhEuKq
         nglkOH/sMZbZWwUauJ6VGot/z3lXIKng0qw7UHosOQ+OTZmtd9KhTJNBWIU8WyC4JvSp
         n414e4rU9UM2B4GWfhYQuq6b2tCYce0N4EzJEQptyNaOi+BdXx0h3nsFDZRGt3yD1G6x
         DFyg==
X-Gm-Message-State: AOAM530Bs73t87SXVF9AP/RwQ7HEaEC6tiQCS5AHFZgndCDiT38NTn8q
	ozEm6NO5TC8gGg8f/9+jxX9ENrWqLa/wl+FHQoBO3yKfg5r3UuIU
X-Google-Smtp-Source: ABdhPJyF/2uThEWGuPqdkmfGF5GVHZWauHBFomIZVrjEeecusT1Hiy/CdpkwwFC8rio5G1nCAgQ4INubOL4IZiiNMJo=
X-Received: by 2002:a17:907:1ca8:b0:70c:68ce:dade with SMTP id
 nb40-20020a1709071ca800b0070c68cedademr29476068ejc.723.1654705282368; Wed, 08
 Jun 2022 09:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-18-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-18-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:21:10 -0700
Message-ID: <CABXOdTd=LgPysNBejqF3tGxX2Ze6caSW=DAOrgRo_Y-CaPJJsw@mail.gmail.com>
Subject: Re: [PATCH v3 17/23] platform/chrome: cros_ec_proto: add Kunit test
 for getting cmd mask error
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_query_all() uses cros_ec_get_host_command_version_mask() to
> query the supported MKBP version; cros_ec_get_host_command_version_mask()
> uses send_command() for transfering the host command.
>
> Returning >=0 from send_command() only denotes the transfer was success.
> cros_ec_get_host_command_version_mask() should check if EC wasn't happy
> by checking `msg->result`.
>
> Add a Kunit test for returning error in `msg->result` in
> cros_ec_get_host_command_version_mask().  For the case,
> cros_ec_query_all() should find the EC device doesn't support MKBP.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No v2.  New and separated from the original series.
>
>  drivers/platform/chrome/cros_ec_proto_test.c | 89 ++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index ec106d0f5648..eb6d77b95c9f 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -892,6 +892,94 @@ static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
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
>  static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -1185,6 +1273,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_data_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp_return_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
>         KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask_return_error),
>         {}
> --
> 2.36.1.255.ge46751e96f-goog
>
