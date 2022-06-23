Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B741FB2
	for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 16:39:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o10so29360703edi.1
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X8CqJoRILL/dve2sT+WdutSeuBTUJjelySjg4TNgewk=;
        b=hjeDCAVUyq2c2N2zMhUW1OVixmztIYgy4ydCOn+R89OsiilOZyWkIi2CCds6CknrSb
         wyFk+2wKRoxbfzdhqPH9NTj93LVSOloSr6Tfnf2+R/WBBZNNGLSxkgyJJ7J4eqzfdTU2
         IvvoJ1ZCVS+Virc4OkimKoWeqLQInhZv2lmpM+5h4nil1oorcT6suS/bho/zZV1cqDkI
         QrLpM8uG49Tx6/LeaVUtyr54pKjGb5KkuFB1NkKQw0pYcxepBN2LIAoLx4YpKNmsN7UL
         4blGUXb4q1BiV3HbS44JPKrsJopW4oxkWuiN68F3S0kthRjSwgfoQpVhE/7MEXKuymfo
         nQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X8CqJoRILL/dve2sT+WdutSeuBTUJjelySjg4TNgewk=;
        b=Rx0yCu3R5EvjwflRWR20CZk5wFthj631ZfROsAtNqoXbf4puc/GWQGJ6lFZsr9M5iY
         C+l7ekGw3RVoOl+udQ2eFgOH31t9/r2wIFBTEXBEGS69yQ7aoFsvWoELuAnfFddRacgG
         JEpMH/qISIu3hKHNXFFmfx7XwW0T2l79ch9i7/aVzPucom2G+AAOrILQ8x5WlMaWMqaF
         ZMH8ISTaJnT8xp+y9WRnIpjh0wLpZtdI2dbhDQXjbOLFtn8dCWXZPv0WEU8CRaHa/wye
         PsfadVfufcVZ0sqmuAuiq+VWbVc5ZNcrgseOgVVsr8MULJ17a/Oav7VdR1jEPeNJJaRx
         /6Zw==
X-Gm-Message-State: AJIora9WZMMfPbHtYZDy20qjsJeE5hF8WpeQpKrfU2jGBiu+fu9i/ImH
	hrXP9c3Lggc2CtylXv2hYi5DrkwDlVpugawWQqbvWA==
X-Google-Smtp-Source: AGRyM1tCH/TvyxXOB2A7V379L6d7opgQwhQuwNpSrSBabVWygvVnu5CjYQVuWV4BD7ZGJdbNym2j6u1vMhjfqJ9ZIP4=
X-Received: by 2002:a05:6402:350e:b0:42f:b2c1:9393 with SMTP id
 b14-20020a056402350e00b0042fb2c19393mr11885456edd.11.1656002340976; Thu, 23
 Jun 2022 09:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220622041040.202737-1-tzungbi@kernel.org> <20220622041040.202737-6-tzungbi@kernel.org>
In-Reply-To: <20220622041040.202737-6-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 23 Jun 2022 09:38:49 -0700
Message-ID: <CABXOdTdBo=PAsj1r4f0uuqjvcMtBbhSQRF=_ERf4VvSX=SoctA@mail.gmail.com>
Subject: Re: [PATCH 5/7] platform/chrome: cros_ec_proto: add Kunit tests for check_features
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_check_features() gets EC features if it hasn't had cache, and
> checks whether the given EC_FEATURE_* is supported or not.
>
> Add Kunit tests for cros_ec_check_features().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 77 ++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index dce9fa3b9c8d..93c1700deaef 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2367,6 +2367,81 @@ static void cros_ec_proto_test_get_host_event_normal(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, ret, EC_HOST_EVENT_MASK(EC_HOST_EVENT_RTC));
>  }
>
> +static void cros_ec_proto_test_check_features_cached(struct kunit *test)
> +{
> +       int ret, i;
> +       struct cros_ec_dev ec;
> +
> +       ec.features.flags[0] = EC_FEATURE_MASK_0(EC_FEATURE_FINGERPRINT);
> +       ec.features.flags[1] = EC_FEATURE_MASK_0(EC_FEATURE_SCP);
> +
> +       for (i = 0; i < EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK; ++i) {
> +               ret = cros_ec_check_features(&ec, i);
> +               switch (i) {
> +               case EC_FEATURE_FINGERPRINT:
> +               case EC_FEATURE_SCP:
> +                       KUNIT_EXPECT_TRUE(test, ret);
> +                       break;
> +               default:
> +                       KUNIT_EXPECT_FALSE(test, ret);
> +                       break;
> +               }
> +       }
> +}
> +
> +static void cros_ec_proto_test_check_features_not_cached(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret, i;
> +       struct cros_ec_dev ec;
> +
> +       ec_dev->max_request = 0xff;
> +       ec_dev->max_response = 0xee;
> +       ec.ec_dev = ec_dev;
> +       ec.dev = ec_dev->dev;
> +       ec.cmd_offset = 0;
> +       ec.features.flags[0] = -1;
> +       ec.features.flags[1] = -1;
> +
> +       /* For EC_CMD_GET_FEATURES. */
> +       {
> +               struct ec_response_get_features *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               data = (struct ec_response_get_features *)mock->o_data;
> +               data->flags[0] = EC_FEATURE_MASK_0(EC_FEATURE_FINGERPRINT);
> +               data->flags[1] = EC_FEATURE_MASK_0(EC_FEATURE_SCP);
> +       }
> +
> +       for (i = 0; i < EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK; ++i) {
> +               ret = cros_ec_check_features(&ec, i);
> +               switch (i) {
> +               case EC_FEATURE_FINGERPRINT:
> +               case EC_FEATURE_SCP:
> +                       KUNIT_EXPECT_TRUE(test, ret);
> +                       break;
> +               default:
> +                       KUNIT_EXPECT_FALSE(test, ret);
> +                       break;
> +               }
> +       }
> +
> +       /* For EC_CMD_GET_FEATURES. */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_FEATURES);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(struct ec_response_get_features));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> +       }
> +}
> +
>  static void cros_ec_proto_test_release(struct device *dev)
>  {
>  }
> @@ -2460,6 +2535,8 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_get_host_event_not_host_event),
>         KUNIT_CASE(cros_ec_proto_test_get_host_event_wrong_event_size),
>         KUNIT_CASE(cros_ec_proto_test_get_host_event_normal),
> +       KUNIT_CASE(cros_ec_proto_test_check_features_cached),
> +       KUNIT_CASE(cros_ec_proto_test_check_features_not_cached),
>         {}
>  };
>
> --
> 2.37.0.rc0.104.g0611611a94-goog
>
