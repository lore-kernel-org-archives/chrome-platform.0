Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C31715B8
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OdyDlipv"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4195fe5cf73so109421cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 04 Oct 2023 19:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696472209; x=1697077009; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54B0QZl2L4MvI3KImOqn8i3CiKGuqRfuG+f8aVUx2rw=;
        b=OdyDlipvg9cYaJ7qvHZG/bvGklL4YFFc8fZ0bln9ukE45AUa7nsNuc1QCUk8le+jQw
         /TRXFyJcSs4rli+Z4Whk/wSwVvmk0KXnkY0MEaJaYK0VkJgqqv0B0plR0chSDg/XrwQH
         FKK+TXXB76l80DJEm8rWWC42zrtPP8z/ERKkjxzSHRLFxVOTOrlN/O3gdTz8gVHNq8YI
         D8NSBs1kKa2L7w6Q20mRHfUYxgW6RFon+7tVZrsfnNrEEkgjig24nHpC3peJXIaeoTFD
         b3VJWZTRT1D1V+4h5+KOQ8+oxTMXeNTANtLLn5wMaBKU3Bd5YR3DywQ75XawIHDyrnCN
         t4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696472209; x=1697077009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54B0QZl2L4MvI3KImOqn8i3CiKGuqRfuG+f8aVUx2rw=;
        b=mcHHVUR+yd6sgN+EeTE9ogScArXZd4QbbZAFERTIhMtBk1oO5gBFf/qzmJX+0paNxu
         lexzp50VrhbP4dCQyeuZYHcTIKX5qQ97afycfVs50ojQT8hs9S6ih++0rsfyLq7wWogH
         o3JsEZWRs72i3Cl9r0WeSgBmZNtqidu1h2lxPntKJcO7t0AhlpCIc4CZfnKhpuXaUXTo
         dbnEC8FMRPzEjCi/sBnZ07z804ZOpg4y3P/h5Y0Mul8ulvVUWXBF0G/LOgpOEvqIS8sz
         lGMGBKO19woPXbnqYDTWzRnyj7Fj+glbAnWrapLAbqloqBOOjbcK9Yzp4xDkeh1rvnXx
         hjvg==
X-Gm-Message-State: AOJu0Yz0v87j11Yv7LRGe+WGHUOwGEEEC/pOEvLt6NC+fTipgxnSOkwy
	z4gnqCcBUax26Q23H3uzxcSEbuuEUVroqFPk7BSz6g==
X-Google-Smtp-Source: AGHT+IHLgl0cQ6fDoze5pVP/nWzbcK+dXytAgiXDcy57x0i5AXQxCNdI1pTx/+X40A0AbUompjk9vDSG27UL57lvLac=
X-Received: by 2002:a05:622a:646:b0:417:cd34:2a7b with SMTP id
 a6-20020a05622a064600b00417cd342a7bmr206qtb.3.1696472208795; Wed, 04 Oct 2023
 19:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003080515.4011374-1-tzungbi@kernel.org>
In-Reply-To: <20231003080515.4011374-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 4 Oct 2023 19:16:37 -0700
Message-ID: <CABXOdTd0ezjjfPDe+7cN_1jkH-DJcdu8WVWUPXHyL7UUwn-rhA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: kunit: make EC protocol tests independent
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 1:05=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Remove CONFIG_CROS_KUNIT and common code concept for ChromeOS Kunit but
> make it bundle to ChromeOS EC protocol tests.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/Kconfig                             | 6 +++---
>  drivers/platform/chrome/Makefile                            | 5 ++---
>  drivers/platform/chrome/cros_ec_proto_test.c                | 2 +-
>  .../chrome/{cros_kunit_util.c =3D> cros_ec_proto_test_util.c} | 4 +---
>  .../chrome/{cros_kunit_util.h =3D> cros_ec_proto_test_util.h} | 0
>  5 files changed, 7 insertions(+), 10 deletions(-)
>  rename drivers/platform/chrome/{cros_kunit_util.c =3D> cros_ec_proto_tes=
t_util.c} (98%)
>  rename drivers/platform/chrome/{cros_kunit_util.h =3D> cros_ec_proto_tes=
t_util.h} (100%)
>
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kc=
onfig
> index 7d82a0946e1c..7a83346bfa53 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -299,12 +299,12 @@ config CROS_TYPEC_SWITCH
>  source "drivers/platform/chrome/wilco_ec/Kconfig"
>
>  # Kunit test cases
> -config CROS_KUNIT
> -       tristate "Kunit tests for ChromeOS" if !KUNIT_ALL_TESTS
> +config CROS_KUNIT_EC_PROTO_TEST
> +       tristate "Kunit tests for ChromeOS EC protocol" if !KUNIT_ALL_TES=
TS
>         depends on KUNIT && CROS_EC
>         default KUNIT_ALL_TESTS
>         select CROS_EC_PROTO
>         help
> -         ChromeOS Kunit tests.
> +         Kunit tests for ChromeOS EC protocol.
>
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/M=
akefile
> index 9e26e45c4a37..2dcc6ccc2302 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -36,6 +36,5 @@ obj-$(CONFIG_CROS_USBPD_NOTIFY)               +=3D cros=
_usbpd_notify.o
>  obj-$(CONFIG_WILCO_EC)                 +=3D wilco_ec/
>
>  # Kunit test cases
> -obj-$(CONFIG_CROS_KUNIT)               +=3D cros_kunit.o
> -cros_kunit-objs                                :=3D cros_kunit_util.o
> -cros_kunit-objs                                +=3D cros_ec_proto_test.o
> +obj-$(CONFIG_CROS_KUNIT_EC_PROTO_TEST) +=3D cros_kunit_proto_test.o
> +cros_kunit_proto_test-objs             :=3D cros_ec_proto_test_util.o cr=
os_ec_proto_test.o
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platf=
orm/chrome/cros_ec_proto_test.c
> index 5b9748e0463b..28f722396fc1 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -11,7 +11,7 @@
>  #include <linux/platform_data/cros_ec_proto.h>
>
>  #include "cros_ec.h"
> -#include "cros_kunit_util.h"
> +#include "cros_ec_proto_test_util.h"
>
>  #define BUFSIZE 512
>
> diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform=
/chrome/cros_ec_proto_test_util.c
> similarity index 98%
> rename from drivers/platform/chrome/cros_kunit_util.c
> rename to drivers/platform/chrome/cros_ec_proto_test_util.c
> index f0fda96b11bd..65d328bcd6eb 100644
> --- a/drivers/platform/chrome/cros_kunit_util.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test_util.c
> @@ -11,7 +11,7 @@
>  #include <linux/platform_data/cros_ec_proto.h>
>
>  #include "cros_ec.h"
> -#include "cros_kunit_util.h"
> +#include "cros_ec_proto_test_util.h"
>
>  int cros_kunit_ec_xfer_mock_default_result;
>  int cros_kunit_ec_xfer_mock_default_ret;
> @@ -126,5 +126,3 @@ void cros_kunit_mock_reset(void)
>         cros_kunit_readmem_mock_data =3D NULL;
>         cros_kunit_readmem_mock_ret =3D 0;
>  }
> -
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/chrome/cros_kunit_util.h b/drivers/platform=
/chrome/cros_ec_proto_test_util.h
> similarity index 100%
> rename from drivers/platform/chrome/cros_kunit_util.h
> rename to drivers/platform/chrome/cros_ec_proto_test_util.h
> --
> 2.42.0.582.g8ccd20d70d-goog
>
