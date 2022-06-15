Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD43D99
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 20:50:39 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id c2so17896909edf.5
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 13:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ZXBUIxqBm6uyxBilji48aCf+mfxOLYDgSX9YlArqBA=;
        b=AFFih5W0o5aUzvDXTiceCSYg5SE+KN4Yx/De279r5ciZaqpBDyOcqdcdiC/LzqV8X7
         PnPCsy33DMFoDcZ7lX5DenjOwjeThgwf0pGPiQEXOQItddk3Tlgedzx2cbX0jUNvLB3w
         sQ1VEU9OpHcvPRde5hjUjGOVAQf2t6G+9qNUpMIfhW+FWNkET5vk2prshkwnufPPgtnE
         XjynoDPD6y9WLVXlrYy1kvocieuQnhn8FhZUbWJo6uHGqHanWuzqhopJrvo8sUzSSex5
         W16BuQjhUbt4tVZ3SaoojwtiDamYTkHE5UnPO7ToVWD+YS+3Vur7hYHI99lH3fYB7luI
         KBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ZXBUIxqBm6uyxBilji48aCf+mfxOLYDgSX9YlArqBA=;
        b=dyhLXYm+Sj0bf8g2JnQuQhIe4R0Dq8K1wozZTs/JErNoMzPf2r6iJ1gVm0jbFTrlKS
         s+zXZEyHO5B9XWS9OO1mDvasg7bRqLWerAd7Er1+8MI1efsgK5UKuTNGrS7LJvaeTzHW
         bpKhJ+z87Qbe0qg5Xz4gZbZtAF4GYIVwuzuAnf6MZhtsYjWffNeT+845WccajY07Fu5q
         Gwsu0KbH2CdJ0ayX89mZ9XgEF6sKbXU8NfOiGa1AuUEO+1tDw6nxGHexvJy51cKFEfSf
         RZkWur97JqxW5dhp/eziW+SZVps/NWs3uibFeiaBCJIhX3NVkXNrqPPFc0bGIEGhpRO7
         TLxA==
X-Gm-Message-State: AJIora9ljqT7DM3kSk8ZlQ+NyYJpudf8tToPfAmNeBYOV7flBpcq78Cv
	9DGcnvy5B9oTDtv0uCGTjZbmcof3tkoCVlVeucVrqOUq9hZo3hLc
X-Google-Smtp-Source: AGRyM1ssS+sc685rYaHH2KgSnyCXAfvHgnC+e/hU1VF6fIg3/zRUdW2cKIeWjcO13qpLymSmg3T/6J3aZ8/+k+qRu8Q=
X-Received: by 2002:a05:6402:3688:b0:42d:d3ba:4725 with SMTP id
 ej8-20020a056402368800b0042dd3ba4725mr2144623edb.212.1655326237916; Wed, 15
 Jun 2022 13:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220615051248.1628156-1-tzungbi@kernel.org> <20220615051248.1628156-6-tzungbi@kernel.org>
In-Reply-To: <20220615051248.1628156-6-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 15 Jun 2022 13:50:26 -0700
Message-ID: <CABXOdTeYf=KsaMeEMOcevRjitvkLDKPeTELfDSmCxyG0OWWjgQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] platform/chrome: cros_ec_proto: separate cros_ec_wait_until_complete()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 14, 2022 at 10:13 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
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

I'll have to spend more time on this; I don't immediately see (from
the diff) the replacement for the traces, and I don't see what
happened with xfer_fxn.

Guenter

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
> +
> +               *result = msg->result;
> +               if (msg->result != EC_RES_SUCCESS)
> +                       break;
>
> -               kfree(status_msg);
> +               if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> +                       break;
>         }
>
> +       kfree(msg);
> +       return ret;
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
> 2.36.1.476.g0c4daa206d-goog
>
