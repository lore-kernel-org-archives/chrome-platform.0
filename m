Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A71C30
	for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 16:36:28 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eq6so21995548edb.6
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lqBcVsfxOKYQ/ByCyoavPTpdHhI26R+jJ+6WpVNfFY=;
        b=GHBY9CCMAqDWxTokSvkIj6qjqb6IC7PLd65SFJbJa8q+W0uj/OzzEO7mnSmKaoyqFk
         gnARvMB4INeNS0CEkyPUnhy1XrGIKmPVwexjgxrsG304XD7NgJ7N782LwJzkhvL2gsHc
         GKNR+autfR1yo293JGOp5lS3Eaz8Dupc/Lc8I8/4ZShQNOPsG4OmQpKg6XY397Rxw3ve
         qnNJkUCYxC8pn7kAVOMLbImRlAqJPuXOo07FARaXqQl8l2vQ81+CQLgfWqLwcQTDDjKF
         On2XrT+0CUZ8f3epypZxbK2KzecWSwzqo9JYvoU4m48WBci6LenYYXBjZ5b+xgSe9Hb9
         IXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lqBcVsfxOKYQ/ByCyoavPTpdHhI26R+jJ+6WpVNfFY=;
        b=bvxmkwGFqITVj8rkVV8Km+dniMZDwqersL/mVPyWEuuP/o1qFXLEgw9SXJlsXnPr4d
         OrKoITO8PPW5y49h0jy9yZ7aP9fTU0Ke8urzDmOGy6R3bXtwkkB2Ccvg9YcxMEdq3Nea
         lCQoUzY2QD9vyeLTkNiEpppsItRncbd9V9V8zmECYISc44YXB137annRWmie49tz8msK
         u3qhXKMBZhI5eos9DsOKk6i9dUJD7fJSf4iqZhrq7O5F9C6pFpW9SPy6qZ/fHbHkRx/h
         VM4S1w9cQBDQ9HDexQCDMhUgBGsypqpYsKlrgaXsFf+UX0Ut5HaL0psE1zIPIR5PzB3E
         CYww==
X-Gm-Message-State: AJIora/+fTfe667qqbB7I96SoeEdzhN0yhZtWFPIDSJQoNYlhj6Zw0EL
	d7GmVtbn1XmdTBYnygfkI20se0KeLQ8qfp77JslFrA==
X-Google-Smtp-Source: AGRyM1vRc2HnzFsusmUvfs2f4IEsojy+FS8mMbAUT5AID6ONZKfbCZjTAcW2H4tEvSRoVeCVg9S4MMd3lGz2HbQdTlw=
X-Received: by 2002:a05:6402:3487:b0:435:b0d2:606e with SMTP id
 v7-20020a056402348700b00435b0d2606emr10787936edc.66.1656002186757; Thu, 23
 Jun 2022 09:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220622041040.202737-1-tzungbi@kernel.org> <20220622041040.202737-2-tzungbi@kernel.org>
In-Reply-To: <20220622041040.202737-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 23 Jun 2022 09:36:15 -0700
Message-ID: <CABXOdTf=G4hWfvS-Pt+mHUnXzX7Sz9Z-LE_TBSBB2rpEwhfMUw@mail.gmail.com>
Subject: Re: [PATCH 1/7] platform/chrome: cros_ec_proto: add Kunit tests for cmd_xfer_status
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_cmd_xfer_status() calls cros_ec_cmd_xfer() and cros_ec_map_error().
>
> Given that there are already test cases for cros_ec_cmd_xfer(), only add
> basic Kunit tests for cros_ec_cmd_xfer_status().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 42 ++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 7d45e5022221..6464f6101fd3 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -1964,6 +1964,46 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_return0(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
>  }
>
> +static void cros_ec_proto_test_cmd_xfer_status_normal(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +       struct cros_ec_command msg;
> +
> +       memset(&msg, 0, sizeof(msg));
> +
> +       /* For cros_ec_cmd_xfer(). */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_add(test, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       ret = cros_ec_cmd_xfer_status(ec_dev, &msg);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static void cros_ec_proto_test_cmd_xfer_status_xfer_error(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +       struct cros_ec_command msg;
> +
> +       memset(&msg, 0, sizeof(msg));
> +
> +       /* For cros_ec_cmd_xfer(). */
> +       {
> +               mock = cros_kunit_ec_xfer_mock_addx(test, -EPROTO, EC_RES_SUCCESS, 0);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +       }
> +
> +       ret = cros_ec_cmd_xfer_status(ec_dev, &msg);
> +       KUNIT_EXPECT_EQ(test, ret, -EPROTO);
> +}
> +
>  static void cros_ec_proto_test_release(struct device *dev)
>  {
>  }
> @@ -2044,6 +2084,8 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_xfer_error),
>         KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return_error),
>         KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_return0),
> +       KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_normal),
> +       KUNIT_CASE(cros_ec_proto_test_cmd_xfer_status_xfer_error),
>         {}
>  };
>
> --
> 2.37.0.rc0.104.g0611611a94-goog
>
