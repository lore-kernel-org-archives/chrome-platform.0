Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CE28E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 16:14:39 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x62so19480976ede.10
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 09:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YP69Bo4qIEJ5orWzjU2yPB3kbf3LLASr73+6q57JiB8=;
        b=ovXkxPeRYWYCnlZPfbbPy4ABOqO6TMMyHIkvRQVUQL4jLm69z/cPHUm56z9zl5598j
         PBFPuqy+OK9wnHIeo7P9xtGqi3mumDlcgUAtTgRDEXxgoS41mRt7QwOoDyg5ktTR5asZ
         mKAG6l84Hi4XPfH8pfE7/ebDOJtGNwRFE31HSjX/cp8qzNfUDdGS8B8xeVHlN5pa8AV4
         mk4NFm+Xs7HBrbE0kzIJGydklZp7pVrizE4E8aKsTQpLVgNYKKMqA0Dx8QRP98hm1PJD
         +EhWloeeXdCEIeRQE/II5DCjkDPOsjSJaEoM7MDij4/7IcrrOq/kGZZydOUBTTv+JvkQ
         3Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YP69Bo4qIEJ5orWzjU2yPB3kbf3LLASr73+6q57JiB8=;
        b=AHuF3x3ufWZACgwKtuK/N3RvsgXJvmqRMSdd3dzpUDqjtfpQR5g4wwtDTNy2u2ZnBd
         KqY9kEBqLK1UHuOf7QcK/rsZWTZByYv1lynR8RKnyO5erDpqRgtz/doixIYFe1mWvsWM
         XOyK4eiSpZXMtwzAfhDom7yqWMNb/MzGl+8urgq0LJ1Ln3jkI6wIavnwtTSfyvQ4jVe0
         n7cqa9jtd+5pO7u0oYe+aNpxS5J10xJlyTRgh84bgPOltHkKkyRPVXlEfL3WlNPxHFOE
         CVQ/SenKQA5S1ESNwE7nJieMD/s1re4Rgvm4H6RDDk/glF4m0khAK91kIAgNbHLlYWvs
         ftUQ==
X-Gm-Message-State: AOAM5333HtE1TTs0kmfoLUHUvyAyefS57OjUS2PLqqpzV3jsLbCD4Dna
	ZdJewxmAsDTGX1GQWGa8j3kNp+5PXqig+VNVLGdA3qvtSMXaaieL
X-Google-Smtp-Source: ABdhPJxloRulIeujEK2Smt/pejxtQaDmM6MYHum0ht4cbuUua5JaMEBdWRK5b7+C4FGg+871XSCJq/lMJ7u84TwKEOw=
X-Received: by 2002:a05:6402:2405:b0:431:6ef1:e2a with SMTP id
 t5-20020a056402240500b004316ef10e2amr3773231eda.26.1654532077731; Mon, 06 Jun
 2022 09:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-14-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-14-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 09:14:26 -0700
Message-ID: <CABXOdTdvcycr-U2VniJSLqbvt=tiEDBmo+EUSx1eX8Nti8cXAg@mail.gmail.com>
Subject: Re: [PATCH 13/13] platform/chrome: cros_ec_proto: fix
 get_host_event_wake_mask() returns
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> get_host_event_wake_mask() only gets valid result if send_command()
> returns sizeof(struct ec_response_host_event_mask).  Simplify the
> code and correct the callers.
>
> Also add a Kunit test for guarding if get_host_event_wake_mask() returns 0.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c      |  15 +--
>  drivers/platform/chrome/cros_ec_proto_test.c | 131 +++++++++++++++++++
>  2 files changed, 137 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 1622e24747c9..1d2399473f35 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -236,7 +236,7 @@ EXPORT_SYMBOL(cros_ec_check_result);
>   *
>   * @ec_dev: EC device to call
>   * @msg: message structure to use
> - * @mask: result when function returns >=0.
> + * @mask: result when function returns >0.
>   *
>   * LOCKING:
>   * the caller has ec_dev->lock mutex, or the caller knows there is
> @@ -256,19 +256,16 @@ static int get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint32_t *mas
>         msg->insize = sizeof(*r);
>
>         ret = send_command(ec_dev, msg);
> -       if (ret >= 0) {
> +       if (ret > 0) {

The idea here was to (potentially) return an error if ret == 0. This
is no longer the case after this change. Instead, the caller has to
check for ret == 0 and treat it as an error. I think it would make
more sense to explicitly check for ret ==0, eg with something like

    mapped = cros_ec_map_error(msg->result);
    if (mapped) {
        ret = mapped;
        goto exit;
    }
    if (ret == 0) {
        ret = -EPROTO;
        goto exit;
    }
    ....

>                 mapped = cros_ec_map_error(msg->result);
>                 if (mapped) {
>                         ret = mapped;
> -                       goto exit;
> +               } else {
> +                       r = (struct ec_response_host_event_mask *)msg->data;
> +                       *mask = r->mask;
>                 }
>         }
> -       if (ret > 0) {
> -               r = (struct ec_response_host_event_mask *)msg->data;
> -               *mask = r->mask;
> -       }
>
> -exit:
>         kfree(msg);
>         return ret;
>  }
> @@ -499,7 +496,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>
>         /* Get host event wake mask. */
>         ret = get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
> -       if (ret < 0) {
> +       if (ret <= 0) {
>                 /*
>                  * If the EC doesn't support EC_CMD_HOST_EVENT_GET_WAKE_MASK,
>                  * use a reasonable default. Note that we ignore various
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index f63196289f54..1ccc837b30cf 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -999,6 +999,136 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_default_wake_mask2(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* Set some garbage bytes. */
> +       ec_dev->host_event_wake_mask = U32_MAX;
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
> +               mock = cros_kunit_ec_xfer_mock_add(test,
> +                                                  sizeof(struct ec_response_get_cmd_versions));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For get_host_command_version_mask() for host sleep v1. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test,
> +                                                  sizeof(struct ec_response_get_cmd_versions));
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
>  static int cros_ec_proto_test_init(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv;
> @@ -1051,6 +1181,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep2),
>         KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask2),
>         {}
>  };
>
> --
> 2.36.1.255.ge46751e96f-goog
>
