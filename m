Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903607B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:14:33 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id n10so42475655ejk.5
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oGn9m0fdkhwA1gpDEF10OhjQq1I10hq7KFiUkQ4pUpk=;
        b=T4vS/t0SbcLTHpxOBi91rhv+zPpSRRFliNYSoVva02OeF1bL0WHk04BFTjGyJvquJY
         1RuR6nTMMkd9axqx6kHFFFeeWvLsI2B4UAWYKZnoABzNfio/TsSQKEYsvu1mF8M7Ck5u
         Kg1j9/jknIETFSZqcFwGWz9brWRjoVAmzfStNV0QinofSu9Vz7v2qhk5PRZRhtH/tuUI
         Xe/KD7tfqFCO0ASaj34jI9eDvOR0RUQXi7FWGKZ/hhs1f9G9ZcqIno/7j+HamT1NkHvl
         d6cvETryqztq1bwlqaYLa3HCV9OkVHSnglLpL5ivNzFF90SrgGPexy+XslYEodbXLvmn
         wXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oGn9m0fdkhwA1gpDEF10OhjQq1I10hq7KFiUkQ4pUpk=;
        b=nvd25GxiCOWg8nCr2vJ9R9KC8AqBY75BBbMIejf7Y6N15cDKuw67CkO+9CBcc8SVOf
         6nxwzqjb9+kaVwU4q6eC/uG3Veeba/FD4+nhs/TFE7igSOxUfW9NNTnsJOz97DHoReiJ
         3NZIyH1P4splO/22irPJtYQclEQFEfb6JuCfnK9Y5DPgZMM2Q9DUSIXSBFwHsSK/TSNP
         tRZak70q3x3pxDg42q4MvEhixYBbrwQ5pytgJniSwa9N15JItYo9FBsfXrdQpSWghJJC
         5cY+b0N/EdqQYKO58hg37zLbJIEduoip5Ba8IF2iRUM2frJyY00uLwNMF9mQ4zQG0XVw
         jJ9A==
X-Gm-Message-State: AOAM531nZwESWFk8gbFtpgLrOFOW0yz5YN6PFYDoaaoGXueflrcg9nD/
	9l9R5rP0u+XQyoTWrrhU8JdunvpTL209wTZzgT1wYA==
X-Google-Smtp-Source: ABdhPJyNz0JikhuzNRq3iN8SYsESldCJB49/x+FVsW7T3w2t/ZNgb/tfLLSZyP1KhGmSDDAN9Q8qgqOrBAnKt7YpwL8=
X-Received: by 2002:a17:906:4d50:b0:70d:afd4:1e63 with SMTP id
 b16-20020a1709064d5000b0070dafd41e63mr28194480ejv.618.1654704871589; Wed, 08
 Jun 2022 09:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-12-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-12-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:14:19 -0700
Message-ID: <CABXOdTcg0mThL_rgNWtAs4izk8mWUiQ4+86TpKF8VhvgL3+1sA@mail.gmail.com>
Subject: Re: [PATCH v3 11/23] platform/chrome: cros_ec_proto: add Kunit test
 for getting legacy info
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_proto_info_legacy() expects to receive
> sizeof(struct ec_response_hello) from send_command().  The payload is
> valid only if the return value is positive.
>
> Add a Kunit test for returning 0 from send_command() in
> cros_ec_get_proto_info_legacy().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No v2.  New and separated from the original series.
>
>  drivers/platform/chrome/cros_ec_proto_test.c | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 8e47cb70dc8b..63071af81c94 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -751,6 +751,54 @@ static void cros_ec_proto_test_query_all_legacy_data_error(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_query_all_legacy_return0(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +
> +       /* For cros_ec_get_proto_info() without passthru. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_INVALID_COMMAND, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       /* For cros_ec_get_proto_info_legacy(). */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       cros_ec_proto_test_query_all_pretest(test);
> +       ret = cros_ec_query_all(ec_dev);
> +       KUNIT_EXPECT_EQ(test, ret, -EPROTO);
> +       KUNIT_EXPECT_EQ(test, ec_dev->proto_version, EC_PROTO_VERSION_UNKNOWN);
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
> +       /* For cros_ec_get_proto_info_legacy(). */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_HELLO);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_hello));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, sizeof(struct ec_params_hello));
> +       }
> +}
> +
>  static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
>  {
>         struct cros_ec_proto_test_priv *priv = test->priv;
> @@ -1135,6 +1183,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_xfer_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return_error),
>         KUNIT_CASE(cros_ec_proto_test_query_all_legacy_data_error),
> +       KUNIT_CASE(cros_ec_proto_test_query_all_legacy_return0),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_mkbp),
>         KUNIT_CASE(cros_ec_proto_test_query_all_no_host_sleep),
>         KUNIT_CASE(cros_ec_proto_test_query_all_default_wake_mask_return_error),
> --
> 2.36.1.255.ge46751e96f-goog
>
