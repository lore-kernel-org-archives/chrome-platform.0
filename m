Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15E1C07
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 13:32:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r6so15299547edd.7
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxdmslAnS6b+ZgeZcdk+CdUgW+Roq4pJkkdHVyVREms=;
        b=We7MIscdIRrGZnQLQX8w+SEF3MfAlePBkfPD/sTbPkMRd2CWtVSsYpqCIV0oFQYcAI
         ecYRTpYR4EBcl1gIQfQmiE9/fa127fmNDnsl9T1wy/Ez6dGaTORreRb2J5xG8LAdIs/m
         unMRQm/NWq0E9UqXwFs7GEvq/34P+p8GrysMCaIDh1kYxQYzNH/KNXg19tm9K7tncTA9
         S4d9vMs8V0D9jIpZ0RVuTV8EQmTmk+cGKnce8jR3gNlQMGNPJaflQ1I0ZeArhNGWtDHR
         E82iKkc6KdArXlms2mypCriKfow8qo3ZpCgwfQHuDY/V5lekGlFst5fP32UWOogv5Z50
         627A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxdmslAnS6b+ZgeZcdk+CdUgW+Roq4pJkkdHVyVREms=;
        b=HbzNyZyRSuBpFf/5OXzJH6FxwWUizPrIW12TGyZDMXq4JKbWtS510hNIVjqsJ7KD9b
         /evOKG6iLojfmBbZz2Sph6wKrLrXQrsi3GepHRQGORlsrOTrYgTKod8dnZ8c05G/JuBg
         ZNUxIJWPzkr7/sS+cvYpqWNQvEteDcvdIzTfN+/USiM+mlVbaq3S0n3f4Fdbl1dvEm95
         vEwP62pI872L+E8NJNjpS7mYGR2qgt42D/gSwfQGgYu/e9iyPyt7DWoj0HGbyuvvoHzS
         R1GOBVpaIZ1SGy4QW/bQ+WcY26+HMGV7IbnDJOHyBOoxosDEDqdQ/dpT2WymIUmNzxQP
         EO3Q==
X-Gm-Message-State: AJIora+j32g4oqtFmkHEBjKdzNUrmktfzm9li7tCO8Vp4mS4Rzepo818
	XPoE2xgbb+LlCKjF7SI1HsOVvRqi8M399L132WjcsA==
X-Google-Smtp-Source: AGRyM1tdaHrL02Liizfy/WoYUlXnVDHpuTmmw6s3M3yjcUJL+oyZoOCmrc1wlxobAns/7gkPGV6zySCd9JEMaVKVg/Y=
X-Received: by 2002:aa7:d389:0:b0:43a:56c0:c863 with SMTP id
 x9-20020aa7d389000000b0043a56c0c863mr37005948edq.373.1658151160318; Mon, 18
 Jul 2022 06:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718050914.2267370-1-tzungbi@kernel.org> <20220718050914.2267370-7-tzungbi@kernel.org>
In-Reply-To: <20220718050914.2267370-7-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 18 Jul 2022 06:32:29 -0700
Message-ID: <CABXOdTcaJg4NgO1WSxoQHVK84qdDg53RgiWSvvTSX2RSokNFTQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] platform/chrome: cros_ec_proto: separate cros_ec_wait_until_complete()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 17, 2022 at 10:10 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> EC returns EC_RES_IN_PROGRESS if the host command needs more time to
> complete.  Whenever receives the return code, cros_ec_send_command()
> sends EC_CMD_GET_COMMS_STATUS to query the command status.
>
> Separate cros_ec_wait_until_complete() from cros_ec_send_command().
> It sends EC_CMD_GET_COMMS_STATUS and waits until the previous command
> was completed, or encountered error, or timed out.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v1:
> - Allocate buffer in cros_ec_wait_until_complete() statically.
> - Use `return ret` instead of `break` to make the intent explicit.
>
>  drivers/platform/chrome/cros_ec_proto.c | 74 ++++++++++++-------------
>  1 file changed, 35 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 0cec013be3d3..a6ad7f7956e6 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -134,56 +134,52 @@ static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_co
>         return ret;
>  }
>
> -static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> +static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *result)
>  {
> -       int ret = cros_ec_xfer_command(ec_dev, msg);
> +       struct {
> +               struct cros_ec_command msg;
> +               struct ec_response_get_comms_status status;
> +       } __packed buf;
> +       struct cros_ec_command *msg = &buf.msg;
> +       struct ec_response_get_comms_status *status = &buf.status;
> +       int ret = 0, i;
>
> -       if (msg->result == EC_RES_IN_PROGRESS) {
> -               int i;
> -               struct cros_ec_command *status_msg;
> -               struct ec_response_get_comms_status *status;
> +       msg->version = 0;
> +       msg->command = EC_CMD_GET_COMMS_STATUS;
> +       msg->insize = sizeof(*status);
> +       msg->outsize = 0;
>
> -               status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
> -                                    GFP_KERNEL);
> -               if (!status_msg)
> -                       return -ENOMEM;
> +       /* Query the EC's status until it's no longer busy or we encounter an error. */
> +       for (i = 0; i < EC_COMMAND_RETRIES; ++i) {
> +               usleep_range(10000, 11000);
>
> -               status_msg->version = 0;
> -               status_msg->command = EC_CMD_GET_COMMS_STATUS;
> -               status_msg->insize = sizeof(*status);
> -               status_msg->outsize = 0;
> +               ret = cros_ec_xfer_command(ec_dev, msg);
> +               if (ret == -EAGAIN)
> +                       continue;
> +               if (ret < 0)
> +                       return ret;
>
> -               /*
> -                * Query the EC's status until it's no longer busy or
> -                * we encounter an error.
> -                */
> -               for (i = 0; i < EC_COMMAND_RETRIES; i++) {
> -                       usleep_range(10000, 11000);
> -
> -                       trace_cros_ec_request_start(status_msg);
> -                       ret = (*xfer_fxn)(ec_dev, status_msg);
> -                       trace_cros_ec_request_done(status_msg, ret);
> -                       if (ret == -EAGAIN)
> -                               continue;
> -                       if (ret < 0)
> -                               break;
> -
> -                       msg->result = status_msg->result;
> -                       if (status_msg->result != EC_RES_SUCCESS)
> -                               break;
> -
> -                       status = (struct ec_response_get_comms_status *)
> -                                status_msg->data;
> -                       if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> -                               break;
> -               }
> +               *result = msg->result;
> +               if (msg->result != EC_RES_SUCCESS)
> +                       return ret;
>
> -               kfree(status_msg);
> +               if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> +                       return ret;
>         }
>
>         return ret;
>  }
>
> +static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> +{
> +       int ret = cros_ec_xfer_command(ec_dev, msg);
> +
> +       if (msg->result == EC_RES_IN_PROGRESS)
> +               ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
> +
> +       return ret;
> +}
> +
>  /**
>   * cros_ec_prepare_tx() - Prepare an outgoing message in the output buffer.
>   * @ec_dev: Device to register.
> --
> 2.37.0.170.g444d1eabd0-goog
>
