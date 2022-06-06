Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEEE28E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 16:09:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id q1so29894725ejz.9
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/tVPhGefm+GvsJF6VgftBj2NdA4gUHa6vMtmIepFS2o=;
        b=WGV6noLQbRHM/I01wzfdtWjPJ9faaOT+sothneiZ8NuNoZsPYgS2KruiQX/h+7dbN2
         yQrIj0ymPvB3PESxQ+mXf4DAfXkjKb+E/5O+K1/xy03sjcSWu/qi/sQlR5ek/URoIIQV
         WIeGzE6G1VpXPrj+kxljBrWIH3v6p2gtYdWywolhbln6f5TBURKWwfL6jgUgKe0iKnNn
         89/mhijZRNwsdbOcUCKz/pY4Hcr7l9mxZPOTBgy9CvjyYth4SkUwWQ/fZhqdvhp7XyVD
         qiI7oTQJyEA9yDBaz5+qvFdrmev++B1dUCijJc/3Pq47AEmx7Je60eGBelgSmrzCPUxM
         DZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/tVPhGefm+GvsJF6VgftBj2NdA4gUHa6vMtmIepFS2o=;
        b=uS0jdTTFD5cz3hdW1HoUpDfLp/FSSczdY+xk6ZcpyMYiUxnccQ1KBxK9PXKbtAzuNo
         ZEozxpJE9qOsWvTvoUq/i/IjR0kzW67QmfKq0K05O7fz9IuWHvkX560wNc8gUNewFI7L
         A40CMjzBv72JkXTNgPeehSjqaTT8Nk1GKqsAD3beU4iex6XCNFLJa9PUSH3ymBXdYRPS
         OCrK5iR6IvD+bfJBk3Yyw4aiqz8BQ3kmZDo1lrJIEcrMbbZV5l9ajrSqUWKxbIHSH5Be
         R9qqr9j9SbMFyL1Y7Ns7Z2qAnjOyFBqPe8CuwT3cC+RJ7UEZ2UTCWT/zOJxZZvhbuUQQ
         0+kA==
X-Gm-Message-State: AOAM5318yAaFzPuAQK0pCPaEY7+mrRFRdvI22yfQOBSLBFRARAzkaIDz
	C6DeAAfrh8PQ8nD1ndGVOfndY9jPH+dBh9DzgJIS5g==
X-Google-Smtp-Source: ABdhPJx+ALLTlqkGHIng2svvGDKMpNb8lWcNpuUwdkFkqhr5t4SpN8viFBuWmo2q8P8fJjTKklvcDsEauegahdrT0K0=
X-Received: by 2002:a17:907:8689:b0:6fe:e525:ea9c with SMTP id
 qa9-20020a170907868900b006fee525ea9cmr22371754ejc.720.1654531776519; Mon, 06
 Jun 2022 09:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-11-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-11-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 09:09:25 -0700
Message-ID: <CABXOdTdPwvcS2eSrXsT8dNd1XnGNugD6ub-x2qscT8YRwwK0SQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] platform/chrome: cros_ec_proto: arrange get_host_command_version_mask()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> - cros_ec_get_host_command_version_mask() is a private (static) function.
>   Rename it to get_host_command_version_mask().

Personally I prefer to still have prefixes, even for static functions.
If the idea is to have a shorter function name, maybe shorten the rest
of the function name a bit.

Guenter

