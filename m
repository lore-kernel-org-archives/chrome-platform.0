Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9AE1FB2
	for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 16:40:28 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id fi2so1321093ejb.9
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jun 2022 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1UW1A5iTJMy9XUHQDhdeFuCCBbHM+64IpJhXilvfwQ=;
        b=TbWRbkLkwMVYyzfyCVsrhUoZeTEmXG3Jwx8lZ8ny9vilG++0V0vPCbgJYQ0Gj3fRNH
         SGDlItoF7hdJBiqiEbERG0pV0c1OCS8cKZ7q/wF8aeqrOF4V0ti1T6ND5kmWcPgzA73c
         tQwH6N44WdoWO41l+yS2nQjo6/QO+FQ71EnmF5OV4L/ItIuxiEs3xOtCdiJXoujfmJRZ
         avSat2MhTJJugCwM3GiXdfDLNfY5tAFkc1budJZrpKId1fZTf2ACBOwrvQoygtau+zid
         lKu1dl92ry6qTkfiS3LGonHJEjrEsrU2iTnxWx8SL7WeYMVowprR5+PfBml1W4Pw4mqy
         d5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1UW1A5iTJMy9XUHQDhdeFuCCBbHM+64IpJhXilvfwQ=;
        b=fd+vV9oPcc4EXzvqbUNRWqe7sxs5QedEkrwCG+OBEQn1ro8CARXmAz0oLIweCPNKGL
         tCM+6bETfi+v9tVswtUutgpynMDnLezJyuw854mjchXkaAZmNi53U14zx7UHcyNFv5zK
         Uda8+Dm6lhD3zJ2gBcgWcBBw6kBpjl7SIV4q6YYgGiWY6KPHziwqrDmP+RDp0DGMHQhm
         Y3rYnh6mGBSPsUtX8FXSC/hXZxGjWG6VHhbucrYD3qN2WG7WYtqWekL2auvCUsbvYXEZ
         OrSQsjCOJPiYU/PK7l2MjP3U6e7kmbozvOz5wm5Um+gpZzibkojNrACJlSUcoK+YygcL
         cMTA==
X-Gm-Message-State: AJIora/D2H24ZeaDiB4DcMppjYJsjTBSwPEE0JN7xGP1wWdpriiQJG13
	J3RkpuosZ6V9lkGUhEkvs4RXfP+DnvJSvzd6HcI+dA==
X-Google-Smtp-Source: AGRyM1uZfCs+3tcv3oONPrGXLyHDbOIITA35SDt1mjZF4XZ5uphCKoXYKL/A5HjQUZz/Wtd7TrkGZJcg/Nt5jK+Vfps=
X-Received: by 2002:a17:907:72c5:b0:722:e515:fcc6 with SMTP id
 du5-20020a17090772c500b00722e515fcc6mr8761561ejc.533.1656002426525; Thu, 23
 Jun 2022 09:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220622041040.202737-1-tzungbi@kernel.org> <20220622041040.202737-8-tzungbi@kernel.org>
In-Reply-To: <20220622041040.202737-8-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 23 Jun 2022 09:40:15 -0700
Message-ID: <CABXOdTcQTWMWHyT5=Va1gijyLNsMSM8LQiNU79RWLH-1O4GhCg@mail.gmail.com>
Subject: Re: [PATCH 7/7] platform/chrome: cros_ec_proto: add Kunit test for cros_ec_cmd()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_cmd() is a wrapper of cros_ec_cmd_xfer_status().
>
> Add Kunit test for cros_ec_cmd().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 6b26ce3104f4..2ff2783fedfb 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2592,6 +2592,53 @@ static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
>         }
>  }
>
> +static void cros_ec_proto_test_ec_cmd(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct ec_xfer_mock *mock;
> +       int ret;
> +       u8 out[3], in[2];
> +
> +       ec_dev->max_request = 0xff;
> +       ec_dev->max_response = 0xee;
> +
> +       out[0] = 0xdd;
> +       out[1] = 0xcc;
> +       out[2] = 0xbb;
> +
> +       {
> +               u8 *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_add(test, 2);
> +               KUNIT_ASSERT_PTR_NE(test, mock, NULL);
> +
> +               data = (u8 *)mock->o_data;
> +               data[0] = 0xaa;
> +               data[1] = 0x99;
> +       }
> +
> +       ret = cros_ec_cmd(ec_dev, 0x88, 0x77, out, ARRAY_SIZE(out), in, ARRAY_SIZE(in));
> +       KUNIT_EXPECT_EQ(test, ret, 2);
> +
> +       {
> +               u8 *data;
> +
> +               mock = cros_kunit_ec_xfer_mock_next();
> +               KUNIT_EXPECT_PTR_NE(test, mock, NULL);
> +
> +               KUNIT_EXPECT_EQ(test, mock->msg.version, 0x88);
> +               KUNIT_EXPECT_EQ(test, mock->msg.command, 0x77);
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize, ARRAY_SIZE(in));
> +               KUNIT_EXPECT_EQ(test, mock->msg.outsize, ARRAY_SIZE(out));
> +
> +               data = (u8 *)mock->i_data;
> +               KUNIT_EXPECT_EQ(test, data[0], 0xdd);
> +               KUNIT_EXPECT_EQ(test, data[1], 0xcc);
> +               KUNIT_EXPECT_EQ(test, data[2], 0xbb);
> +       }
> +}
> +
>  static void cros_ec_proto_test_release(struct device *dev)
>  {
>  }
> @@ -2690,6 +2737,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
>         KUNIT_CASE(cros_ec_proto_test_get_sensor_count_normal),
>         KUNIT_CASE(cros_ec_proto_test_get_sensor_count_xfer_error),
>         KUNIT_CASE(cros_ec_proto_test_get_sensor_count_legacy),
> +       KUNIT_CASE(cros_ec_proto_test_ec_cmd),
>         {}
>  };
>
> --
> 2.37.0.rc0.104.g0611611a94-goog
>
