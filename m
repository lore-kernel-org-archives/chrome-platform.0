Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DE31FAB
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 16:23:47 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id er5so3651940edb.12
        for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkgXRv11TFmVpKw2VzXBq/69nT9VJwBF0ytd0D0jMdU=;
        b=AzcYi1Aax2AqUmzHRRQYPaKAztb43xqy6E2FTpO61ttPxFTwcZme0gTNXu1Im/rv+1
         hOmoTGIAnUPj44BQlsBfnaA5tIjhX4JnT315slCUCJ2QPqtQGTXXQiwaVHVuQaaa8owS
         dlOVt248YV0ntWxMB+3SjS71ab+fztIj4EFSSBQGadoTJf4RhxySfJNPcTLF2bwL4ckH
         h/Dca5kPGrMnPI/qrYTYfsul1O4Ym/h2Sv93JWx00Rgu7HWDLhGtweaEk2C6Ceq/J2Uh
         vo5AorQWdySJmgi0ir4pSA/K9/aiMh2OJUOaok7/i0AwM4RJLg4ECL4eiYKEa0fpARPy
         t4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkgXRv11TFmVpKw2VzXBq/69nT9VJwBF0ytd0D0jMdU=;
        b=it2EUc6GnIvGnpU1hKdLd0IVPe7JkNCbtqQmxT5uArGYUXIm3PLGAWr6sMV6PypazF
         qD32aP1AIFmRNl7EY3IxG0xFnEvK79gddo6Ho8u9zm31SVcsqjepPl3Vm+DP1K0PRqWA
         QiNTA+2V/8FCWpbljsiw25WmeRpH0wv6iZ3PJcNEPr1db2y1Blu0N7bhFEuaO45zObW+
         VM5w2FRREvEz7FJpkFO7v9rNEL1uqot25DTdM2wA4MJPOGjFNc/ophBQNLoVNzuKQu8s
         /mV2sZRzhsoUhujxL0YacxhX0B+PfQX4bALP3YBdpEGpokTDWRWAnBss7+B0rmDvHYaP
         ssOw==
X-Gm-Message-State: AOAM5328HbH1kGBhsKCLKT9M3ShSitnTBbC39wmdj8w3xUQxSgd9d2MO
	YOYxQQ2GnkEa8yFqOLFk0Tri7t7k6xDMF9g6N4wW5g==
X-Google-Smtp-Source: ABdhPJzNu5qj7p0x54i4idPlYMK/+w1vaBKs9Ocj7/f15YQs71O5pIUUDnFLmvb7IVjubtZ0QXr5t2wUC1YT9yfp33w=
X-Received: by 2002:a05:6402:2710:b0:427:d087:b with SMTP id
 y16-20020a056402271000b00427d087000bmr580960edd.11.1652891025935; Wed, 18 May
 2022 09:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220518091814.2028579-1-tzungbi@kernel.org> <20220518091814.2028579-2-tzungbi@kernel.org>
In-Reply-To: <20220518091814.2028579-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 18 May 2022 09:23:34 -0700
Message-ID: <CABXOdTf4QqNiCDpXvxYo8ya_9mjF+B1XdyfcxOWd8HP5_JcpjA@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_prepare_tx()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, 
	Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 2:18 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_prepare_tx() is used to fill the protocol headers according to
