Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A187C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 19:12:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x5so19146117edi.2
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7kb1j+lCYcgNJfFRtU39ymeKe9zS4sLF08OKHSZXXsk=;
        b=adPlAQ+Bou+4Tln1nEnCl84skioMttrUky89A5FguxVn/QEfz2lsfXdaCoPuhegnEx
         pS2Mf4tzCXPnX6a8rBGJKlMDM4JWozBITUs7OtqwUZXEauNgL5wFDann1NuPVQ84R2/F
         SiKHKY/gcUNMiz6keZBbt5ej+HUZZW5D+bWpceuKEd21chp/ec4OWlKCOgWNh1ocs1XD
         ETkKWwHNDT9V6uFbdvIvo0/d8cHwH5vy4OFxVGp9kdPjouw0Eq3beVkPpg8w3PZMIO0j
         xNO2/Pob0Fhg/JiNAyl3k26tOS79XwzGqBJJsCCYQ34+SEOad5CzgNlrl/gb7rCYYC4d
         pG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7kb1j+lCYcgNJfFRtU39ymeKe9zS4sLF08OKHSZXXsk=;
        b=DQjK7EPxWoBjraG6HEI524hu9hETTGKVHinS78iW1LKZ2ZnwNFxmda+QfwJss7b+VA
         Z6pcfYQIBfYgb1qUDDCeL72KJHuD3tsEtWQQCd2T83TJV1wldpl1jc7mdcyYB0/eYc3k
         5MjNwb7ByGRrAMZti94YUg2uvI3JneSJUrwa7LDv9OGQLcFBpwymmjbXlsgy+F2aJvvj
         fZ3K7I2p1WgDfmiPlhJ78pyatkA7A6Rz3dn5OhyevHlQrUJj+brCgs0UouBHalJWflSV
         CtvGSGoSTt2VKnVVOEadzY/z9Bm1/vDxqfUuPPdYXjIzVVogiLvIdCIZ9UL0PCHcOr0a
         P23w==
X-Gm-Message-State: AOAM531j3Je+ZGaylEkcjOUZ5J82yE8VAoXAXU/EC2g98FfhkdTCGG6Q
	czKtb6V+sBhzP8G8WRG/f0l75bMtmiaUeR9xeYKySw==
X-Google-Smtp-Source: ABdhPJzDz+gUGeg7JrjZDYQJqx4ADRcQHPr104EcjqIGmFojpTe85n7p+Y2kwYAcqviPln3kX1gG0YoHp2ksvNLfBkA=
X-Received: by 2002:a05:6402:2687:b0:430:328f:e46b with SMTP id
 w7-20020a056402268700b00430328fe46bmr22886699edd.33.1654629156511; Tue, 07
 Jun 2022 12:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607145639.2362750-1-tzungbi@kernel.org> <20220607145639.2362750-16-tzungbi@kernel.org>
In-Reply-To: <20220607145639.2362750-16-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 12:12:25 -0700
Message-ID: <CABXOdTcYD6L6vnfNJwYROo1ynGqkabdbpm8JjvvosjtYGV1xow@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] platform/chrome: cros_ec_proto: return 0 on
 getting wake mask success
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_event_wake_mask() used to return value from
> send_command() which is number of bytes for input payload on success
> (i.e. sizeof(struct ec_response_host_event_mask)).
>
> However, the callers don't need to know how many bytes are available.
>
> - Fix cros_ec_get_host_event_wake_mask() to return 0 on success;
>   negative integers on error.
>
> - Add a Kunit test for guarding if send_command() returns 0 in
>   get_host_event_wake_mask().
>
Please split into two patches.

Thanks,
Guenter

> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> - Return 0 on success; otherwise, negative intergers.
>
>  drivers/platform/chrome/cros_ec_proto.c      |  23 ++--
>  drivers/platform/chrome/cros_ec_proto_test.c | 128 +++++++++++++++++++
>  2 files changed, 142 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 9d96ed16244f..04c852aa790b 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -256,18 +256,23 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
>         msg->insize = sizeof(*r);
>
>         ret = send_command(ec_dev, msg);
> -       if (ret >= 0) {
> -               mapped = cros_ec_map_error(msg->result);
> -               if (mapped) {
> -                       ret = mapped;
> -                       goto exit;
> -               }
> +       if (ret < 0)
> +               goto exit;
> +
> +       mapped = cros_ec_map_error(msg->result);
> +       if (mapped) {
> +               ret = mapped;
> +               goto exit;
>         }
> -       if (ret > 0) {
> -               r = (struct ec_response_host_event_mask *)msg->data;
> -               *mask = r->mask;
> +
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
>         }
>
> +       r = (struct ec_response_host_event_mask *)msg->data;
> +       *mask = r->mask;
> +       ret = 0;
>  exit:
>         kfree(msg);
>         return ret;
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index af69410f2978..3ee0de337d53 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -1406,6 +1406,133 @@ static void cros_ec_proto_test_query_all_default_wake_mask_return_error(struct k
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_default_wake_mask_return0(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->host_event_wake_mask = U32_MAX;
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
> +       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For get_host_event_wake_mask(). */
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
> +       }
> +
> +       /* For get_host_event_wake_mask(). */
> +       {
> +               u32 mask;
> +
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_HOST_EVENT_GET_WAKE_MASK);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_host_event_mask));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> +
> +               mask = ec_dev->host_event_wake_mask;
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_LID_CLOSED), 0);
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_AC_DISCONNECTED), 0);
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_LOW), 0);
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_CRITICAL), 0);
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY), 0);
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PD_MCU), 0);
> +               KUNIT_EXPECT_EQ(test, mask & EC_HOST_EVENT_MASK(EC_HOST_EVENT_BATTERY_STATUS), 0);
> +       }
> +}
> +
>  static void cros_ec_proto_test_release(struct device *dev)
>  {
>  }
> @@ -1471,6 +1598,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask_return_error),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask_return0),
>         {}
>  };
>
> --
> 2.36.1.255.ge46751e96f-goog
>
