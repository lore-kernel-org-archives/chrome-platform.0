Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2646D4C6D
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 13:01:59 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id x125so16172680vsb.13
        for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AW46xL7r4jS0thdYzx3ynnITVHQeuO0nmP7MJbVua4g=;
        b=UjphxVnACeKxMDkdkSpppTnv3Y5JsowXe3Vk2CQH5ab7IcK0HMW6+PDwch69NTPE90
         SO31hXKWXClODMcnlsODgiAxn5DdX8L/0AIYR+XNYn7iDUx1eG66e0GYeFqV5oYZU9bI
         H+KYBUej4MNPzQC5UzbNbHu3aqqLb0vTDmIL1UaCBxqyXkajWxC06U6hmbZcFnll5wgP
         rQWL2Ih3mDjPeMEidj11cneVolYSWDbVADEnHZlFzxpkgZdJVP/0q2fXOL8THUpxN/Zu
         P8BmNnmWkk8HuXFF9gWVA1hee3jLUNpjQKE8RhOkqMs2yvAWEi6ehxH0B27Jnl7KPNto
         jjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AW46xL7r4jS0thdYzx3ynnITVHQeuO0nmP7MJbVua4g=;
        b=HaolFXNdhKpB4Dj86UoN5HF3qeL8f2tJX4rifGGNMrxdYbQoSFOaXSpoxkKM4A2M8M
         MZQDUcxJ8WBvIPViyt+RpoSW+Nzyel6bZ6pI4oINaStumfHSvGJNheCvnANtbDt0/SO6
         P1QgNrmzELf8dts4e/RQUG7H5h7ZLVcIczk3A18eC5Wmt1IIuHmoHx36t5GohDH9/P+0
         iZks/N/AN/F1XUO1RhznLSUKX6K27RD73tHq+ghnOa1uIkE/c0KG8Fu2fdUuzIkvNrYs
         hQ2uMglFf8KXfhmAtJx5xkre0ivUdJiHyjJNmNLAEpOTJLNeW+vaG3ILAPDwgW50b2yk
         1auQ==
X-Gm-Message-State: AJIora9V4YchVtDBrjSwObq/6KfB+2LTlutFQe8v1TMC5HHk0K8CPzQ8
	TeVWsgF541sLXCgmOZUo3XD913kBk6OmhwCs3A5KbA==
X-Google-Smtp-Source: AGRyM1uMt6EDGuK4a9s9RLh37JSOOK05JUZjiWDWMgJ/zX5bCT7ENqOa88xinWs40uClNk1xzyirSW6dovQho84hDns=
X-Received: by 2002:a05:6102:3d25:b0:357:7f34:2664 with SMTP id
 i37-20020a0561023d2500b003577f342664mr12451410vsv.45.1658322117639; Wed, 20
 Jul 2022 06:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720044754.4026295-1-tzungbi@kernel.org> <20220720044754.4026295-2-tzungbi@kernel.org>