>
> - Join multiple lines into one if it can fit in 100 columns.
>
> - Don't show MKBP support version if it doesn't support.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c      | 26 ++++++----------
>  drivers/platform/chrome/cros_ec_proto_test.c | 32 ++++++++++----------
>  2 files changed, 25 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 5f4414f05d66..07b57ea105b6 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -400,7 +400,7 @@ static int fill_protocol_info_legacy(struct cros_ec_device *ec_dev)
>  }
>
>  /*
> - * cros_ec_get_host_command_version_mask
> + * get_host_command_version_mask
>   *
>   * Get the version mask of a given command.
>   *
> @@ -415,16 +415,14 @@ static int fill_protocol_info_legacy(struct cros_ec_device *ec_dev)
>   * the caller has ec_dev->lock mutex or the caller knows there is
>   * no other command in progress.
>   */
> -static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
> -       u16 cmd, u32 *mask)
> +static int get_host_command_version_mask(struct cros_ec_device *ec_dev, u16 cmd, u32 *mask)
>  {
>         struct ec_params_get_cmd_versions *pver;
>         struct ec_response_get_cmd_versions *rver;
>         struct cros_ec_command *msg;
>         int ret;
>
> -       msg = kmalloc(sizeof(*msg) + max(sizeof(*rver), sizeof(*pver)),
> -                     GFP_KERNEL);
> +       msg = kmalloc(sizeof(*msg) + max(sizeof(*rver), sizeof(*pver)), GFP_KERNEL);
>         if (!msg)
>                 return -ENOMEM;
>
> @@ -443,7 +441,6 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>         }
>
>         kfree(msg);
> -
>         return ret;
>  }
>
> @@ -488,21 +485,16 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                 return -ENOMEM;
>
>         /* Probe if MKBP event is supported */
> -       ret = cros_ec_get_host_command_version_mask(ec_dev,
> -                                                   EC_CMD_GET_NEXT_EVENT,
> -                                                   &ver_mask);
> -       if (ret < 0 || ver_mask == 0)
> +       ret = get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
> +       if (ret < 0 || ver_mask == 0) {
>                 ec_dev->mkbp_event_supported = 0;
> -       else
> +       } else {
>                 ec_dev->mkbp_event_supported = fls(ver_mask);
> -
> -       dev_dbg(ec_dev->dev, "MKBP support version %u\n",
> -               ec_dev->mkbp_event_supported - 1);
> +               dev_dbg(ec_dev->dev, "MKBP support version %u\n", ec_dev->mkbp_event_supported - 1);
> +       }
>
>         /* Probe if host sleep v1 is supported for S0ix failure detection. */
> -       ret = cros_ec_get_host_command_version_mask(ec_dev,
> -                                                   EC_CMD_HOST_SLEEP_EVENT,
> -                                                   &ver_mask);
> +       ret = get_host_command_version_mask(ec_dev, EC_CMD_HOST_SLEEP_EVENT, &ver_mask);
>         ec_dev->host_sleep_v1 = (ret >= 0 && (ver_mask & EC_VER_MASK(1)));
>
>         /* Get host event wake mask. */
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 22f9322787f4..e2c369765612 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -217,7 +217,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>                 data->max_request_packet_size = 0xbf;
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 struct ec_response_get_cmd_versions *data;
>
> @@ -228,7 +228,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>                 data->version_mask = BIT(6) | BIT(5);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       /* For get_host_command_version_mask() for host sleep v1. */
>         {
>                 struct ec_response_get_cmd_versions *data;
>
> @@ -288,7 +288,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, ec_dev->max_passthru, 0xbf - sizeof(struct ec_host_request));
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 struct ec_params_get_cmd_versions *data;
>
> @@ -307,7 +307,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, ec_dev->mkbp_event_supported, 7);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       /* For get_host_command_version_mask() for host sleep v1. */
>         {
>                 struct ec_params_get_cmd_versions *data;
>
> @@ -502,7 +502,7 @@ static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 struct ec_response_get_cmd_versions *data;
>
> @@ -543,7 +543,7 @@ static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 struct ec_params_get_cmd_versions *data;
>
> @@ -596,7 +596,7 @@ static void cros_ec_proto_test_query_all_no_mkbp2(struct kunit *test)
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_add(test, 0);
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> @@ -632,7 +632,7 @@ static void cros_ec_proto_test_query_all_no_mkbp2(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 struct ec_params_get_cmd_versions *data;
>
> @@ -685,14 +685,14 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_add(test,
>                                                    sizeof(struct ec_response_get_cmd_versions));
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       /* For get_host_command_version_mask() for host sleep v1. */
>         {
>                 struct ec_response_get_cmd_versions *data;
>
> @@ -733,7 +733,7 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_next();
>                 KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> @@ -745,7 +745,7 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       /* For get_host_command_version_mask() for host sleep v1. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_next();
>                 KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> @@ -793,14 +793,14 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_add(test,
>                                                    sizeof(struct ec_response_get_cmd_versions));
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       /* For get_host_command_version_mask() for host sleep v1. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_add(test,
>                                                    sizeof(struct ec_response_get_cmd_versions));
> @@ -844,7 +844,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for MKBP. */
> +       /* For get_host_command_version_mask() for MKBP. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_next();
>                 KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> @@ -856,7 +856,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
>         }
>
> -       /* For cros_ec_get_host_command_version_mask() for host sleep v1. */
> +       /* For get_host_command_version_mask() for host sleep v1. */
>         {
>                 mock = cros_kunit_ec_xfer_mock_next();
>                 KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> --
> 2.36.1.255.ge46751e96f-goog
>
