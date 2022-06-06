Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F128E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 15:22:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id y19so29624513ejq.6
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZjZ0VdqAL6kmHWqTKLZULOCPl5pLYRAgVk7NDjhCtWY=;
        b=JYeRxDa3uRwOplt/Ng6ADsQLUBREnHZWDhNa9ccrb0BykgUMVd8BHRshRg8rfIk8IQ
         o9rdRJXOhSadgbGuuOVsC5OEbKB1dW5/mI7e0rW7WbfnnWeqkLs1cqgoxwZaGdffne5F
         WL7w8OvssrMu4IHyDX1802lZOX/0LyPByUSUF6Dp72qCxenOblcRU9SypZXCBsvab8XX
         qKIbQqSS+3MUhx63hN/u2nBYWcB4Pj+U8Uch7uJ/AME69M37600O1VAtJvBMNFBojaip
         GJ0XiJKVOZgH+0UpF1/HqF5RDrNPogTWRjYfFi923hoER7fuC7+Xu/RRUlGD0Lf39Tdt
         9coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjZ0VdqAL6kmHWqTKLZULOCPl5pLYRAgVk7NDjhCtWY=;
        b=1yXSeD7EyerSgmOMPYetRC2z8+mCEniqzOoJbkPN4suseO/bTMq2qJXWj6O/qdWwKz
         VmFjgacSGGKzQyaJpmuED5Fzgsq5oUfbb9jNHwBHlltSA+IFzMbDhb+uo0pnrGhx9QyQ
         z42hq0/YOmLNiJIarGemXgjJmjmlAk3UZeQv4tZHbdNb1/3TIbryzEPvIP3kzm6p8XLb
         yqsZ3XRZQHgTsyd+wNcWqMBKNyLYyv49LUnL5U1AHW7JwcI8d3Sf1XJTEIVKVvXfExGf
         yOiNPmm6Dr57HA33SV5eLI7U1Ocq/rRRyQ9lf3oXbJ36qefqn86+yzmZ0LRouTv49lPi
         sAjg==
X-Gm-Message-State: AOAM530op0dHI2ANLHAD2odbM+G2b8YBddlJnoNIJNC/STZPDshDEKiP
	A2waT3hDWTmY0BpIm1tE/l7i7Aenyde+N5FKmWsmvQ==
X-Google-Smtp-Source: ABdhPJzlgrMVyOmzp81U9IcYZVRMfMoiK/Ja4H8G5drVVzxFiETnPYHHCIeoZtqSgVj1kahJrGJmNm4SUhcy3g2RA7o=
X-Received: by 2002:a17:906:85cb:b0:70b:ffb4:b0e with SMTP id
 i11-20020a17090685cb00b0070bffb40b0emr18618534ejy.533.1654528935046; Mon, 06
 Jun 2022 08:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-4-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-4-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 08:22:03 -0700