In-Reply-To: <20220720044754.4026295-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 20 Jul 2022 06:01:46 -0700
Message-ID: <CABXOdTf-9WWc30WC6r7YjTnp7SGS-skJLTgLUaaqHVcCnx=fYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: merge Kunit utils and test cases
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 9:48 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Merge CROS_KUNIT and CROS_EC_PROTO_KUNIT_TEST so that when they're built
> as modules cros_kunit_util doesn't need to export the symbols.
>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/Kconfig           | 10 ++--------
>  drivers/platform/chrome/Makefile          |  5 +++--
>  drivers/platform/chrome/cros_kunit_util.c | 14 --------------
>  3 files changed, 5 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index cae859f0bc06..c45fb376d653 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -269,17 +269,11 @@ source "drivers/platform/chrome/wilco_ec/Kconfig"
>
>  # Kunit test cases
>  config CROS_KUNIT
> -       tristate
> -       help
> -         ChromeOS Kunit.
> -
> -config CROS_EC_PROTO_KUNIT_TEST
> -       tristate "Kunit tests for ChromeOS EC protocol" if !KUNIT_ALL_TESTS
> +       tristate "Kunit tests for ChromeOS" if !KUNIT_ALL_TESTS
>         depends on KUNIT && CROS_EC
>         default KUNIT_ALL_TESTS
>         select CROS_EC_PROTO
> -       select CROS_KUNIT
>         help
> -         Kunit tests for the ChromeOS Embedded Controller protocol.
> +         ChromeOS Kunit tests.
>
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index a06bc56d12a8..f7e74a845afc 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -32,5 +32,6 @@ obj-$(CONFIG_CROS_USBPD_NOTIFY)               += cros_usbpd_notify.o
>  obj-$(CONFIG_WILCO_EC)                 += wilco_ec/
>
>  # Kunit test cases
> -obj-$(CONFIG_CROS_KUNIT)               += cros_kunit_util.o
> -obj-$(CONFIG_CROS_EC_PROTO_KUNIT_TEST) += cros_ec_proto_test.o
> +obj-$(CONFIG_CROS_KUNIT)               += cros_kunit.o
> +cros_kunit-objs                                := cros_kunit_util.o
> +cros_kunit-objs                                += cros_ec_proto_test.o
> diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform/chrome/cros_kunit_util.c
> index d37c334b416d..090927d43035 100644
> --- a/drivers/platform/chrome/cros_kunit_util.c
> +++ b/drivers/platform/chrome/cros_kunit_util.c
> @@ -14,11 +14,8 @@
>  #include "cros_kunit_util.h"
>
>  int cros_kunit_ec_xfer_mock_default_ret;
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_ret);
>  int cros_kunit_ec_cmd_xfer_mock_called;
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_cmd_xfer_mock_called);
>  int cros_kunit_ec_pkt_xfer_mock_called;
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_pkt_xfer_mock_called);
>
>  static struct list_head cros_kunit_ec_xfer_mock_in;
>  static struct list_head cros_kunit_ec_xfer_mock_out;
> @@ -48,27 +45,23 @@ int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_comman
>
>         return mock->ret;
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock);
>
>  int cros_kunit_ec_cmd_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>  {
>         ++cros_kunit_ec_cmd_xfer_mock_called;
>         return cros_kunit_ec_xfer_mock(ec_dev, msg);
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_cmd_xfer_mock);
>
>  int cros_kunit_ec_pkt_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>  {
>         ++cros_kunit_ec_pkt_xfer_mock_called;
>         return cros_kunit_ec_xfer_mock(ec_dev, msg);
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_pkt_xfer_mock);
>
>  struct ec_xfer_mock *cros_kunit_ec_xfer_mock_add(struct kunit *test, size_t size)
>  {
>         return cros_kunit_ec_xfer_mock_addx(test, size, EC_RES_SUCCESS, size);
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_add);
>
>  struct ec_xfer_mock *cros_kunit_ec_xfer_mock_addx(struct kunit *test,
>                                                   int ret, int result, size_t size)
> @@ -91,7 +84,6 @@ struct ec_xfer_mock *cros_kunit_ec_xfer_mock_addx(struct kunit *test,
>
>         return mock;
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_addx);
>
>  struct ec_xfer_mock *cros_kunit_ec_xfer_mock_next(void)
>  {
> @@ -103,14 +95,10 @@ struct ec_xfer_mock *cros_kunit_ec_xfer_mock_next(void)
>
>         return mock;
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_next);
>
>  int cros_kunit_readmem_mock_offset;
> -EXPORT_SYMBOL_GPL(cros_kunit_readmem_mock_offset);
>  u8 *cros_kunit_readmem_mock_data;
> -EXPORT_SYMBOL_GPL(cros_kunit_readmem_mock_data);
>  int cros_kunit_readmem_mock_ret;
> -EXPORT_SYMBOL_GPL(cros_kunit_readmem_mock_ret);
>
>  int cros_kunit_readmem_mock(struct cros_ec_device *ec_dev, unsigned int offset,
>                             unsigned int bytes, void *dest)
> @@ -121,7 +109,6 @@ int cros_kunit_readmem_mock(struct cros_ec_device *ec_dev, unsigned int offset,
>
>         return cros_kunit_readmem_mock_ret;
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_readmem_mock);
>
>  void cros_kunit_mock_reset(void)
>  {
> @@ -135,6 +122,5 @@ void cros_kunit_mock_reset(void)
>         cros_kunit_readmem_mock_data = NULL;
>         cros_kunit_readmem_mock_ret = 0;
>  }
> -EXPORT_SYMBOL_GPL(cros_kunit_mock_reset);
>
>  MODULE_LICENSE("GPL");
> --
> 2.37.0.170.g444d1eabd0-goog
>
