Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2F4A00
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 18:16:34 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ss3so15255063ejc.11
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 11:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncNTnSyyHX2VTcK/5a+3RxtAnZS3Eiu/HYYWKWm5tqk=;
        b=d+ahix7JcEXFi1nCKUaO270dPP5Gkcbc8fr4FdUEJqZ14KEunHgDh3euSMzf5FShlN
         SFDKz7Xd7f4Kz0Dpr9CCICsrZ1C5sIJ3V+DTysNAFniDi9omM/KVgs8J8pz4Y1+ysVHl
         B0AfFrQkGKgoT4WovgJ3nFKpXjmKh9I/3o+sUVb7JW8c8kOGpZfwpGNRBkGMpH83IGed
         BfkxeRLJqN/3vYwwg4GnlIIElMx82l70UhHfl8lyXzbfgeIMUI1qZgkNsRtLADMQphVo
         oIY5FwVXb7zi8w/KdUXQo+5uBx43Bq8XRcc3tZhanvJkOjnF4f7YJXiYiUj46F1JjW4u
         ROkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncNTnSyyHX2VTcK/5a+3RxtAnZS3Eiu/HYYWKWm5tqk=;
        b=ae/4KtgxPFPEIIC7Q3osCxHLVHIMTRcjStufpaz3EZnsCakVRyl2oXCgUTAYKw5d9n
         Bl2ES8Iskwuz+Umj2UcvpCC5xEaY5ih5MaPTX8VhEMpF38oO/nYy3C9Na1BGkbPb85Di
         vUjsi8tvF4plPGVzmAcd5U1iJCKKAaYE81+Hu+IHlrKY5Dd/A6XO6sRhdSiIORog14Ai
         d3rcYegengndnlZ/sQORwHAUyTwmXMfsJ3CQJGI/HdRg8T63ZM8boFgO1HMEr79uyUwm
         blukcF5HlcoZExNhT4EbiXEfeXq2Y+irB5yOYCNIWIOYxwkyQCBXuOa7UBzSgZKWpOW5
         Pp9Q==
X-Gm-Message-State: AJIora/qSJ8Zd+CNOsE41FyzWijD1pm4+SQyxBd3YrnlFLGBSZywaCpY
	2rHMsY0ec7GNsRtkE7fSemcSvW8W7ja/3/1L+ysBUQ==
X-Google-Smtp-Source: AGRyM1sH0nSfuYL+3mf0INCiKCLD2n9ZcPY/cIny3nLwPEs8TXfhKQaFxML+tKuumf7uEZZqIgpTV07KVdi1L0//cPA=
X-Received: by 2002:a17:907:a06f:b0:72b:564c:465b with SMTP id
 ia15-20020a170907a06f00b0072b564c465bmr4785902ejc.344.1657736192657; Wed, 13
 Jul 2022 11:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628024913.1755292-1-tzungbi@kernel.org> <20220628024913.1755292-7-tzungbi@kernel.org>
In-Reply-To: <20220628024913.1755292-7-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 13 Jul 2022 11:16:21 -0700
Message-ID: <CABXOdTcS25n5u0PyZTC2Exs8wLc1-1WRMTJhgwAjpsbCby_dcg@mail.gmail.com>
Subject: Re: [RESEND PATCH 06/11] platform/chrome: cros_ec_proto: change Kunit
 expectation when timed out
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> While EC_COMMS_STATUS_PROCESSING flag is still on after it tries
> EC_COMMAND_RETRIES times for sending EC_CMD_GET_COMMS_STATUS,
> cros_ec_wait_until_complete() doesn't return an error code.
>
> Change the expectation to an error code.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 64100fd81c6a..fbb872040711 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -1870,9 +1870,7 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_retries_status_processing(st
>         }
>
>         ret = cros_ec_cmd_xfer(ec_dev, &msg);
> -       KUNIT_EXPECT_EQ(test, ret, sizeof(struct ec_response_get_comms_status));
> -
> -       KUNIT_EXPECT_EQ(test, msg.result, EC_RES_SUCCESS);
> +       KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
>
>         /* For EC_CMD_GET_COMMS_STATUS EC_COMMAND_RETRIES times. */
>         KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 51);
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
