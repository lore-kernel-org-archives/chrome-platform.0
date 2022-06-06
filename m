Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09128E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 16:19:10 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id h23so18856686ejj.12
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 09:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YaI0g8cUivOx96ChYxLm99Kiy6nUc3V/ruLcuNQVvVU=;
        b=pDpF4wAUHXj2HlsodBz/+GqJm33nIH6Zvrsv77r1RCrOj6STgjoR7+2GVxwnxUjnQL
         cNWnDA6xDOY8yxHVp0tKjuZpfxdmDGEYk5z8bacYrDMx2XgKFsGFivG3q5AIWNeN/u9+
         ihPdAh1i/1PSQzvuZjbEpv5WvgPO+6JNxA8iNEF3aP9/WV0zoABNvd0JpvtbXuunbctz
         8XMYp6YQrZA6JIAnReLeiG4Jeoz1pGpZQb1oDN3grHB8Vr5lAL/sih5lyzzg6pKzXCwG
         48syNDdXmb6K19hhi7ekwr6jD1VCexjCUKYvWPlNRHtbqzOiLc4uro0lgNt5pG2k7Up+
         eUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YaI0g8cUivOx96ChYxLm99Kiy6nUc3V/ruLcuNQVvVU=;
        b=rNEIQ8LU83VHDcKMxNCbnkMyKSXOpJH4sTtSzxB8kDWLxj0wVca+pbZ/rxe9OTL7vF
         hH5s5MXeW5HdoZul14LPk2nAjhGQ/8J6+/aOkLofrel4K/cXhfrktiaR4yHm6IJ4jPLD
         MKj/lg/91bJBO0A6UAnDtP/PYrQO109/y2D9fCjuHfPZ7Cd1azYNpVFNE1MehMgQx5Z8
         oKzxF1a2GNVriZk7SxiVbQ8GgRrYuia/sj9PWZbWrc9wN3wn9CIQ874+CiHQK4/itKwo
         ij6/ZjeJcN0MLb0Ebvv16BtHWRMZ99Lt83cFh7T6ALfLqhGPmJ9dNR9FqYyfrjO+km1N
         sLow==
X-Gm-Message-State: AOAM5323P4K09C3TwE8Jwq1r3uVgHPB8Vc5cOoT4xOdks7NGZsNw3BnI
	EEPJU9Dpe+yZXJRBhsNbZ3bd48d9DUBrFvae3vmkvA==
X-Google-Smtp-Source: ABdhPJxgrdnu3Q5uPdwC77Uc+wTlcIOC/3m3ouGaWoL9iDpazMz6g9UQ/0XHdqGhTGU+ALRSeSys1aLANW5r3Jt16uQ=
X-Received: by 2002:a17:906:4d50:b0:70d:afd4:1e63 with SMTP id
 b16-20020a1709064d5000b0070dafd41e63mr17720036ejv.618.1654532348927; Mon, 06
 Jun 2022 09:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-13-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-13-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 09:18:57 -0700
Message-ID: <CABXOdTe-9gu+mPZp+drKknJysoRS3krO_KSxTfO90+8i2ooWDw@mail.gmail.com>
Subject: Re: [PATCH 12/13] platform/chrome: cros_ec_proto: arrange get_host_event_wake_mask()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> - cros_ec_get_host_event_wake_mask() is a private (static) function.
>   Rename it to get_host_event_wake_mask().
>
Same as before - I still prefer to have prefixes. Also, this is a bit
of point-of-view thing, so I'd rather leave function names alone
unless there is a good reason to change them. Otherwise we might end
up with sequences of function-name-rename patches for no good reason
besides someone mot liking the existing names.

Thanks,
Guenter

> - Join multiple lines into one if it can fit in 100 columns.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c      | 9 ++++-----
>  drivers/platform/chrome/cros_ec_proto_test.c | 8 ++++----
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 91c945c9911f..1622e24747c9 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -230,7 +230,7 @@ int cros_ec_check_result(struct cros_ec_device *ec_dev,
>  EXPORT_SYMBOL(cros_ec_check_result);
>
>  /*
> - * cros_ec_get_host_event_wake_mask
> + * get_host_event_wake_mask
>   *
>   * Get the mask of host events that cause wake from suspend.
>   *
> @@ -242,7 +242,7 @@ EXPORT_SYMBOL(cros_ec_check_result);
>   * the caller has ec_dev->lock mutex, or the caller knows there is
>   * no other command in progress.
>   */
> -static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint32_t *mask)
> +static int get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint32_t *mask)
>  {
>         struct cros_ec_command *msg;
>         struct ec_response_host_event_mask *r;
> @@ -498,7 +498,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>         ec_dev->host_sleep_v1 = (ret > 0 && (ver_mask & EC_VER_MASK(1)));
>
>         /* Get host event wake mask. */
> -       ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
> +       ret = get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
>         if (ret < 0) {
>                 /*
>                  * If the EC doesn't support EC_CMD_HOST_EVENT_GET_WAKE_MASK,
> @@ -522,8 +522,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                  * other errors.
>                  */
>                 if (ret != -EOPNOTSUPP)
> -                       dev_err(ec_dev->dev,
> -                               "failed to retrieve wake mask: %d\n", ret);
> +                       dev_err(ec_dev->dev, "failed to retrieve wake mask: %d\n", ret);
>         }
>
>         return 0;
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 7d73aeb99d1d..f63196289f54 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -239,7 +239,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>                 data->version_mask = BIT(1);
>         }
>
> -       /* For cros_ec_get_host_event_wake_mask(). */
> +       /* For get_host_event_wake_mask(). */
>         {
>                 struct ec_response_host_event_mask *data;
>
> @@ -326,7 +326,7 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>                 KUNIT_EXPECT_TRUE(test, ec_dev->host_sleep_v1);
>         }
>
> -       /* For cros_ec_get_host_event_wake_mask(). */
> +       /* For get_host_event_wake_mask(). */
>         {
>                 mock = cros_kunit_ec_xfer_mock_next();
>                 KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> @@ -915,7 +915,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>         }
>
> -       /* For cros_ec_get_host_event_wake_mask(). */
> +       /* For get_host_event_wake_mask(). */
>         {
>                 mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND,
>                                                     sizeof(struct ec_response_host_event_mask));
> @@ -976,7 +976,7 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_get_cmd_versions));
>         }
>
> -       /* For cros_ec_get_host_event_wake_mask(). */
> +       /* For get_host_event_wake_mask(). */
>         {
>                 u32 mask;
>
> --
> 2.36.1.255.ge46751e96f-goog
>