> the requested protocol version.
>
> Add Kunit tests cros_ec_prepare_tx() for each version.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/Kconfig              |   9 +
>  drivers/platform/chrome/Makefile             |   3 +
>  drivers/platform/chrome/cros_ec_proto_test.c | 173 +++++++++++++++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 drivers/platform/chrome/cros_ec_proto_test.c
>
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 717299cbccac..4b3d2427e8dd 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -267,4 +267,13 @@ config CHROMEOS_PRIVACY_SCREEN
>
>  source "drivers/platform/chrome/wilco_ec/Kconfig"
>
> +# Kunit test cases
> +config CROS_EC_PROTO_KUNIT_TEST
> +       tristate "Kunit tests for ChromeOS EC protocol" if !KUNIT_ALL_TESTS
> +       depends on KUNIT && CROS_EC
> +       default KUNIT_ALL_TESTS
> +       select CROS_EC_PROTO
> +       help
> +         Kunit tests for the ChromeOS Embedded Controller protocol.
> +
>  endif # CHROMEOS_PLATFORMS
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index 52f5a2dde8b8..3c380066c6b6 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -30,3 +30,6 @@ obj-$(CONFIG_CROS_USBPD_LOGGER)               += cros_usbpd_logger.o
>  obj-$(CONFIG_CROS_USBPD_NOTIFY)                += cros_usbpd_notify.o
>
>  obj-$(CONFIG_WILCO_EC)                 += wilco_ec/
> +
> +# Kunit test cases
> +obj-$(CONFIG_CROS_EC_PROTO_KUNIT_TEST) += cros_ec_proto_test.o
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> new file mode 100644
> index 000000000000..61abb18ac00b
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit tests for ChromeOS Embedded Controller protocol.
> + */
> +
> +#include <kunit/test.h>
> +
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
> +
> +#include "cros_ec.h"
> +
> +#define BUFSIZE 512
> +
> +struct cros_ec_proto_test_priv {
> +       struct cros_ec_device ec_dev;
> +       u8 dout[BUFSIZE];
> +       u8 din[BUFSIZE];
> +       struct cros_ec_command *msg;
> +       u8 _msg[BUFSIZE];
> +};
> +
> +static void cros_ec_proto_test_prepare_tx_legacy_normal(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct cros_ec_command *msg = priv->msg;
> +       int ret, i;
> +       u8 csum;
> +
> +       ec_dev->proto_version = 2;
> +
> +       msg->command = EC_CMD_HELLO;
> +       msg->outsize = EC_PROTO2_MAX_PARAM_SIZE;
> +       msg->data[0] = 0xde;
> +       msg->data[1] = 0xad;
> +       msg->data[2] = 0xbe;
> +       msg->data[3] = 0xef;
> +
> +       ret = cros_ec_prepare_tx(ec_dev, msg);
> +
> +       KUNIT_EXPECT_EQ(test, ret, EC_MSG_TX_PROTO_BYTES + EC_PROTO2_MAX_PARAM_SIZE);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[0], EC_CMD_VERSION0);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[1], EC_CMD_HELLO);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[2], EC_PROTO2_MAX_PARAM_SIZE);
> +       KUNIT_EXPECT_EQ(test, EC_MSG_TX_HEADER_BYTES, 3);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[EC_MSG_TX_HEADER_BYTES + 0], 0xde);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[EC_MSG_TX_HEADER_BYTES + 1], 0xad);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[EC_MSG_TX_HEADER_BYTES + 2], 0xbe);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[EC_MSG_TX_HEADER_BYTES + 3], 0xef);
> +       for (i = 4; i < EC_PROTO2_MAX_PARAM_SIZE; ++i)
> +               KUNIT_EXPECT_EQ(test, ec_dev->dout[EC_MSG_TX_HEADER_BYTES + i], 0);
> +
> +       csum = EC_CMD_VERSION0;
> +       csum += EC_CMD_HELLO;
> +       csum += EC_PROTO2_MAX_PARAM_SIZE;
> +       csum += 0xde;
> +       csum += 0xad;
> +       csum += 0xbe;
> +       csum += 0xef;
> +       KUNIT_EXPECT_EQ(test,
> +                       ec_dev->dout[EC_MSG_TX_HEADER_BYTES + EC_PROTO2_MAX_PARAM_SIZE],
> +                       csum);
> +}
> +
> +static void cros_ec_proto_test_prepare_tx_legacy_bad_msg_outsize(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct cros_ec_command *msg = priv->msg;
> +       int ret;
> +
> +       ec_dev->proto_version = 2;
> +
> +       msg->outsize = EC_PROTO2_MAX_PARAM_SIZE + 1;
> +
> +       ret = cros_ec_prepare_tx(ec_dev, msg);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static void cros_ec_proto_test_prepare_tx_normal(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct cros_ec_command *msg = priv->msg;
> +       struct ec_host_request *request = (struct ec_host_request *)ec_dev->dout;
> +       int ret, i;
> +       u8 csum;
> +
> +       msg->command = EC_CMD_HELLO;
> +       msg->outsize = 0x88;
> +       msg->data[0] = 0xde;
> +       msg->data[1] = 0xad;
> +       msg->data[2] = 0xbe;
> +       msg->data[3] = 0xef;
> +
> +       ret = cros_ec_prepare_tx(ec_dev, msg);
> +
> +       KUNIT_EXPECT_EQ(test, ret, sizeof(*request) + 0x88);
> +
> +       KUNIT_EXPECT_EQ(test, request->struct_version, EC_HOST_REQUEST_VERSION);
> +       KUNIT_EXPECT_EQ(test, request->command, EC_CMD_HELLO);
> +       KUNIT_EXPECT_EQ(test, request->command_version, 0);
> +       KUNIT_EXPECT_EQ(test, request->data_len, 0x88);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[sizeof(*request) + 0], 0xde);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[sizeof(*request) + 1], 0xad);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[sizeof(*request) + 2], 0xbe);
> +       KUNIT_EXPECT_EQ(test, ec_dev->dout[sizeof(*request) + 3], 0xef);
> +       for (i = 4; i < 0x88; ++i)
> +               KUNIT_EXPECT_EQ(test, ec_dev->dout[sizeof(*request) + i], 0);
> +
> +       csum = EC_HOST_REQUEST_VERSION;
> +       csum += EC_CMD_HELLO;
> +       csum += 0x88;
> +       csum += 0xde;
> +       csum += 0xad;
> +       csum += 0xbe;
> +       csum += 0xef;
> +       KUNIT_EXPECT_EQ(test, request->checksum, (u8)-csum);
> +}
> +
> +static void cros_ec_proto_test_prepare_tx_bad_msg_outsize(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv = test->priv;
> +       struct cros_ec_device *ec_dev = &priv->ec_dev;
> +       struct cros_ec_command *msg = priv->msg;
> +       int ret;
> +
> +       msg->outsize = ec_dev->dout_size - sizeof(struct ec_host_request) + 1;
> +
> +       ret = cros_ec_prepare_tx(ec_dev, msg);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +static int cros_ec_proto_test_init(struct kunit *test)
> +{
> +       struct cros_ec_proto_test_priv *priv;
> +       struct cros_ec_device *ec_dev;
> +
> +       priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       test->priv = priv;
> +
> +       ec_dev = &priv->ec_dev;
> +       ec_dev->dout = (u8 *)priv->dout;
> +       ec_dev->dout_size = ARRAY_SIZE(priv->dout);
> +       ec_dev->din = (u8 *)priv->din;
> +       ec_dev->din_size = ARRAY_SIZE(priv->din);
> +       ec_dev->proto_version = EC_HOST_REQUEST_VERSION;
> +
> +       priv->msg = (struct cros_ec_command *)priv->_msg;
> +
> +       return 0;
> +}
> +
> +static struct kunit_case cros_ec_proto_test_cases[] = {
> +       KUNIT_CASE(cros_ec_proto_test_prepare_tx_legacy_normal),
> +       KUNIT_CASE(cros_ec_proto_test_prepare_tx_legacy_bad_msg_outsize),
> +       KUNIT_CASE(cros_ec_proto_test_prepare_tx_normal),
> +       KUNIT_CASE(cros_ec_proto_test_prepare_tx_bad_msg_outsize),
> +       {}
> +};
> +
> +static struct kunit_suite cros_ec_proto_test_suite = {
> +       .name = "cros_ec_proto_test",
> +       .init = cros_ec_proto_test_init,
> +       .test_cases = cros_ec_proto_test_cases,
> +};
> +
> +kunit_test_suite(cros_ec_proto_test_suite);
> +
> +MODULE_LICENSE("GPL");
> --
> 2.36.0.550.gb090851708-goog
>