Message-ID: <CABXOdTdSqA0x5kLLjekQwvT+9EvNmOuA0MAdjuFp8z0T3F37Pg@mail.gmail.com>
Subject: Re: [PATCH 03/13] platform/chrome: use macros for passthru indexes
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Move passthru indexes for EC and PD devices to common header.  Also use
> them instead of literal constants.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/platform/chrome/cros_ec.c            |  3 ---
>  drivers/platform/chrome/cros_ec_proto.c      |  6 +++---
>  drivers/platform/chrome/cros_ec_proto_test.c | 18 ++++++++++++------
>  drivers/platform/chrome/cros_ec_trace.h      |  8 ++++----
>  include/linux/platform_data/cros_ec_proto.h  |  3 +++
>  5 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index b3e94cdf7d1a..e51a3f2176c7 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -19,9 +19,6 @@
>
>  #include "cros_ec.h"
>
> -#define CROS_EC_DEV_EC_INDEX 0
> -#define CROS_EC_DEV_PD_INDEX 1
> -
>  static struct cros_ec_platform ec_p = {
>         .ec_name = CROS_EC_DEV_NAME,
>         .cmd_offset = EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_EC_INDEX),
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 13ced9d2dd71..65191af5139c 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -433,7 +433,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>
>         /* First try sending with proto v3. */
>         ec_dev->proto_version = 3;
> -       ret = cros_ec_host_command_proto_query(ec_dev, 0, proto_msg);
> +       ret = cros_ec_host_command_proto_query(ec_dev, CROS_EC_DEV_EC_INDEX, proto_msg);
>
>         if (ret == 0) {
>                 proto_info = (struct ec_response_get_protocol_info *)
> @@ -459,7 +459,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                 /*
>                  * Check for PD
>                  */
> -               ret = cros_ec_host_command_proto_query(ec_dev, 1, proto_msg);
> +               ret = cros_ec_host_command_proto_query(ec_dev, CROS_EC_DEV_PD_INDEX, proto_msg);
>
>                 if (ret) {
>                         dev_dbg(ec_dev->dev, "no PD chip found: %d\n", ret);
> @@ -609,7 +609,7 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
>                 msg->insize = ec_dev->max_response;
>         }
>
> -       if (msg->command < EC_CMD_PASSTHRU_OFFSET(1)) {
> +       if (msg->command < EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX)) {
>                 if (msg->outsize > ec_dev->max_request) {
>                         dev_err(ec_dev->dev,
>                                 "request of size %u is too big (max: %u)\n",
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index c5e16566a634..5169bf33360b 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -280,7 +280,8 @@ static void cros_ec_proto_test_query_all_normal(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command,
> -                               EC_CMD_PASSTHRU_OFFSET(1) | EC_CMD_GET_PROTOCOL_INFO);
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
>                 KUNIT_EXPECT_EQ(test, mock->msg.insize,
>                                 sizeof(struct ec_response_get_protocol_info));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> @@ -393,7 +394,8 @@ static void cros_ec_proto_test_query_all_no_pd(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command,
> -                               EC_CMD_PASSTHRU_OFFSET(1) | EC_CMD_GET_PROTOCOL_INFO);
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
>                 KUNIT_EXPECT_EQ(test, mock->msg.insize,
>                                 sizeof(struct ec_response_get_protocol_info));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> @@ -535,7 +537,8 @@ static void cros_ec_proto_test_query_all_no_mkbp(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command,
> -                               EC_CMD_PASSTHRU_OFFSET(1) | EC_CMD_GET_PROTOCOL_INFO);
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
>                 KUNIT_EXPECT_EQ(test, mock->msg.insize,
>                                 sizeof(struct ec_response_get_protocol_info));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> @@ -623,7 +626,8 @@ static void cros_ec_proto_test_query_all_no_mkbp2(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command,
> -                               EC_CMD_PASSTHRU_OFFSET(1) | EC_CMD_GET_PROTOCOL_INFO);
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
>                 KUNIT_EXPECT_EQ(test, mock->msg.insize,
>                                 sizeof(struct ec_response_get_protocol_info));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> @@ -723,7 +727,8 @@ static void cros_ec_proto_test_query_all_no_host_sleep(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command,
> -                               EC_CMD_PASSTHRU_OFFSET(1) | EC_CMD_GET_PROTOCOL_INFO);
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
>                 KUNIT_EXPECT_EQ(test, mock->msg.insize,
>                                 sizeof(struct ec_response_get_protocol_info));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> @@ -833,7 +838,8 @@ static void cros_ec_proto_test_query_all_default_wake_mask(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command,
> -                               EC_CMD_PASSTHRU_OFFSET(1) | EC_CMD_GET_PROTOCOL_INFO);
> +                               EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX) |
> +                               EC_CMD_GET_PROTOCOL_INFO);
>                 KUNIT_EXPECT_EQ(test, mock->msg.insize,
>                                 sizeof(struct ec_response_get_protocol_info));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
> diff --git a/drivers/platform/chrome/cros_ec_trace.h b/drivers/platform/chrome/cros_ec_trace.h
> index 9bb5cd2c98b8..d7e407de88df 100644
> --- a/drivers/platform/chrome/cros_ec_trace.h
> +++ b/drivers/platform/chrome/cros_ec_trace.h
> @@ -30,8 +30,8 @@ TRACE_EVENT(cros_ec_request_start,
>         ),
>         TP_fast_assign(
>                 __entry->version = cmd->version;
> -               __entry->offset = cmd->command / EC_CMD_PASSTHRU_OFFSET(1);
> -               __entry->command = cmd->command % EC_CMD_PASSTHRU_OFFSET(1);
> +               __entry->offset = cmd->command / EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX);
> +               __entry->command = cmd->command % EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX);
>                 __entry->outsize = cmd->outsize;
>                 __entry->insize = cmd->insize;
>         ),
> @@ -55,8 +55,8 @@ TRACE_EVENT(cros_ec_request_done,
>         ),
>         TP_fast_assign(
>                 __entry->version = cmd->version;
> -               __entry->offset = cmd->command / EC_CMD_PASSTHRU_OFFSET(1);
> -               __entry->command = cmd->command % EC_CMD_PASSTHRU_OFFSET(1);
> +               __entry->offset = cmd->command / EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX);
> +               __entry->command = cmd->command % EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX);
>                 __entry->outsize = cmd->outsize;
>                 __entry->insize = cmd->insize;
>                 __entry->result = cmd->result;
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 138fd912c808..6475a8066f00 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -21,6 +21,9 @@
>  #define CROS_EC_DEV_SCP_NAME   "cros_scp"
>  #define CROS_EC_DEV_TP_NAME    "cros_tp"
>
> +#define CROS_EC_DEV_EC_INDEX 0
> +#define CROS_EC_DEV_PD_INDEX 1
> +
>  /*
>   * The EC is unresponsive for a time after a reboot command.  Add a
>   * simple delay to make sure that the bus stays locked.
> --
> 2.36.1.255.ge46751e96f-goog
>
