Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134F4C6D
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 13:02:38 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id d187so16222914vsd.10
        for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1ADlbcOE17NYUMjiVagDfq4PUxtl1uXmumEQgrN0ns=;
        b=jvD6x40J3yho1JCQqEblcfudZ/i3pFzH6EP0raY01ry+4aGebg1QdnwCVsATMnrGyJ
         NrQyyemO5XLsKz3yCkJXo/jXEvrgVEyiSjrqK07Wv9mqS1zAajXiw203GIHggPqZEXKm
         iQyRezph1eQMpSTOu85fh1VHUZh2R/WKMgzx08STdgwYelol59Xuq/C3qjyxIak8Ypam
         Q/pd3+tvuLpov1NiSb1MZVfrhkNyI93Bal3j+nJdaCSFh1DS2YnDAYpe6WsIAXsHb1B3
         OyEkUJ1zn87tzp6BBE0Cyjm9XnkHKonjOuogXGDt+2sKSpRdpJ18yZSVaJBRQ78rp3Ka
         CP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1ADlbcOE17NYUMjiVagDfq4PUxtl1uXmumEQgrN0ns=;
        b=kCkWr6p7zzZ176QG3Z7jXJF0T1GT/ggugqKNJaAoBAX3NzS3rfTnX1Em7KIqgEcqZV
         lnEY+l8CWCtoF5Q3xNn1bgA4FFe+S7rrndSOFFlkbSUdYk9NtoP61/9FT6QbnwMAS3uH
         Rg0v7j04nAVsq/dOT17104sY3FOXD6SmP76BsnVY0ay45z2CTJvk78JbB5PdGuehYn9w
         PDJ+V7SpxyQtbMbwAzWEUYhMIfAb1sgwxp8ddAsFeJDC8YhCIawfYHBE9B77D0IluppF
         KfzIsGLXrRARgE/xNf91IHM6oxRwX/9wSrn2239/c997tk+Ewp+Tmh8ps3+MGGdF5iJo
         DCAw==
X-Gm-Message-State: AJIora9I2sczeNESGGylCf0UiQ2+47YhWr9pi6sSBLuiXkiliHgTCaL8
	9l5vvKayihfjSSO8XjyErvkuRn/aDyFIAvSBsCR2yQ==
X-Google-Smtp-Source: AGRyM1utT93d5kWPKobsQR1mFixnWNiywLDzDUUYqbQcLQ2ntUnx4AgebIkC27zZLeUIViUiVAOPEgijG2dG4dOw66w=
X-Received: by 2002:a05:6102:34d1:b0:357:ee01:3e64 with SMTP id
 a17-20020a05610234d100b00357ee013e64mr4095477vst.70.1658322157067; Wed, 20
 Jul 2022 06:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720044754.4026295-1-tzungbi@kernel.org> <20220720044754.4026295-3-tzungbi@kernel.org>
In-Reply-To: <20220720044754.4026295-3-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 20 Jul 2022 06:02:26 -0700
Message-ID: <CABXOdTeC5hNuP_k8Gj-0-2_vCECNJYVkt2qfy23P7tPKfWp3zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_kunit_util: add default value
 for `msg->result`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 9:48 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Add default value for `msg->result` so that it won't be garbage bytes
> when the mock list is empty.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_kunit_util.c | 6 +++++-
>  drivers/platform/chrome/cros_kunit_util.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform/chrome/cros_kunit_util.c
> index 090927d43035..f0fda96b11bd 100644
> --- a/drivers/platform/chrome/cros_kunit_util.c
> +++ b/drivers/platform/chrome/cros_kunit_util.c
> @@ -13,6 +13,7 @@
>  #include "cros_ec.h"
>  #include "cros_kunit_util.h"
>
> +int cros_kunit_ec_xfer_mock_default_result;
>  int cros_kunit_ec_xfer_mock_default_ret;
>  int cros_kunit_ec_cmd_xfer_mock_called;
>  int cros_kunit_ec_pkt_xfer_mock_called;
> @@ -25,8 +26,10 @@ int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_comman
>         struct ec_xfer_mock *mock;
>
>         mock = list_first_entry_or_null(&cros_kunit_ec_xfer_mock_in, struct ec_xfer_mock, list);
> -       if (!mock)
> +       if (!mock) {
> +               msg->result = cros_kunit_ec_xfer_mock_default_result;
>                 return cros_kunit_ec_xfer_mock_default_ret;
> +       }
>
>         list_del(&mock->list);
>
> @@ -112,6 +115,7 @@ int cros_kunit_readmem_mock(struct cros_ec_device *ec_dev, unsigned int offset,
>
>  void cros_kunit_mock_reset(void)
>  {
> +       cros_kunit_ec_xfer_mock_default_result = 0;
>         cros_kunit_ec_xfer_mock_default_ret = 0;
>         cros_kunit_ec_cmd_xfer_mock_called = 0;
>         cros_kunit_ec_pkt_xfer_mock_called = 0;
> diff --git a/drivers/platform/chrome/cros_kunit_util.h b/drivers/platform/chrome/cros_kunit_util.h
> index 88134c9f1acf..414002271c9c 100644
> --- a/drivers/platform/chrome/cros_kunit_util.h
> +++ b/drivers/platform/chrome/cros_kunit_util.h
> @@ -23,6 +23,7 @@ struct ec_xfer_mock {
>         u32 o_data_len;
>  };
>
> +extern int cros_kunit_ec_xfer_mock_default_result;
>  extern int cros_kunit_ec_xfer_mock_default_ret;
>  extern int cros_kunit_ec_cmd_xfer_mock_called;
>  extern int cros_kunit_ec_pkt_xfer_mock_called;
> --
> 2.37.0.170.g444d1eabd0-goog
>
