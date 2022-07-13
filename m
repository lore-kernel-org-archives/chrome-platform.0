Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D24A00
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 18:16:00 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bp15so11026716ejb.6
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s0/VHpNQ9RNaH4zKX955bl36QOw/Zy/4YbokavoGCgM=;
        b=Ny4Pqz5A/eak6mJZG9FHAhtrBD57iegbQK9b5ZE/Wo0hwEKnlm79zPJSnzf9K7vSov
         iGsKF/twoL/k9zGAafixG9JVJHYDnpRlU7oOtrHiN+3f2PCEgTrVIg33Noggk4brABam
         xrx4O3+I+AaXtWQ3LzUlvCB7HzYgrsstAGI1V3nrQch5fRAFEprCPRXdcGLlw1vhBeLL
         BUt3LwuW8iwiKf4x8bV0RkeSZCq/4JyTfLci4DWKgChMy5fvD6lzU8NAa6rGfo9IoATM
         x6qt/3OYw+Hz64MfOUQE+e1OoU5QpvBrfrrfsWNKCOYOZXZa9s8zdNv0SPhx5ftHQ8KW
         rPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s0/VHpNQ9RNaH4zKX955bl36QOw/Zy/4YbokavoGCgM=;
        b=xD3uRAv+Pv550IsYDyZJoAbKjJWTS96EArNTg4r8CiWIz9OCnEWAuoYHzDLwubVxdE
         uAUaJpxeWlcVxTj9fY03QWGot0JTx7pYhCtlDEN+zm0Hp7rGr9rS3f9nWWInfk0Ho6pV
         +v4JxnYyc6f3+Jsh4FNjuyY+p6xLKVaPdrWhHIqv9+2hdk1T1iQxfBflIP7ODPLk/N7O
         k+CsSZKTxC2TDka6+Y/GcKDlBtmgyOM11BDZsmaVCv6I+YOTVHzuvF9zN1r6oEDcnPWz
         PcsdbiigiFNR/uDTDMNO/Dg2oT4AhNrcPQLu3Tsbi/OB8+9l6jomWRS0GwjcRAA/iIIZ
         12MQ==
X-Gm-Message-State: AJIora8Q/KxhcGCIKataZ5VsZyA1k/bySwuFqZbBMFnmD87jBBwb8ea4
	4DJLVXMyZHrREhCxBzToPsDCmDjluU77mUYjidNWyg==
X-Google-Smtp-Source: AGRyM1uNgzHa05xSrO6VL9KZMSWI81JqTiirpvtPBwCpeY10b3CQqHu3PMPBz/XjB7tlpFaKSWjBXqN6UgZb3TSLAUw=
X-Received: by 2002:a17:907:720a:b0:72b:549e:305a with SMTP id
 dr10-20020a170907720a00b0072b549e305amr4447049ejc.691.1657736158879; Wed, 13
 Jul 2022 11:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628024913.1755292-1-tzungbi@kernel.org> <20220628024913.1755292-6-tzungbi@kernel.org>
In-Reply-To: <20220628024913.1755292-6-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 13 Jul 2022 11:15:47 -0700
Message-ID: <CABXOdTeC+q-UiPiThqL5MGg-+cGACGW4qLaLKZbmX4M26TvbDg@mail.gmail.com>
Subject: Re: [RESEND PATCH 05/11] platform/chrome: cros_ec_proto: separate cros_ec_wait_until_complete()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
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
> ---
>  drivers/platform/chrome/cros_ec_proto.c | 75 ++++++++++++-------------
>  1 file changed, 36 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 0cec013be3d3..466ecb063bd6 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -134,53 +134,50 @@ static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_co
>         return ret;
>  }
>
> -static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> +static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *result)
>  {
> -       int ret = cros_ec_xfer_command(ec_dev, msg);
> +       struct cros_ec_command *msg;
> +       struct ec_response_get_comms_status *status;
> +       int ret = 0, i;
> +
> +       msg = kzalloc(sizeof(*msg) + sizeof(*status), GFP_KERNEL);
> +       if (!msg)
> +               return -ENOMEM;

AFAICS this is always 24 bytes. I would suggest to allocate it on the
stack to reduce overhead.
>
> -       if (msg->result == EC_RES_IN_PROGRESS) {
> -               int i;
> -               struct cros_ec_command *status_msg;
> -               struct ec_response_get_comms_status *status;
> +       msg->command = EC_CMD_GET_COMMS_STATUS;
> +       msg->insize = sizeof(*status);
>
> -               status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
> -                                    GFP_KERNEL);
> -               if (!status_msg)
> -                       return -ENOMEM;
> +       status = (struct ec_response_get_comms_status *)msg->data;
>
> -               status_msg->version = 0;
> -               status_msg->command = EC_CMD_GET_COMMS_STATUS;
> -               status_msg->insize = sizeof(*status);
> -               status_msg->outsize = 0;
> +       /* Query the EC's status until it's no longer busy or we encounter an error. */
> +       for (i = 0; i < EC_COMMAND_RETRIES; ++i) {
> +               usleep_range(10000, 11000);
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
> +               ret = cros_ec_xfer_command(ec_dev, msg);
> +               if (ret == -EAGAIN)
> +                       continue;
> +               if (ret < 0)
> +                       break;

With the command allocated on the stack, this can return immediately.

> +
> +               *result = msg->result;
> +               if (msg->result != EC_RES_SUCCESS)
> +                       break;

Again, this can return immediately if the command buffer is on the stack.

>
> -               kfree(status_msg);
> +               if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> +                       break;

Can return immediately.

>         }
>
> +       kfree(msg);
> +       return ret;

What should this return on timeout ?

> +}
> +
> +static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> +{
> +       int ret = cros_ec_xfer_command(ec_dev, msg);
> +
> +       if (msg->result == EC_RES_IN_PROGRESS)
> +               ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
> +
>         return ret;
>  }
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
