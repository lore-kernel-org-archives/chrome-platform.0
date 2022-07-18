Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5091C07
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 13:35:55 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id fy29so20126036ejc.12
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLZfMItbgnFH20Ojb6+L7ZjShSWcxZycIztS3QeVtXU=;
        b=RLtIfACKMzTN0tJfrUf3+G0s3unNigLq9BwxSQ0Sj4fwufYxI/xc9A2oZmv/wiOE+N
         tK0b5hoxVJ+cFZ1H9o82+e4frzQOT+LLX5K54hawsa7IwoD1RBbNZbkAHQoHsatuUsW7
         w+9xZ1N13eivY/xwrBfFY5krHpPnEkXOelWNK44QMDBzP4pyIsCzjtmbN/yV+glWZgpR
         nuxtJdmfG5P6aBUFLnbxLJwW4BMjJHY12RcEtfSc74NvdNEQnikayUjN0/zmgFlSFTzG
         h9W9X/z8z3WSfeI8OaPlsV9Ob6hPd9gKmW0tjQ0dMXDzQsSFjXzJOrHQXZUXBhIH3Y8U
         bMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLZfMItbgnFH20Ojb6+L7ZjShSWcxZycIztS3QeVtXU=;
        b=aOPv2bTX5TvLOdwxcX4CZ/BxwTYAQeGgoM0/YQnY0xisv37W9NTh02hPzvbAyFWfPA
         wR5KDVrchEhMqnZMSQsJnsNkwzRLJRHb/H+SsAAWpsRzRW/mJmIYtIKXP90DA/7mt6p5
         UquvPGBXoSSHiTMWPYL4Ei/F1NPvtZIG9XaLNT0b0FmTwnTZveSc/NNMrEBUzNbNjrf0
         xekYDmC7IWdbKW10RG4SCzGNq2Fd+cAk2fR2CUBWfC8hnBKj4H3M5Zs3cvojKcTOMfi5
         sj5pp4f57QkBnuFPEUi2/hTVrUqoi9TvpA5qDrRA7Oq04atBDyLolHAfNg7SxVP3ayGI
         CftA==
X-Gm-Message-State: AJIora8MqyZWCHC2ep2VTGOpab+OfroKIDEce52mT6fsbwEGZ5n4bYdS
	R0XK3UD4CTGExrdzNjy3QsVAgRrg1r3+xZRofJvuqg==
X-Google-Smtp-Source: AGRyM1vVcwbBDP2kEY0e/gmWy62ZPHbdF1a6M5U7XHIIbXVOkWsVPLzxeIK/H2PIsBow6eepKC9XPEzZQCPheFA0o5k=
X-Received: by 2002:a17:907:6d12:b0:72b:6e70:8c7d with SMTP id
 sa18-20020a1709076d1200b0072b6e708c7dmr27063567ejc.23.1658151353762; Mon, 18
 Jul 2022 06:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718050914.2267370-1-tzungbi@kernel.org> <20220718050914.2267370-2-tzungbi@kernel.org>
In-Reply-To: <20220718050914.2267370-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 18 Jul 2022 06:35:42 -0700
Message-ID: <CABXOdTfYAGapjkPxRC4SbKMKEwCWmrF46aEDFWvsMBqaTuCzPA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] platform/chrome: cros_kunit_util: add default
 value for `msg->result`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 17, 2022 at 10:10 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Add default value for `msg->result` so that it won't be garbage bytes
> when the mock list is empty.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> No v1.  New in the series.
>
>  drivers/platform/chrome/cros_kunit_util.c | 7 ++++++-
>  drivers/platform/chrome/cros_kunit_util.h | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform/chrome/cros_kunit_util.c
> index e031777dea87..6810d558d462 100644
> --- a/drivers/platform/chrome/cros_kunit_util.c
> +++ b/drivers/platform/chrome/cros_kunit_util.c
> @@ -13,6 +13,8 @@
>  #include "cros_ec.h"
>  #include "cros_kunit_util.h"
>
> +int cros_kunit_ec_xfer_mock_default_result;
> +EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_result);

Is this needed as a global variable and, if so, does it really have to
be exported ?

>  int cros_kunit_ec_xfer_mock_default_ret;
>  EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_ret);

Same here, really, only I didn't notice before.

Thanks,
Guenter

>
> @@ -24,8 +26,10 @@ int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_comman
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
> @@ -89,6 +93,7 @@ EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_next);
>
>  void cros_kunit_mock_reset(void)
>  {
> +       cros_kunit_ec_xfer_mock_default_result = 0;
>         cros_kunit_ec_xfer_mock_default_ret = 0;
>         INIT_LIST_HEAD(&cros_kunit_ec_xfer_mock_in);
>         INIT_LIST_HEAD(&cros_kunit_ec_xfer_mock_out);
> diff --git a/drivers/platform/chrome/cros_kunit_util.h b/drivers/platform/chrome/cros_kunit_util.h
> index 79c4525f873c..79c4f259f2bb 100644
> --- a/drivers/platform/chrome/cros_kunit_util.h
> +++ b/drivers/platform/chrome/cros_kunit_util.h
> @@ -23,6 +23,7 @@ struct ec_xfer_mock {
>         u32 o_data_len;
>  };
>
> +extern int cros_kunit_ec_xfer_mock_default_result;
>  extern int cros_kunit_ec_xfer_mock_default_ret;
>
>  int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_command *msg);
> --
> 2.37.0.170.g444d1eabd0-goog
>
